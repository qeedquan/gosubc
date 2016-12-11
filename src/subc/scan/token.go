package scan

import (
	"fmt"
	"text/scanner"
)

// Span stores the beginning and end position boundary of a token or block.
type Span struct {
	Start scanner.Position
	End   scanner.Position
}

func (s Span) IsValid() bool { return s != NoSpan }

var (
	NoSpan = Span{}             // A zero value for span, considered to be invalid span.
	NoPos  = scanner.Position{} // A zero value for position, considered to be an invalid position.
)

type Token struct {
	Type Type
	Pos  scanner.Position
	Text string
}

func (i Token) Span() Span {
	start, end := i.Pos, i.Pos
	end.Offset += len(i.Text)
	end.Column += len(i.Text)
	return Span{start, end}
}

func (i Token) String() string {
	switch {
	case i.Type == EOF:
		return fmt.Sprintf("%v: EOF", i.Pos)
	case i.Type == Error:
		return fmt.Sprintf("%v: error: %v", i.Pos, i.Text)
	case len(i.Text) > 20:
		return fmt.Sprintf("%v: %.20q...", i.Pos, i.Text)
	}
	return fmt.Sprintf("%v: %q", i.Pos, i.Text)
}

// Type is a token type.
type Type int

// All of the token types.
const (
	EOF Type = iota
	Error
	Comment
	Preprocessor

	Div
	Mul
	Mod
	Plus
	Minus
	Lsh
	Rsh
	Gt
	Geq
	Lt
	Leq
	Eq
	Neq
	And
	Xor
	Or
	Land
	Lor

	Arrow
	AndEq
	XorEq
	LshEq
	MinusEq
	ModEq
	OrEq
	PlusEq
	RshEq
	DivEq
	MulEq
	Assign
	Auto
	Break
	Case
	Char
	Colon
	Comma
	Const
	Continue
	Dec
	Default
	Do
	Dot
	Double
	Ellipsis
	Else
	Enum
	Extern
	Float
	For
	Goto
	Ident
	If
	Inc
	Int
	Lbrace
	Lbrack
	Long
	Lparen
	Not
	Qmark
	Rbrace
	Rbrack
	Register
	Restrict
	Return
	Rparen
	Semi
	Short
	Signed
	Sizeof
	Static
	Struct
	Switch
	Typedef
	Negate
	Union
	Unsigned
	Void
	Volatile
	While

	Alignas
	Alignof
	Atomic
	Bool
	Complex
	Generic
	Imaginary
	Noreturn
	Static_assert
	Thread_local

	Number
	Rune
	String
)

var types = [...]string{
	EOF:          "EOF",
	Error:        "error",
	Comment:      "comment",
	Preprocessor: "preprocessor",

	Div:   "/",
	Mul:   "*",
	Mod:   "%",
	Plus:  "+",
	Minus: "-",
	Lsh:   "<<",
	Rsh:   ">>",
	Gt:    ">",
	Geq:   "<=",
	Lt:    "<",
	Leq:   "<=",
	Eq:    "==",
	Neq:   "!=",
	And:   "&",
	Xor:   "^",
	Or:    "|",
	Land:  "&&",
	Lor:   "||",

	Arrow:    "<-",
	AndEq:    "&=",
	XorEq:    "^=",
	LshEq:    "<<=",
	MinusEq:  "-=",
	ModEq:    "%=",
	OrEq:     "|=",
	PlusEq:   "+=",
	RshEq:    ">>=",
	DivEq:    "/=",
	MulEq:    "*=",
	Assign:   "=",
	Auto:     "auto",
	Break:    "break",
	Case:     "case",
	Char:     "char",
	Colon:    ":",
	Comma:    ",",
	Const:    "const",
	Continue: "continue",
	Dec:      "--",
	Default:  "default",
	Do:       "do",
	Dot:      ".",
	Double:   "double",
	Ellipsis: "...",
	Else:     "else",
	Enum:     "enum",
	Extern:   "extern",
	Float:    "float",
	For:      "for",
	Goto:     "goto",
	Ident:    "ident",
	If:       "if",
	Inc:      "++",
	Int:      "int",
	Lbrace:   "{",
	Lbrack:   "[",
	Long:     "long",
	Lparen:   "(",
	Not:      "!",
	Qmark:    "?",
	Rbrace:   "}",
	Rbrack:   "]",
	Register: "register",
	Restrict: "restrict",
	Return:   "return",
	Rparen:   ")",
	Semi:     ";",
	Signed:   "signed",
	Sizeof:   "sizeof",
	Short:    "short",
	Static:   "static",
	Struct:   "struct",
	Switch:   "switch",
	Typedef:  "typedef",
	Negate:   "~",
	Union:    "union",
	Unsigned: "unsigned",
	Void:     "void",
	Volatile: "volatile",
	While:    "while",

	Alignas:       "_Alignas",
	Alignof:       "_Alignof",
	Atomic:        "_Atomic",
	Bool:          "_Bool",
	Complex:       "_Complex",
	Generic:       "_Generic",
	Imaginary:     "_Imaginary",
	Noreturn:      "_Noreturn",
	Static_assert: "_Static_assert",
	Thread_local:  "_Thread_local",

	Rune:   "rune",
	Number: "number",
	String: "string",
}

func (t Type) String() string {
	if 0 <= int(t) && int(t) < len(types) {
		return types[t]
	}
	return fmt.Sprintf("Token(%d)", t)
}

// Precedence returns the operator precedence of a given operator.
// The operators covered are not the full set, because some of them need
// more context like whether or not it is prefix/postfix/unary,
// If op is not an arithmetic or logical operator, it returns the lowest precedence.
func (op Token) Precedence() int {
	switch op.Type {
	case Div, Mul, Mod:
		return 10
	case Plus, Minus:
		return 9
	case Lsh, Rsh:
		return 8
	case Gt, Geq, Lt, Leq:
		return 7
	case Eq, Neq:
		return 6
	case And:
		return 5
	case Xor:
		return 4
	case Or:
		return 3
	case Land:
		return 2
	case Lor:
		return 1
	}
	return 0
}

// IsLiteral returns whether or not an op was a literal
func (op Token) IsLiteral() bool {
	return op.Type == Rune || op.Type == Number || op.Type == String
}
