package compile

import (
	"fmt"
	"strconv"

	"subc/ast"
	"subc/compile/arch"
	"subc/scan"
	"subc/types"
)

// varDecl emits code for global variable declarations.
func (c *compiler) varDecl(d *ast.VarDecl) {
	intSize := c.cg.Int()
	v, found := c.variable(d.Name, c.Defs)
	if !found {
		return
	}

	storage := v.Storage()
	name := d.Name.Name
	typ := v.Type()
	lv := &arch.LV{
		Name:    name,
		Type:    typ,
		Storage: storage,
	}
	c.sym[v] = lv

	_, isArray := typ.(*types.Array)
	if isArray && d.Value != nil {
		c.cg.Data()
		c.cg.Name(name)

		switch x := d.Value.(type) {
		case *ast.StringLit:
			text := ""
			for _, lit := range x.Lits {
				text += lit.Text[1 : len(lit.Text)-1]
			}
			c.cg.Defs(text)
			c.cg.Defb(0)
			c.cg.Align(len(text)+1, intSize)

		case *ast.CompositeLit:
			prim := primType(typ)
			for _, elts := range x.Elts {
				tv, found := c.typAndValue(elts)
				if !found {
					continue
				}

				n, _ := strconv.Atoi(tv.Value.String())
				switch prim {
				case types.Typ[types.Char]:
					c.cg.Defb(n)
				default:
					c.cg.Defw(n)
				}
			}
			if prim == types.Typ[types.Char] {
				c.cg.Align(len(x.Elts), intSize)
			}

		default:
			panic(fmt.Sprintf("unknown value for code generation: %T", x))
		}

		if storage == types.Public {
			c.cg.Public(name)
		}
	} else {
		c.defineGlobal(v)
	}
}

// funcDecl emits code for function declarations
func (c *compiler) funcDecl(d *ast.FuncDecl) {
	if d.Body == nil {
		return
	}

	ret := c.Types[d.Result]
	switch ret.Type {
	case types.Typ[types.Short], types.Typ[types.Long],
		types.Typ[types.Float], types.Typ[types.Double],
		types.Typ[types.Bool], types.Typ[types.Complex]:
		c.errorf(d.Span().Start, "unsupported return type %s", ret.Type)
	}

	name := d.Name.Name

	intSize := c.cg.Int()
	addr := 2 * intSize
	for _, p := range d.Params {
		if p.Name == nil {
			addr += intSize
			continue
		}

		v, found := c.variable(p.Name, c.Defs)
		if !found {
			addr += intSize
			continue
		}

		lv := &arch.LV{
			Name:    p.Name.Name,
			Type:    v.Type(),
			Value:   v.Value(),
			Storage: types.Auto,
			Addr:    addr,
		}
		c.sym[v] = lv
		addr += intSize
	}

	lsize, localInits := c.localDecls(d.Decls)
	c.cg.Text()

	if d.Storage == nil || d.Storage.Type == scan.Extern {
		c.cg.Public(name)
	}

	c.cg.AlignText()
	c.cg.Name(name)
	c.cg.Entry()
	c.cg.Stack(lsize)
	c.cg.LocInit(localInits)
	c.cg.Retlab = c.cg.Label()

	c.labels = make(map[string]int)
	for _, l := range d.Labels {
		c.labels[l.Label.Name] = c.cg.Label()
	}

	for _, s := range d.Body.Stmt {
		c.stmt(s)
	}

	c.cg.Lab(c.cg.Retlab)
	c.cg.Stack(-lsize)
	c.cg.Exit()
}

// localDecls emits code for local variable declarations.
func (c *compiler) localDecls(d []ast.Decl) (stackSize int, localInits [][2]int) {
	intSize := c.cg.Int()
	addr := 0
	for _, d := range d {
		pos := d.Span().Start
		switch d := d.(type) {
		case *ast.ConstDecl:
		case *ast.EnumDecl:

		case *ast.VarDecl:
			v, found := c.variable(d.Name, c.Defs)
			if !found {
				break
			}

			typ := v.Type()
			val := v.Value()
			storage := v.Storage()
			size := int(c.cg.Sizeof(typ))
			size = (size + intSize - 1) / intSize * intSize
			lv := &arch.LV{}

			switch storage {
			case types.LocalStatic:
				c.defineLocal(v, lv)

			case types.Extern:
				// nothing

			case types.Auto:
				addr -= int(size)
				lv.Size = int(size)
				lv.Addr = addr

			default:
				c.errorf(pos, "unknown storage: %v", storage)
			}
			c.sym[v] = lv

			if val != nil && storage == types.Auto {
				n, _ := strconv.Atoi(val.String())
				localInits = append(localInits, [2]int{addr, n})
			}

		default:
			c.errorf(pos, "unknown decl: %T", d)
		}
	}

	return addr, localInits
}

// variable looks up a variable given its identifier.
func (c *compiler) variable(d *ast.Ident, m map[*ast.Ident]types.Object) (*types.Var, bool) {
	pos := d.Span().Start
	obj, found := m[d]
	if !found {
		c.errorf(pos, "no type information for %s", d.Name)
		return nil, false
	}

	v, ok := obj.(*types.Var)
	if !ok {
		c.errorf(pos, "not a valid variable")
	}

	switch v.Type() {
	case types.Typ[types.Short], types.Typ[types.Long],
		types.Typ[types.Float], types.Typ[types.Double],
		types.Typ[types.Bool], types.Typ[types.Complex]:
		c.errorf(pos, "unsupported type %s for variable", v.Type())
	}

	return v, true
}

// defineGlobal defines a variable at the file scope level.
func (c *compiler) defineGlobal(v *types.Var) {
	storage := v.Storage()
	if storage != types.Public && storage != types.GlobalStatic {
		return
	}

	c.cg.Data()

	intSize := c.cg.Int()
	ptrSize := c.cg.Pointer()

	name := v.Name()
	gname := c.cg.Gsym(name)
	isStatic := storage == types.GlobalStatic
	if storage == types.Public {
		c.cg.Public(name)
	}

	typ := v.Type().Underlying()
	prim := primType(typ)
	array, isArray := typ.(*types.Array)
	isRecord := isRecord(typ, true)

	if !isArray && !isRecord {
		c.cg.Name(name)
	}

	size := 1
	if isArray {
		size = int(array.Len())
	}

	val := 0
	if x := v.Value(); x != nil {
		val, _ = strconv.Atoi(x.String())
	}

	switch {
	case isRecord:
		c.cg.BSS(gname, c.cg.Sizeof(typ), isStatic)
	case prim == types.Typ[types.Char]:
		if isArray {
			c.cg.BSS(gname, size, isStatic)
		} else {
			c.cg.Defb(val)
			c.cg.Align(1, intSize)
		}
	case prim == types.Typ[types.Int]:
		if isArray {
			c.cg.BSS(gname, size*intSize, isStatic)
		} else {
			c.cg.Defw(val)
		}
	default:
		if isArray {
			c.cg.BSS(gname, size*ptrSize, isStatic)
		} else {
			c.cg.Defp(val)
		}
	}
}

// defineLocal defines a variable at a function scope.
func (c *compiler) defineLocal(v *types.Var, lv *arch.LV) {
	val := c.cg.Label()
	lv.Addr = val
	c.cg.Data()

	intSize := c.cg.Int()
	ptrSize := c.cg.Pointer()
	size := 1

	typ := v.Type().Underlying()
	prim := primType(typ)
	array, isArray := typ.(*types.Array)
	isRecord := isRecord(typ, true)

	if isArray {
		size = int(array.Len())
	}

	init := 0
	if x := v.Value(); x != nil {
		init, _ = strconv.Atoi(x.String())
	}

	if !isArray && !isRecord {
		c.cg.Lab(val)
	}

	switch {
	case isRecord:
		c.cg.BSS(c.cg.Labname(val), c.cg.Sizeof(typ), true)

	case prim == types.Typ[types.Char]:
		if isArray {
			c.cg.BSS(c.cg.Labname(val), size, true)
		} else {
			c.cg.Defb(init)
			c.cg.Align(1, intSize)
		}

	case prim == types.Typ[types.Int]:
		if isArray {
			c.cg.BSS(c.cg.Labname(val), size*intSize, true)
		} else {
			c.cg.Defw(init)
		}

	default:
		if isArray {
			c.cg.BSS(c.cg.Labname(val), size*ptrSize, true)
		} else {
			c.cg.Defp(init)
		}
	}
}

// primType dereferences an array to get the base type.
func primType(typ types.Type) types.Type {
	for {
		typ = typ.Underlying()
		switch p := typ.(type) {
		case *types.Array:
			typ = p.Elem()
		default:
			return typ
		}
	}
}
