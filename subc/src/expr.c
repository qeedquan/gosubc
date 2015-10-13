/*
 *	NMH's Simple C Compiler, 2011--2014
 *	Expression parser
 */

#include "defs.h"
#include "data.h"
#include "decl.h"
#include "prec.h"

static node *asgmnt(int *lv);
static node *cast(int *lv);
static node *exprlist(int *lv, int ckvoid);

static node *rvalue(node *n, int *lv) {
	if (lv[LVADDR]) {
		lv[LVADDR] = 0;
		return mkunop2(OP_RVAL, lv[LVPRIM], lv[LVSYM], n);
	}
	else {
		return n;
	}
}

/*
 * primary :=
 *	  IDENT
 *	| INTLIT
 *	| string
 *	| ARGC
 *	| ( expr )
 *
 * string :=
 *	  STRLIT
 *	| STRLIT string
 */

static node *primary(int *lv) {
	node	*n = NULL;
	int	y, lab, k;
	char	name[NAMELEN+1];

	lv[LVPRIM] = lv[LVSYM] = lv[LVADDR] = 0;
	switch (Token) {
	case IDENT:
		y = findsym(Text);
		copyname(name, Text);
		Token = scan();
		if (!y) {
			if (LPAREN == Token) {
				y = addglob(name, PINT, TFUNCTION, CEXTERN,
					-1, 0, NULL, 0);
			}
			else {
				error("undeclared variable: %s", name);
				y = addloc(name, PINT, TVARIABLE, CAUTO,
					0, 0, 0);
			}
		}
		lv[LVSYM] = y;
		lv[LVPRIM] = Prims[y];
		if (TFUNCTION == Types[y]) {
			if (LPAREN != Token) {
				lv[LVPRIM] = FUNPTR;
				n = mkleaf(OP_ADDR, y);
			}
			return n;
		}
		if (TCONSTANT == Types[y]) {
			return mkleaf(OP_LIT, Vals[y]);
		}
		if (TARRAY == Types[y]) {
			n = mkleaf(OP_ADDR, y);
			lv[LVPRIM] = pointerto(lv[LVPRIM]);
			return n;
		}
		if (comptype(Prims[y])) {
			n = mkleaf(OP_ADDR, y);
			lv[LVSYM] = 0;
			return n;
		}
		n = mkleaf(OP_IDENT, y);
		lv[LVADDR] = 1;
		return n;
	case INTLIT:
		n = mkleaf(OP_LIT, Value);
		Token = scan();
		lv[LVPRIM] = PINT;
		return n;
	case STRLIT:
		gendata();
		lab = label();
		genlab(lab);
		k = 0;
		while (STRLIT == Token) {
			gendefs(Text, Value);
			k += Value-2;
			Token = scan();
		}
		gendefb(0);
		genalign(k+1);
		n = mkleaf(OP_LDLAB, lab);
		lv[LVPRIM] = CHARPTR;
		return n;
	case LPAREN:
		Token = scan();
		n = exprlist(lv, 0);
		rparen();
		return n;
	default:
		error("syntax error at: %s", Text);
		Token = synch(SEMI);
		return NULL;
	}
}

int typematch(int p1, int p2) {
	if (p1 == p2) return 1;
	if (inttype(p1) && inttype(p2)) return 1;
	if (!inttype(p1) && VOIDPTR == p2) return 1;
	if (VOIDPTR == p1 && !inttype(p2)) return 1;
	return 0;
}

/*
 * fnargs :=
 *	  asgmnt
 *	| asgmnt , fnargs
 */

static node *fnargs(int fn, int *na) {
	int	lv[LV];
	int	*types;
	char	msg[100];
	int	sgn[MAXFNARGS+1];
	node	*n = NULL, *n2;

	types = (int *) (fn? Mtext[fn]: NULL);
	*na = 0;
	while (RPAREN != Token) {
		n2 = asgmnt(lv);
		n2 = rvalue(n2, lv);
		n = mkbinop(OP_GLUE, n, n2);
		if (comptype(lv[LVPRIM])) {
			error("struct/union passed by value", NULL);
			lv[LVPRIM] = pointerto(lv[LVPRIM]);
		}
		if (types && *types) {
			if (!typematch(*types, lv[LVPRIM])) {
				sprintf(msg, "wrong type in argument %d"
					" of call to: %%s",
					*na+1);
				error(msg, Names[fn]);
			}
			types++;
		}
		if (*na < MAXFNARGS) sgn[*na] = lv[LVPRIM], sgn[*na+1] = 0;
		(*na)++;
		if (COMMA == Token) {
			Token = scan();
			if (RPAREN == Token)
				error("trailing ',' in function call", NULL);
		}
		else
			break;
	}
	if (fn && TFUNCTION == Types[fn] && !Mtext[fn]) {
		Mtext[fn] = galloc((*na+1) * sizeof(int), 1);
		memcpy(Mtext[fn], sgn, (*na+1) * sizeof(int));
	}
	rparen();
	return n;
}

int deref(int p) {
	int	y;

	switch (p) {
	case INTPP:	return INTPTR;
	case INTPTR:	return PINT;
	case CHARPP:	return CHARPTR;
	case CHARPTR:	return PCHAR;
	case VOIDPP:	return VOIDPTR;
	case VOIDPTR:	return PCHAR;
	case FUNPTR:	return PCHAR;
	}
	y = p & ~STCMASK;
	switch (p & STCMASK) {
	case STCPP:	return STCPTR | y;
	case STCPTR:	return PSTRUCT | y;
	case UNIPP:	return UNIPTR | y;
	case UNIPTR:	return PUNION | y;
	}
	return -1;
}

static node *indirection(node *n, int *lv) {
	int	p;

	n = rvalue(n, lv);
	if (VOIDPTR == lv[LVPRIM])
		error("dereferencing void pointer", NULL);
	if ((p = deref(lv[LVPRIM])) < 0) {
		if (lv[LVSYM])
			error("indirection through non-pointer: %s",
				Names[lv[LVSYM]]);
		else
			error("indirection through non-pointer", NULL);
		p = lv[LVPRIM];
	}
	lv[LVPRIM] = p;
	lv[LVSYM] = 0;
	return n;
}

static void badcall(int *lv) {
	if (lv[LVSYM])
		error("call of non-function: %s",
			Names[lv[LVSYM]]);
	else
		error("call of non-function", NULL);
}

static int argsok(int na, int nf) {
	return na == nf || (nf < 0 && na >= -nf-1);
}

static node *stc_access(node *n, int *lv, int ptr) {
	int	y, p;
	node	*n2;

	n2 = n;
	p = lv[LVPRIM] & STCMASK;
	lv[LVADDR] = 1;
	if (IDENT != Token) {
		Token = scan();
		error("struct/union member name expected after '%s'",
			ptr? "->": ".");
		return NULL;
	}
	y = findmem(lv[LVPRIM] & ~STCMASK, Text);
	if (0 == y)
		error("struct/union has no such member: %s", Text);
	if ((PSTRUCT == p || STCPTR == p) && Vals[y]) {
		n2 = mkleaf(OP_LIT, Vals[y]);
		n2 = mkbinop(OP_ADD, n, n2);
	}
	Token = scan();
	p = Prims[y];
	if (TARRAY == Types[y]) {
		p = pointerto(p);
		lv[LVADDR] = 0;
	}
	lv[LVPRIM] = p;
	return n2;
}

/*
 * postfix :=
 *	  primary
 *	| postfix [ expr ]
 *	| postfix ( )
 *	| postfix ( fnargs )
 *	| postfix ++
 *	| postfix --
 *	| postfix . identifier
 *	| postfix -> identifier
 */

static node *postfix(int *lv) {
	node	*n = NULL, *n2;
	int	lv2[LV], p, na;

	n = primary(lv);
	for (;;) {
		switch (Token) {
		case LBRACK:
			while (LBRACK == Token) {
				n = indirection(n, lv);
				Token = scan();
				n2 = exprlist(lv2, 1);
				n2 = rvalue(n2, lv2);
				p = lv[LVPRIM];
				if (PINT != lv2[LVPRIM])
					error("non-integer subscript", NULL);
				if (    PINT == p || INTPTR == p ||
					CHARPTR == p || VOIDPTR == p ||
					STCPTR == (p & STCMASK) ||
					UNIPTR == (p & STCMASK)
				) {
					n2 = mkunop(OP_SCALE, n2);
				}
				else if (comptype(p)) {
					n2 = mkunop1(OP_SCALEBY,
						objsize(p, TVARIABLE, 1), n2);
				}
				n = mkbinop(OP_ADD, n, n2);
				rbrack();
				lv[LVSYM] = 0;
				lv[LVADDR] = 1;
			}
			break;
		case LPAREN:
			Token = scan();
			n = fnargs(lv[LVSYM], &na);
			if (lv[LVSYM] && TFUNCTION == Types[lv[LVSYM]]) {
				if (!argsok(na, Sizes[lv[LVSYM]]))
					error("wrong number of arguments: %s",
						Names[lv[LVSYM]]);
				n = mkunop2(OP_CALL, lv[LVSYM], na, n);
			}
			else {
				if (lv[LVPRIM] != FUNPTR) badcall(lv);
				n = mkunop2(OP_CALR, lv[LVSYM], na, n);
				lv[LVPRIM] = PINT;
			}
			lv[LVADDR] = 0;
			break;
		case INCR:
		case DECR: 
			if (lv[LVADDR]) {
				if (INCR == Token)
					n = mkunop2(OP_POSTINC, lv[LVPRIM],
						lv[LVSYM], n);
				else
					n = mkunop2(OP_POSTDEC, lv[LVPRIM],
						lv[LVSYM], n);
			}
			else
				error("lvalue required before '%s'", Text);
			Token = scan();
			lv[LVADDR] = 0;
			break;
		case DOT:
			Token = scan();
			if (comptype(lv[LVPRIM]))
				n = stc_access(n, lv, 0);
			else
				error("struct/union expected before '.'",
					NULL);
			break;
		case ARROW:
			Token = scan();
			p = lv[LVPRIM] & STCMASK;
			if (p == STCPTR || p == UNIPTR) {
				n = rvalue(n, lv);
				n = stc_access(n, lv, 1);
			}
			else
				error(
				 "struct/union pointer expected before '->'",
				 NULL);
			lv[LVSYM] = 0;
			break;
		default:
			return n;
		}
	}
}

static node *prefix(int *lv);

static node *comp_size(void) {
	int	k = 0, y, lv[LV];

	if (	CHAR == Token || INT == Token || VOID == Token ||
		STRUCT == Token || UNION == Token
	) {
		switch (Token) {
		case CHAR:	k = CHARSIZE; break;
		case INT:	k = INTSIZE; break;
		case STRUCT:
		case UNION:	k = primtype(Token, NULL);
				k = objsize(k, TVARIABLE, 1);
				break;
		}
		Token = scan();
		if (STAR == Token) {
			k = PTRSIZE;
			Token = scan();
			if (STAR == Token) Token = scan();
		}
		else if (0 == k) {
			error("sizeof(void) is unknown", NULL);
		}
	}
	else {
		prefix(lv);
		y = lv[LVSYM]? lv[LVSYM]: 0;
		k = y? objsize(Prims[y], Types[y], Sizes[y]):
			objsize(lv[LVPRIM], TVARIABLE, 1);
		if (0 == k)
			error("cannot compute sizeof: %s",
				Text);
	}
	return mkleaf(OP_LIT, k);
}

/*
 * prefix :=
 *	  postfix
 *	| ++ prefix
 *	| -- prefix
 *	| & cast
 *	| * cast
 *	| + cast
 *	| - cast
 *	| ~ cast
 *	| ! cast
 *	| SIZEOF ( type )
 *	| SIZEOF ( type * )
 *	| SIZEOF ( type * * )
 *	| SIZEOF ( IDENT )
 *
 * type :=
 *	  INT
 *	| CHAR
 *	| VOID
 *	| STRUCT IDENT
 *	| UNION IDENT
 */

static node *prefix(int *lv) {
	node	*n;
	int	t;

	switch (Token) {
	case INCR:
	case DECR:
		t = Token;
		Token = scan();
		n = prefix(lv);
		if (lv[LVADDR]) {
			if (INCR == t)
				n = mkunop2(OP_PREINC, lv[LVPRIM],
					lv[LVSYM], n);
			else
				n = mkunop2(OP_PREDEC, lv[LVPRIM],
					lv[LVSYM], n);
		}
		else {
			error("lvalue expected after '%s'",
				t == INCR? "++": "--");
		}
		lv[LVADDR] = 0;
		return n;
	case STAR:
		Token = scan();
		n = cast(lv);
		n = indirection(n, lv);
		lv[LVADDR] = 1;
		return n;
	case PLUS:
		Token = scan();
		n = cast(lv);
		n = rvalue(n, lv); /* XXX really? */
		if (!inttype(lv[LVPRIM]))
			error("bad operand to unary '+'", NULL);
		lv[LVADDR] = 0;
		return n;
	case MINUS:
		Token = scan();
		n = cast(lv);
		n = rvalue(n, lv);
		if (!inttype(lv[LVPRIM]))
			error("bad operand to unary '-'", NULL);
		n = mkunop(OP_NEG, n);
		lv[LVADDR] = 0;
		return n;
	case TILDE:
		Token = scan();
		n = cast(lv);
		n = rvalue(n, lv);
		if (!inttype(lv[LVPRIM]))
			error("bad operand to '~'", NULL);
		n = mkunop(OP_NOT, n);
		lv[LVADDR] = 0;
		return n;
	case XMARK:
		Token = scan();
		n = cast(lv);
		n = rvalue(n, lv);
		n = mkunop(OP_LOGNOT, n);
		lv[LVPRIM] = PINT;
		lv[LVADDR] = 0;
		return n;
	case AMPER:
		Token = scan();
		n = cast(lv);
		if (lv[LVADDR]) {
			if (lv[LVSYM]) n = mkunop1(OP_ADDR, lv[LVSYM], n);
		}
		else if ((0 == lv[LVSYM] || Types[lv[LVSYM]] != TARRAY) &&
			 !comptype(lv[LVPRIM])
		) {
			error("lvalue expected after unary '&'", NULL);
		}
		lv[LVPRIM] = pointerto(lv[LVPRIM]);
		lv[LVADDR] = 0;
		return n;
	case SIZEOF:
		Token = scan();
		lparen();
		n = comp_size();
		rparen();
		lv[LVPRIM] = PINT;
		lv[LVADDR] = 0;
		return n;
	default:
		return postfix(lv);
	}
}

/*
 * cast :=
 *	  prefix
 *	| ( type ) prefix
 *	| ( type * ) prefix
 *	| ( type * * ) prefix
 *	| ( INT ( * ) ( ) ) prefix
 */

static node *cast(int *lv) {
	int	t;
	node	*n;

	if (LPAREN == Token) {
		Token = scan();
		if (	INT == Token || CHAR == Token || VOID == Token ||
			STRUCT == Token || UNION == Token
		) {
			t = primtype(Token, NULL);
			Token = scan();
		}
		else {
			reject();
			Token = LPAREN;
			strcpy(Text, "(");
			return prefix(lv);
		}
		if (PINT == t && LPAREN == Token) {
			Token = scan();
			match(STAR, "int(*)()");
			rparen();
			lparen();
			rparen();
			t = FUNPTR;
		}
		else if (STAR == Token) {
			t = pointerto(t);
			Token = scan();
			if (STAR == Token) {
				t = pointerto(t);
				Token = scan();
			}
		}
		rparen();
		n = prefix(lv);
		lv[LVPRIM] = t;
		return n;
	}
	else {
		return prefix(lv);
	}
}

int binop(int tok) {
	switch(tok) {
	case AMPER:	return OP_BINAND;
	case CARET:	return OP_BINXOR;
	case EQUAL:	return OP_EQUAL;
	case GREATER:	return OP_GREATER;
	case GTEQ:	return OP_GTEQ;
	case LESS:	return OP_LESS;
	case LSHIFT:	return OP_LSHIFT;
	case LTEQ:	return OP_LTEQ;
	case MINUS:	return OP_SUB;
	case MOD:	return OP_MOD;
	case NOTEQ:	return OP_NOTEQ;
	case PIPE:	return OP_BINIOR;
	case PLUS:	return OP_PLUS;
	case RSHIFT:	return OP_RSHIFT;
	case SLASH:	return OP_DIV;
	case STAR:	return OP_MUL;
	default:	fatal("internal: unknown binop");
			return 0; /* notreached */
	}
}

node *mkop(int op, int p1, int p2, node *l, node *r) {
	if (PLUS == op || MINUS == op) {
		return mkbinop2(binop(op), p1, p2, l, r);
	}
	else if (EQUAL == op || NOTEQ == op || LESS == op ||
		 GREATER == op || LTEQ == op || GTEQ == op)
	{
		return mkbinop1(binop(op), p1, l, r);
	}
	else {
		return mkbinop(binop(op), l, r);
	}
}

/*
 * term :=
 *	  cast
 *	| term * cast
 *	| term / cast
 *	| term % cast
 *
 * sum :=
 *	  term
 *	| sum + term
 *	| sum - term
 *
 * shift :=
 *	  sum
 *	| shift << sum
 *	| shift >> sum
 *
 * relation :=
 *	  shift
 *	| relation < shift
 *	| relation > shift
 *	| relation <= shift
 *	| relation >= shift
 *
 * equation :=
 *	  relation
 *	| equation == relation
 *	| equation != relation
 *
 * binand :=
 *	  equation
 *	| binand & equation
 *
 * binxor :=
 *	  binand
 *	| binxor ^ binand
 *
 * binor :=
 *	  binxor
 *	| binor '|' binxor
 *
 * binexpr :=
 *	  binor
 */

static node *binexpr(int *lv) {
	int	ops[9];
	int	prims[10];
	int	sp = 0;
	int	lv2[LV], a;
	node	*tree[10];

	tree[0] = cast(lv);
	a = lv[LVADDR];
	prims[0] = lv[LVPRIM];
	while (SLASH == Token || STAR == Token || MOD == Token ||
		PLUS == Token || MINUS == Token || LSHIFT == Token ||
		RSHIFT == Token || GREATER == Token || GTEQ == Token ||
		LESS == Token || LTEQ == Token || EQUAL == Token ||
		NOTEQ == Token || AMPER == Token || CARET == Token ||
		PIPE == Token
	) {
		tree[0] = rvalue(tree[0], lv);
		while (sp > 0 && Prec[Token] <= Prec[ops[sp-1]]) {
			tree[sp-1] = mkop(ops[sp-1], prims[sp-1], prims[sp],
					tree[sp-1], tree[sp]);
			prims[sp-1] = binoptype(ops[sp-1], prims[sp-1],
					prims[sp]);
			sp--;
		}
		ops[sp++] = Token;
		Token = scan();
		tree[sp] = cast(lv2);
		tree[sp] = rvalue(tree[sp], lv2);
		prims[sp] = lv2[LVPRIM];
		a = 0;
	}
	while (sp > 0) {
		tree[sp-1] = mkop(ops[sp-1], prims[sp-1], prims[sp],
				tree[sp-1], tree[sp]);
		prims[sp-1] = binoptype(ops[sp-1], prims[sp-1], prims[sp]);
		sp--;
	}
	lv[LVPRIM] = prims[0];
	lv[LVADDR] = a;
	return tree[0];
}

/*
 * logand :=
 *	  binexpr
 *	| logand && binexpr
 *
 * logor :=
 *	  logand
 *	| logor '||' logand
 */

static node *cond2(int *lv, int op) {
	int	lv2[LV];
	int	lab = 0;
	node	*n, *n2 = NULL;
	int	tv = 1;

	n = op == LOGOR? cond2(lv, LOGAND): binexpr(lv);
	while (Token == op) {
		if (!lab) lab = label();
		if (tv) notvoid(lv[LVPRIM]), tv = 0;
		n = rvalue(n, lv);
		Token = scan();
		n2 = op == LOGOR? cond2(lv2, LOGAND): binexpr(lv2);
		n2 = rvalue(n2, lv2);
		if (op == LOGOR)
			n = mkbinop1(OP_BRTRUE, lab, n, n2);
		else
			n = mkbinop1(OP_BRFALSE, lab, n, n2);
	}
	if (lab) {
		n = mkunop1(OP_LAB, lab, n);
		n = mkunop(OP_BOOL, n);
		lv[LVPRIM] = PINT;
		lv[LVADDR] = 0;
	}
	return n;
}

/*
 * condexpr :=
 *	  logor
 *	| logor ? expr : condexpr
 */

static node *cond3(int *lv) {
	node	*n, *n2;
	int	lv2[LV], p;
	int	l1 = 0, l2 = 0, tv = 1;

	n = cond2(lv, LOGOR);
	p = 0;
	while (QMARK == Token) {
		n = rvalue(n, lv);
		if (tv) notvoid(lv[LVPRIM]), tv = 0;
		l1 = label();
		if (!l2) l2 = label();
		Token = scan();
		n2 = exprlist(lv2, 0);
		n2 = rvalue(n2, lv2);
		n = mkbinop1(OP_BRFALSE, l1, n, n2);
		if (!p) p = lv2[LVPRIM];
		if (!typematch(p, lv2[LVPRIM]))
			error("incompatible types in '?:'", NULL);
		colon();
		n2 = cond2(lv2, LOGOR);
		n2 = rvalue(n2, lv2);
		n = mkbinop(OP_GLUE, n, n2);
		if (QMARK != Token)
			if (!typematch(p, lv2[LVPRIM]))
				error("incompatible types in '?:'", NULL);
	}
	if (l2) {
		n = mkunop1(OP_IFELSE, l2, n);
		lv[LVPRIM] = p;
		lv[LVADDR] = 0;
	}
	return n;
}

int arithop(int tok) {
	switch(tok) {
	case ASPLUS:	return PLUS;
	case ASMINUS:	return MINUS;
	case ASAND:	return AMPER;
	case ASOR:	return PIPE;
	case ASXOR:	return CARET;
	case ASMUL:	return STAR;
	case ASMOD:	return MOD;
	case ASDIV:	return SLASH;
	case ASLSHIFT:	return LSHIFT;
	case ASRSHIFT:	return RSHIFT;
	default:	fatal("internal: unknown assignment operator");
			return 0; /* notreached */
	}
}

/*
 * asgmnt :=
 *	  condexpr
 *	| condexpr = asgmnt
 *	| condexpr *= asgmnt
 *	| condexpr /= asgmnt
 *	| condexpr %= asgmnt
 *	| condexpr += asgmnt
 *	| condexpr -= asgmnt
 *	| condexpr <<= asgmnt
 *	| condexpr >>= asgmnt
 *	| condexpr &= asgmnt
 *	| condexpr ^= asgmnt
 *	| condexpr |= asgmnt
 */

static node *asgmnt(int *lv) {
	node	*n, *n2, *src;
	int	lv2[LV], lvs[LV], op;

	n = cond3(lv);
	if (ASSIGN == Token || ASDIV == Token || ASMUL == Token ||
		ASMOD == Token || ASPLUS == Token || ASMINUS == Token ||
		ASLSHIFT == Token || ASRSHIFT == Token || ASAND == Token ||
		ASXOR == Token || ASOR == Token
	) {
		op = Token;
		Token = scan();
		n2 = asgmnt(lv2);
		n2 = rvalue(n2, lv2);
		if (ASSIGN == op) {
			if (!typematch(lv[LVPRIM], lv2[LVPRIM]))
				error("assignment from incompatible type",
					NULL);
			n = mkbinop2(OP_ASSIGN, lv[LVPRIM], lv[LVSYM], n, n2);
		}
		else {
			memcpy(lvs, lv, sizeof(lvs));
			src = rvalue(n, lvs);
			n2 = mkop(arithop(op), lv[LVPRIM], lv2[LVPRIM],
				src, n2);
			n = mkbinop2(OP_ASSIGN, lv[LVPRIM], lv[LVSYM], n, n2);
		}
		if (!lv[LVADDR])
			error("lvalue expected in assignment", Text);
		lv[LVADDR] = 0;
	}
	return n;
}

/*
 * expr :=
 *	  asgmnt
 *	| asgmnt , expr
 */

static node *exprlist(int *lv, int ckvoid) {
	node	*n, *n2 = NULL;
	int	p;

	n = asgmnt(lv);
	p = lv[LVPRIM];
	while (COMMA == Token) {
		Token = scan();
		n2 = asgmnt(lv);
		n2 = rvalue(n2, lv);
		p = lv[LVPRIM];
		n = mkbinop(OP_COMMA, n, n2);
	}
	if (ckvoid) notvoid(p);
	return n;
}

void expr(int *lv, int ckvoid) {
	node	*n;

	Ndtop = 1;
	n = exprlist(lv, ckvoid);
	n = rvalue(n, lv);
	emittree(n);
}

void rexpr(void) {
	int	lv[LV];

	expr(lv, 1);
}

int constexpr(void) {
	node	*n;
	int	lv[LV];

	Ndtop = 1;
	n = binexpr(lv);
	notvoid(lv[LVPRIM]);
	n = fold_reduce(n);
	if (NULL == n || OP_LIT != n->op) {
		error("constant expression expected", NULL);
		return 0;
	}
	return n->args[0];
}
