package types

import (
	"bytes"
	"fmt"
	"text/scanner"

	"subc/constant"
	"subc/scan"
)

// Object represents a type checked object.
type Object interface {
	Parent() *Scope                   // returns the parent scope of the object is in
	Pos() scanner.Position            // the position of the object in the source code
	Name() string                     // the name of the object
	Type() Type                       // the type of the object
	String() string                   // the string of the object
	setParent(parent *Scope)          // set the parent scope
	setScopePos(pos scanner.Position) // set the scope information
	scopePos() scanner.Position       // get the scope position
}

// object provides a common base for all
// other objects to embed.
type object struct {
	parent    *Scope
	pos       scanner.Position
	name      string
	typ       Type
	scopePos_ scanner.Position
}

// Func represents a function.
type Func struct {
	object
	storage Storage
}

// Fwrd represents a forward declaration.
type Fwrd struct {
	object
	objs []Object
}

// Const represents a constant value.
type Const struct {
	object
	val constant.Value
}

// Var represents a variable.
type Var struct {
	object
	storage Storage
	visited bool
	isField bool
	val     constant.Value
}

// Label represents a label.
type Label struct {
	object
}

// TypeName represents a type name object.
// An example would be struct file fd;
// fd in this case would be the type name.
type TypeName struct {
	object
}

// NewTypeName creates a type name object.
func NewTypeName(pos scanner.Position, name string, typ Type) *TypeName {
	return &TypeName{object{nil, pos, name, typ, scan.NoPos}}
}

// NewField creates a new field inside a record declaration object.
func NewField(pos scanner.Position, name string, typ Type) *Var {
	return &Var{object: object{nil, pos, name, typ, scan.NoPos}}
}

// NewFunc creates a new function declaration.
func NewFunc(pos scanner.Position, storage Storage, name string, sig *Signature) *Func {
	var typ Type
	if sig != nil {
		typ = sig
	}
	return &Func{object{nil, pos, name, typ, scan.NoPos}, storage}
}

// NewFwrd creates a new forward declaration.
func NewFwrd(name string, objs ...Object) *Fwrd {
	typ := objs[len(objs)-1].Type()
	return &Fwrd{object: object{name: name, typ: typ}, objs: objs}
}

// NewConst creates a new constant declaration.
func NewConst(pos scanner.Position, name string, typ Type, val constant.Value) *Const {
	return &Const{object: object{nil, pos, name, typ, scan.NoPos}, val: val}
}

// NewVar creates a new variable declaration.
func NewVar(pos scanner.Position, storage Storage, name string, typ Type, val constant.Value) *Var {
	return &Var{object: object{nil, pos, name, typ, scan.NoPos}, storage: storage, val: val}
}

// NewLabel creates a new label declaration.
func NewLabel(pos scanner.Position, name string) *Label {
	return &Label{object: object{nil, pos, name, nil, scan.NoPos}}
}

func (obj *Func) Storage() Storage { return obj.storage }

func (obj *Var) Storage() Storage      { return obj.storage }
func (obj *Var) Value() constant.Value { return obj.val }

func (obj *object) Parent() *Scope                   { return obj.parent }
func (obj *object) Pos() scanner.Position            { return obj.pos }
func (obj *object) Name() string                     { return obj.name }
func (obj *object) Type() Type                       { return obj.typ }
func (obj *object) setParent(parent *Scope)          { obj.parent = parent }
func (obj *object) setScopePos(pos scanner.Position) { obj.scopePos_ = pos }
func (obj *object) scopePos() scanner.Position       { return obj.scopePos_ }

// ObjectString returns a pretty-printed version of an object.
func ObjectString(obj Object) string {
	var buf bytes.Buffer
	writeObject(&buf, obj)
	return buf.String()
}

func writeObject(buf *bytes.Buffer, obj Object) {
	typ := obj.Type()
	switch obj := obj.(type) {
	case *Const:
		buf.WriteString("const")

	case *Var:
		if obj.isField {
			buf.WriteString("field")
		} else {
			buf.WriteString("var")
		}

	case *Func:
		buf.WriteString("func " + obj.Name())
		if typ != nil {
			WriteSignature(buf, typ.(*Signature))
		}
		return

	case *Fwrd:
		for _, f := range obj.objs {
			buf.WriteString("fwrd " + obj.Name() + " ")
			if typ := f.Type(); typ != nil {
				WriteType(buf, typ)
			}
			buf.WriteString("\n")
		}
		return

	case *TypeName:
		buf.WriteString("type")
		typ = typ.Underlying()

	default:
		panic(fmt.Sprintf("writeObject(%T)", obj))
	}

	buf.WriteString(" " + obj.Name())
	if typ != nil {
		buf.WriteByte(' ')
		WriteType(buf, typ)
	}

	switch obj := obj.(type) {
	case *Const:
		buf.WriteString(" = " + obj.val.String())
	}
}

func (obj *Const) String() string    { return ObjectString(obj) }
func (obj *Var) String() string      { return ObjectString(obj) }
func (obj *Func) String() string     { return ObjectString(obj) }
func (obj *Fwrd) String() string     { return ObjectString(obj) }
func (obj *Label) String() string    { return ObjectString(obj) }
func (obj *TypeName) String() string { return ObjectString(obj) }

// newStorage creates a storage type given a token, whether not that
// variable is global and if it is a function.
func newStorage(tok *scan.Token, global, isFunc bool) Storage {
	var typ scan.Type
	if tok == nil {
		if isFunc {
			typ = scan.Extern
		} else if !global {
			typ = scan.Auto
		}
	} else {
		typ = tok.Type
	}

	var storage Storage
	switch typ {
	case scan.Extern:
		storage = Extern
	case scan.Auto:
		storage = Auto
	case scan.Static:
		if global {
			storage = GlobalStatic
		} else {
			storage = LocalStatic
		}
	default:
		storage = Public
	}
	return storage
}
