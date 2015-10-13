package types

import "fmt"

func isNamed(typ Type) bool {
	if _, ok := typ.(*Basic); ok {
		return ok
	}
	_, ok := typ.(*Named)
	return ok
}

func isBoolean(typ Type) bool {
	t, ok := typ.Underlying().(*Basic)
	return (ok && t.info&IsInteger != 0) || isPointer(typ.Underlying())
}

func isInteger(typ Type) bool {
	t, ok := typ.Underlying().(*Basic)
	return ok && t.info&IsInteger != 0
}

func isNumeric(typ Type) bool {
	t, ok := typ.Underlying().(*Basic)
	return (ok && t.info&IsInteger != 0) || isPointer(typ.Underlying())
}

func isVoid(typ Type) bool {
	t, ok := typ.Underlying().(*Basic)
	return ok && t.info&IsVoid != 0
}

func isArray(typ Type) bool {
	_, ok := typ.Underlying().(*Array)
	return ok
}

func isPointer(typ Type) bool {
	_, ok := typ.Underlying().(*Pointer)
	return ok
}

func isRecord(typ Type) bool {
	_, ok := typ.Underlying().(*Record)
	return ok
}

func isVoidPointer(typ Type) bool {
	return isPointer(typ) && deref(typ) == Typ[Void]
}

// Identical returns if two types are identical.
func Identical(x, y Type) bool {
	if x == y {
		return true
	}

	switch x := x.(type) {
	case *Array:
		// Two arrays are the same if they have the same length and underlying type
		if y, ok := y.(*Array); ok {
			return x.len == y.len && Identical(x.elem, y.elem)
		}

	case *Basic:
		// Two basics are the same if they have the same underlying type
		if y, ok := y.(*Basic); ok {
			return x.typ == y.typ
		}

	case *Record:
		// Two records are identical if they have the same number of fields
		// and with all the same types and names
		if y, ok := y.(*Record); ok {
			if x.NumFields() == y.NumFields() {
				for i, f := range x.fields {
					g := y.fields[i]
					if f.name != g.name || !Identical(f.typ, g.typ) {
						return false
					}
				}
				return true
			}
		}

	case *Pointer:
		// Two pointer types are identical if they have identical base types.
		if y, ok := y.(*Pointer); ok {
			return Identical(x.base, y.base)
		}

	case *Tuple:
		// Two tuples types are identical if they have the same number of elements
		// and corresponding elements have identical types.
		if y, ok := y.(*Tuple); ok {
			if x.Len() == y.Len() {
				if x != nil {
					for i, v := range x.vars {
						w := y.vars[i]
						if !Identical(v.typ, w.typ) {
							return false
						}
					}
				}
				return true
			}
		}

	case *Signature:
		// Two function types are identical if they have the same number of parameters
		// and result values, corresponding parameter and result types are identical,
		// and either both functions are variadic or neither is. Parameter and result
		// names are not required to match.
		if y, ok := y.(*Signature); ok {
			return x.variadic == y.variadic &&
				Identical(x.params, y.params) &&
				Identical(x.result.typ, y.result.typ)
		}

	case *Named:
		// Two named types are identical if their type name
		// originate in the same type declaration.
		if y, ok := y.(*Named); ok {
			return x.obj == y.obj
		}

	default:
		panic(fmt.Sprintf("unknown type %T", x))
	}

	return false
}
