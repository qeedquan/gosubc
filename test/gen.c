/*
 *	NMH's Simple C Compiler, 2011--2014
 *	Code generator (emitter)
 */

#include "defs.h"
#include "data.h"
#include "decl.h"
#include "cgen.h"

int	Acc = 0;

void clear(int q) {
	Acc = 0;
	if (q) Q_type = empty;
}

void load(void) {
	Acc = 1;
}

int label(void) {
	static int id = 1;

	return id++;
}

void spill(void) {
	if (Acc) {
		gentext();
		cgpush();
	}
}

void genraw(char *s) {
	if (NULL == Outfile) return;
	fprintf(Outfile, "%s", s);
}

void gen(char *s) {
	if (NULL == Outfile) return;
	fprintf(Outfile, "\t%s\n", s);
}

void ngen(char *s, char *inst, int n) {
	if (NULL == Outfile) return;
	fputc('\t', Outfile);
	fprintf(Outfile, s, inst, n);
	fputc('\n', Outfile);
}

void ngen2(char *s, char *inst, int n, int a) {
	if (NULL == Outfile) return;
	fputc('\t', Outfile);
	fprintf(Outfile, s, inst, n, a);
	fputc('\n', Outfile);
}

void lgen(char *s, char *inst, int n) {
	if (NULL == Outfile) return;
	fputc('\t', Outfile);
	fprintf(Outfile, s, inst, LPREFIX, n);
	fputc('\n', Outfile);
}

void lgen2(char *s, int v1, int v2) {
	if (NULL == Outfile) return;
	fputc('\t', Outfile);
	fprintf(Outfile, s, v1, LPREFIX, v2);
	fputc('\n', Outfile);
}

void sgen(char *s, char *inst, char *s2) {
	if (NULL == Outfile) return;
	fputc('\t', Outfile);
	fprintf(Outfile, s, inst, s2);
	fputc('\n', Outfile);
}

void sgen2(char *s, char *inst, int v, char *s2) {
	if (NULL == Outfile) return;
	fputc('\t', Outfile);
	fprintf(Outfile, s, inst, v, s2);
	fputc('\n', Outfile);
}

void genlab(int id) {
	if (NULL == Outfile) return;
	fprintf(Outfile, "%c%d:\n", LPREFIX, id);
}

char *labname(int id) {
	static char	name[100];

	sprintf(name, "%c%d", LPREFIX, id);
	return name;
}

char *gsym(char *s) {
	static char	name[NAMELEN+2];

	name[0] = PREFIX;
	copyname(&name[1], s);
	return name;
}

/* administrativa */

void gendata(void) {
	if (Textseg) cgdata();
	Textseg = 0;
}

void gentext(void) {
	if (!Textseg) cgtext();
	Textseg = 1;
}

void genprelude(void) {
	cgprelude();
	Textseg = 0;
	gentext();
}

void genpostlude(void) {
	cgpostlude();
}

void genname(char *name) {
	genraw(gsym(name));
	genraw(":");
}

void genpublic(char *name) {
	cgpublic(gsym(name));
}

/* loading values */

void commit(void) {
	if (Q_cmp != cnone) {
		commit_cmp();
		return;
	}
	if (Q_bool != bnone) {
		commit_bool();
		return;
	}
	if (empty == Q_type) return;
	spill();
	switch (Q_type) {
	case addr_auto:		cgldla(Q_val); break;
	case addr_static:	cgldsa(Q_val); break;
	case addr_globl:	cgldga(gsym(Q_name)); break;
	case addr_label:	cgldlab(Q_val); break;
	case literal:		cglit(Q_val); break;
	case auto_byte:		cgclear(); cgldlb(Q_val); break;
	case auto_word:		cgldlw(Q_val); break;
	case static_byte:	cgclear(); cgldsb(Q_val); break;
	case static_word:	cgldsw(Q_val); break;
	case globl_byte:	cgclear(); cgldgb(gsym(Q_name)); break;
	case globl_word:	cgldgw(gsym(Q_name)); break;
	default:		fatal("internal: unknown Q_type");
	}
	load();
	Q_type = empty;
}

void queue(int type, int val, char *name) {
	commit();
	Q_type = type;
	Q_val = val;
	if (name) copyname(Q_name, name);
	Q_cmp = cnone;
}

void genaddr(int y) {
	gentext();
	if (CAUTO == Stcls[y])
		queue(addr_auto, Vals[y], NULL);
	else if (CLSTATC == Stcls[y])
		queue(addr_static, Vals[y], NULL);
	else
		queue(addr_globl, 0, Names[y]);
}

void genldlab(int id) {
	gentext();
	queue(addr_label, id, NULL);
}

void genlit(int v) {
	gentext();
	queue(literal, v, NULL);
}

/* binary ops */

void genand(void) {
	gentext();
	cgand();
}

void genior(void) {
	gentext();
	cgior();
}

void genxor(void) {
	gentext();
	cgxor();
}

void genshl(int swapped) {
	gentext();
	if (cgload2() || !swapped) cgswap();
	cgshl();
}

void genshr(int swapped) {
	gentext();
	if (cgload2() || !swapped) cgswap();
	cgshr();
}

static int ptr(int p) {
	int	sp;

	sp = p & STCMASK;
	return INTPTR == p || INTPP == p ||
		CHARPTR == p || CHARPP == p ||
		VOIDPTR == p || VOIDPP == p ||
		STCPTR == sp || STCPP == sp ||
		UNIPTR == sp || UNIPP == sp ||
		FUNPTR == p;
}

static int needscale(int p) {
	int	sp;

	sp = p & STCMASK;
	return INTPTR == p || INTPP == p || CHARPP == p || VOIDPP == p ||
		STCPTR == sp || STCPP == sp || UNIPTR == sp || UNIPP == sp;
}

int genadd(int p1, int p2, int swapped) {
	int	rp = PINT, t;

	gentext();
	if (cgload2() || !swapped) {
		t = p1;
		p1 = p2;
		p2 = t;
	}
	if (ptr(p1)) {
		if (needscale(p1)) {
			if (	(p1 & STCMASK) == STCPTR ||
				(p1 & STCMASK) == UNIPTR
			)
				cgscale2by(objsize(deref(p1), TVARIABLE, 1));
			else
				cgscale2();
		}
		rp = p1;
	}
	else if (ptr(p2)) {
		if (needscale(p2)) {
			if (	(p2 & STCMASK) == STCPTR ||
				(p2 & STCMASK) == UNIPTR
			)
				cgscaleby(objsize(deref(p2), TVARIABLE, 1));
			else
				cgscale();
		}
		rp = p2;
	}
	cgadd();
	return rp;
}

int gensub(int p1, int p2, int swapped) {
	int	rp = PINT;

	gentext();
	if (cgload2() || !swapped) cgswap();
	if (!inttype(p1) && !inttype(p2) && p1 != p2)
		error("incompatible pointer types in binary '-'", NULL);
	if (ptr(p1) && !ptr(p2)) {
		if (needscale(p1)) {
			if (	(p1 & STCMASK) == STCPTR ||
				(p1 & STCMASK) == UNIPTR
			)
				cgscale2by(objsize(deref(p1), TVARIABLE, 1));
			else
				cgscale2();
		}
		rp = p1;
	}
	cgsub();
	if (needscale(p1) && needscale(p2)) {
		if (	(p1 & STCMASK) == STCPTR ||
			(p1 & STCMASK) == UNIPTR
		)
			cgunscaleby(objsize(deref(p1), TVARIABLE, 1));
		else
			cgunscale();
	}
	return rp;
}

void genmul(void) {
	gentext();
	cgload2();
	cgmul();
}

void gendiv(int swapped) {
	gentext();
	if (cgload2() || !swapped) cgswap();
	cgdiv();
}

void genmod(int swapped) {
	gentext();
	if (cgload2() || !swapped) cgswap();
	cgmod();
}

static void binopchk(int op, int p1, int p2) {
	if (ASPLUS == op)
		op = PLUS;
	else if (ASMINUS == op)
		op = MINUS;
	if (inttype(p1) && inttype(p2))
		return;
	else if (comptype(p1) || comptype(p2))
		/* fail */;
	else if (PVOID == p1 || PVOID == p2)
		/* fail */;
	else if (PLUS == op && (inttype(p1) || inttype(p2)))
		return;
	else if (MINUS == op && (!inttype(p1) || inttype(p2)))
		return;
	else if ((EQUAL == op || NOTEQ == op || LESS == op ||
		 GREATER == op || LTEQ == op || GTEQ == op)
		&&
		(p1 == p2 ||
		 (VOIDPTR == p1 && !inttype(p2)) ||
		 (VOIDPTR == p2 && !inttype(p1)))
	)
		return;
	error("invalid operands to binary operator", NULL);
}

void commit_cmp(void) {
	switch (Q_cmp) {
	case equal:		cgeq(); break;
	case not_equal:		cgne(); break;
	case less:		cglt(); break;
	case greater:		cggt(); break;
	case less_equal:	cgle(); break;
	case greater_equal:	cgge(); break;
	case below:		cgult(); break;
	case above:		cgugt(); break;
	case below_equal:	cgule(); break;
	case above_equal:	cguge(); break;
	}
	Q_cmp = cnone;
}

void queue_cmp(int op) {
	if (Q_bool != bnone) commit_bool();
	if (Q_cmp != cnone) commit_cmp();
	Q_cmp = op;
}

int binoptype(int op, int p1, int p2) {
	binopchk(op, p1, p2);
	if (PLUS == op) {
		if (!inttype(p1)) return p1;
		if (!inttype(p2)) return p2;
	}
	else if (MINUS == op) {
		if (!inttype(p1)) {
			if (!inttype(p2)) return PINT;
			return p1;
		}
	}
	return PINT;
}

/* unary ops */

void commit_bool(void) {
	switch (Q_bool) {
	case lognot:	cglognot(); break;
	case normalize:	cgbool(); break;
	}
	Q_bool = bnone;
}

void queue_bool(int op) {
	commit();
	Q_bool = op;
}

void genbool(void) {
	queue_bool(normalize);
}

void genlognot(void) {
	queue_bool(lognot);
}

void genind(int p) {
	gentext();
	commit();
	if (PCHAR == p)
		cgindb();
	else
		cgindw();
}

void genneg(void) {
	gentext();
	commit();
	cgneg();
}

void gennot(void) {
	gentext();
	commit();
	cgnot();
}

void genscale(void) {
	gentext();
	commit();
	cgscale();
}

void genscale2(void) {
	gentext();
	commit();
	cgscale2();
}

void genscaleby(int v) {
	gentext();
	commit();
	cgscaleby(v);
}

/* jump/call/function ops */

void genjump(int dest) {
	gentext();
	commit();
	cgjump(dest);
}

void genbranch(int dest, int inv) {
	if (inv) {
		switch (Q_cmp) {
		case equal:		cgbrne(dest); break;
		case not_equal:		cgbreq(dest); break;
		case less:		cgbrge(dest); break;
		case greater:		cgbrle(dest); break;
		case less_equal:	cgbrgt(dest); break;
		case greater_equal:	cgbrlt(dest); break;
		case below:		cgbruge(dest); break;
		case above:		cgbrule(dest); break;
		case below_equal:	cgbrugt(dest); break;
		case above_equal:	cgbrult(dest); break;
		}
	}
	else {
		switch (Q_cmp) {
		case equal:		cgbreq(dest); break;
		case not_equal:		cgbrne(dest); break;
		case less:		cgbrlt(dest); break;
		case greater:		cgbrgt(dest); break;
		case less_equal:	cgbrle(dest); break;
		case greater_equal:	cgbrge(dest); break;
		case below:		cgbrult(dest); break;
		case above:		cgbrugt(dest); break;
		case below_equal:	cgbrule(dest); break;
		case above_equal:	cgbruge(dest); break;
		}
	}
	Q_cmp = cnone;
}

void genlogbr(int dest, int inv) {
	if (normalize == Q_bool) {
		if (inv)
			cgbrfalse(dest);
		else
			cgbrtrue(dest);
	}
	else if (lognot == Q_bool) {
		if (inv)
			cgbrtrue(dest);
		else
			cgbrfalse(dest);
	}
	Q_bool = bnone;
}

void genbrfalse(int dest) {
	gentext();
	if (Q_cmp != cnone) {
		genbranch(dest, 0);
		return;
	}
	if (Q_bool != bnone) {
		genlogbr(dest, 1);
		return;
	}
	commit();
	cgbrfalse(dest);
}

void genbrtrue(int dest) {
	gentext();
	if (Q_cmp != cnone) {
		genbranch(dest, 1);
		return;
	}
	if (Q_bool != bnone) {
		genlogbr(dest, 0);
		return;
	}
	commit();
	cgbrtrue(dest);
}

void gencall(int y) {
	gentext();
	commit();
	cgcall(gsym(Names[y]));
	load();
}

void gencalr(void) {
	gentext();
	commit();
	cgcalr();
	load();
}

void genentry(void) {
	gentext();
	cgentry();
}

void genexit(void) {
	gentext();
	cgexit();
}

void genpush(void) {
	gentext();
	commit();
	cgpush();
}

void genpushlit(int n) {
	gentext();
	commit();
	spill();
	cgpushlit(n);
}

void genstack(int n) {
	if (n) {
		gentext();
		cgstack(n);
	}
}

void genlocinit(void) {
	int	i;

	gentext();
	for (i=0; i<Nli; i++)
		cginitlw(LIval[i], LIaddr[i]);
}

/* data definitions */

void genbss(char *name, int len, int statc) {
	gendata();
	if (statc)
		cglbss(name, (len + INTSIZE-1) / INTSIZE * INTSIZE);
	else
		cggbss(name, (len + INTSIZE-1) / INTSIZE * INTSIZE);
}

void genalign(int k) {
	gendata();
	while (k++ % INTSIZE)
		cgdefb(0);
}

void genaligntext() {
	cgalign();
}

void gendefb(int v) {
	gendata();
	cgdefb(v);
}

void gendefp(int v) {
	gendata();
	cgdefp(v);
}

void gendefs(char *s, int len) {
	int	i;

	gendata();
	for (i=1; i<len-1; i++) {
		if (isalnum(s[i]))
			cgdefc(s[i]);
		else
			cgdefb(s[i]);
	}
}

void gendefw(int v) {
	gendata();
	cgdefw(v);
}

/* increment ops */

static void genincptr(int *lv, int inc, int pre) {
	int	y, size;

	size = objsize(deref(lv[LVPRIM]), TVARIABLE, 1);
	gentext();
	y = lv[LVSYM];
	commit();
	if (!y && !pre) cgldinc();
	if (!pre) {
		genrval(lv);
		commit();
	}
	if (!y) {
		if (pre)
			if (inc)
				cginc1pi(size);
			else
				cgdec1pi(size);
		else
			if (inc)
				cginc2pi(size);
			else
				cgdec2pi(size);
	}
	else if (CAUTO == Stcls[y]) {
		if (inc)
			cgincpl(Vals[y], size);
		else
			cgdecpl(Vals[y], size);
	}
	else if (CLSTATC == Stcls[y]) {
		if (inc)
			cgincps(Vals[y], size);
		else
			cgdecps(Vals[y], size);
	}
	else {
		if (inc)
			cgincpg(gsym(Names[y]), size);
		else
			cgdecpg(gsym(Names[y]), size);
	}
	if (pre) genrval(lv);
}

void geninc(int *lv, int inc, int pre) {
	int	y, b;

	gentext();
	y = lv[LVSYM];
	if (needscale(lv[LVPRIM])) {
		genincptr(lv, inc, pre);
		return;
	}
	b = PCHAR == lv[LVPRIM];
	/* will duplicate move to aux register in (*char)++ */
	commit();
	if (!y && !pre) cgldinc();
	if (!pre) {
		genrval(lv);
		commit();
	}
	if (!y) {
		if (pre)
			if (inc)
				b? cginc1ib(): cginc1iw();
			else
				b? cgdec1ib(): cgdec1iw();
		else
			if (inc)
				b? cginc2ib(): cginc2iw();
			else
				b? cgdec2ib(): cgdec2iw();
	}
	else if (CAUTO == Stcls[y]) {
		if (inc)
			b? cginclb(Vals[y]): cginclw(Vals[y]);
		else
			b? cgdeclb(Vals[y]): cgdeclw(Vals[y]);
	}
	else if (CLSTATC == Stcls[y]) {
		if (inc)
			b? cgincsb(Vals[y]): cgincsw(Vals[y]);
		else
			b? cgdecsb(Vals[y]): cgdecsw(Vals[y]);
	}
	else {
		if (inc)
			b? cgincgb(gsym(Names[y])):
			   cgincgw(gsym(Names[y]));
		else
			b? cgdecgb(gsym(Names[y])):
			   cgdecgw(gsym(Names[y]));
	}
	if (pre) genrval(lv);
}

/* switch table generator */

void genswitch(int *vals, int *labs, int nc, int dflt) {
	int	i, ltbl;

	ltbl = label();
	gentext();
	cgldswtch(ltbl);
	cgcalswtch();
	genlab(ltbl);
	cgdefw(nc);
	for (i = 0; i < nc; i++)
		cgcase(vals[i], labs[i]);
	cgdefl(dflt);
}

/* assigments */

void genstore(int *lv) {
	if (NULL == lv) return;
	gentext();
	if (!lv[LVSYM]) {
		cgpopptr();
		if (PCHAR == lv[LVPRIM])
			cgstorib();
		else
			cgstoriw();

	}
	else if (CAUTO == Stcls[lv[LVSYM]]) {
		if (PCHAR == lv[LVPRIM])
			cgstorlb(Vals[lv[LVSYM]]);
		else
			cgstorlw(Vals[lv[LVSYM]]);
	}
	else if (CLSTATC == Stcls[lv[LVSYM]]) {
		if (PCHAR == lv[LVPRIM])
			cgstorsb(Vals[lv[LVSYM]]);
		else
			cgstorsw(Vals[lv[LVSYM]]);
	}
	else {
		if (PCHAR == lv[LVPRIM])
			cgstorgb(gsym(Names[lv[LVSYM]]));
		else
			cgstorgw(gsym(Names[lv[LVSYM]]));
	}
}

/* genrval computation */

void genrval(int *lv) {
	if (NULL == lv) return;
	gentext();
	if (!lv[LVSYM]) {
		genind(lv[LVPRIM]);
	}
	else if (CAUTO == Stcls[lv[LVSYM]]) {
		if (PCHAR == lv[LVPRIM])
			queue(auto_byte, Vals[lv[LVSYM]], NULL);
		else
			queue(auto_word, Vals[lv[LVSYM]], NULL);
	}
	else if (CLSTATC == Stcls[lv[LVSYM]]) {
		if (PCHAR == lv[LVPRIM])
			queue(static_byte, Vals[lv[LVSYM]], NULL);
		else
			queue(static_word, Vals[lv[LVSYM]], NULL);
	}
	else {
		if (PCHAR == lv[LVPRIM])
			queue(globl_byte, 0, Names[lv[LVSYM]]);
		else
			queue(globl_word, 0, Names[lv[LVSYM]]);
	}
}
