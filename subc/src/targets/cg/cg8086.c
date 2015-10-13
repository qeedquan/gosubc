/*
 *	NMH's Simple C Compiler, 2013,2014
 *	8086 target description
 */

#include "defs.h"
#include "data.h"
#include "decl.h"
#include "cgen.h"

void cgdata(void)	{ gen(".data"); }
void cgtext(void)	{ gen(".code"); }
void cgprelude(void)	{ gen(".model small"); }
void cgpostlude(void)	{ gen("end"); }
void cgpublic(char *s)	{ ngen("public\t%s", s, 0); }

void cgsynth(char *op) {
	int	n;
	char	*s;

	n = Q_val;
	s = gsym(Q_name);
	switch (Q_type) {
	case addr_auto:		ngen("%s\tcx,[bp%+d]", "leal", n);
				sgen("%s\tax,%s", op, "cx");
				break;
	case addr_static:	lgen("%s\tax,offset %c%d", op, n); break;
	case addr_globl:	sgen("%s\tax,offset %s", op, s); break;
	case addr_label:	lgen("%s\tax,offset %c%d", op, n); break;
	case literal: 		ngen("%s\tax,%d", op, n); break;
	case auto_word:		ngen("%s\tax,[bp%+d]", op, n); break;
	case static_word:	lgen("%s\tax,%c%d", op, n); break;
	case globl_word:	sgen("%s\tax,%s", op, s); break;
	case auto_byte:
	case static_byte:
	case globl_byte:	cgload2();
				ngen("%s\tax,cx", op, 0);
				break;
	case empty:		cgpop2();
				sgen("%s\tax,%s", op, "cx");
				break;
	default:		fatal("internal: bad type in cgsynth()");
	}
	Q_type = empty;
}

int cgload2(void) {
	int	n, q;
	char	*s, *op;

	op = "mov";
	n = Q_val;
	s = gsym(Q_name);
	switch (Q_type) {
	case addr_auto:		ngen("%s\tcx,[bp%+d]", "lea", n);
				break;
	case addr_static:	lgen("%s\tcx,offset %c%d", op, n); break;
	case addr_globl:	sgen("%s\tcx,offset %s", op, s); break;
	case addr_label:	lgen("%s\tcx,offset %c%d", op, n); break;
	case literal: 		ngen("%s\tcx,%d", op, n); break;
	case auto_byte:		cgclear2();
				ngen("%s\tcl,[bp%+d]", op, n);
				break;
	case auto_word:		ngen("%s\tcx,[bp%+d]", op, n); break;
	case static_byte:	cgclear2();
				lgen("%s\tcl,%c%d", op, n); break;
				break;
	case static_word:	lgen("%s\tcx,%c%d", op, n); break;
	case globl_byte:	cgclear2();
				sgen("%s\tcl,%s", op, s); break;
				break;
	case globl_word:	sgen("%s\tcx,%s", op, s); break;
	case empty:		cgpop2();
				break;
	default:		fatal("internal: bad type in cgload2()");
	}
	q = Q_type;
	Q_type = empty;
	return empty == q;
}

void cglit(int v)	{ ngen("%s\tax,%d", "mov", v); }
void cgclear(void)	{ gen("xor\tax,ax"); }
void cgclear2(void)	{ gen("xor\tcx,cx"); }
void cgldgb(char *s)	{ sgen("%s\tal,%s", "mov", s); }
void cgldgw(char *s)	{ sgen("%s\tax,%s", "mov", s); }
void cgldlb(int n)	{ ngen("%s\tal,[bp%+d]", "mov", n); }
void cgldlw(int n)	{ ngen("%s\tax,[bp%+d]", "mov", n); }
void cgldsb(int n)	{ lgen("%s\tal,%c%d", "mov", n); }
void cgldsw(int n)	{ lgen("%s\tax,%c%d", "mov", n); }
void cgldla(int n)	{ ngen("%s\tax,[bp%+d]", "lea", n); }
void cgldsa(int n)	{ lgen("%s\tax,offset %c%d", "mov", n); }
void cgldga(char *s)	{ sgen("%s\tax,offset %s", "mov", s); }
void cgindb(void)	{ gen("mov\tbx,ax");
			  cgclear();
			  gen("mov\tal,[bx]"); }
void cgindw(void)	{ gen("mov\tbx,ax");
			  gen("mov\tax,[bx]"); }
void cgldlab(int id)	{ lgen("%s\tax,offset %c%d", "mov", id); }

void cgpush(void)	{ gen("push\tax"); }
void cgpushlit(int n)	{ cglit(n);
                          cgpush(); }
void cgpop2(void)	{ gen("pop\tcx"); }
void cgswap(void)	{ gen("xchg\tax,cx"); }

void cgand(void)	{ cgsynth("and"); }
void cgior(void)	{ cgsynth("or"); }
void cgxor(void)	{ cgsynth("xor"); }
void cgadd(void)	{ gen("add\tax,cx"); }
void cgmul(void)	{ gen("imul\tcx"); }
void cgsub(void)	{ gen("sub\tax,cx"); }
void cgdiv(void)	{ gen("cwd");
			  gen("idiv\tcx"); }
void cgmod(void)	{ cgdiv();
			  gen("mov\tax,dx"); }
void cgshl(void)	{ gen("shl\tax,cl"); }
void cgshr(void)	{ gen("sar\tax,cl"); }

void cgcmp(char *inst)	{ int lab;
			  lab = label();
			  gen("xor\tdx,dx");
			  if (empty == Q_type) {
				cgpop2();
				gen("cmp\tcx,ax");
			  }
			  else {
				cgsynth("cmp");
			  }
			  lgen("%s\t%c%d", inst, lab);
			  gen("inc\tdx");
			  genlab(lab);
			  gen("mov\tax,dx"); }
void cgeq()		{ cgcmp("jne"); }
void cgne()		{ cgcmp("je"); }
void cglt()		{ cgcmp("jge"); }
void cggt()		{ cgcmp("jle"); }
void cgle()		{ cgcmp("jg"); }
void cgge()		{ cgcmp("jl"); }
void cgult()		{ cgcmp("jae"); }
void cgugt()		{ cgcmp("jbe"); }
void cgule()		{ cgcmp("ja"); }
void cguge()		{ cgcmp("jb"); }

void cgbrcond(char *i, int n)	{ int lab;
				  lab = label();
				  if (empty == Q_type) {
					cgpop2();
					gen("cmp\tcx,ax");
				  }
				  else {
					cgsynth("cmp");
				  }
				  lgen("%s\t%c%d", i, lab);
				  lgen("%s\t%c%d", "jmp", n);
				  genlab(lab); }
void cgbreq(int n)		{ cgbrcond("je", n); }
void cgbrne(int n)		{ cgbrcond("jne", n); }
void cgbrlt(int n)		{ cgbrcond("jl", n); }
void cgbrgt(int n)		{ cgbrcond("jg", n); }
void cgbrle(int n)		{ cgbrcond("jle", n); }
void cgbrge(int n)		{ cgbrcond("jge", n); }
void cgbrult(int n)		{ cgbrcond("jb", n); }
void cgbrugt(int n)		{ cgbrcond("ja", n); }
void cgbrule(int n)		{ cgbrcond("jbe", n); }
void cgbruge(int n)		{ cgbrcond("jae", n); }

void cgneg(void)	{ gen("neg\tax"); }
void cgnot(void)	{ gen("not\tax"); }
void cglognot(void)	{ gen("neg\tax");
			  gen("sbb\tax,ax");
			  gen("inc\tax"); }
void cgscale(void)	{ gen("shl\tax,1"); }
void cgscale2(void)	{ gen("shl\tcx,1"); }
void cgunscale(void)	{ gen("shr\tax,1"); }
void cgscaleby(int v)	{ ngen("%s\tcx,%d", "mov", v);
			  gen("mul\tcx"); }
void cgscale2by(int v)	{ gen("push\tax");
			  ngen("%s\tax,%d", "mov", v);
			  gen("mul\tcx");
			  gen("mov\tcx,ax");
			  gen("pop\tax"); }
void cgunscaleby(int v)	{ ngen("%s\tcx,%d", "mov", v);
			  gen("xor\tdx,dx");
			  gen("div\tcx"); }
void cgbool(void)	{ gen("neg\tax");
			  gen("sbb\tax,ax");
			  gen("neg\tax"); }

void cgincind(char *r, char *i, int v) {
	if (strcmp(r, "bx")) sgen("%s\tbx,%s", "mov", r);
	ngen("%s\tcx,%d", "mov", v);
	sgen("%s\t[bx],cx", i, NULL);
}

void cgincloc(char *i, int a, int v) {
	ngen("%s\tcx,%d", "mov", v);
	ngen("%s\t[bp%+d],cx", i, a);
}

void cgincstat(char *i, int a, int v) {
	ngen("%s\tcx,%d", "mov", v);
	lgen("%s\t%c%d,cx", i, a);
}

void cgincglob(char *i, char *s, int v) {
	ngen("%s\tcx,%d", "mov", v);
	sgen("%s\t%s,cx", i, s);
}

void cgincbind(char *r, char *i, int v) {
	if (strcmp(r, "bx")) sgen("%s\tbx,%s", "mov", r);
	ngen("%s\tcl,%d", "mov", v);
	sgen("%s\tbyte ptr [bx],cl", i, NULL);
}

void cgincbloc(char *i, int a, int v) {
	ngen("%s\tcl,%d", "mov", v);
	ngen("%s\tbyte ptr [bp%+d],cl", i, v);
}

void cgincbstat(char *i, int a, int v) {
	ngen("%s\tcl,%d", "mov", v);
	lgen("%s\t%c%d,cl", i, a);
}

void cgincbglob(char *i, char *s, int v) {
	ngen("%s\tcl,%d", "mov", v);
	sgen("%s\t%s,cl", i, s);
}

void cgldinc(void)	{ /*gen("mov\tbx,ax");*/ }
void cginc1pi(int v)	{ cgincind("ax", "add", v); }
void cgdec1pi(int v)	{ cgincind("ax", "sub", v); }
void cginc2pi(int v)	{ cgincind("bx", "add", v); }
void cgdec2pi(int v)	{ cgincind("bx", "sub", v); }
void cgincpl(int a, int v)	{ cgincloc("add", a, v); }
void cgdecpl(int a, int v)	{ cgincloc("sub", a, v); }
void cgincps(int a, int v)	{ cgincstat("add", a, v); }
void cgdecps(int a, int v)	{ cgincstat("sub", a, v); }
void cgincpg(char *s, int v)	{ cgincglob("add", s, v); }
void cgdecpg(char *s, int v)	{ cgincglob("sub", s, v); }
void cginc1iw(void)	{ cgincind("ax", "add", 1); }
void cgdec1iw(void)	{ cgincind("ax", "sub", 1); }
void cginc2iw(void)	{ cgincind("bx", "add", 1); }
void cgdec2iw(void)	{ cgincind("bx", "sub", 1); }
void cginclw(int a)	{ cgincloc("add", a, 1); }
void cgdeclw(int a)	{ cgincloc("sub", a, 1); }
void cgincsw(int a)	{ cgincstat("add", a, 1); }
void cgdecsw(int a)	{ cgincstat("sub", a, 1); }
void cgincgw(char *s)	{ cgincglob("add", s, 1); }
void cgdecgw(char *s)	{ cgincglob("sub", s, 1); }
void cginc1ib(void)	{ cgincbind("ax", "add", 1); }
void cgdec1ib(void)	{ cgincbind("ax", "sub", 1); }
void cginc2ib(void)	{ cgincbind("bx", "add", 1); }
void cgdec2ib(void)	{ cgincbind("bx", "sub", 1); }
void cginclb(int a)	{ cgincbloc("add", a, 1); }
void cgdeclb(int a)	{ cgincbloc("sub", a, 1); }
void cgincsb(int a)	{ cgincbstat("add", a, 1); }
void cgdecsb(int a)	{ cgincbstat("sub", a, 1); }
void cgincgb(char *s)	{ cgincglob("add", s, 1); }
void cgdecgb(char *s)	{ cgincglob("sub", s, 1); }

void cgbr(char *how, int n)	{ int lab;
				  lab = label();
				  gen("or\tax,ax");
				  lgen("%s\t%c%d", how, lab);
				  lgen("%s\t%c%d", "jmp", n);
				  genlab(lab); }
void cgbrtrue(int n)	{ cgbr("jz", n); }
void cgbrfalse(int n)	{ cgbr("jnz", n); }
void cgjump(int n)	{ lgen("%s\t%c%d", "jmp", n); }
void cgldswtch(int n)	{ lgen("%s\tsi,offset %c%d", "mov", n); }
void cgcalswtch(void)	{ gen("jmp\tswitch"); }
void cgcase(int v, int l)	{ lgen2("dw\t%d,%c%d", v, l); }

void cgpopptr(void)	{ gen("pop\tbx"); }
void cgstorib(void)	{ ngen("%s\t[bx],al", "mov", 0); }
void cgstoriw(void)	{ ngen("%s\t[bx],ax", "mov", 0); }
void cgstorlb(int n)	{ ngen("%s\t[bp%+d],al", "mov", n); }
void cgstorlw(int n)	{ ngen("%s\t[bp%+d],ax", "mov", n); }
void cgstorsb(int n)	{ lgen("%s\t%c%d,al", "mov", n); }
void cgstorsw(int n)	{ lgen("%s\t%c%d,ax", "mov", n); }
void cgstorgb(char *s)	{ sgen("%s\t%s,al", "mov", s); }
void cgstorgw(char *s)	{ sgen("%s\t%s,ax", "mov", s); }

void cginitlw(int v, int a)	{ cglit(v);
				  cgstorlw(a); }
void cgcall(char *s)	{ sgen("%s\t%s", "call", s); }
void cgcalr(void)	{ gen("call\tax"); }
void cgstack(int n)	{ ngen("%s\tsp,%d", "add", n); }
void cgentry(void)	{ gen("push\tbp");
			  gen("mov\tbp,sp"); }
void cgexit(void)	{ gen("pop\tbp");
			  gen("ret"); }

void cgdefb(int v)	{ ngen("%s\t%d", "db", v); }
void cgdefw(int v)	{ ngen("%s\t%d", "dw", v); }
void cgdefp(int v)	{ ngen("%s\t%d", "dw", v); }
void cgdefl(int v)	{ lgen("%s\t%c%d", "dw", v); }
void cgdefc(int c)	{ ngen("%s\t'%c'", "db", c); }
void cggbss(char *s, int z)	{ genraw(s);
				  genraw(":");
				  ngen("%s\t0 dup %d", "db", z); }
void cglbss(char *s, int z)	{ cggbss(s, z); }
void cgalign(void)	{ /* unused */ }
