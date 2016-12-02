package compile

import (
	"fmt"
	"io"
	"os"
	"strconv"

	"subc/compile/arch"
	"subc/types"
)

type opcode int

type node struct {
	op          opcode
	left, right *node
	lv          [2]arch.LV
}

const (
	opGlue opcode = iota + 1
	opAdd
	opAddr
	opAssign
	opBinAnd
	opBinOr
	opBinXor
	opBool
	opBrFalse
	opBrTrue
	opCall
	opCalr
	opComma
	opDec
	opDiv
	opEq
	opGt
	opGeq
	opIdent
	opIfElse
	opLab
	opLdlab
	opLt
	opLit
	opLogNot
	opLsh
	opLeq
	opMod
	opMul
	opNeg
	opNot
	opNeq
	opPlus
	opPreDec
	opPreInc
	opPostDec
	opPostInc
	opRsh
	opRval
	opScale
	opScaleBy
	opSub
)

func (op opcode) String() string {
	tab := [...]string{
		opGlue:    "glue",
		opAdd:     "add",
		opAddr:    "addr",
		opAssign:  "assign",
		opBinAnd:  "binand",
		opBinOr:   "binor",
		opBinXor:  "binxor",
		opBool:    "bool",
		opBrFalse: "brfalse",
		opBrTrue:  "brtrue",
		opCall:    "call",
		opCalr:    "calr",
		opComma:   "comma",
		opDec:     "dec",
		opDiv:     "div",
		opEq:      "eq",
		opGt:      "gt",
		opGeq:     "geq",
		opIdent:   "ident",
		opIfElse:  "ifelse",
		opLab:     "lab",
		opLdlab:   "ldlab",
		opLt:      "lt",
		opLit:     "lit",
		opLogNot:  "lognot",
		opLsh:     "lsh",
		opLeq:     "leq",
		opMod:     "mod",
		opMul:     "mul",
		opNeg:     "neg",
		opNot:     "not",
		opNeq:     "neq",
		opPlus:    "plus",
		opPreDec:  "predec",
		opPreInc:  "preinc",
		opPostDec: "postdec",
		opPostInc: "postinc",
		opRsh:     "rsh",
		opRval:    "rval",
		opScale:   "scale",
		opScaleBy: "scaleby",
		opSub:     "sub",
	}
	if op == 0 || int(op) >= len(tab) {
		return "unknown"
	}
	return tab[op]
}

func newNode(op opcode, l1, l2 *arch.LV, left, right *node) *node {
	n := &node{
		op:    op,
		left:  left,
		right: right,
	}
	if l1 != nil {
		n.lv[0] = *l1
	}
	if l2 != nil {
		n.lv[1] = *l2
	}
	return n
}

func (c *compiler) emitArgs(n *node) {
	if n == nil {
		return
	}
	c.tree(n.right)
	c.emitArgs(n.left)
}

func (c *compiler) tree(n *node) {
	if n == nil {
		return
	}

	intSize := c.cg.Int()
	lv := n.lv[0]
	switch n.op {
	case opIdent, opGlue:
		// ignore

	case opAddr:
		c.cg.Addr(lv)

	case opLit:
		value, _ := strconv.Atoi(lv.Value.String())
		c.cg.Lit(value)

	case opPreInc, opPreDec, opPostInc, opPostDec:
		c.tree(n.left)
		switch n.op {
		case opPreInc:
			c.cg.Inc(lv, true, true)
		case opPreDec:
			c.cg.Inc(lv, false, true)
		case opPostInc:
			c.cg.Inc(lv, true, false)
		case opPostDec:
			c.cg.Inc(lv, false, false)
		}

	case opLogNot, opNeg, opNot, opScale:
		c.tree(n.left)
		switch n.op {
		case opBool:
			c.cg.Bool()
		case opLogNot:
			c.cg.LogNot()
		case opNeg:
			c.cg.Neg()
		case opNot:
			c.cg.Not()
		case opScale:
			c.cg.Scale()
		}

	case opEq, opNeq, opLt, opGt, opLeq, opGeq:
		c.tree(n.left)
		c.tree(n.right)
		c.cg.Commit()
		x, y, z, w := arch.Below, arch.Above, arch.BelowEqual, arch.AboveEqual
		if intTypes(lv.Btype) {
			x, y, z, w = arch.Less, arch.Greater, arch.LessEqual, arch.GreaterEqual
		}
		switch n.op {
		case opEq:
			c.cg.QueueCmp(arch.Equal)
		case opNeq:
			c.cg.QueueCmp(arch.NotEqual)
		case opLt:
			c.cg.QueueCmp(x)
		case opGt:
			c.cg.QueueCmp(y)
		case opLeq:
			c.cg.QueueCmp(z)
		case opGeq:
			c.cg.QueueCmp(w)
		}

	case opMod, opLsh, opRsh, opDiv, opBinAnd, opBinOr, opBinXor, opMul, opSub, opPlus, opAdd:
		c.tree(n.left)
		c.tree(n.right)
		c.cg.Commit()
		switch n.op {
		case opLsh:
			c.cg.Shl(true)
		case opRsh:
			c.cg.Shr(true)
		case opDiv:
			c.cg.Div(true)
		case opMod:
			c.cg.Mod(true)
		case opBinAnd:
			c.cg.And()
		case opBinOr:
			c.cg.Or()
		case opBinXor:
			c.cg.Xor()
		case opMul:
			c.cg.Mul()
		case opAdd:
			c.cg.Add(types.Typ[types.Int], types.Typ[types.Int], true)
		case opPlus:
			c.cg.Add(n.lv[0].Type, n.lv[1].Type, true)
		case opSub:
			c.cg.Sub(n.lv[0].Type, n.lv[1].Type, true)
		}

	case opCall:
		c.emitArgs(n.left)
		c.cg.Commit()
		c.cg.Spill()
		c.cg.Call(lv)
		c.cg.Stack(lv.Size * intSize)

	case opCalr:
		c.emitArgs(n.left)
		c.cg.Commit()
		c.cg.Spill()
		c.cg.Clear(false)
		c.cg.Rval(lv)
		c.cg.Calr(lv)
		c.cg.Stack(lv.Size * intSize)

	case opLab:
		c.tree(n.left)
		c.cg.Commit()
		c.cg.Lab(lv.Addr)

	case opLdlab:
		c.cg.Ldlab(lv.Addr)

	case opRval:
		c.tree(n.left)
		c.cg.Rval(lv)

	case opAssign:
		if n.left != nil && n.left.op == opIdent {
			c.tree(n.right)
			c.cg.Commit()
			c.tree(n.left)
		} else {
			c.tree(n.left)
			c.cg.Commit()
			c.tree(n.right)
			c.cg.Commit()
		}
		c.cg.Store(lv)

	case opScaleBy:
		c.tree(n.left)
		c.cg.ScaleBy(lv.Size)

	case opIfElse:
		c.emitCond(n.left, lv)
		c.cg.Commit()
		c.cg.Lab(lv.Addr)

	case opBrFalse, opBrTrue:
		c.tree(n.left)
		c.cg.Commit()
		if n.op == opBrTrue {
			c.cg.BrTrue(lv.Addr)
		} else {
			c.cg.BrFalse(lv.Addr)
		}
		c.cg.Clear(false)
		c.tree(n.right)

	case opComma:
		c.tree(n.left)
		c.cg.Commit()
		c.cg.Clear(false)
		c.tree(n.right)

	case opBool:
		c.tree(n.left)
		c.cg.Bool()

	default:
		panic(fmt.Sprintf("internal: unhandle op %v", n.op))
	}
}

func (c *compiler) emitCond(n *node, lv arch.LV) {
	if n.left.left.op == opGlue {
		c.emitCond(n.left.left, lv)
	}
	c.tree(n.left.left)
	c.cg.BrFalse(n.left.lv[0].Addr)
	c.cg.Clear(false)
	c.tree(n.left.right)
	c.cg.Jump(lv.Addr)
	c.cg.Commit()
	c.cg.Lab(n.left.lv[0].Addr)
	c.cg.Clear(false)
	c.tree(n.right)
}

func (c *compiler) printTree(n *node) {
	p := &treePrinter{w: os.Stdout, indent: -1}
	p.Dump(n)
}

func (c *compiler) emit(n *node) {
	c.optimize(n)
	//c.printTree(n)
	c.tree(n)
}

type treePrinter struct {
	w      io.Writer
	indent int
}

func (p *treePrinter) Dump(n *node) {
	if n == nil {
		return
	}

	p.indent++
	for i := 0; i < p.indent; i++ {
		fmt.Printf("  ")
	}

	switch n.op {
	case opLit:
		fmt.Fprintf(p.w, "lit %s\n", n.lv[0].Value)

	case opCall:
		fmt.Fprintf(p.w, "call %s %v\n", n.lv[0].Name, n.lv[0].Type)
		p.Dump(n.left)

	case opCalr:
		fmt.Fprintf(p.w, "calr %s %v\n", n.lv[0].Name, n.lv[0].Type)
		p.Dump(n.left)

	case opLab:
		fmt.Fprintf(p.w, "label L%d\n", n.lv[0].Addr)

	case opLdlab:
		fmt.Fprintf(p.w, "ldlab L%d\n", n.lv[0].Addr)

	case opGlue:
		fmt.Fprintf(p.w, "glue\n")
		p.Dump(n.left)
		p.Dump(n.right)

	case opRval:
		p.dumpUnaryExpr(n, "*")

	case opLt:
		p.dumpBinExpr(n, "<")

	case opLeq:
		p.dumpBinExpr(n, "<=")

	case opAssign:
		p.dumpBinExpr(n, "=")

	case opEq:
		p.dumpBinExpr(n, "==")

	case opNeq:
		p.dumpBinExpr(n, "!=")

	case opGt:
		p.dumpBinExpr(n, ">")

	case opGeq:
		p.dumpBinExpr(n, ">=")

	case opBinAnd:
		p.dumpBinExpr(n, "&")

	case opBinOr:
		p.dumpBinExpr(n, "|")

	case opBinXor:
		p.dumpBinExpr(n, "^")

	case opLsh:
		p.dumpBinExpr(n, "<<")

	case opRsh:
		p.dumpBinExpr(n, ">>")

	case opAdd, opPlus:
		p.dumpBinExpr(n, "+")

	case opSub:
		p.dumpBinExpr(n, "-")

	case opMul:
		p.dumpBinExpr(n, "*")

	case opDiv:
		p.dumpBinExpr(n, "/")

	case opMod:
		p.dumpBinExpr(n, "%")

	case opNeg:
		p.dumpUnaryExpr(n, "-")

	case opNot:
		p.dumpUnaryExpr(n, "~")

	case opPreInc:
		p.dumpUnaryExpr(n, "++")

	case opPreDec:
		p.dumpUnaryExpr(n, "--")

	case opBool:
		p.dumpUnaryExpr(n, "bool ")

	case opPostInc:
		x, _ := nameOrValues(n.lv)
		p.dumpUnaryOp(n, "%s++\n", x)

	case opPostDec:
		x, _ := nameOrValues(n.lv)
		p.dumpUnaryOp(n, "%s--\n", x)

	case opLogNot:
		p.dumpUnaryExpr(n, "!")

	case opIdent:
		fmt.Fprintf(p.w, "id %s\n", n.lv[0].Name)

	case opAddr:
		x, _ := nameOrValues(n.lv)
		fmt.Fprintf(p.w, "addr %s\n", x)

	case opScale:
		p.dumpUnaryExpr(n, "scale ")

	case opScaleBy:
		p.dumpUnaryExpr(n, "scaleby ")

	case opIfElse:
		p.dumpUnaryExpr(n, "ifelse ")

	case opBrFalse:
		p.dumpBinExpr(n, "brfalse")

	case opBrTrue:
		p.dumpBinExpr(n, "brtrue")

	case opComma:
		p.dumpBinExpr(n, ",")

	default:
		panic(fmt.Sprintf("unknown tree printer op: %v", n.op))
	}

	p.indent--
}

func (p *treePrinter) dumpUnaryOp(n *node, format string, args ...interface{}) {
	fmt.Fprintf(p.w, format, args...)
	p.indent++
	p.Dump(n.left)
	p.indent--
}

func (p *treePrinter) dumpUnaryExpr(n *node, op string) {
	x, _ := nameOrValues(n.lv)
	p.dumpUnaryOp(n, op+"%s\n", x)
}

func (p *treePrinter) dumpBinOp(n *node, format string, args ...interface{}) {
	fmt.Fprintf(p.w, format, args...)
	p.indent++
	p.Dump(n.left)
	p.Dump(n.right)
	p.indent--
}

func (p *treePrinter) dumpBinExpr(n *node, op string) {
	x, y := nameOrValues(n.lv)
	if op == "%" {
		op = "%%"
	}
	p.dumpBinOp(n, "%s "+op+" %s\n", x, y)
}

func nameOrValues(lv [2]arch.LV) (string, string) {
	x, y := lv[0].Name, lv[1].Name
	if !lv[0].Ident && lv[0].Value != nil {
		x = lv[0].Value.String()
	}
	if !lv[1].Ident && lv[1].Value != nil {
		y = lv[1].Value.String()
	}
	return x, y
}

func intTypes(t types.Type) bool {
	return t == types.Typ[types.Int] || t == types.Typ[types.Char]
}
