package compile

import "subc/types"

// isArray returns if a type is an array.
func isArray(typ types.Type) bool {
	_, ok := typ.Underlying().(*types.Array)
	return ok
}

// isPointer returns if a type is a pointer.
func isPointer(typ types.Type) bool {
	_, ok := typ.Underlying().(*types.Pointer)
	return ok
}

// isVoidPointer returns if the type is a void pointer.
func isVoidPointer(typ types.Type) bool {
	ptr, ok := typ.(*types.Pointer)
	if !ok {
		return false
	}

	return ptr.Elem() == types.Typ[types.Void]
}

// isRecord returns if a type is a record.
// The drillDown flag is used to determine if the function
// should keep dereferencing arrays/pointers to get to the base
// type or if it should only go down one level.
func isRecord(typ types.Type, drillDown bool) bool {
loop:
	for {
		typ = typ.Underlying()
		switch x := typ.(type) {
		case *types.Pointer:
			typ = x.Elem().Underlying()
		case *types.Array:
			typ = x.Elem().Underlying()
		default:
			break loop
		}
		if !drillDown {
			break
		}
	}
	_, ok := typ.Underlying().(*types.Record)
	return ok
}

// deref dereferences a type if it is a pointer, it returns the dereferenced type.
func deref(typ types.Type) types.Type {
	ptr, ok := typ.(*types.Pointer)
	if !ok {
		return typ
	}
	return ptr.Elem()
}
