/*
 *	NMH's Simple C Compiler, 2012--2014
 *	x86-64 (Darwin-specific) target description
 */

#include "defs.h"
#include "data.h"
#include "decl.h"
#include "cgen.h"

void cgdata(void)	{ gen(".data"); }
void cgtext(void)	{ gen(".text"); }
void cgprelude(void)	{ }
void cgpostlude(void)	{ }
void cgpublic(char *s)	{ ngen(".globl\t%s", s, 0); }

void cgsynth(char *op) {
	int	n;
	char	*s;

	n = Q_val;
	s = gsym(Q_name);
	switch (Q_type) {
	case addr_auto:		ngen("%s\t%d(%%rbp),%%rcx", "leaq", n);
				sgen("%s\t%s,%%rax", op, "%rcx");
				break;
	case addr_static:	lgen("%s\t%c%d(%%rip),%%rax", op, n); break;
	case addr_globl:	sgen("%s\t%s(%%rip),%%rax", op, s); break;
	case addr_label:	lgen("%s\t%c%d(%%rip),%%rax", op, n); break;
	case literal: 		ngen("%s\t$%d,%%rax", op, n); break;
	case auto_word:		ngen("%s\t%d(%%rbp),%%rax", op, n); break;
	case static_word:	lgen("%s\t%c%d(%%rip),%%rax", op, n); break;
	case globl_word:	sgen("%s\t%s(%%rip),%%rax", op, s); break;
	case auto_byte:
	case static_byte:
	case globl_byte:	cgload2();
				ngen("%s\t%%rcx,%%rax", op, 0);
				break;
	case empty:		cgpop2();
				sgen("%s\t%s,%%rax", op, "%rcx");
				break;
	default:		fatal("internal: bad type in cgsynth()");
	}
	Q_type = empty;
}

int cgload2(void) {
	int	n, q;
	char	*s, *op, *opb;

	op = "movq";
	opb = "movb";
	n = Q_val;
	s = gsym(Q_name);
	switch (Q_type) {
	case addr_auto:		ngen("%s\t%d(%%rbp),%%rcx", "leaq", n);
				break;
	case addr_static:	lgen("%s\t%c%d(%%rip),%%rcx", op, n); break;
	case addr_globl:	sgen("%s\t%s(%%rip),%%rcx", op, s); break;
	case addr_label:	lgen("%s\t%c%d(%%rip),%%rcx", op, n); break;
	case literal: 		ngen("%s\t$%d,%%rcx", op, n); break;
	case auto_byte:		cgclear2();
				ngen("%s\t%d(%%rbp),%%cl", opb, n);
				break;
	case auto_word:		ngen("%s\t%d(%%rbp),%%rcx", op, n); break;
	case static_byte:	cgclear2();
				lgen("%s\t%c%d(%%rip),%%cl", opb, n); break;
				break;
	case static_word:	lgen("%s\t%c%d(%%rip),%%rcx", op, n); break;
	case globl_byte:	cgclear2();
				sgen("%s\t%s(%%rip),%%cl", opb, s); break;
				break;
	case globl_word:	sgen("%s\t%s(%%rip),%%rcx", op, s); break;
	case empty:		cgpop2();
				break;
	default:		fatal("internal: bad type in cgload2()");
	}
	q = Q_type;
	Q_type = empty;
	return empty == q;
}

void cglit(int v)	{ ngen("%s\t$%d,%%rax", "movq", v); }
void cgclear(void)	{ gen("xorq\t%rax,%rax"); }
void cgclear2(void)	{ gen("xorq\t%rcx,%rcx"); }
void cgldgb(char *s)	{ sgen("%s\t%s(%%rip),%%al", "movb", s); }
void cgldgw(char *s)	{ sgen("%s\t%s(%%rip),%%rax", "movq", s); }
void cgldlb(int n)	{ ngen("%s\t%d(%%rbp),%%al", "movb", n); }
void cgldlw(int n)	{ ngen("%s\t%d(%%rbp),%%rax", "movq", n); }
void cgldsb(int n)	{ lgen("%s\t%c%d(%%rip),%%al", "movb", n); }
void cgldsw(int n)	{ lgen("%s\t%c%d(%%rip),%%rax", "movq", n); }
void cgldla(int n)	{ ngen("%s\t%d(%%rbp),%%rax", "leaq", n); }
void cgldsa(int n)	{ lgen("%s\t%c%d(%%rip),%%rax", "leaq", n); }
void cgldga(char *s)	{ sgen("%s\t%s(%%rip),%%rax", "leaq", s); }
void cgindb(void)	{ gen("movq\t%rax,%rdx");
			  cgclear();
			  gen("movb\t(%rdx),%al"); }
void cgindw(void)	{ gen("movq\t(%rax),%rax"); }
void cgldlab(int id)	{ lgen("%s\t%c%d(%%rip),%%rax", "leaq", id); }

void cgpush(void)	{ gen("pushq\t%rax"); }
void cgpushlit(int n)	{ ngen("%s\t$%d", "pushq", n); }
void cgpop2(void)	{ gen("popq\t%rcx"); }
void cgswap(void)	{ gen("xchgq\t%rax,%rcx"); }

void cgand(void)	{ cgsynth("andq"); }
void cgior(void)	{ cgsynth("orq"); }
void cgxor(void)	{ cgsynth("xorq"); }
void cgadd(void)	{ gen("addq\t%rcx,%rax"); }
void cgmul(void)	{ gen("imulq\t%rcx,%rax"); }
void cgsub(void)	{ gen("subq\t%rcx,%rax"); }
void cgdiv(void)	{ gen("cqo");
			  gen("idivq\t%rcx"); }
void cgmod(void)	{ cgdiv();
			  gen("movq\t%rdx,%rax"); }
void cgshl(void)	{ gen("shlq\t%cl,%rax"); }
void cgshr(void)	{ gen("sarq\t%cl,%rax"); }

void cgcmp(char *inst)	{ int lab;
			  lab = label();
			  gen("xorq\t%rdx,%rdx");
			  if (empty == Q_type) {
				cgpop2();
				gen("cmpq\t%rax,%rcx");
			  }
			  else {
				cgsynth("cmpq");
			  }
			  lgen("%s\t%c%d", inst, lab);
			  gen("incq\t%rdx");
			  genlab(lab);
			  gen("movq\t%rdx,%rax"); }
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
					gen("cmpq\t%rax,%rcx");
				  }
				  else {
					cgsynth("cmpq");
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

void cgneg(void)	{ gen("negq\t%rax"); }
void cgnot(void)	{ gen("notq\t%rax"); }
void cglognot(void)	{ gen("negq\t%rax");
			  gen("sbbq\t%rax,%rax");
			  gen("incq\t%rax"); }
void cgscale(void)	{ gen("shlq\t$3,%rax"); }
void cgscale2(void)	{ gen("shlq\t$3,%rcx"); }
void cgunscale(void)	{ gen("shrq\t$3,%rax"); }
void cgscaleby(int v)	{ ngen("%s\t$%d,%%rcx", "movq", v);
			  gen("mulq\t%rcx"); }
void cgscale2by(int v)	{ gen("pushq\t%rax");
			  ngen("%s\t$%d,%%rax", "movq", v);
			  gen("mulq\t%rcx");
			  gen("movq\t%rax,%rcx");
			  gen("popq\t%rax"); }
void cgunscaleby(int v)	{ ngen("%s\t$%d,%%rcx", "movq", v);
			  gen("xorq\t%rdx,%rdx");
			  gen("divq\t%rcx"); }
void cgbool(void)	{ gen("negq\t%rax");
			  gen("sbbq\t%rax,%rax");
			  gen("negq\t%rax"); }

void cgldinc(void)	{ gen("movq\t%rax,%rdx"); }
void cginc1pi(int v)	{ ngen("%s\t$%d,(%%rax)", "addq", v); }
void cgdec1pi(int v)	{ ngen("%s\t$%d,(%%rax)", "subq", v); }
void cginc2pi(int v)	{ ngen("%s\t$%d,(%%rdx)", "addq", v); }
void cgdec2pi(int v)	{ ngen("%s\t$%d,(%%rdx)", "subq", v); }
void cgincpl(int a, int v)	{ ngen2("%s\t$%d,%d(%%rbp)", "addq", v, a); }
void cgdecpl(int a, int v)	{ ngen2("%s\t$%d,%d(%%rbp)", "subq", v, a); }
void cgincps(int a, int v)	{ lgen2("addq\t$%d,%c%d(%%rip)", v, a); }
void cgdecps(int a, int v)	{ lgen2("subq\t$%d,%c%d(%%rip)", v, a); }
void cgincpg(char *s, int v)	{ sgen2("%s\t$%d,%s(%%rip)", "addq", v, s); }
void cgdecpg(char *s, int v)	{ sgen2("%s\t$%d,%s(%%rip)", "subq", v, s); }
void cginc1iw(void)	{ ngen("%s\t(%%rax)", "incq", 0); }
void cgdec1iw(void)	{ ngen("%s\t(%%rax)", "decq", 0); }
void cginc2iw(void)	{ ngen("%s\t(%%rdx)", "incq", 0); }
void cgdec2iw(void)	{ ngen("%s\t(%%rdx)", "decq", 0); }
void cginclw(int a)	{ ngen("%s\t%d(%%rbp)", "incq", a); }
void cgdeclw(int a)	{ ngen("%s\t%d(%%rbp)", "decq", a); }
void cgincsw(int a)	{ lgen("%s\t%c%d(%%rip)", "incq", a); }
void cgdecsw(int a)	{ lgen("%s\t%c%d(%%rip)", "decq", a); }
void cgincgw(char *s)	{ sgen("%s\t%s(%%rip)", "incq", s); }
void cgdecgw(char *s)	{ sgen("%s\t%s(%%rip)", "decq", s); }
void cginc1ib(void)	{ ngen("%s\t(%%rax)", "incb", 0); }
void cgdec1ib(void)	{ ngen("%s\t(%%rax)", "decb", 0); }
void cginc2ib(void)	{ ngen("%s\t(%%rdx)", "incb", 0); }
void cgdec2ib(void)	{ ngen("%s\t(%%rdx)", "decb", 0); }
void cginclb(int a)	{ ngen("%s\t%d(%%rbp)", "incb", a); }
void cgdeclb(int a)	{ ngen("%s\t%d(%%rbp)", "decb", a); }
void cgincsb(int a)	{ lgen("%s\t%c%d(%%rip)", "incb", a); }
void cgdecsb(int a)	{ lgen("%s\t%c%d(%%rip)", "decb", a); }
void cgincgb(char *s)	{ sgen("%s\t%s(%%rip)", "incb", s); }
void cgdecgb(char *s)	{ sgen("%s\t%s(%%rip)", "decb", s); }

void cgbr(char *how, int n)	{ int lab;
				  lab = label();
				  gen("orq\t%rax,%rax");
				  lgen("%s\t%c%d", how, lab);
				  lgen("%s\t%c%d", "jmp", n);
				  genlab(lab); }
void cgbrtrue(int n)	{ cgbr("jz", n); }
void cgbrfalse(int n)	{ cgbr("jnz", n); }
void cgjump(int n)	{ lgen("%s\t%c%d", "jmp", n); }
void cgldswtch(int n)	{ lgen("%s\t%c%d(%%rip),%%rdx", "leaq", n); }
void cgcalswtch(void)	{ gen("jmp\tswitch"); }
void cgcase(int v, int l)	{ lgen2(".quad\t%d,%c%d", v, l); }

void cgpopptr(void)	{ gen("popq\t%rdx"); }
void cgstorib(void)	{ ngen("%s\t%%al,(%%rdx)", "movb", 0); }
void cgstoriw(void)	{ ngen("%s\t%%rax,(%%rdx)", "movq", 0); }
void cgstorlb(int n)	{ ngen("%s\t%%al,%d(%%rbp)", "movb", n); }
void cgstorlw(int n)	{ ngen("%s\t%%rax,%d(%%rbp)", "movq", n); }
void cgstorsb(int n)	{ lgen("%s\t%%al,%c%d(%%rip)", "movb", n); }
void cgstorsw(int n)	{ lgen("%s\t%%rax,%c%d(%%rip)", "movq", n); }
void cgstorgb(char *s)	{ sgen("%s\t%%al,%s(%%rip)", "movb", s); }
void cgstorgw(char *s)	{ sgen("%s\t%%rax,%s(%%rip)", "movq", s); }

void cginitlw(int v, int a)	{ ngen2("%s\t$%d,%d(%%rbp)", "movq", v, a); }
void cgcall(char *s)	{ sgen("%s\t%s", "call", s); }
void cgcalr(void)	{ gen("call\t*%rax"); }
void cgstack(int n)	{ ngen("%s\t$%d,%%rsp", "addq", n); }
void cgentry(void)	{ gen("pushq\t%rbp");
			  gen("movq\t%rsp,%rbp"); }
void cgexit(void)	{ gen("popq\t%rbp");
			  gen("ret"); }

void cgdefb(int v)	{ ngen("%s\t%d", ".byte", v); }
void cgdefw(int v)	{ ngen("%s\t%d", ".quad", v); }
void cgdefp(int v)	{ ngen("%s\t%d", ".quad", v); }
void cgdefl(int v)	{ lgen("%s\t%c%d", ".quad", v); }
void cgdefc(int c)	{ ngen("%s\t'%c", ".byte", c); }
void cggbss(char *s, int z)	{ ngen(".comm\t%s,%d", s, z); }
void cglbss(char *s, int z)	{ ngen(".lcomm\t%s,%d", s, z); }
void cgalign(void)	{ /* unused */ }
