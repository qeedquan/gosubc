package types

import (
	"fmt"
	"strconv"

	"subc/ast"
	"subc/constant"
	"subc/scan"
)

// ident type checks an identifier.
func (c *checker) ident(x *operand, e *ast.Ident, silent bool) {
	x.mode = invalid
	x.expr = e

	_, obj := c.scope.LookupParent(Ord, e.Name, scan.NoPos)
	if obj == nil {
		_, obj = c.scope.LookupParent(Fwd, e.Name, scan.NoPos)
	}
	if obj == nil {
		if !silent {
			c.errorf(e.Span().Start, "undeclared name: %s", e.Name)
		}
		return
	}

	c.recordUse(e, obj)
	typ := obj.Type()

	switch obj := obj.(type) {
	case *Const:
		if typ == Typ[Invalid] {
			return
		}
		x.val = obj.val
		x.mode = constant_

	case *Var:
		if typ == Typ[Invalid] {
			return
		}

		array, isArray := typ.(*Array)
		if isArray {
			typ = NewPointer(array.Elem(), array)
		}

		x.mode = variable

	case *Fwrd:
		if typ == Typ[Invalid] {
			return
		}
		x.mode = variable

	case *Func:
		if typ == Typ[Invalid] {
			return
		}
		x.mode = value

	default:
		panic(fmt.Sprintf("unknown ident type: %T", obj))
	}

	x.typ = typ
}

// typExpr types check an expression and record the type.
func (c *checker) typExpr(e ast.Expr) Type {
	typ := c.typExprInternal(e)
	c.recordTypeAndValue(e, typexpr, typ, nil)
	return typ
}

// typExprInternal is the main driver that type checks an expression.
func (c *checker) typExprInternal(e ast.Expr) Type {
	switch e := e.(type) {
	case *ast.EnumDecl:
		return c.typEnumDecl(e)

	case *ast.VarDecl:
		// defaults to int if there is no type, for declarations such as
		// volatile count = 0; and such
		if e.Type == nil {
			return Typ[Int]
		}
		return c.typExpr(e.Type)

	case *ast.BasicType:
		return c.typBasic(e)

	case *ast.RecordType:
		return c.typRecord(e)

	case *ast.FuncType:
		return c.typFunc(e)

	case *ast.ParenExpr:
		return c.typExpr(e.X)

	case *ast.StarExpr:
		return NewPointer(c.typExpr(e.X), nil)

	case nil:
		c.errorf(scan.NoPos, "invalid nil node")

	default:
		c.errorf(e.Span().Start, "%T: %v is not a type", e, e)
	}

	typ := Typ[Invalid]
	return typ
}

// typBasic type checks a basic type.
func (c *checker) typBasic(e *ast.BasicType) Type {
	typ := Type(Typ[Invalid])
	switch e.Type.Type {
	case scan.Bool:
		typ = Typ[Bool]
	case scan.Short:
		typ = Typ[Short]
	case scan.Long:
		typ = Typ[Long]
	case scan.Float:
		typ = Typ[Float]
	case scan.Double:
		typ = Typ[Double]
	case scan.Complex:
		typ = Typ[Complex]
	case scan.Int:
		typ = Typ[Int]
	case scan.Char:
		typ = Typ[Char]
	case scan.Void:
		typ = Typ[Void]
	default:
		c.errorf(e.Span().Start, "%s is not a type", e.Type.Text)
	}
	return c.typExt(typ, e.X)
}

// typExt checks if the current type has * or [] extensions to it
// to make them pointers or arrays.
func (c *checker) typExt(typ Type, e ast.Expr) Type {
	n := ast.Expr(e)
loop:
	for n != nil {
		pos := n.Span().Start
		switch m := n.(type) {
		case *ast.StarExpr:
			typ = NewPointer(typ, nil)
			n = m.X
		case *ast.ArrayType:
			var x operand
			var err error

			length := int64(-1)
			if m.Len != nil {
				c.constExpr(&x, m.Len)

				if x.val == nil || x.val.Type() != constant.Int {
					c.errorf(pos, "array length is not a constant integer")
					break loop
				}
				length, err = strconv.ParseInt(x.val.String(), 0, 64)
				if err != nil {
					c.errorf(pos, "failed to convert array length into constant integer: %v", err)
					break loop
				}
			}

			typ = NewArray(typ, length)
			n = nil
		default:
			c.errorf(pos, "%s is not a type", n)
			break loop
		}
	}

	return typ
}

// typFunc type checks function pointers.
func (c *checker) typFunc(e *ast.FuncType) Type {
	var errSpan scan.Span
	b, ok := e.Result.(*ast.BasicType)
	if len(e.Params) > 0 {
		errSpan = e.Params[0].Span()
	} else if !ok || b.Type.Type != scan.Int {
		errSpan = b.Span()
	}

	if errSpan != scan.NoSpan {
		c.errorf(errSpan.Start, "only function pointers of the form int (*)() are supported")
		return Typ[Invalid]
	}

	result := NewVar(e.Result.Span().Start, 0, "", c.typExpr(e.Result), nil)

	// function pointers are treated differently, even though it is declares as (*f)()
	// it will be variadic

	t := NewSignature(nil, result, true)
	return t
}

// typEnumDecl type checks enum declarations.
func (c *checker) typEnumDecl(e *ast.EnumDecl) Type {
	var values []*Const

	c.iota = constant.MakeInt64(-1)
	for _, e := range e.List {
		var x operand

		if e.X != nil {
			c.constExpr(&x, e.X)
			if x.mode == invalid {
				return Typ[Invalid]
			}
		} else {
			var err error
			x.val, err = constant.BinaryOp(c.iota, scan.Plus, constant.MakeInt64(1))
			if err != nil {
				c.errorf(x.pos(), "%v", err)
			}
		}
		c.iota = x.val

		pos := e.Name.Span().Start
		name := e.Name.Name
		obj := NewConst(pos, name, Typ[Int], c.iota)
		values = append(values, obj)
		c.declare(Ord, c.scope, e.Name, obj, scan.NoPos)
	}

	t := new(Enum)
	t.values = values
	return t
}

// typRecord check record declarations
func (c *checker) typRecord(e *ast.RecordType) Type {
	name := e.Name.Name
	pos := e.Span().Start
	_, rec := c.scope.LookupParent(Tag, name, scan.NoPos)
	if rec == nil {
		c.errorf(pos, "no such %s type %s", e.Record.Text, name)
		return Typ[Invalid]
	}

	obj, isTypeName := rec.(*TypeName)
	typ := obj.Type()
	if _, isRecord := typ.(*Record); !isTypeName || !isRecord {
		c.errorf(pos, "%s not declared as a %s type, but as %v", name, e.Record.Text, typ)
		return Typ[Invalid]
	}

	t := NewNamed(obj, typ)
	return c.typExt(t, e.X)
}
