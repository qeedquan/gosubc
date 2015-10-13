/*
 *	NMH's Simple C Compiler, 2011--2014
 *	armv6 target description
 */

#include "defs.h"
#include "data.h"
#include "decl.h"
#include "cgen.h"

void cgdata(void)	{ gen(".data"); }
void cgtext(void)	{ gen(".text"); }
void cgprelude(void)	{ gen(".syntax unified"); }
void cgpostlude(void)	{ }
void cgpublic(char *s)	{ ngen(".globl\t%s", s, 0); }

/*
 * Functions dealing with PC-relative addressing
 */

void cglit2(int v, int aux) {
	int l, skip;
	if (0 <= v && v <= 127) {
		if (aux == 2)
			ngen("%s\tr2,#%d", "mov", v);
		else if (aux == 1)
			ngen("%s\tr1,#%d", "mov", v);
		else
			ngen("%s\tr0,#%d", "mov", v);
	}
	else if (-128 <= v && v < 0) {
		v = -v-1;
		if (aux == 2)
			ngen("%s\tr2,#%d", "mvn", v);
		else if (aux == 1)
			ngen("%s\tr1,#%d", "mvn", v);
		else
			ngen("%s\tr0,#%d", "mvn", v);
	}
	else {
		l = label();
		if (aux == 2)
			lgen("%s\tr2,%c%d", "ldr", l);
		else if (aux == 1)
			lgen("%s\tr1,%c%d", "ldr", l);
		else
			lgen("%s\tr0,%c%d", "ldr", l);
		skip = label();
		lgen("%s\t%c%d", "b", skip);
		genlab(l);
		cgdefw(v);
		genlab(skip);
	}
}

void cglocladdr(int n, int aux) {
	if (n < -255 || n > 255) {
		cglit2(n, 2);
		if (aux)
			gen("add\tr1,r11,r2");
		else
			gen("add\tr0,r11,r2");
	}
	else {
		if (aux)
			ngen("%s\tr1,r11,#%d", "add", n);
		else
			ngen("%s\tr0,r11,#%d", "add", n);
	}
}

void cgstataddr(int n, int aux) {
	int	l, skip;

	l = label();
	if (aux)
		lgen("%s\tr1,%c%d", "ldr", l);
	else
		lgen("%s\tr0,%c%d", "ldr", l);
	skip = label();
	lgen("%s\t%c%d", "b", skip);
	genlab(l);
	cgdefl(n);
	genlab(skip);
}

void cgglobaddr(char *s, int aux) {
	int	l, skip;

	l = label();
	if (aux)
		lgen("%s\tr1,%c%d", "ldr", l);
	else
		lgen("%s\tr0,%c%d", "ldr", l);
	skip = label();
	lgen("%s\t%c%d", "b", skip);
	genlab(l);
	sgen("%s\t%s", ".long", s);
	genlab(skip);
}

void cgind2b(void)	{ gen("ldrb\tr1,[r1]"); }
void cgind2w(void)	{ gen("ldr\tr1,[r1]"); }

void cgstorb(void)	{ gen("strb\tr0,[r1]"); }
void cgstorw(void)	{ gen("str\tr0,[r1]"); }

/* End of PC-relative addressing */

int cgsynth(void) {
	/* unused */
	return 0;
}

int cgload2(void) {
	int	n, q;
	char	*s, *op, *opb;

	op = "ldr";
	opb = "ldrb";
	n = Q_val;
	s = gsym(Q_name);
	switch (Q_type) {
	case addr_auto:		cglocladdr(n, 1); break;
	case addr_static:	cgstataddr(n, 1); break;
	case addr_globl:	cgglobaddr(s, 1); break;
	case addr_label:	cgstataddr(n, 1); break;
	case literal: 		cglit2(n, 1); break;
	case auto_byte:		cglocladdr(n, 1);
				cgind2b();
				break;
	case auto_word:		cglocladdr(n, 1);
				cgind2w();
				break;
	case static_byte:	cgstataddr(n, 1);
				cgind2b();
				break;
	case static_word:	cgstataddr(n, 1);
				cgind2w();
				break;
	case globl_byte:	cgglobaddr(s, 1);
				cgind2b();
				break;
	case globl_word:	cgglobaddr(s, 1);
				cgind2w();
				break;
	case empty:		cgpop2();
				break;
	default:		fatal("internal: bad type in cgload2()");
	}
	q = Q_type;
	Q_type = empty;
	return empty == q;
}

void cglit(int v)	{ cglit2(v, 0); }
void cgclear(void)	{ /* unused */ }
void cgclear2(void)	{ /* unused */ }
void cgldgb(char *s)	{ cgglobaddr(s, 0);
			  cgindb(); }
void cgldgw(char *s)	{ cgglobaddr(s, 0);
			  cgindw(); }
void cgldlb(int n)	{ cglocladdr(n, 0);
			  cgindb(); }
void cgldlw(int n)	{ cglocladdr(n, 0);
			  cgindw(); }
void cgldsb(int n)	{ cgstataddr(n, 0);
			  cgindb(); }
void cgldsw(int n)	{ cgstataddr(n, 0);
			  cgindw(); }
void cgldla(int n)	{ cglocladdr(n, 0); }
void cgldsa(int n)	{ cgstataddr(n, 0); }
void cgldga(char *s)	{ cgglobaddr(s, 0); }
void cgindb(void)	{ gen("ldrb\tr0,[r0]"); }
void cgindw(void)	{ gen("ldr\tr0,[r0]"); }
void cgldlab(int id)	{ cgstataddr(id, 0); }

void cgpush(void)	{ gen("push\t{r0}"); }
void cgpushlit(int n)	{ cglit(n); cgpush(); }
void cgpop2(void)	{ gen("pop\t{r1}"); }
void cgswap(void)	{ gen("mov\tr2,r0");
			  gen("mov\tr0,r1");
			  gen("mov\tr1,r2"); }

void cgand(void)	{ cgload2(); gen("and\tr0,r0,r1"); }
void cgior(void)	{ cgload2(); gen("orr\tr0,r0,r1"); }
void cgxor(void)	{ cgload2(); gen("eor\tr0,r0,r1"); }
void cgadd(void)	{ gen("add\tr0,r0,r1"); }
void cgmul(void)	{ gen("mul\tr0,r0,r1"); }
void cgsub(void)	{ gen("sub\tr0,r0,r1"); }
void cgdiv(void)	{ gen("bl\tsdiv"); }
void cgmod(void)	{ gen("bl\tsrem"); }
void cgshl(void)	{ gen("lsl\tr0,r0,r1"); }
void cgshr(void)	{ gen("asr\tr0,r0,r1"); }

void cgcmp(char *inst)	{ gen("mov\tr3,r0");
			  gen("mov\tr0,#0");
			  if (empty == Q_type) {
				cgpop2();
				gen("cmp\tr1,r3");
			  }
			  else {
				cgload2();
				gen("cmp\tr3,r1");
			  }
			  ngen("%s\tr0,#%d", inst, 1); }
void cgeq()		{ cgcmp("moveq"); }
void cgne()		{ cgcmp("movne"); }
void cglt()		{ cgcmp("movlt"); }
void cggt()		{ cgcmp("movgt"); }
void cgle()		{ cgcmp("movle"); }
void cgge()		{ cgcmp("movge"); }
void cgult()		{ cgcmp("movlo"); }
void cgugt()		{ cgcmp("movhi"); }
void cgule()		{ cgcmp("movls"); }
void cguge()		{ cgcmp("movhs"); }

void cgbrcond(char *i, int n)	{ int lab;
				  lab = label();
				  if (empty == Q_type) {
					cgpop2();
					gen("cmp\tr1,r0");
				  }
				  else {
					cgload2();
					gen("cmp\tr0,r1");
				  }
				  lgen("%s\t%c%d", i, lab);
				  lgen("%s\t%c%d", "b", n);
				  genlab(lab); }
void cgbreq(int n)	{ cgbrcond("beq", n); }
void cgbrne(int n)	{ cgbrcond("bne", n); }
void cgbrlt(int n)	{ cgbrcond("blt", n); }
void cgbrgt(int n)	{ cgbrcond("bgt", n); }
void cgbrle(int n)	{ cgbrcond("ble", n); }
void cgbrge(int n)	{ cgbrcond("bge", n); }
void cgbrult(int n)	{ cgbrcond("blo", n); }
void cgbrugt(int n)	{ cgbrcond("bhi", n); }
void cgbrule(int n)	{ cgbrcond("bls", n); }
void cgbruge(int n)	{ cgbrcond("bhs", n); }

void cgneg(void)	{ gen("neg\tr0,r0"); }
void cgnot(void)	{ gen("mvn\tr0,r0"); }
void cglognot(void)	{ gen("cmp\tr0,#0");
			  gen("mov\tr0,#0");
			  gen("moveq\tr0,#1"); }
void cgscale(void)	{ gen("lsl\tr0,#2"); }
void cgscale2(void)	{ gen("lsl\tr1,#2"); }
void cgunscale(void)	{ gen("lsr\tr0,#2"); }
void cgscaleby(int v)	{ cglit2(v, 1);
			  gen("mul\tr0,r0,r1"); }
void cgscale2by(int v)	{ cglit2(v, 2);
			  gen("mul\tr1,r1,r2"); }
void cgunscaleby(int v)	{ cglit2(v, 1);
			  gen("bl\tudiv"); }
void cgbool(void)	{ gen("cmp\tr0,#0");
			  gen("mov\tr0,#0");
			  gen("movne\tr0,#1"); }

void cgldinc(void)	{ gen("mov\tr2,r0"); }
void cginc1pi(int v)	{ cglit2(v, 1);
			  gen("ldr\tr3,[r0]");
			  gen("add\tr3,r3,r1");
			  gen("str\tr3,[r0]"); }
void cgdec1pi(int v)	{ cglit2(v, 1);
			  gen("ldr\tr3,[r0]");
			  gen("sub\tr3,r3,r1");
			  gen("str\tr3,[r0]"); }
void cginc2pi(int v)	{ cglit2(v, 1);
			  gen("ldr\tr3,[r2]");
			  gen("add\tr3,r3,r1");
			  gen("str\tr3,[r2]"); }
void cgdec2pi(int v)	{ cglit2(v, 1);
			  gen("ldr\tr3,[r2]");
			  gen("sub\tr3,r3,r1");
			  gen("str\tr3,[r2]"); }
void cgincpl(int a, int v)	{ cglit2(v, 2);
				  cglocladdr(a, 1);
				  gen("ldr\tr3,[r1]");
				  gen("add\tr3,r3,r2");
				  gen("str\tr3,[r1]"); }
void cgdecpl(int a, int v)	{ cglit2(v, 2);
				  cglocladdr(a, 1);
				  gen("ldr\tr3,[r1]");
				  gen("sub\tr3,r3,r2");
				  gen("str\tr3,[r1]"); }
void cgincps(int a, int v)	{ cglit2(v, 2);
				  cgstataddr(a, 1);
				  gen("ldr\tr3,[r1]");
				  gen("add\tr3,r3,r2");
				  gen("str\tr3,[r1]"); }
void cgdecps(int a, int v)	{ cglit2(v, 2);
				  cgstataddr(a, 1);
				  gen("ldr\tr3,[r1]");
				  gen("sub\tr3,r3,r2");
				  gen("str\tr3,[r1]"); }
void cgincpg(char *s, int v)	{ cglit2(v, 2);
				  cgglobaddr(s, 1);
				  gen("ldr\tr3,[r1]");
				  gen("add\tr3,r3,r2");
				  gen("str\tr3,[r1]"); }
void cgdecpg(char *s, int v)	{ cglit2(v, 2);
				  cgglobaddr(s, 1);
				  gen("ldr\tr3,[r1]");
				  gen("sub\tr3,r3,r2");
				  gen("str\tr3,[r1]"); }
void cginc1iw(void)	{ gen("ldr\tr1,[r0]");
			  gen("add\tr1,r1,#1");
			  gen("str\tr1,[r0]"); }
void cgdec1iw(void)	{ gen("ldr\tr1,[r0]");
			  gen("sub\tr1,r1,#1");
			  gen("str\tr1,[r0]"); }
void cginc2iw(void)	{ gen("ldr\tr1,[r2]");
			  gen("add\tr1,r1,#1");
			  gen("str\tr1,[r2]"); }
void cgdec2iw(void)	{ gen("ldr\tr1,[r2]");
			  gen("sub\tr1,r1,#1");
			  gen("str\tr1,[r2]"); }
void cginclw(int a)	{ cglocladdr(a, 1);
			  gen("ldr\tr2,[r1]");
			  gen("add\tr2,r2,#1");
			  gen("str\tr2,[r1]"); }
void cgdeclw(int a)	{ cglocladdr(a, 1);
			  gen("ldr\tr2,[r1]");
			  gen("sub\tr2,r2,#1");
			  gen("str\tr2,[r1]"); }
void cgincsw(int a)	{ cgstataddr(a, 1);
			  gen("ldr\tr2,[r1]");
			  gen("add\tr2,r2,#1");
			  gen("str\tr2,[r1]"); }
void cgdecsw(int a)	{ cgstataddr(a, 1);
			  gen("ldr\tr2,[r1]");
			  gen("sub\tr2,r2,#1");
			  gen("str\tr2,[r1]"); }
void cgincgw(char *s)	{ cgglobaddr(s, 1);
			  gen("ldr\tr2,[r1]");
			  gen("add\tr2,r2,#1");
			  gen("str\tr2,[r1]"); }
void cgdecgw(char *s)	{ cgglobaddr(s, 1);
			  gen("ldr\tr2,[r1]");
			  gen("sub\tr2,r2,#1");
			  gen("str\tr2,[r1]"); }
void cginc1ib(void)	{ gen("ldrb\tr1,[r0]");
			  gen("add\tr1,r1,#1");
			  gen("strb\tr1,[r0]"); }
void cgdec1ib(void)	{ gen("ldrb\tr1,[r0]");
			  gen("sub\tr1,r1,#1");
			  gen("strb\tr1,[r0]"); }
void cginc2ib(void)	{ gen("ldrb\tr1,[r2]");
			  gen("add\tr1,r1,#1");
			  gen("strb\tr1,[r2]"); }
void cgdec2ib(void)	{ gen("ldrb\tr1,[r2]");
			  gen("sub\tr1,r1,#1");
			  gen("strb\tr1,[r2]"); }
void cginclb(int a)	{ cglocladdr(a, 1);
			  gen("ldrb\tr2,[r1]");
			  gen("add\tr2,r2,#1");
			  gen("strb\tr2,[r1]"); }
void cgdeclb(int a)	{ cglocladdr(a, 1);
			  gen("ldrb\tr2,[r1]");
			  gen("sub\tr2,r2,#1");
			  gen("strb\tr2,[r1]"); }
void cgincsb(int a)	{ cgstataddr(a, 1);
			  gen("ldrb\tr2,[r1]");
			  gen("add\tr2,r2,#1");
			  gen("strb\tr2,[r1]"); }
void cgdecsb(int a)	{ cgstataddr(a, 1);
			  gen("ldrb\tr2,[r1]");
			  gen("sub\tr2,r2,#1");
			  gen("strb\tr2,[r1]"); }
void cgincgb(char *s)	{ cgglobaddr(s, 1);
			  gen("ldrb\tr2,[r1]");
			  gen("add\tr2,r2,#1");
			  gen("strb\tr2,[r1]"); }
void cgdecgb(char *s)	{ cgglobaddr(s, 1);
			  gen("ldrb\tr2,[r1]");
			  gen("sub\tr2,r2,#1");
			  gen("strb\tr2,[r1]"); }

void cgbr(char *how, int n)	{ int lab;
				  lab = label();
				  gen("cmp\tr0,#0");
				  lgen("%s\t%c%d", how, lab);
				  lgen("%s\t%c%d", "b", n);
				  genlab(lab); }
void cgbrtrue(int n)	{ cgbr("beq", n); }
void cgbrfalse(int n)	{ cgbr("bne", n); }
void cgjump(int n)	{ lgen("%s\t%c%d", "b", n); }
void cgldswtch(int n)	{ cgstataddr(n, 1); }
void cgcalswtch(void)	{ gen("b\tswitch"); }
void cgcase(int v, int l)	{ lgen2(".long\t%d,%c%d", v, l); }

void cgpopptr(void)	{ gen("pop\t{r2}"); }
void cgstorib(void)	{ gen("strb\tr0,[r2]"); }
void cgstoriw(void)	{ gen("str\tr0,[r2]"); }
void cgstorlb(int n)	{ cglocladdr(n, 1);
			  cgstorb(); }
void cgstorlw(int n)	{ cglocladdr(n, 1);
			  cgstorw(); }
void cgstorsb(int n)	{ cgstataddr(n, 1);
			  cgstorb(); }
void cgstorsw(int n)	{ cgstataddr(n, 1);
			  cgstorw(); }
void cgstorgb(char *s)	{ cgglobaddr(s, 1);
			  cgstorb(); }
void cgstorgw(char *s)	{ cgglobaddr(s, 1);
			  cgstorw(); }

void cginitlw(int v, int a)	{ cglit(v);
				  cglocladdr(a, 1);
				  cgstorw(); }
void cgcall(char *s)	{ sgen("%s\t%s", "bl", s); }
void cgcalr(void)	{ gen("blx\tr0"); }
void cgstack(int n)	{ cglit2(n, 1);
			  gen("add\tsp,sp,r1"); }
void cgentry(void)	{ gen("push\t{r11,lr}");
			  gen("mov\tr11,sp"); }
void cgexit(void)	{ gen("pop\t{r11,pc}"); }

void cgdefb(int v)	{ ngen("%s\t%d", ".byte", v); }
void cgdefw(int v)	{ ngen("%s\t%d", ".long", v); }
void cgdefp(int v)	{ ngen("%s\t%d", ".long", v); }
void cgdefl(int v)	{ lgen("%s\t%c%d", ".long", v); }
void cgdefc(int c)	{ ngen("%s\t'%c'", ".byte", c); }
void cggbss(char *s, int z)	{ ngen(".comm\t%s,%d", s, z); }
void cglbss(char *s, int z)	{ ngen(".lcomm\t%s,%d", s, z); }
void cgalign(void)	{ gen(".align 2"); }
