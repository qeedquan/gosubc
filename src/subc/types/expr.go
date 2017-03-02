package types

import (
	"fmt"
	"strconv"

	"subc/ast"
	"subc/constant"
	"subc/scan"
)

// The expression type
type exprType int

// Types of expression that are encountered
// during type checking.
const (
	conversion exprType = iota
	expression
	statement
)

// predicates to check if an operation are valid on this type.
type opPredicates map[scan.Type]func(Type) bool

var unaryOpPredicates = opPredicates{
	scan.Plus:   isInteger,
	scan.Minus:  isInteger,
	scan.Negate: isInteger,
	scan.Not:    isBoolean,
}

var binaryOpPredicates = opPredicates{
	scan.Plus:  isNumeric,
	scan.Minus: isNumeric,
	scan.Mul:   isInteger,
	scan.Div:   isInteger,
	scan.Mod:   isInteger,

	scan.And: isInteger,
	scan.Or:  isInteger,
	scan.Xor: isInteger,
	scan.Lsh: isInteger,
	scan.Rsh: isInteger,

	scan.Land: isBoolean,
	scan.Lor:  isBoolean,

	scan.Eq:  isNumeric,
	scan.Neq: isNumeric,
	scan.Lt:  isNumeric,
	scan.Gt:  isNumeric,
	scan.Leq: isNumeric,
	scan.Geq: isNumeric,

	scan.PlusEq:  isNumeric,
	scan.MinusEq: isNumeric,
	scan.MulEq:   isInteger,
	scan.DivEq:   isInteger,
	scan.ModEq:   isInteger,
	scan.LshEq:   isInteger,
	scan.RshEq:   isInteger,
	scan.OrEq:    isInteger,
	scan.AndEq:   isInteger,
	scan.XorEq:   isInteger,
}

// op checks if an op is defined for a type.
func (c *checker) op(m opPredicates, x *operand, op scan.Type) bool {
	if pred := m[op]; pred != nil {
		if !pred(x.typ) {
			c.invalidOp(x.pos(), "operator %v not defined for %v", op, x)
			return false
		}
	} else {
		c.invalidAST(x.pos(), "unknown operator %s", op)
	}
	return true
}

// binaryCast does an implicit conversion for the result
// of a binary operation, don't need to handle all cases
// because the binary operation will take on the first type.
func (c *checker) binaryCast(x, y operand, op scan.Type) Type {
	p1, p2 := isPointer(x.typ), isPointer(y.typ)
	i1, i2 := isInteger(x.typ), isInteger(y.typ)

	switch op {
	case scan.Plus:
		switch {
		case i1 && p2:
			// an integer+pointer is a pointer
			return NewPointer(y.typ, nil)
		}

	case scan.Minus:
		switch {
		case p1 && p2:
			// a pointer-pointer is an integer
			return Typ[Int]
		case !p1 && !(i1 && i2):
			// cannot do integer-pointer
			c.invalidOp(x.pos(), "cannot apply binary op '-' to types %v %v", x.typ, y.typ)
		}
	}

	return x.typ
}

// binary type checks a binary expression.
func (c *checker) binary(x *operand, lhs, rhs ast.Expr, op scan.Type) {
	var y operand

	c.expr(x, lhs)
	c.expr(&y, rhs)

	if x.mode == invalid {
		return
	}
	if y.mode == invalid {
		x.mode = invalid
		x.expr = y.expr
		return
	}

	_, hasAssign := c.assignOp(op)

	switch {
	case op == scan.Comma:
		// nothing

	case op == scan.Assign || hasAssign:
		c.assignment(x, &y)
		if x.mode == invalid {
			return
		}
		if !hasAssign {
			break
		}

		fallthrough
	default:
		if !c.op(binaryOpPredicates, x, op) || !c.op(binaryOpPredicates, &y, op) {
			x.mode = invalid
			return
		}
	}

	if x.mode == constant_ && x.val.Type() != constant.String &&
		y.mode == constant_ && y.val.Type() != constant.String &&
		validConstBinOp(op) {
		var err error
		x.val, err = constant.BinaryOp(x.val, op, y.val)
		if err != nil {
			c.errorf(y.pos(), "%v", err)
		}
		return
	}

	x.typ = c.binaryCast(*x, y, op)
	x.mode = value
}

// validConstBinOp returns if an op is a valid binary operaiton
// to generate do constant folding for.
func validConstBinOp(op scan.Type) bool {
	switch op {
	case scan.Plus, scan.Minus, scan.Mul, scan.Div, scan.Mod,
		scan.Lsh, scan.Rsh, scan.Or, scan.Xor, scan.And,
		scan.Eq, scan.Gt, scan.Geq, scan.Lt, scan.Leq, scan.Neq:
		return true
	}
	return false
}

// incOrDec type checks an expression for ++/-- operators.
func (c *checker) incOrDec(x *operand, e *ast.UnaryExpr, op scan.Type) {
	Y := &ast.BasicLit{scan.Token{scan.Number, e.Span().Start, "1"}}
	c.binary(x, e.X, Y, op)
}

// unary type checks a unary expression.
func (c *checker) unary(x *operand, e *ast.UnaryExpr, op scan.Type) {
	switch op {
	case scan.And:
		if x.mode != variable {
			c.invalidOp(x.pos(), "cannot take address of %s", x)
			x.mode = invalid
			return
		}
		x.mode = value
		x.typ = NewPointer(x.typ, nil)
		return

	case scan.Inc:
		c.incOrDec(x, e, scan.Plus)
		return

	case scan.Dec:
		c.incOrDec(x, e, scan.Minus)
		return
	}

	if !c.op(unaryOpPredicates, x, op) {
		x.mode = invalid
		return
	}

	if x.mode == constant_ && x.val.Type() != constant.String {
		x.val = constant.UnaryOp(op, x.val, uint(c.conf.Sizes.Sizeof(Typ[Int])))
		return
	}

	x.mode = value
}

// expr type checks an expression and record the result.
func (c *checker) expr(x *operand, e ast.Expr) exprType {
	kind := c.exprInternal(x, e)

	var typ Type
	var val constant.Value
	switch x.mode {
	case invalid:
		typ = Typ[Invalid]
	case constant_:
		typ = x.typ
		val = x.val
	default:
		typ = x.typ
	}

	c.recordTypeAndValue(e, x.mode, typ, val)
	return kind
}

// exprInternal is the main driver, it does a recursive descent
// through the expressions to type check them.
func (c *checker) exprInternal(x *operand, e ast.Expr) exprType {
	x.mode = invalid
	x.typ = Typ[Invalid]

	pos := e.Span().Start
	switch e := e.(type) {
	case *ast.BadExpr:
		goto Error

	case *ast.BasicType:
		x.typ = c.typBasic(e)
		x.expr = e
		x.mode = typexpr
		return expression

	case *ast.Ident:
		c.ident(x, e, false)

	case *ast.StringLit:
		var text string
		for _, lit := range e.Lits {
			text += lit.Text[1 : len(lit.Text)-1]
		}
		text = strconv.Quote(text)
		x.setConst(scan.String, text)
		if x.mode == invalid {
			c.invalidAST(pos, "invalid literal %v", text)
		}

	case *ast.BasicLit:
		x.setConst(e.Type, e.Text)
		if x.mode == invalid {
			c.invalidAST(pos, "invalid literal %v", e.Text)
			goto Error
		}

	case *ast.CompositeLit:
		var y operand
		for _, elt := range e.Elts {
			c.expr(&y, elt)
			if y.mode != constant_ {
				c.errorf(y.pos(), "constant expression expected")
			}
		}

	case *ast.CallExpr:
		return c.call(x, e)

	case *ast.BinaryExpr:
		c.binary(x, e.X, e.Y, e.Op.Type)
		if x.mode == invalid {
			goto Error
		}

	case *ast.StarExpr:
		c.expr(x, e.X)
		switch x.mode {
		case invalid:
			goto Error
		case typexpr:
			x.typ = NewPointer(x.typ, nil)
		default:
			if typ, ok := x.typ.Underlying().(*Pointer); ok {
				x.mode = variable
				x.typ = typ.base
			} else {
				c.invalidOp(pos, "cannot indirect %s", x)
			}
		}

	case *ast.IndexExpr:
		c.expr(x, e.X)
		if x.mode == invalid {
			goto Error
		}

		valid := false
		switch typ := x.typ.Underlying().(type) {
		case *Pointer:
			valid = true
			if x.mode != variable {
				x.mode = value
			}
			x.typ = typ.Elem()
		}

		if !valid {
			c.invalidOp(x.pos(), "cannot index %s", x)
			goto Error
		}

		if e.Index == nil {
			c.invalidAST(pos, "missing index for %s", x)
			goto Error
		}
		c.index(e.Index)

	case *ast.UnaryExpr:
		c.expr(x, e.X)
		if x.mode == invalid {
			goto Error
		}
		c.unary(x, e, e.Op.Type)
		if x.mode == invalid {
			goto Error
		}

	case *ast.ParenExpr:
		exprType := c.expr(x, e.X)
		x.expr = e
		return exprType

	case *ast.SizeofExpr:
		c.expr(x, e.X)
		if x.mode == invalid {
			goto Error
		}

		typ := x.typ
		ptr, ok := typ.(*Pointer)
		if ok && ptr.Decay() != nil {
			typ = ptr.Decay()
		}

		x.mode = constant_
		x.val = constant.MakeInt64(int64(c.conf.Sizes.Sizeof(typ)))
		x.typ = Typ[Int]

	case *ast.SelectorExpr:
		c.selector(x, e)

	case *ast.CondExpr:
		var y, z, w operand
		c.expr(&y, e.Cond)
		c.expr(&z, e.X)
		c.expr(&w, e.Y)
		x.mode = value
		x.typ = z.typ

	case *ast.CastExpr:
		typ := c.typExpr(e.Type)
		c.expr(x, e.X)
		x.typ = typ

	case *ast.RecordType:
		x.mode = typexpr
		x.typ = c.typExpr(e)

	default:
		panic(fmt.Sprintf("%s: unknown expression type %T", e.Span().Start, e))
	}

	x.expr = e
	return expression

Error:
	x.mode = invalid
	x.expr = e
	return statement
}

// constExpr type checks an expression for a constant value.
func (c *checker) constExpr(x *operand, e ast.Expr) {
	c.expr(x, e)
	if x.mode != constant_ {
		c.errorf(e.Span().Start, "expected constant declaration, got %v", x.typ)
	}
}

// index checks an expression for array accesses.
func (c *checker) index(index ast.Expr) {
	var x operand

	c.expr(&x, index)
	if x.mode == invalid {
		return
	}

	if !isInteger(x.typ) {
		c.invalidArg(x.pos(), "index %s must be an integer", &x)
		return
	}
}
