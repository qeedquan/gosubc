package types

import (
	"text/scanner"

	"subc/ast"
	"subc/scan"
)

// enumDecl type checks an enum declaration.
func (c *checker) enumDecl(d *ast.EnumDecl) {
	typ := c.typExpr(d)
	if d.Name != nil {
		obj := NewTypeName(d.Enum.Span().Start, d.Name.Name, typ)
		c.declare(Tag, c.scope, d.Name, obj, scan.NoPos)
	}
}

// recordDecl type checks a record declaration.
func (c *checker) recordDecl(d *ast.RecordDecl) {
	rec := new(Record)
	rec.union = d.Record.Type == scan.Union

	obj := NewTypeName(d.Record.Span().Start, d.Name.Name, rec)
	c.declare(Tag, c.scope, d.Name, obj, scan.NoPos)

	var fset objset
	var fields []*Var
	add := func(field *ast.FieldDecl, ident *ast.Ident, typ Type, pos scanner.Position) {
		name := ident.Name
		fld := NewField(pos, name, typ)
		if c.declareInSet(&fset, pos, fld) {
			fields = append(fields, fld)
			c.recordDef(ident, fld)
		}

		if isVoid(typ) {
			c.errorf(pos, "field %s is declared void", name)
		}
	}
	for _, f := range d.Fields {
		typ := c.typExpr(f.Type)
		add(f, f.Name, typ, f.Name.Span().Start)
	}
	rec.fields = fields

	c.recordTypeAndValue(d, typexpr, rec, nil)
}

// isVoidFuncParam checks if a parameter is void.
func isVoidFuncParam(e ast.Expr) bool {
	t, ok := e.(*ast.BasicType)
	if !ok {
		return false
	}
	return t.Type.Type == scan.Void && t.X == nil
}

// decayArg transforms the last array type to pointer type in function declarations
// char a[] will become char *a, and char *a[] will become char **a and so forth
func decayArg(typ Type) Type {
	switch typ := typ.(type) {
	case *Pointer:
		typ.base = decayArg(typ.base)
		return typ
	case *Array:
		if !isPointer(typ.elem) && !isArray(typ.elem) {
			typ.elem = decayArg(typ.elem)
			if !isArray(typ.elem) {
				typ.len = 0
			}
		} else {
			return NewPointer(typ.elem, typ)
		}
		return typ
	default:
		return typ
	}
}

// funcDecl type checks a function declaration.
func (c *checker) funcDecl(d *ast.FuncDecl) {
	name := d.Name.Name

	var result *Var
	if d.Result != nil {
		result = NewVar(d.Result.Span().Start, newStorage(d.Storage, true, true), "", c.typExpr(d.Result), nil)
	} else {
		result = NewVar(d.Span().Start, newStorage(d.Storage, true, true), "", Typ[Int], nil)
	}

	variadic := false

	// f() is f(void), not variadic for this language.
	var vars []*Var
	if !(len(d.Params) == 1 && isVoidFuncParam(d.Params[0].Type)) {
		for i, p := range d.Params {
			var name string
			if p.Name != nil {
				name = p.Name.Name
			}

			// variadic function needs at least one named argument before it
			pos := p.Span().Start
			tok, _ := p.Type.(scan.Token)
			if tok.Type == scan.Ellipsis {
				if i == 0 {
					c.errorf(pos, "requires a named argument before ...")
				} else if i == len(d.Params)-1 {
					variadic = true
					break
				}
			}

			// struct/unions passing are not supported
			typ := c.typExpr(p.Type)
			typ = decayArg(typ)
			if isRecord(typ) {
				c.errorf(p.Span().Start, "struct/union parameter in functions are not supported")
			}

			vars = append(vars, NewVar(p.Span().Start, Auto, name, typ, nil))
		}
	}

	sig := NewSignature(NewTuple(vars...), result, variadic)
	fun := NewFunc(d.Name.Pos, newStorage(d.Storage, true, true), name, sig)
	fwrd := NewFwrd(name, fun)
	if d.Body == nil {
		// a forward declaration
		c.declare(Fwd, c.scope, d.Name, fwrd, scan.NoPos)
	} else {
		// an ordinary function will be in both forward declaration and ordinary scope
		// so we can match against invalid declarations easier
		c.declare(Fwd, c.scope, nil, fwrd, scan.NoPos)
		c.declare(Ord, c.scope, d.Name, fun, scan.NoPos)
		c.checkFuncBody(d.Params, vars, d.Decls, d.Labels, d.Body)
	}
}

// varDecl type checks a variable declaration.
func (c *checker) varDecl(d *ast.VarDecl, global bool) {
	var x operand

	pos := d.Span().Start
	typ := c.typExpr(d)
	name := d.Name.Name
	array, isArray := typ.(*Array)
	switch {
	case isArray:
		if isVoid(array.Elem()) {
			c.errorf(pos, "declaration of %s as void array", name)
		}

		if d.Value != nil {
			vpos := d.Value.Span().Start
			if !global {
				c.errorf(vpos, "initialization of local arrays not supported")
			} else {
				c.expr(&x, d.Value)
				switch v := d.Value.(type) {
				case *ast.CompositeLit:
					array.len = int64(len(v.Elts))
					if array.len == 0 {
						c.errorf(vpos, "cannot have empty initializer")
					}

				case *ast.StringLit:
					array.len = 0
					for _, lit := range v.Lits {
						array.len += int64(len(lit.Text))
					}

				default:
					c.errorf(vpos, "unsupported array initialization type: %T", v)
				}
			}
		}

	case d.Value != nil:
		c.expr(&x, d.Value)
		if isPointer(typ) && x.mode == constant_ && x.val.String() != "0" {
			c.errorf(d.Value.Span().Start, "non-zero pointer initialization")
		}
	}

	obj := NewVar(d.Span().Start, newStorage(d.Storage, global, false), name, typ, x.val)
	if global {
		scope, alt := c.scope.LookupParent(Ord, name, scan.NoPos)
		v, ok := alt.(*Var)
		if alt != nil && (ok && v.val == nil) {
			delete(scope.elems[Ord], name)
		}

		if !(alt != nil && ok && v.val != nil && x.val == nil) {
			c.declare(Ord, c.scope, d.Name, obj, scan.NoPos)
		}
		fwrd := NewFwrd(name, obj)
		c.declare(Fwd, c.scope, nil, fwrd, scan.NoPos)
	} else {
		c.declare(Ord, c.scope, d.Name, obj, scan.NoPos)
	}

	if obj.Storage() == Extern && x.val != nil {
		c.errorf(pos, "extern variable cannot have initializers")
	}

	if isVoid(typ) {
		c.errorf(pos, "variable %s declared void", name)
	}
}

// checkFwrd checks if the forward declarations matches so far.
func (c *checker) checkFwrd(x *Fwrd) {
	for i := len(x.objs) - 1; i > 0; i-- {
		a := x.objs[i]
		b := x.objs[i-1]
		if !Identical(a.Type(), b.Type()) {
			c.errorf(a.Pos(), "declaration mismatch from declaration at %v", b.Pos())
			break
		}
	}
}

// declare declares an object in a name space, it will error out
// if there is an existing object with the same name in the same scope and namespace.
func (c *checker) declare(ns Namespace, scope *Scope, id *ast.Ident, obj Object, pos scanner.Position) {
	if alt := scope.Insert(ns, obj); alt != nil {
		if ns == Fwd {
			x := alt.(*Fwrd)
			y := obj.(*Fwrd)
			x.objs = append(x.objs, y.objs...)
			c.checkFwrd(x)
		} else {
			c.errorf(obj.Pos(), "%s redeclared in the %v namespace", obj.Name(), ns)
			c.reportAltDecl(alt)
		}
		return
	}
	obj.setScopePos(pos)
	if id != nil {
		c.recordDef(id, obj)
	}
}

// recordDef records a definition.
func (c *checker) recordDef(id *ast.Ident, obj Object) {
	c.Defs[id] = obj
}

// reportAltDecl reports where the other object declaration occured in
// the case of redeclaration errors.
func (c *checker) reportAltDecl(obj Object) {
	if pos := obj.Pos(); pos.IsValid() {
		c.errorf(pos, "\tother declaration of %s", obj.Name())
	}
}
