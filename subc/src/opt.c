/*
 *	NMH's Simple C Compiler, 2014
 *	Optimizer
 */

#include <limits.h>
#include "defs.h"
#include "data.h"
#include "decl.h"

static int	Opt_sum_lim;

void opt_init(void) {
	int	i, k;

	Opt_sum_lim = 1;
	k = sizeof(int) < BPW? sizeof(int): BPW;
	k = k*8 - 1;
	for (i=1; i<k; i++)
		Opt_sum_lim <<= 1;
}

static node *fold2(node *n) {
	int	v, vl, vr;

	vl = n->left->args[0];
	vr = n->right->args[0];
	switch (n->op) {
	case OP_PLUS:
	case OP_ADD:	if (abs(vl) >= Opt_sum_lim || abs(vr) >= Opt_sum_lim)
				return n;
			v = vl + vr;
			break;
	case OP_SUB:	if (abs(vl) >= Opt_sum_lim || abs(vr) >= Opt_sum_lim)
				return n;
			v = vl - vr;
			break;
	case OP_MUL:	v = vl * vr;
			if (v / vl != vr) return n;
			if ((v & (Opt_sum_lim-1)) != v) return n;
			break;
	case OP_DIV:	if (0 == vr) return n;
			v = vl / vr;
			break;
	case OP_MOD:	if (0 == vr) return n;
			v = vl % vr;
			break;
	case OP_BINAND:	v = vl & vr; break;
	case OP_BINIOR:	v = vl | vr; break;
	case OP_BINXOR:	v = vl ^ vr; break;
	case OP_LSHIFT:	if (vr > BPW*8-1) return n;
			v = vl << vr;
			break;
	case OP_RSHIFT:	if (vr > BPW*8-1) return n;
			v = vl << vr;
			break;
	case OP_EQUAL:	v = vl == vr; break;
	case OP_NOTEQ:	v = vl != vr; break;
	case OP_LESS:	v = vl <  vr; break;
	case OP_GREATER:v = vl >  vr; break;
	case OP_LTEQ:	v = vl <= vr; break;
	case OP_GTEQ:	v = vl >= vr; break;
	default:	return n;
			break;
	}
	return mkleaf(OP_LIT, v);
}

static node *fold1(node *n) {
	int	v;

	v = n->left->args[0];
	switch (n->op) {
	case OP_NOT:	v = ~v; break;
	case OP_LOGNOT:	v = !v; break;
	case OP_NEG:	v = -v; break;
	case OP_SCALE:	v = v * BPW; break;
	default:	return n;
			break;
	}
	return mkleaf(OP_LIT, v);
}

static node *reduce(node *n) {
	int	k, i, lim, op, cl, cr, vl = 0, vr = 0;

	op = n->op;
	cl = OP_LIT == n->left->op;
	cr = OP_LIT == n->right->op;
	if (cl) vl = n->left->args[0];
	if (cr) vr = n->right->args[0];
	if ((OP_PLUS == op || OP_ADD == op) && cr && 0 == vr)	/* x+0 -> x */
		return n->left;
	if ((OP_PLUS == op || OP_ADD == op) && cl && 0 == vl)	/* 0+x -> x */
		return n->right;
	if (OP_SUB == op && cr && 0 == vr)			/* x-0 -> x */
		return n->left;
	if (OP_SUB == op && cl && 0 == vl)			/* 0-x -> -x */
		return mkunop(OP_NEG, n->right);
	if (OP_MUL == op && cl && 0 == vl)			/* 0*x -> 0 */
		return mkleaf(OP_LIT, 0);
	if (OP_MUL == op && cr && 0 == vr)			/* x*0 -> 0 */
		return mkleaf(OP_LIT, 0);
	if (OP_MUL == op || OP_DIV == op) {
		lim = BPW * 8 - 1;
		for (k=1,i=0; i<lim; i++, k<<=1) {
			if (cr && k == vr) {
				if (OP_MUL == op)
					return mkbinop(OP_LSHIFT, n->left,
							mkleaf(OP_LIT, i));
				else
					return mkbinop(OP_RSHIFT, n->left,
							mkleaf(OP_LIT, i));
			}
			else if (cl && k == vl && OP_MUL == op) {
				return mkbinop(OP_LSHIFT, n->right,
						mkleaf(OP_LIT, i));
			}
		}
	}
	return n;
}

node *fold_reduce(node *n) {
	if (NULL == n) return NULL;
	n->left = fold_reduce(n->left);
	n->right = fold_reduce(n->right);
	if (n->left && OP_LIT == n->left->op &&
	    n->right && OP_LIT == n->right->op)
	{
		n = fold2(n);
	}
	else if (n->left && OP_LIT == n->left->op)
		n = fold1(n);
	if (n->left && n->right &&
	    (OP_LIT == n->left->op || OP_LIT == n->right->op))
	{
		n = reduce(n);
	}
	return n;
}

node *reorder_ops(node *n) {
	int	op, lop, t;
	node	*tn;

	if (NULL == n) return NULL;
	n->left = reorder_ops(n->left);
	n->right = reorder_ops(n->right);
	if (NULL == n->right || NULL == n->left) return n;
	op = n->op;
	lop = n->left->op;
	if (	(OP_LIT == lop ||
		 (OP_RVAL == lop &&
		  n->left->left &&
		  OP_IDENT == n->left->left->op))
		&&
		(OP_ADD == op || OP_PLUS == op || OP_MUL == op ||
		 OP_BINAND == op || OP_BINIOR == op || OP_BINXOR == op ||
		 OP_EQUAL == op || OP_NOTEQ == op)
	) {
		if (OP_PLUS == op) {	/* switch types */
			t = n->args[0];
			n->args[0] = n->args[1];
			n->args[1] = t;
		}
		tn = n->right;
		n->right = n->left;
		n->left = tn;
	}
	return n;
}

node *optimize(node *n) {
	n = fold_reduce(n);
	n = reorder_ops(n);
	return n;
}
