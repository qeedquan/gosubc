package types

import (
	"bytes"
	"fmt"
	"text/scanner"

	"subc/ast"
	"subc/constant"
	"subc/scan"
)

// operandMode is the type of operand it is.
type operandMode byte

// The types of operands.
const (
	invalid operandMode = iota
	novalue
	typexpr
	constant_
	variable
	value
)

var operandModeString = [...]string{
	invalid:   "invalid operand",
	novalue:   "no value",
	typexpr:   "type",
	constant_: "constant",
	variable:  "variable",
	value:     "value",
}

// operand is a structure used during type checking,
// it is passed through until the leaves where it is filled
// with type information that the parent can use.
type operand struct {
	mode operandMode
	expr ast.Expr
	typ  Type
	val  constant.Value
}

func (x *operand) pos() scanner.Position {
	if x.expr == nil {
		return scan.NoPos
	}
	return x.expr.Span().Start
}

func (x *operand) setConst(typ scan.Type, lit string) {
	val := constant.MakeFromLiteral(lit, typ, 0)
	if val == nil {
		x.mode = invalid
		return
	}

	var kind BasicType
	switch typ {
	case scan.Number:
		kind = Int
	case scan.Rune:
		kind = Char
	case scan.String:
		kind = UntypedString
	default:
		panic(fmt.Sprintf("unknown type: %v", typ))
	}

	x.mode = constant_
	x.typ = Typ[kind]
	x.val = val
}

func (x *operand) String() string {
	var buf bytes.Buffer

	var expr string
	if x.expr != nil {
		expr = ExprString(x.expr)
	} else {
		switch x.mode {
		case typexpr:
			expr = TypeString(x.typ)
		case constant_:
			expr = x.val.String()
		}
	}

	// <expr> (
	if expr != "" {
		buf.WriteString(expr)
		buf.WriteString(" (")
	}

	// <untyped kind>
	hasType := false
	switch x.mode {
	case invalid, novalue, typexpr:
		// no type
	default:
		// has type
		hasType = true
	}

	// <mode>
	buf.WriteString(operandModeString[x.mode])

	// <val>
	if x.mode == constant_ {
		if s := x.val.String(); s != expr {
			buf.WriteByte(' ')
			buf.WriteString(s)
		}
	}

	// <typ>
	if hasType {
		if x.typ != Typ[Invalid] {
			buf.WriteString(" of type ")
			WriteType(&buf, x.typ)
		} else {
			buf.WriteString(" with invalid type")
		}
	}

	// )
	if expr != "" {
		buf.WriteByte(')')
	}

	return buf.String()
}

func (x *operand) assignableTo(config *Config, T Type) bool {
	if x.mode == invalid || T == Typ[Invalid] {
		// avoid spurious errors
		return true
	}

	V := x.typ
	if Identical(V, T) {
		return true
	}

	Vu := V.Underlying()
	Tu := T.Underlying()

	if Identical(Vu, Tu) && (!isNamed(V) || !isNamed(T)) {
		return true
	}

	return false
}
