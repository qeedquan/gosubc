package parse

import "subc/scan"

// isQualifier returns if a token is a qualifier such as auto, register, static, etc.
func isQualifier(tok scan.Type) bool {
	switch tok {
	case scan.Auto, scan.Register, scan.Static, scan.Volatile, scan.Restrict, scan.Extern:
		return true
	}
	return false
}

// isType returns whether or not a token is a valid type.
func isType(tok scan.Type) bool {
	switch tok {
	case scan.Char, scan.Short, scan.Int, scan.Long, scan.Float,
		scan.Double, scan.Bool, scan.Complex, scan.Void, scan.Struct, scan.Union:
		return true
	}
	return false
}

// isLocalType returns if a token is a valid type declaration in
// a local declaration, such as auto, extern, int, char, volatile, etc.
func isLocalType(tok scan.Type) bool {
	switch tok {
	case scan.Auto, scan.Extern, scan.Register, scan.Static,
		scan.Volatile, scan.Restrict, scan.Int, scan.Char, scan.Short, scan.Long,
		scan.Float, scan.Double, scan.Bool, scan.Complex, scan.Void, scan.Enum,
		scan.Struct, scan.Union:
		return true
	}
	return false
}

// isAssignOp returns if a token is an assignment operator.
func isAssignOp(typ scan.Type) bool {
	switch typ {
	case scan.Assign, scan.DivEq, scan.MulEq, scan.ModEq,
		scan.PlusEq, scan.MinusEq, scan.LshEq, scan.RshEq,
		scan.AndEq, scan.XorEq, scan.OrEq:
		return true
	}
	return false
}
