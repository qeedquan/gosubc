package constant

import (
	"fmt"
	"math/big"
	"strconv"

	"subc/scan"
)

// Type is a valid constant type.
type Type int

// Various types.
const (
	Unknown Type = iota
	Int
	String
)

// Value represents a constant value.
type Value interface {
	Type() Type     // The type of the value.
	String() string // The value itself in form of a string.
}

type (
	unknownVal struct{}
	int64Val   int64
	intVal     struct{ val *big.Int }
	stringVal  string
)

func (unknownVal) Type() Type { return Unknown }
func (int64Val) Type() Type   { return Int }
func (intVal) Type() Type     { return Int }
func (stringVal) Type() Type  { return String }

func (unknownVal) String() string  { return "unknown" }
func (x int64Val) String() string  { return strconv.FormatInt(int64(x), 10) }
func (x intVal) String() string    { return x.val.String() }
func (x stringVal) String() string { return strconv.Quote(string(x)) }

var (
	minInt64 = big.NewInt(-1 << 63)
	maxInt64 = big.NewInt(1<<63 - 1)
)

func normInt(x *big.Int) Value {
	if minInt64.Cmp(x) <= 0 && x.Cmp(maxInt64) <= 0 {
		return int64Val(x.Int64())
	}
	return intVal{x}
}

func is32bit(x int64) bool {
	const s = 32
	return -1<<(s-1) <= x && x <= 1<<(s-1)-1
}

func is63bit(x int64) bool {
	const s = 63
	return -1<<(s-1) <= x && x <= 1<<(s-1)-1
}

func truthInt(b bool) int64 {
	if b {
		return 1
	}
	return 0
}

// BinaryOp does a binary operation on two constant values.
func BinaryOp(x Value, op scan.Type, y Value) (Value, error) {
	x, y = match(x, y)
	switch x := x.(type) {
	case unknownVal:
		return x, nil

	case int64Val:
		a := int64(x)
		b := int64(y.(int64Val))
		var c int64

		switch op {
		case scan.Plus:
			if !is63bit(a) || !is63bit(b) {
				return normInt(new(big.Int).Add(big.NewInt(a), big.NewInt(b))), nil
			}
			c = a + b
		case scan.Minus:
			if !is63bit(a) || !is63bit(b) {
				return normInt(new(big.Int).Sub(big.NewInt(a), big.NewInt(b))), nil
			}
			c = a - b
		case scan.Mul:
			if !is32bit(a) || !is32bit(b) {
				return normInt(new(big.Int).Mul(big.NewInt(a), big.NewInt(b))), nil
			}
			c = a * b
		case scan.Div:
			if b == 0 {
				return int64Val(0), fmt.Errorf("division by zero")
			}
			c = a / b
		case scan.Mod:
			if b == 0 {
				return int64Val(0), fmt.Errorf("modulo by zero")
			}
			c = a % b
		case scan.And:
			c = a & b
		case scan.Or:
			c = a | b
		case scan.Xor:
			c = a ^ b
		case scan.Eq, scan.Neq, scan.Lt, scan.Leq, scan.Gt, scan.Geq:
			c = truthInt(Compare(x, op, y))
		case scan.Lsh, scan.Rsh:
			if b < 0 {
				return int64Val(0), fmt.Errorf("negative shift count")
			}
			return Shift(x, op, uint(b))
		default:
			goto Error
		}
		return int64Val(c), nil

	case intVal:
		a := x.val
		b := y.(intVal).val
		var c big.Int
		switch op {
		case scan.Plus:
			c.Add(a, b)
		case scan.Minus:
			c.Sub(a, b)
		case scan.Mul:
			c.Mul(a, b)
		case scan.Div:
			if b.Sign() == 0 {
				return normInt(&c), fmt.Errorf("division by zero")
			}
			c.Quo(a, b)
		case scan.Mod:
			if b.Sign() == 0 {
				return normInt(&c), fmt.Errorf("modulus by zero")
			}
			c.Rem(a, b)
		case scan.And:
			c.And(a, b)
		case scan.Or:
			c.Or(a, b)
		case scan.Xor:
			c.Xor(a, b)
		case scan.Eq, scan.Neq, scan.Lt, scan.Leq, scan.Gt, scan.Geq:
			c.SetInt64(truthInt(Compare(x, op, y)))
		case scan.Lsh, scan.Rsh:
			if b.Int64() < 0 {
				return normInt(&c), fmt.Errorf("negative shift count")
			}
			return Shift(x, op, uint(b.Int64()))
		default:
			goto Error
		}
		return normInt(&c), nil
	}

Error:
	panic(fmt.Sprintf("invalid binary operation %v %s %v", x, op, y))
}

// UnaryOp does a unary operation on a unary expression.
func UnaryOp(op scan.Type, y Value, prec uint) Value {
	switch op {
	case scan.Plus:
		switch y.(type) {
		case unknownVal, int64Val, intVal:
			return y
		}

	case scan.Minus:
		switch y := y.(type) {
		case unknownVal:
			return y
		case int64Val:
			if z := -y; z != y {
				return z // no overflow
			}
			return normInt(new(big.Int).Neg(big.NewInt(int64(y))))
		case intVal:
			return normInt(new(big.Int).Neg(y.val))
		}

	case scan.Negate:
		var z big.Int
		switch y := y.(type) {
		case unknownVal:
			return y
		case int64Val:
			z.Not(big.NewInt(int64(y)))
		case intVal:
			z.Not(y.val)
		default:
			goto Error
		}
		return normInt(&z)

	case scan.Not:
		switch y := y.(type) {
		case unknownVal:
			return y
		case int64Val:
			if y == 0 {
				return int64Val(1)
			}
			return int64Val(0)
		case intVal:
			z := new(big.Int).SetInt64(0)
			if y.val.Sign() == 0 {
				z.SetInt64(1)
			}
			return normInt(z)
		}
	}

Error:
	panic(fmt.Sprintf("invalid unary operation %s%v", op, y))
}

// ord the type size of a value to see if it needs to
// be converted up or down.
func ord(x Value) int {
	switch x.(type) {
	default:
		return 0
	case int64Val:
		return 1
	case intVal:
		return 2
	}
}

// match casts the values into their proper types.
func match(x, y Value) (Value, Value) {
	if ord(x) > ord(y) {
		y, x = match(y, x)
		return x, y
	}

	switch x := x.(type) {
	case unknownVal:
		return x, x

	case int64Val:
		switch y := y.(type) {
		case int64Val:
			return x, y
		case intVal:
			return intVal{big.NewInt(int64(x))}, y
		}

	case intVal:
		switch y := y.(type) {
		case intVal:
			return x, y
		}
	}

	panic(fmt.Errorf("unknown type: %T %T", x, y))
}

// Shift applies a left or right shift on a constant value.
func Shift(x Value, op scan.Type, s uint) (Value, error) {
	if s > 1024 {
		return int64Val(0), fmt.Errorf("shift count too large")
	}
	switch x := x.(type) {
	case unknownVal:
		return x, nil

	case int64Val:
		if s == 0 {
			return x, nil
		}
		switch op {
		case scan.Lsh:
			z := big.NewInt(int64(x))
			return normInt(z.Lsh(z, s)), nil
		case scan.Rsh:
			return x >> s, nil
		}

	case intVal:
		if s == 0 {
			return x, nil
		}
		var z big.Int
		switch op {
		case scan.Lsh:
			return normInt(z.Lsh(x.val, s)), nil
		case scan.Rsh:
			return normInt(z.Rsh(x.val, s)), nil
		}
	}

	panic(fmt.Sprintf("invalid shift %v %s %d", x, op, s))
}

// MakeFromLiteral creates a constant value from a string.
func MakeFromLiteral(lit string, tok scan.Type, prec uint) Value {
	if prec != 0 {
		panic("limited precision not supported")
	}

	switch tok {
	case scan.Number:
		if x, err := strconv.ParseInt(lit, 0, 64); err == nil {
			return int64Val(x)
		}
		if x, ok := new(big.Int).SetString(lit, 0); ok {
			return intVal{x}
		}

	case scan.Rune:
		// special case because UnquoteChar fails on these
		if lit == "'\\'" {
			return int64Val('\\')
		} else if lit == "'''" {
			return int64Val('\'')
		}

		if n := len(lit); n >= 2 {
			if code, _, _, err := strconv.UnquoteChar(lit[1:n-1], '\''); err == nil {
				return int64Val(code)
			}
		}

	case scan.String:
		if s, err := strconv.Unquote(lit); err == nil {
			return stringVal(s)
		}
	}

	return nil
}

// cmpZero returns if a value <, >, <=, >=, or == to zero.
func cmpZero(x int, op scan.Type) bool {
	switch op {
	case scan.Eq:
		return x == 0
	case scan.Neq:
		return x != 0
	case scan.Lt:
		return x < 0
	case scan.Leq:
		return x <= 0
	case scan.Gt:
		return x > 0
	case scan.Geq:
		return x >= 0
	}
	panic("unreachable")
}

// Compare compares two values.
func Compare(x Value, op scan.Type, y Value) bool {
	x, y = match(x, y)

	switch x := x.(type) {
	case unknownVal:
		return false

	case int64Val:
		y := y.(int64Val)
		switch op {
		case scan.Eq:
			return x == y
		case scan.Neq:
			return x != y
		case scan.Lt:
			return x < y
		case scan.Leq:
			return x <= y
		case scan.Gt:
			return x > y
		case scan.Geq:
			return x >= y
		}

	case intVal:
		return cmpZero(x.val.Cmp(y.(intVal).val), op)
	}

	panic(fmt.Sprintf("invalid comparison %v %s %v", x, op, y))
}

// MakeInt64 creates a constant value out of a int64.
func MakeInt64(x int64) Value { return int64Val(x) }

// MakeUint64 creates a constant value out of a uint64.
func MakeUint64(x uint64) Value { return normInt(new(big.Int).SetUint64(x)) }
