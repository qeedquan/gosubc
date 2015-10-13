package types

import (
	"subc/ast"
	"subc/scan"
)

// call type checks a call expression.
func (c *checker) call(x *operand, e *ast.CallExpr) exprType {
	// if there is no forward declaration of the function
	// it is assumed to be variadic and returns an int
	ident, ok := e.Fun.(*ast.Ident)
	if ok {
		var y operand
		c.ident(&y, ident, true)
		if y.mode == invalid {
			pos := e.Span().Start
			result := NewVar(pos, 0, ident.Name, Typ[Int], nil)
			sig := NewSignature(nil, result, true)
			fun := NewFunc(pos, GlobalStatic, ident.Name, sig)
			fwrd := NewFwrd(ident.Name, fun)
			c.declare(Fwd, c.scope, ident, fwrd, scan.NoPos)
		}
	}
	c.expr(x, e.Fun)

	invalidArgs := false
	var y operand
	for _, arg := range e.Args {
		c.expr(&y, arg)
		if isRecord(y.typ) {
			c.errorf(arg.Span().Start, "struct/union passing by value is not supported")
			invalidArgs = true
		}
	}
	if invalidArgs {
		goto Error
	}

	switch x.mode {
	case invalid:
		x.expr = e
		return statement

	default:
		sig, _ := x.typ.Underlying().(*Signature)
		if sig == nil {
			c.errorf(e.Span().Start, "cannot call a non-function %v", x)
			goto Error
		}

		params := sig.Params()
		numParams := 0
		if params != nil {
			numParams = params.Len()
		}
		if !sig.Variadic() && len(e.Args) != numParams {
			c.errorf(e.Lparen.Span().Start, "expected %d arguments, but function call passed %d arguments", numParams, len(e.Args))
			goto Error
		}

		if sig.Variadic() && numParams != 0 && len(e.Args) < numParams {
			c.errorf(e.Lparen.Span().Start, "expected at least %d arguments for variadic function, but function call passed %d arguments", numParams, len(e.Args))
		}

		// don't need to check the individual arguments, because we don't support passing records, so everything else
		// is a pointer or integer and pointers can be passed to integer and vice versa

		x.typ = sig.Result().Type().Underlying()
		if x.typ == Typ[Void] {
			x.mode = novalue
		}

		return statement
	}

Error:
	x.mode = invalid
	x.expr = e
	return statement
}

// selector type checks a selector expression (a.x, a->x, etc).
func (c *checker) selector(x *operand, e *ast.SelectorExpr) {
	pos := e.X.Span().Start

	c.expr(x, e.X)
	sel := &Selection{}

	typ := x.typ
	if isPointer(typ) {
		typ = deref(typ)
	}

	var obj Object
	switch typ := typ.(type) {
	case *Named:
		obj = typ.Obj()
	default:
		c.errorf(x.pos(), "unknown selector type: %T", typ)
	}

	typ = typ.Underlying()
	if isPointer(typ) {
		typ = deref(typ)
	}

	if x.mode == invalid {
		goto Error
	}

	switch op := e.Op.Type; op {
	case scan.Dot:
		if !isRecord(typ) {
			c.errorf(pos, "struct/union expected before . but got type %v", typ)
			goto Error
		}

		c.recordAccess(obj.Name(), sel, x, typ.(*Record), e)

	case scan.Arrow:
		if !isPointer(x.typ) || !isRecord(deref(x.typ.Underlying())) {
			c.errorf(pos, "struct/union expected before -> but got type %v", typ)
			goto Error
		}

		sel.indirect = true
		c.recordAccess(obj.Name(), sel, x, typ.(*Record), e)

	default:
		c.invalidAST(pos, "invalid selector operator %v", e.Op.Text)
		goto Error
	}

	c.Selections[e] = sel
	x.expr = e
	return

Error:
	x.mode = invalid
	x.expr = e
}

func deref(typ Type) Type {
	return typ.(*Pointer).Elem()
}

func (c *checker) recordAccess(recordName string, sel *Selection, x *operand, t *Record, e *ast.SelectorExpr) {
	pos := e.Sel.Pos
	name := e.Sel.Name
	found := false

	sel.isUnion = t.IsUnion()
	var vars []*Var
	for i := 0; i < t.NumFields(); i++ {
		v := t.Field(i)
		vars = append(vars, v)
		if v.Name() == name {
			x.typ = v.Type()
			sel.typ = v.Type()
			if array, ok := x.typ.Underlying().(*Array); ok {
				x.typ = NewPointer(array.Elem(), array)
				sel.typ = x.typ
			}

			sel.obj = v
			offsets := c.conf.Sizes.Offsetsof(vars)
			sel.offset = offsets[len(offsets)-1]
			found = true
			break
		}
	}
	if !found {
		c.errorf(pos, "struct/union %v has no such member %v", recordName, name)
		return
	}
}
