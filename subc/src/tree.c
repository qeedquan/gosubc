/*
 *	NMH's Simple C Compiler, 2014
 *	Syntax tree construction
 */

#include "defs.h"
#include "data.h"
#include "decl.h"

#define	MAXBARS	100

int	Level = 0;
char	Bars[MAXBARS];

static void emittree1(node *a);

static node *mknode(int op, int na, int *args, node *left, node *right) {
	node	*n;
	int	hdrlen;

	hdrlen = sizeof(node) / sizeof(int) - 1;
	if (Ndtop + hdrlen + na >= NODEPOOLSZ)
		fatal("expression too complex (out of nodes)");
	n = (node *) &Nodes[Ndtop];
	Ndtop += hdrlen + na;
	if (Ndtop > Ndmax) Ndmax = Ndtop;
	n->op = op;
	n->left = left,
	n->right = right;
	memcpy(n->args, args, na * sizeof(int));
	return n;
}

node *mkleaf(int op, int n) {
	int	a[1];

	a[0] = n;
	return mknode(op, 1, a, NULL, NULL);
}

node *mkunop(int op, node *left) {
	return mknode(op, 0, NULL, left, NULL);
}

node *mkunop1(int op, int n, node *left) {
	int	a[1];

	a[0] = n;
	return mknode(op, 1, a, left, NULL);
}

node *mkunop2(int op, int n1, int n2, node *left) {
	int	a[2];

	a[0] = n1;
	a[1] = n2;
	return mknode(op, 2, a, left, NULL);
}

node *mkbinop(int op, node *left, node *right) {
	return mknode(op, 0, NULL, left, right);
}

node *mkbinop1(int op, int n, node *left, node *right) {
	int	a[1];

	a[0] = n;
	return mknode(op, 1, a, left, right);
}

node *mkbinop2(int op, int n1, int n2, node *left, node *right) {
	int	a[2];

	a[0] = n1;
	a[1] = n2;
	return mknode(op, 2, a, left, right);
}

#ifdef debug

static void dumpleaf(char *s, int n) {
	printf("%s %d\n", s, n);
}

static void dumpunop1(char *s, node *a) {
	printf("%s %d\n", s, a->args[0]);
	Level++;
	dumptree(a->left);
	Level--;
}

static void dumpunop2(char *s, node *a) {
	printf("%s %d %d\n", s, a->args[0], a->args[1]);
	Level++;
	dumptree(a->left);
	Level--;
}

static void dumpunop(char *s, node *a) {
	printf("%s\n", s);
	Level++;
	dumptree(a->left);
	Level--;
}

static void dumpbinop(char *s, node *a) {
	printf("%s\n", s);
	Level++;
	if (Level < MAXBARS) Bars[Level] = 1;
	dumptree(a->left);
	if (Level < MAXBARS) Bars[Level] = 0;
	dumptree(a->right);
	Level--;
}

static void dumpbinop1(char *s, node *a) {
	printf("%s %d\n", s, a->args[0]);
	Level++;
	if (Level < MAXBARS) Bars[Level] = 1;
	dumptree(a->left);
	if (Level < MAXBARS) Bars[Level] = 0;
	dumptree(a->right);
	Level--;
}

static void dumpbinop2(char *s, node *a) {
	printf("%s %d %d\n", s, a->args[0], a->args[1]);
	Level++;
	if (Level < MAXBARS) Bars[Level] = 1;
	dumptree(a->left);
	if (Level < MAXBARS) Bars[Level] = 0;
	dumptree(a->right);
	Level--;
}

void dumptree(node *a) {
	int	i;

	if (NULL == a) return;
	for (i=0; i<Level; i++)
		printf(Level > MAXBARS || !Bars[i]? "  ": "| ");
	if (Level) printf("`-");
	switch (a->op) {
	case OP_ADDR:	dumpleaf("addr", a->args[0]); break;
	case OP_IDENT:	dumpleaf("id", a->args[0]); break;
	case OP_LIT:	dumpleaf("lit", a->args[0]); break;
	case OP_BOOL:	dumpunop("!!x", a); break;
	case OP_PREINC:	dumpunop2("++x", a); break;
	case OP_PREDEC:	dumpunop2("--x", a); break;
	case OP_POSTINC:dumpunop2("x++", a); break;
	case OP_POSTDEC:dumpunop2("x--", a); break;
	case OP_RVAL:	dumpunop2("*x", a); break;
	case OP_LAB:	dumpunop1("label", a); break;
	case OP_LDLAB:	dumpunop1("ldlab", a); break;
	case OP_BRFALSE:dumpbinop1("jump/false", a); break;
	case OP_BRTRUE:	dumpbinop1("jump/true", a); break;
	case OP_IFELSE:	dumpunop1("?:", a); break;
	case OP_LOGNOT:	dumpunop("!x", a); break;
	case OP_NEG:	dumpunop("-x", a); break;
	case OP_NOT:	dumpunop("~x", a); break;
	case OP_SCALE:	dumpunop("scale", a); break;
	case OP_SCALEBY:dumpunop1("scaleby", a); break;
	case OP_ADD:	dumpbinop("x+y (int,int)", a); break;
	case OP_PLUS:	dumpbinop2("x+y", a); break;
	case OP_MUL:	dumpbinop("x*y", a); break;
	case OP_SUB:	dumpbinop("x-y", a); break;
	case OP_BINAND:	dumpbinop("x&y", a); break;
	case OP_BINIOR:	dumpbinop("x|y", a); break;
	case OP_BINXOR:	dumpbinop("x^y", a); break;
	case OP_DIV:	dumpbinop("x/y", a); break;
	case OP_EQUAL:	dumpbinop("x==y", a); break;
	case OP_GLUE:	dumpbinop("glue", a); break;
	case OP_COMMA:	dumpbinop("x,y", a); break;
	case OP_GREATER:dumpbinop("x>y", a); break;
	case OP_GTEQ:	dumpbinop("x>=y", a); break;
	case OP_LESS:	dumpbinop("x<y", a); break;
	case OP_LSHIFT:	dumpbinop("x<<y", a); break;
	case OP_LTEQ:	dumpbinop("x<=y", a); break;
	case OP_MOD:	dumpbinop("x%y", a); break;
	case OP_NOTEQ:	dumpbinop("x!=y", a); break;
	case OP_RSHIFT:	dumpbinop("x>>y", a); break;
	case OP_ASSIGN:	dumpbinop2("x=y", a); break;
	case OP_CALL:	dumpunop2("x()", a); break;
	case OP_CALR:	dumpunop2("(*x)()", a); break;
	}
}

#endif /* debug */

void emitcond(node *a, int ex) {
	if (OP_GLUE == a->left->left->op)
		emitcond(a->left->left, ex);
	emittree1(a->left->left);
	genbrfalse(a->left->args[0]);
	clear(0);
	emittree1(a->left->right);
	genjump(ex);
	commit();
	genlab(a->left->args[0]);
	clear(0);
	emittree1(a->right);
}

void emitargs(node *a) {
	if (NULL == a) return;
	emittree1(a->right);
	emitargs(a->left);
}

static void emittree1(node *a) {
	int	lv[LV];
	int	ptr;

	if (NULL == a) return;
	switch (a->op) {
	case OP_IDENT:	/* ignore */ break;
	case OP_ADDR:	genaddr(a->args[0]); break;
	case OP_LIT:	genlit(a->args[0]); break;
	case OP_PREINC:	/* fallthru */
	case OP_PREDEC:	/* fallthru */
	case OP_POSTINC:/* fallthru */
	case OP_POSTDEC:lv[LVPRIM] = a->args[0];
			lv[LVSYM] = a->args[1];
			emittree1(a->left);
			switch (a->op) {
			case OP_PREINC:	geninc(lv, 1, 1); break;
			case OP_PREDEC:	geninc(lv, 0, 1); break;
			case OP_POSTINC:geninc(lv, 1, 0); break;
			case OP_POSTDEC:geninc(lv, 0, 0); break;
			}
			break;
	case OP_SCALEBY:emittree1(a->left);
			genscaleby(a->args[0]);
			break;
	case OP_LAB:	emittree1(a->left);
			commit();
			genlab(a->args[0]);
			break;
	case OP_LDLAB:	genldlab(a->args[0]); break;
	case OP_RVAL:	emittree1(a->left);
			lv[LVPRIM] = a->args[0];
			lv[LVSYM] = a->args[1];
			genrval(lv);
			break;
	case OP_BOOL:	emittree1(a->left);
			genbool();
			break;
	case OP_LOGNOT:	/* fallthru */
	case OP_NEG:	/* fallthru */
	case OP_NOT:	/* fallthru */
	case OP_SCALE:	emittree1(a->left);
			switch (a->op) {
			case OP_BOOL:	genbool(); break;
			case OP_LOGNOT:	genlognot(); break;
			case OP_NEG:	genneg(); break;
			case OP_NOT:	gennot(); break;
			case OP_SCALE:	genscale(); break;
			}
			break;
	case OP_BRFALSE:/* fallthru */
	case OP_BRTRUE:	emittree1(a->left);
			commit();
			a->op == OP_BRTRUE?
				genbrtrue(a->args[0]):
				genbrfalse(a->args[0]);
			clear(0);
			emittree1(a->right);
			clear(0);
			break;
	case OP_IFELSE:	emitcond(a->left, a->args[0]);
			commit();
			genlab(a->args[0]);
			break;
	case OP_COMMA:	emittree1(a->left);
			commit();
			clear(0);
			emittree1(a->right);
			break;
	case OP_EQUAL:	/* fallthru */
	case OP_NOTEQ:	/* fallthru */
	case OP_LESS:	/* fallthru */
	case OP_GREATER:/* fallthru */
	case OP_LTEQ:	/* fallthru */
	case OP_GTEQ:	emittree1(a->left);
			emittree1(a->right);
			ptr = !inttype(a->args[0]);
			switch(a->op) {
			case OP_EQUAL:	queue_cmp(equal); break;
			case OP_NOTEQ:	queue_cmp(not_equal); break;
			case OP_LESS:	queue_cmp(ptr? below: less); break;
			case OP_GREATER:queue_cmp(ptr? above: greater); break;
			case OP_LTEQ:	queue_cmp(ptr? below_equal:
						less_equal);
					break;
			case OP_GTEQ:	queue_cmp(ptr? above_equal:
						greater_equal);
					break;
			}
			break;
	case OP_MOD:	/* fallthru */
	case OP_LSHIFT:	/* fallthru */
	case OP_RSHIFT:	/* fallthru */
	case OP_DIV:	/* fallthru */
	case OP_BINAND:	/* fallthru */
	case OP_BINIOR:	/* fallthru */
	case OP_BINXOR:	/* fallthru */
	case OP_MUL:	/* fallthru */
	case OP_SUB:	/* fallthru */
	case OP_PLUS:	/* fallthru */
	case OP_ADD:	emittree1(a->left);
			emittree1(a->right);
			switch(a->op) {
			case OP_LSHIFT:	genshl(1); break;
			case OP_RSHIFT:	genshr(1); break;
			case OP_DIV:	gendiv(1); break;
			case OP_MOD:	genmod(1); break;
			case OP_BINAND:	genand(); break;
			case OP_BINIOR:	genior(); break;
			case OP_BINXOR:	genxor(); break;
			case OP_MUL:	genmul(); break;
			case OP_ADD:	genadd(PINT, PINT, 1); break;
			case OP_PLUS:	genadd(a->args[0], a->args[1], 1);
					break;
			case OP_SUB:	gensub(a->args[0], a->args[1], 1);						break;
			}
			break;
	case OP_CALL:	emitargs(a->left);
			commit();
			spill();
			gencall(a->args[0]);
			genstack((a->args[1]) * BPW);
			break;
	case OP_CALR:	emitargs(a->left);
			commit();
			spill();
			clear(0);
			lv[LVPRIM] = FUNPTR;
			lv[LVSYM] = a->args[0];
			genrval(lv);
			gencalr();
			genstack((a->args[1]) * BPW);
			break;
	case OP_ASSIGN: if (OP_IDENT == a->left->op) {
				emittree1(a->right);
				commit();
				emittree1(a->left);
			}
			else {
				emittree1(a->left);
				commit();
				emittree1(a->right);
				commit();
			}
			lv[LVPRIM] = a->args[0];
			lv[LVSYM] = a->args[1];
			genstore(lv);
			break;
	}
}

void emittree(node *a) {
	/*dumptree(a);*/
	a = optimize(a);
	emittree1(a);
}
