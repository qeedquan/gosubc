package compile

import (
	"strconv"

	"subc/ast"
	"subc/compile/arch"
	"subc/constant"
	"subc/scan"
	"subc/types"
)

// expr generates code for an expression.
func (c *compiler) expr(e ast.Expr) {
	var lv arch.LV
	n := c.exprInternal(e, &lv)
	n = c.rvalue(n, &lv)
	c.emit(n)
}

// exprInternal is the main function for generating code by figuring
// out what kind of expression it is.
func (c *compiler) exprInternal(e ast.Expr, lv *arch.LV) *node {
	lv.Ident = false

	pos := e.Span().Start
	tv, found := c.typAndValue(e)
	if !found {
		return nil
	}

	// for constants we can just get the value right away
	if tv.Value != nil {
		lv.Type = tv.Type
		lv.Value = tv.Value
		switch tv.Type {
		case types.Typ[types.UntypedString]:
			str, err := strconv.Unquote(tv.Value.String())
			if err != nil {
				c.errorf(pos, "invalid constant %v: %v", tv.Value, err)
			}
			c.cg.Data()
			lab := c.cg.Label()
			c.cg.Lab(lab)
			c.cg.Defs(str)
			c.cg.Defb(0)
			c.cg.Align(len(str)+1, c.cg.Int())
			lv.Addr = lab
			return newNode(opLdlab, lv, nil, nil, nil)

		default:
			return newNode(opLit, lv, nil, nil, nil)
		}
	}

	switch e := e.(type) {
	case *ast.BinaryExpr:
		return c.binaryExpr(e, lv)

	case *ast.UnaryExpr:
		return c.unaryExpr(e, lv)

	case *ast.SizeofExpr:
		return c.sizeofExpr(e, lv, tv)

	case *ast.StarExpr:
		return c.starExpr(e, lv)

	case *ast.CallExpr:
		return c.callExpr(e, lv)

	case *ast.Ident:
		return c.ident(e, lv, tv)

	case *ast.ParenExpr:
		return c.exprInternal(e.X, lv)

	case *ast.IndexExpr:
		return c.indexExpr(e, lv)

	case *ast.SelectorExpr:
		return c.selectorExpr(e, lv)

	case *ast.CondExpr:
		return c.condExpr(e, lv)

	case *ast.CastExpr:
		return c.castExpr(e, lv, tv)

	case *ast.BasicType:
		lv.Type = tv.Type

	default:
		c.errorf(pos, "invalid expression: %T", e)
	}

	return nil
}

// ident generates code for an identifier by loading it into the accumulator.
func (c *compiler) ident(e *ast.Ident, lv *arch.LV, tv types.TypeAndValue) *node {
	lv.Ident = true
	lv.Type = tv.Type.Underlying()
	lv.Name = e.Name

	_, isFunc := tv.Type.(*types.Signature)
	if isFunc {
		if x, ok := c.Uses[e]; ok {
			switch x := x.(type) {
			case *types.Func:
				lv.Storage = x.Storage()
				return newNode(opAddr, lv, nil, nil, nil)
			case *types.Fwrd:
				return newNode(opAddr, lv, nil, nil, nil)
			}
		}
	}

	v, found := c.variable(e, c.Uses)
	if !found {
		lv.Ident = false
		return nil
	}

	s, found := c.symbol(v)
	if !found {
		lv.Ident = false
		return nil
	}

	_, isRecord := lv.Type.(*types.Record)

	// arrays decay to pointers, so we need to get the original type
	// because the type and value by the typechecker is recorded as a pointer
	array, isArray := v.Type().(*types.Array)

	lv.Addr = s.Addr
	lv.Value = s.Value
	lv.Storage = v.Storage()
	switch {
	// constants
	case tv.Value != nil:
		lv.Value = tv.Value
		return newNode(opLit, lv, nil, nil, nil)

	case isArray:
		lv.Type = types.NewPointer(array.Elem(), nil)
		return newNode(opAddr, lv, nil, nil, nil)

	case isRecord:
		lv.Ident = false
		return newNode(opAddr, lv, nil, nil, nil)

	// variable that a integer or a pointer
	default:
		lv.Addressable = true
		return newNode(opIdent, lv, nil, nil, nil)
	}
}

// rvalue generates code for loading a value of the variable if it addressable.
func (*compiler) rvalue(n *node, lv *arch.LV) *node {
	if lv.Addressable {
		n = newNode(opRval, lv, nil, n, nil)
		lv.Addressable = false
	}
	return n
}

// indirection dereferences a pointer and generate code to load it.
func (c *compiler) indirection(e ast.Expr, n *node, lv *arch.LV) *node {
	pos := e.Span().Start
	n = c.rvalue(n, lv)
	ptr, ok := lv.Type.(*types.Pointer)

	if !ok {
		c.errorf(pos, "indirection through non pointer")
		return nil
	} else if isVoidPointer(lv.Type) {
		c.errorf(pos, "dereferencing void pointer")
		return nil
	}

	lv.Ident = false
	lv.Type = ptr.Elem().Underlying()
	return n
}

// indexExpr generates code for array accesses (a[x], etc).
func (c *compiler) indexExpr(e *ast.IndexExpr, lv *arch.LV) *node {
	var lv2 arch.LV
	n := c.exprInternal(e.X, lv)
	lv.Type = lv.Type.Underlying()
	n = c.indirection(e, n, lv)

	m := c.exprInternal(e.Index, &lv2)
	m = c.rvalue(m, &lv2)

	record, isRecord := lv.Type.(*types.Record)
	if !isRecord && lv.Type != types.Typ[types.Char] {
		// if it is not a record, we just need to scale
		// it by the sizeof of the type
		m = newNode(opScale, nil, nil, m, nil)
	} else if isRecord {
		// if it is a struct, we use sizeof to figure
		// out the size to multiply by to get to the index
		lv2.Size = c.cg.Sizeof(record)
		m = newNode(opScaleBy, &lv2, nil, m, nil)
	}

	lv.Ident = false
	lv.Addressable = true

	return newNode(opAdd, lv, &lv2, n, m)
}

// selectorExpr generates code for record accesses (a.x, a->x, etc)
func (c *compiler) selectorExpr(e *ast.SelectorExpr, lv *arch.LV) *node {
	sel, found := c.Selections[e]
	if !found {
		c.errorf(e.Op.Pos, "no selection expression information found")
		return nil
	}

	n := c.exprInternal(e.X, lv)
	if sel.Indirect() {
		n = c.rvalue(n, lv)
		lv.Ident = false
	}

	lv.Addressable = true

	if !sel.IsUnion() && sel.Offset() != 0 {
		lv.Value = constant.MakeInt64(sel.Offset())
		m := newNode(opLit, lv, nil, nil, nil)
		n = newNode(opAdd, lv, nil, n, m)
	}

	if isArray(sel.Obj().Type()) {
		lv.Addressable = false
	}

	lv.Type = sel.Type().Underlying()

	return n
}

// binaryExpr generates code for binary operators.
func (c *compiler) binaryExpr(e *ast.BinaryExpr, lv *arch.LV) *node {
	op := e.Op.Type
	if op == scan.Land || op == scan.Lor {
		return c.logical(op, e, lv)
	}

	var lv2 arch.LV
	n := c.exprInternal(e.X, lv)
	if op == scan.Comma {
		n = c.rvalue(n, lv)
	}
	m := c.rvalue(c.exprInternal(e.Y, &lv2), &lv2)

	bop := binOp(op)
	aop := arithOp(op)
	switch {
	// regular binary operators (+, -, *, /, etc)
	case bop != 0:
		tv, found := c.typAndValue(e)
		if !found {
			return nil
		}
		n = c.rvalue(n, lv)
		lv.Btype = tv.Type
		return newNode(bop, lv, &lv2, n, m)

	// binary assignment operator such as (+=, -=, *=, /=, etc)
	case aop != 0:
		lvs := *lv
		src := c.rvalue(n, &lvs)
		m = newNode(aop, lv, &lv2, src, m)
		n = newNode(opAssign, lv, &lv2, n, m)
		lv.Addressable = false

	// assignment operator (=)
	case op == scan.Assign:
		n = newNode(opAssign, lv, &lv2, n, m)
		lv.Addressable = false

	// comma operator (,)
	case op == scan.Comma:
		n = c.rvalue(n, lv)
		n = newNode(opComma, &lv2, nil, n, m)

	default:
		c.errorf(e.Span().Start, "unknown binary op: %s\n", e.Op.Text)
	}

	return n
}

// logical generates code for || and && operators.
func (c *compiler) logical(op scan.Type, e *ast.BinaryExpr, lv *arch.LV) *node {
	l := []*ast.BinaryExpr{e}
	for x := e.X; ; {
		y, ok := x.(*ast.BinaryExpr)
		if !ok || y.Op.Type != op {
			break
		}
		l = append(l, y)
		x = y.X
	}

	var lx arch.LV
	n := c.exprInternal(l[len(l)-1].X, lv)
	for i := len(l) - 1; i >= 0; i-- {
		var lv2 arch.LV
		if lx.Addr == 0 {
			lx.Addr = c.cg.Label()
		}

		n = c.rvalue(n, lv)
		n2 := c.exprInternal(l[i].Y, &lv2)
		n2 = c.rvalue(n2, &lv2)
		if op == scan.Lor {
			n = newNode(opBrTrue, &lx, nil, n, n2)
		} else {
			n = newNode(opBrFalse, &lx, nil, n, n2)
		}
	}
	n = newNode(opLab, &lx, nil, n, nil)
	n = newNode(opBool, nil, nil, n, nil)
	lv.Type = types.Typ[types.Int]
	lv.Addressable = false

	return n
}

// condExpr generates code for ? and : operators.
func (c *compiler) condExpr(e *ast.CondExpr, lv *arch.LV) *node {
	l := []*ast.CondExpr{e}
	for x := e.Cond; ; {
		y, ok := x.(*ast.CondExpr)
		if !ok {
			break
		}
		l = append(l, y)
		x = y.Cond
	}

	var lx arch.LV
	var l2 int
	var typ types.Type
	n := c.exprInternal(l[len(l)-1].Cond, lv)
	for i := len(l) - 1; i >= 0; i-- {
		var lv2 arch.LV

		n = c.rvalue(n, lv)
		l1 := c.cg.Label()
		if l2 == 0 {
			l2 = c.cg.Label()
		}

		n2 := c.exprInternal(l[i].X, &lv2)
		n2 = c.rvalue(n2, &lv2)
		lx.Addr = l1
		n = newNode(opBrFalse, &lx, nil, n, n2)
		if typ == nil {
			typ = lv2.Type
		}

		n2 = c.exprInternal(l[i].Y, &lv2)
		n2 = c.rvalue(n2, &lv2)
		n = newNode(opGlue, nil, nil, n, n2)
	}

	lx.Addr = l2
	n = newNode(opIfElse, &lx, nil, n, nil)
	lv.Type = typ
	lv.Addressable = false
	return n
}

// arithOp returns the opcode used for a given binary arithmetic assignment operation.
func arithOp(op scan.Type) opcode {
	switch op {
	case scan.PlusEq:
		return opPlus
	case scan.MinusEq:
		return opSub
	case scan.AndEq:
		return opBinAnd
	case scan.OrEq:
		return opBinOr
	case scan.XorEq:
		return opBinXor
	case scan.MulEq:
		return opMul
	case scan.ModEq:
		return opMod
	case scan.DivEq:
		return opDiv
	case scan.LshEq:
		return opLsh
	case scan.RshEq:
		return opRsh
	}
	return 0
}

// binOp returns the opcode used for a given binary operation.
func binOp(op scan.Type) opcode {
	switch op {
	case scan.And:
		return opBinAnd
	case scan.Xor:
		return opBinXor
	case scan.Eq:
		return opEq
	case scan.Gt:
		return opGt
	case scan.Geq:
		return opGeq
	case scan.Lt:
		return opLt
	case scan.Lsh:
		return opLsh
	case scan.Leq:
		return opLeq
	case scan.Minus:
		return opSub
	case scan.Mod:
		return opMod
	case scan.Neq:
		return opNeq
	case scan.Or:
		return opBinOr
	case scan.Plus:
		return opPlus
	case scan.Rsh:
		return opRsh
	case scan.Div:
		return opDiv
	case scan.Mul:
		return opMul
	}
	return 0
}

// unaryExpr generates code unary operators (+a, -a, ~a, !a, etc).
func (c *compiler) unaryExpr(e *ast.UnaryExpr, lv *arch.LV) *node {
	pos := e.Span().Start
	n := c.exprInternal(e.X, lv)

	var x opcode
	switch op := e.Op.Type; op {
	case scan.Inc, scan.Dec:
		switch {
		case op == scan.Inc && e.Affix == ast.Prefix:
			x = opPreInc
		case op == scan.Inc && e.Affix == ast.Postfix:
			x = opPostInc
		case op == scan.Dec && e.Affix == ast.Prefix:
			x = opPreDec
		case op == scan.Dec && e.Affix == ast.Postfix:
			x = opPostDec
		}
		n = newNode(x, lv, nil, n, nil)
		lv.Addressable = false

	case scan.Plus:
		n = c.rvalue(n, lv)
		lv.Addressable = false

	case scan.Minus, scan.Negate, scan.Not:
		switch op {
		case scan.Minus:
			x = opNeg
		case scan.Negate:
			x = opNot
		case scan.Not:
			x = opLogNot
		}
		n = c.rvalue(n, lv)
		n = newNode(x, lv, nil, n, nil)
		lv.Addressable = false

	case scan.And:
		if lv.Addressable && lv.Ident {
			n = newNode(opAddr, lv, nil, n, nil)
		}
		lv.Addressable = false

	default:
		c.errorf(pos, "invalid unary expression %v", op)
	}
	return n
}

// sizeofExpr generates code for a sizeof(x) expression.
func (c *compiler) sizeofExpr(e *ast.SizeofExpr, lv *arch.LV, tv types.TypeAndValue) *node {
	lv.Value = tv.Value
	lv.Addressable = false
	n := newNode(opLit, lv, nil, nil, nil)
	return n

}

// starExpr generates code for a dereference expression (*a, etc).
func (c *compiler) starExpr(e *ast.StarExpr, lv *arch.LV) *node {
	n := c.exprInternal(e.X, lv)
	n = c.indirection(e, n, lv)
	lv.Addressable = true
	return n
}

// call expression generates code for calling functions (f(x), fact(1), etc).
func (c *compiler) callExpr(e *ast.CallExpr, lv *arch.LV) *node {
	c.exprInternal(e.Fun, lv)
	n := c.fnArgs(e.Args)
	if sig, ok := lv.Type.(*types.Signature); ok {
		lv.Size = len(e.Args)
		lv.Type = sig.Result().Type().Underlying()
		if !lv.Addressable {
			// regular function calls
			n = newNode(opCall, lv, nil, n, nil)
		} else {
			// function pointer calls
			n = newNode(opCalr, lv, nil, n, nil)
		}
	}
	lv.Addressable = false
	return n
}

// fnArgs generates code for passing function arguments.
func (c *compiler) fnArgs(args []ast.Expr) *node {
	var n *node
	var lv arch.LV
	for _, e := range args {
		m := c.rvalue(c.exprInternal(e, &lv), &lv)
		n = newNode(opGlue, nil, nil, n, m)
	}
	return n
}

// castExpr generates code casting ((void**) f, (int) a, etc).
func (c *compiler) castExpr(e *ast.CastExpr, lv *arch.LV, tv types.TypeAndValue) *node {
	n := c.exprInternal(e.X, lv)
	lv.Type = tv.Type
	return n
}

// typAndValue returns a type and value from the type checker for an expression.
func (c *compiler) typAndValue(e ast.Expr) (types.TypeAndValue, bool) {
	tv, found := c.Types[e]
	if !found {
		c.errorf(e.Span().Start, "no type info for expression")
	}
	return tv, found
}

// symbol returns a symbol from an object. A symbol is an object
// but with more compile time info such as the stack addresses of it.
func (c *compiler) symbol(obj types.Object) (*arch.LV, bool) {
	s, found := c.sym[obj]
	if !found {
		c.errorf(obj.Pos(), "no object information found")
	}
	return s, found
}
