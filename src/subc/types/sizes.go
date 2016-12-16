package types

// Sizes defines the sizing functions.
type Sizes interface {
	// Alignof returns the alignment of a variable of type T.
	Alignof(T Type) int64

	// Offsetsof returns the offsets of the given struct fields, in bytes.
	Offsetsof(fields []*Var) []int64

	// Sizeof returns the size of a variable of type T.
	Sizeof(T Type) int64
}

// StdSizes is a convenience type for creating commonly used Sizes.
// It makes the following simplifying assumptions:
//
//	- The size of an array of n elements corresponds to the size of
//	  a struct of n consecutive fields of the array's element type.
//      - The size of a struct is the offset of the last field plus that
//	  field's size. As with all element types, if the struct is used
//	  in an array its size must first be aligned to a multiple of the
//	  struct's alignment. All alignments are aligned against WordSize.
//	- All other types have size WordSize.
//	- Arrays and structs are aligned per spec definition; all other
//	  types are naturally aligned with a maximum alignment MaxAlign.
//
// *StdSizes implements Sizes.
//
type StdSizes struct {
	WordSize int64 // word size in bytes - must be >= 2
	MaxAlign int64 // maximum alignment in bytes - must be >= 1
}

func (s *StdSizes) Alignof(T Type) int64 {
	// For arrays and structs, alignment is defined in terms
	// of alignment of the elements and fields, respectively.
	switch t := T.Underlying().(type) {
	case *Array:
		// spec: "For a variable x of array type: unsafe.Alignof(x)
		// is the same as unsafe.Alignof(x[0]), but at least 1."
		return s.Alignof(t.elem)
	case *Record:
		// spec: "For a variable x of struct type: unsafe.Alignof(x)
		// is the largest of the values unsafe.Alignof(x.f) for each
		// field f of x, but at least 1."
		max := int64(1)
		for _, f := range t.fields {
			if a := s.Alignof(f.typ); a > max {
				max = a
			}
		}
		return max
	}
	a := s.Sizeof(T) // may be 0
	if a < 1 {
		return 1
	}
	if a > s.MaxAlign {
		return s.MaxAlign
	}
	return a
}

// Offsetof returns the offset of set of fields.
// All of the fields are aligned to the nearest word size boundary.
func (s *StdSizes) Offsetsof(fields []*Var) []int64 {
	offsets := make([]int64, len(fields))
	intSize := s.Sizeof(Typ[Int])
	var o int64
	for i, f := range fields {
		offsets[i] = o
		o += s.Sizeof(f.typ)
		o = (o + intSize - 1) / intSize * intSize
	}
	return offsets
}

// Sizeof returns the size of a type.
func (s *StdSizes) Sizeof(T Type) int64 {
	switch t := T.Underlying().(type) {
	case *Basic:
		k := t.typ
		switch k {
		case Bool:
			return 1
		case Char:
			return 1
		case Short:
			return 2
		case Int:
			return s.WordSize
		case Long:
			return 8
		case Float:
			return 4
		case Double:
			return 8
		case Complex:
			return 16
		}

		if k == UntypedString {
			return s.WordSize
		}
	case *Array:
		n := t.len
		if n == 0 {
			return 0
		}
		a := s.Alignof(t.elem)
		z := s.Sizeof(t.elem)
		return align(z, a)*int64(n-1) + z
	case *Record:
		n := t.NumFields()
		if n == 0 {
			return 0
		}

		offsets := t.offsets
		if t.offsets == nil {
			// compute offsets on demand
			offsets = s.Offsetsof(t.fields)
			t.offsets = offsets
		}

		// if it is a union, get the largest size in struct
		if t.union {
			usize := int64(0)
			for i := 1; i < len(t.offsets); i++ {
				size := t.offsets[i] - t.offsets[i-1]
				if size > usize {
					usize = size
				}
			}
			size := s.Sizeof(t.fields[n-1].typ)
			if size > usize {
				usize = size
			}
			t.offsets = nil

			return usize
		}

		return offsets[n-1] + s.Sizeof(t.fields[n-1].typ)
	}
	return s.WordSize // catch-all
}

// align returns the smallest y >= x such that y % a == 0.
func align(x, a int64) int64 {
	y := x + a - 1
	return y - y%a
}
