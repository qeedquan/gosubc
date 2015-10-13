package compile

import (
	"strconv"

	"subc/compile/arch"
	"subc/constant"
)

// optimize tries to optimize the code generated tree by
// doing constant folding and strength reductions.
func (c *compiler) optimize(n *node) *node {
	n = c.foldReduce(n)
	n = c.reorderOps(n)
	return n
}

// fold1 folds constant unary expressions.
func (c *compiler) fold1(n *node) *node {
	var lv arch.LV

	switch n.op {
	case opScale:
		v, _ := strconv.Atoi(n.left.lv[0].Value.String())
		lv.Value = constant.MakeInt64(int64(v * c.cg.Int()))
	default:
		return n
	}
	return newNode(opLit, &lv, nil, nil, nil)
}

// foldReduce does constant folding and reducing.
func (c *compiler) foldReduce(n *node) *node {
	if n == nil {
		return nil
	}
	n.left = c.foldReduce(n.left)
	n.right = c.foldReduce(n.right)

	if n.left != nil && n.left.op == opLit {
		n = c.fold1(n)
	}

	if n.left != nil && n.right != nil && (n.left.op == opLit || n.right.op == opLit) {
		n = c.reduce(n)
	}

	return n
}

// reduce transforms expressions into equivalent but faster expressions.
func (c *compiler) reduce(n *node) *node {
	var vl, vr int
	var lv arch.LV

	op := n.op
	cl := n.left.op == opLit
	cr := n.right.op == opLit
	if cl {
		vl, _ = strconv.Atoi(n.left.lv[0].Value.String())
	}
	if cr {
		vr, _ = strconv.Atoi(n.right.lv[0].Value.String())
	}

	switch {
	case (op == opPlus || op == opAdd) && cr && vr == 0: // x+0 -> x
		return n.left

	case (op == opPlus || op == opAdd) && cl && vl == 0: // 0+x -> x
		return n.right

	case op == opSub && cr && vr == 0: // x-0 -> x
		return n.left

	case op == opSub && cl && vl == 0: // 0-x -> -x
		return newNode(opNeg, nil, nil, n.right, nil)

	case op == opMul && ((cl && vl == 0) || (cr && vr == 0)): // 0*x -> 0 || x*0 -> 0
		lv.Value = constant.MakeInt64(0)
		return newNode(opLit, &lv, nil, nil, nil)

	case op == opMul || op == opDiv: // reduce x*(2^n) or x/(2^n) to x<<n or x>>n
		lim := c.cg.Int()*8 - 1
		for i, k := 0, 1; i < lim; i, k = i+1, k<<1 {
			lv.Value = constant.MakeInt64(int64(i))
			m := newNode(opLit, &lv, nil, nil, nil)
			if cr && k == vr {
				if op == opMul {
					return newNode(opLsh, nil, nil, n.left, m)
				} else {
					return newNode(opRsh, nil, nil, n.left, m)
				}
			} else if cl && k == vl && op == opMul {
				return newNode(opLsh, nil, nil, n.right, m)
			}
		}
	}

	return n
}

// reorderOps swaps the nodes that are commutative to keep literals and idents to the
// right of the tree for more effective folding.
func (c *compiler) reorderOps(n *node) *node {
	if n == nil {
		return nil
	}
	n.left = c.reorderOps(n.left)
	n.right = c.reorderOps(n.right)

	if n.right == nil || n.left == nil {
		return n
	}

	op := n.op
	lop := n.left.op
	if (lop == opLit || (lop == opRval && n.left.left != nil && n.left.left.op == opIdent)) && allowReorder(op) {
		if op == opPlus {
			n.lv[0], n.lv[1] = n.lv[1], n.lv[0]
		}
		n.left, n.right = n.right, n.left
	}

	return n
}

// allowReorder returns if an opcode allows the nodes to be reorder.
func allowReorder(op opcode) bool {
	switch op {
	case opAdd, opPlus, opMul, opBinAnd, opBinOr, opBinXor, opEq, opNeq:
		return true
	}
	return false
}
