package types

import "subc/constant"

// Storage represents a storage location.
type Storage uint

// Storage locations.
const (
	Auto         Storage = 1 << iota // local declaration storage.
	Public                           // global storage (file scope)
	Extern                           // external storage, for using them before linking resolution.
	GlobalStatic                     // file scope static variables
	LocalStatic                      // function scope static variables
)

func (s Storage) String() string {
	switch s {
	case Auto:
		return "auto"
	case Public:
		return "public"
	case Extern:
		return "extern"
	case GlobalStatic:
		return "global static"
	case LocalStatic:
		return "local static"
	}
	return "unknown"
}

// Type represents a type.
type Type interface {
	Underlying() Type
	String() string
}

// TypeAndValue represents a type and a value.
type TypeAndValue struct {
	mode  operandMode
	Type  Type
	Value constant.Value
}

// Signature represents a signature.
type Signature struct {
	scope    *Scope
	params   *Tuple
	result   *Var
	variadic bool
}

// Tuple represents function arguments.
type Tuple struct {
	vars []*Var
}

// Array represents an array.
type Array struct {
	len  int64
	elem Type
}

// Basic Types.
type (
	BasicType int
	BasicInfo int
)

// Basic represents a native type like char or int.
type Basic struct {
	typ  BasicType
	info BasicInfo
	name string
}

// Record represents struct and union types.
type Record struct {
	union   bool
	fields  []*Var
	offsets []int64
}

// Enum represent enums.
type Enum struct {
	values []*Const
}

// Pointer represents a pointer.
type Pointer struct {
	base  Type
	decay *Array
}

// Named represents a name that has been
// defined by a record.
// An example is struct file fd, fd will be the Named in this case.
type Named struct {
	obj        *TypeName
	underlying Type
}

// Various basic types.
const (
	Invalid BasicType = iota

	Char
	Short
	Int
	Long
	Float
	Double
	Bool
	Complex
	Void

	UntypedString
)

// Basic type information.
const (
	IsBoolean BasicInfo = 1 << iota // boolean type
	IsInteger                       // integer type
	IsFloat                         // floating point type
	IsComplex                       // complex type
	IsString                        // a string
	IsUntyped                       // untyped, mainly for literals
	IsVoid                          // void type

	IsNumeric = IsInteger // an integer or pointer
)

// Typ is an array containing all the basic types.
var Typ = [...]*Basic{
	Invalid: {Invalid, 0, "invalid type"},

	Bool:    {Bool, IsBoolean, "_Bool"},
	Complex: {Complex, IsComplex, "_Complex"},
	Char:    {Char, IsInteger, "char"},
	Short:   {Char, IsInteger, "short"},
	Int:     {Int, IsInteger, "int"},
	Long:    {Int, IsInteger, "long"},
	Float:   {Float, IsFloat, "float"},
	Double:  {Double, IsFloat, "double"},
	Void:    {Void, IsVoid, "void"},

	UntypedString: {UntypedString, IsString | IsUntyped, "untyped string"},
}

// NewSignature creates a new signature.
func NewSignature(params *Tuple, result *Var, variadic bool) *Signature {
	return &Signature{nil, params, result, variadic}
}

// NewEnum creates a new enum.
func NewEnum(values []*Const) *Enum {
	return &Enum{values: values}
}

// NewRecord creates a new record.
func NewRecord(union bool, fields []*Var) *Record {
	return &Record{union, fields, nil}
}

// NewPointer creates a new pointer.
// The decay represents if this was an array that decayed to
// a pointer when passing in a function or using it in operations.
func NewPointer(base Type, decay *Array) *Pointer {
	return &Pointer{base: base, decay: decay}
}

// NewTuple creates a tuple.
func NewTuple(vars ...*Var) *Tuple {
	return &Tuple{vars: vars}
}

// NewArray creates an array.
func NewArray(elem Type, len int64) *Array {
	return &Array{elem: elem, len: len}
}

// NewNamed creates a named.
func NewNamed(obj *TypeName, underlying Type) *Named {
	if _, ok := underlying.(*Named); ok {
		panic("types.NewNamed: underlying type must not be *Named")
	}
	typ := &Named{obj: obj, underlying: underlying}
	if obj.typ == nil {
		obj.typ = typ
	}
	return typ

}

func (t *Basic) Underlying() Type     { return t }
func (t *Array) Underlying() Type     { return t }
func (t *Record) Underlying() Type    { return t }
func (t *Pointer) Underlying() Type   { return t }
func (t *Signature) Underlying() Type { return t }
func (t *Tuple) Underlying() Type     { return t }
func (t *Enum) Underlying() Type      { return t }
func (t *Named) Underlying() Type     { return t.underlying }

func (t *Record) String() string    { return TypeString(t) }
func (t *Pointer) String() string   { return TypeString(t) }
func (t *Basic) String() string     { return TypeString(t) }
func (t *Array) String() string     { return TypeString(t) }
func (t *Signature) String() string { return TypeString(t) }
func (t *Tuple) String() string     { return TypeString(t) }
func (t *Enum) String() string      { return TypeString(t) }
func (t *Named) String() string     { return TypeString(t) }

func (tv TypeAndValue) Addressable() bool {
	return tv.mode == variable
}

func (tv TypeAndValue) Assignable() bool {
	return tv.mode == variable
}

func (tv TypeAndValue) IsValue() bool {
	switch tv.mode {
	case constant_, variable, value:
		return true
	}
	return false
}

// IsType returns if the this mode is a type expression.
func (tv TypeAndValue) IsType() bool {
	return tv.mode == typexpr
}

// IsVoid returns if the type is a void value.
func (tv TypeAndValue) IsVoid() bool {
	return tv.mode == novalue
}

func (t *Array) Elem() Type { return t.elem }
func (t *Array) Len() int64 { return t.len }

func (t *Record) NumFields() int   { return len(t.fields) }
func (t *Record) Field(i int) *Var { return t.fields[i] }
func (t *Record) IsUnion() bool    { return t.union }

func (t *Tuple) Len() int { return len(t.vars) }

func (t *Pointer) Elem() Type    { return t.base }
func (t *Pointer) Decay() *Array { return t.decay }

func (t *Signature) Result() *Var   { return t.result }
func (t *Signature) Params() *Tuple { return t.params }
func (t *Signature) Variadic() bool { return t.variadic }

func (t *Named) Obj() *TypeName { return t.obj }
