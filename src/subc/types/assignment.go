package types

// assignment tries to see if the assignment of y to x is possible.
func (c *checker) assignment(x, y *operand) {
	a, b := ExprString(x.expr), ExprString(y.expr)

	// lhs has to be a variable
	if x.mode != variable {
		c.errorf(x.pos(), "%v is not an assignable variable", a)
		return
	}

	// struct/unions are not supported for assignment
	if isRecord(x.typ) || isRecord(y.typ) {
		c.errorf(x.pos(), "%v cannot be assigned to %v, assignment of struct/unions are not supported", a, b)
		x.mode = invalid
		return
	}

	// strings can be assigned to a char* only
	if y.typ == Typ[UntypedString] && isPointer(x.typ) && deref(x.typ) == Typ[Char] {
		return
	}

	// void pointers can be assigned either way
	if isVoidPointer(x.typ) || isVoidPointer(y.typ) {
		return
	}

	// function pointers are allowed to assigned to other function pointers or void
	// or to integers
	s, _ := x.typ.Underlying().(*Signature)
	if s != nil {
		t, _ := y.typ.Underlying().(*Signature)
		if isVoidPointer(y.typ) || t != nil || isInteger(y.typ) {
			return
		}
	}

	// allow integers and pointers to be assigned to each other
	// we are more lenient on this than SubC on this, because we allow pointers
	// to be assigned to integers and integer to pointers without casting
	if isNumeric(x.typ) && isNumeric(y.typ) {
		return
	}

	if !Identical(x.typ, y.typ) {
		c.errorf(x.pos(), "cannot assign because of type mismatch of %v and %v", x, y)
		x.mode = invalid
		return
	}
}
