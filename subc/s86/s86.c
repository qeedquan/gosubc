/*
 *	S86 -- A Simple 8086 Tool Chain
 *	8086 assembler
 *	Nils M Holm, 1993,1995,2013,2014
 *	In the public domain
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <setjmp.h>
#include <ctype.h>
#include "obj.h"
#include "defs.h"
#include "sym.h"

#define unsigned	char *

#define TMPDATA	"asd00000.tmp"
#define TMPCODE	"asc00000.tmp"
#define TMPRLOC	"asr00000.tmp"

#define MAXLN	128

#define SYMSZ	32760
#define MARKSZ	12280
#define MACSZ	2048
#define CACHESZ	1024

char	*Marks;
char	DosReloc[NDOSREL];
int	DosReltop;
int	Reltop;

int	debug = 0;

FILE	*Infile;
FILE	*Sdata;
FILE	*Scode;
FILE	*Sreloc;
char	Linebuf[MAXLN+1];
char	Cache[CACHESZ];
int	Ncached, Cachebot;
char	*Label, *Instr, *Oper1, *Oper2, *Aoper;
int	Off1, Off2;
int	Line;
int	Segment;
int	Ctop, Dtop;
int	Symtop;
char	*Symbols;
char	*Macpool;
int	Mactop;
int	Wop;
int	Short;
int	Linked;
int	SegPfx;
int	Errcnt;

jmp_buf	Restart;

void fatal(char *msg) {
	remove(TMPCODE);
	remove(TMPDATA);
	remove(TMPRLOC);
	printf("s86: %d: fatal error: %s\n", Line, msg);
	exit(1);
}

void error(char *msg) {
	printf("s86: %d: %s\n", Line, msg);
	longjmp(&Restart, 1);
}

void warn(char *msg) {
	printf("s86: %d: *Warning* %s\n", Line, msg);
}

void init(void) {
	char	*nomem;

	nomem = "out of memory";
	if ((Symbols = malloc(SYMSZ)) == NULL)
		fatal(nomem);
	if ((Marks = malloc(MARKSZ)) == NULL)
		fatal(nomem);
	if ((Macpool = malloc(MACSZ)) == NULL)
		fatal(nomem);
}

void dreloc(void) {
	if (DosReltop >= NDOSREL) fatal("DOS relocation table overflow");
	DosReloc[DosReltop++] = Ctop-2;
	DosReloc[DosReltop++] = (Ctop-2) >> 8;
}

void reloc(int addr, int class) {
	fputc(class, Sreloc);
	fputc(addr, Sreloc);
	fputc(addr>>8, Sreloc);
	Reltop += 3;
}

int findsym(char *name) {
	int	i;

	for (i=0; i<Symtop; i+=SSIZE)
		if (!strcmp(&Symbols[i], name))
			return i;
	return -1;
}

int classof(char *name) {
	int	i;

	for (i=0; i<Symtop; i+=SSIZE)
		if (!strcmp(&Symbols[i], name))
			return Symbols[i+SSEGMT];
	return SNONE;
}

void flushcache(void) {
	if (Ncached) {
		fseek(Scode, 0, SEEK_END);
		fwrite(Cache, 1, Ncached, Scode);
	}
	Cachebot += Ncached;
	Ncached = 0;
}

void putcache(int v) {
	if (Ncached >= CACHESZ)
		flushcache();
	Cache[Ncached++] = v;
}

int incache(int a) {
	return (unsigned) a >= (unsigned) Cachebot;
}

void mark(char *name, int class, int addr, int shrt, int rel) {
	int	i, sym;

	for (i=0; i<MARKSZ; i+=MKSZ) {
		if (Marks[i+MKADDR] == 0 && Marks[i+MKADDR+1] == 0) {
			if ((sym = findsym(name)) == -1)
				fatal("CE: bad name in mark()");
			Marks[i+MKPTR] = Symbols[sym+SMARK];
			Marks[i+MKPTR+1] = Symbols[sym+SMARK+1];
			Marks[i+MKADDR] = addr;
			Marks[i+MKADDR+1] = addr >> 8;
			Marks[i+MKFLAG] = 0;
			if (shrt) Marks[i+MKFLAG] |= MKSHORT;
			if (rel) Marks[i+MKFLAG] |= MKREL;
			Symbols[sym+SMARK] = i;
			Symbols[sym+SMARK+1] = (i >> 8);
			if (debug)
				printf(
			 "addmark: %s\taddr=%04x\tflags=%02x\tptr=%4x\n",
			 name, Marks[i+MKADDR] + (Marks[i+MKADDR+1]<<8),
			 Marks[i+MKFLAG],
			 Marks[i+MKPTR] + (Marks[i+MKPTR+1]<<8));
			return;
		}
	}
	fatal("mark table overflow");
}

void resolve(char *sym, int addr) {
	int	a, ptr, disp, pt, h, l;
	char	*cp;

	ptr = sym[SMARK] + (sym[SMARK+1] << 8);
	if (debug) printf("resolve: [%04x] at", addr);
	while (ptr != 0xffff) {
		a = Marks[ptr+MKADDR] + (Marks[ptr+MKADDR+1]<<8);
		if (debug)
			printf(" %04x%s",
				a, (Marks[ptr+MKFLAG] & MKREL)? "R": "A");
		if (!(Marks[ptr+MKFLAG] & MKREL)) {
			if (incache(a)) {
				cp = &Cache[a-Cachebot];
				pt = cp[0] | (cp[1] << 8);
				pt += addr;
				cp[0] = pt;
				cp[1] = pt >> 8;
			}
			else {
				flushcache();
				ufseek(Scode, a, SEEK_SET);
				l = fgetc(Scode);
				h = fgetc(Scode);
				pt = (h << 8) | l;
				pt += addr;
				fseek(Scode, -2, SEEK_CUR);
				fputc(pt, Scode);
				fputc(pt>>8, Scode);
			}
			reloc(a, sym[SSEGMT]);
		}
		else {
 			disp = addr - a -
 				((Marks[ptr+MKFLAG] & MKSHORT)? 1: 2);
			if (	Marks[ptr+MKFLAG] & MKSHORT &&
				(disp < -128 || disp > 127))
			{
				printf("short jump to %s out of range\n",
				 	sym);
			}
			if (incache(a)) {
				cp = &Cache[a-Cachebot];
				if (Marks[ptr+MKFLAG] & MKSHORT) {
					cp[0] = disp;
				}
				else {
					cp[0] = disp;
					cp[1] = disp >> 8;
				}
			}
			else {
				flushcache();
				ufseek(Scode, a, SEEK_SET);
				if (Marks[ptr+MKFLAG] & MKSHORT) {
					fputc(disp, Scode);
				}
				else {
					fputc(disp, Scode);
					fputc(disp >> 8, Scode);
				}
			}
		}
		a = ptr;
		ptr = Marks[ptr+MKPTR] + (Marks[ptr+MKPTR+1]<<8);
		Marks[a+MKADDR] = Marks[a+MKADDR+1] = 0;
	}
	fseek(Scode, 0, SEEK_END);
	if (debug) putchar('\n');
}

void ckpubs(void) {
	int	i;

	for (i=0; i<Symtop; i+=SSIZE) {
		if (Symbols[i+SCLASS] == PUBLIC)
			if (Symbols[i+SMARK] != 0xff ||
			    Symbols[i+SMARK+1] != 0xff
		) {
			printf("s86: undefined public symbol: %s\n",
				&Symbols[i]);
			Errcnt++;
		}
	}
}

void eject(char *srcname, char *objname) {
	char	objnambuf[81];
	char	*p;
	FILE	*outfile;
	char	buf[256];
	int	n, i, ptr, cnt;
	char	ohd[OHDSZ];

	ckpubs();
	if (objname == NULL) {
		objname = objnambuf;
		strcpy(objname, srcname);
		if ((p = strchr(objname, '.')) != NULL) *p = 0;
		strcat(objname, ".o");
	}
	rewind(Sdata);
	flushcache();
	rewind(Scode);
	rewind(Sreloc);
	if ((outfile = fopen(objname, "wb")) == NULL) {
		fclose(Sdata);
		remove(TMPDATA);
		remove(TMPDATA);
		remove(TMPRLOC);
		fprintf(stderr, "cannot create output file: %s\n", objname);
		exit(1);
	}
	/* write preliminary object header */
	ohd[OMAGIC] = ohd[OMAGIC+1] = 0;
	fwrite(ohd, 1, OHDSZ, outfile);
	/* write public symbols */
	ohd[OPUBP] = OHDSZ;
	ohd[OPUBP+1] = OHDSZ>>8;
	for (cnt=OHDSZ, i=0; i<Symtop; i+=SSIZE) {
		if (Symbols[i+SCLASS] == PUBLIC)
			cnt += fwrite(&Symbols[i], 1, SSIZE, outfile);
	}
	/* write extern symbols and marks */
	ohd[OEXTP] = cnt;
	ohd[OEXTP+1] = cnt>>8;
	for (i=0; i<Symtop; i+=SSIZE) {
		if (Symbols[i+SCLASS] == UNDEFD)
			Symbols[i+SCLASS] = EXTRN;
		if (Symbols[i+SCLASS] == EXTRN) {
			ptr = Symbols[i+SMARK] + (Symbols[i+SMARK+1]<<8);
			if (ptr != 0xffff) {
				cnt += fwrite(&Symbols[i], 1, SSIZE, outfile);
				while (ptr != 0xffff) {
					cnt += fwrite(&Marks[ptr], 1, MKSZ,
							outfile);
					ptr = Marks[ptr+MKPTR] +
						(Marks[ptr+MKPTR+1]<<8);
				}
				buf[0] = ptr;
				for (n=0; n<MKSZ; n++)
					fwrite(buf, 1, 1, outfile);
				cnt += MKSZ;
			}
		}
	}
	/* write DOS relocation table */
	ohd[ODOSREL] = cnt;
	ohd[ODOSREL+1] = cnt>>8;
	cnt += fwrite(DosReloc, 1, DosReltop, outfile);
	/* write relocation table */
	ohd[ORELOC] = cnt;
	ohd[ORELOC+1] = cnt>>8;
	n = fread(buf, 1, 256, Sreloc);
	while (n > 0) {
		fwrite(buf, 1, n, outfile);
		n = fread(buf, 1, 256, Sreloc);
	}
	cnt += Reltop;
	/* append code area */
	ohd[OCODE] = cnt;
	ohd[OCODE+1] = cnt>>8;
	n = fread(buf, 1, 256, Scode);
	while (n > 0) {
		fwrite(buf, 1, n, outfile);
		n = fread(buf, 1, 256, Scode);
	}
	cnt += Ctop;
	/* append data area */
	ohd[ODATA] = cnt;
	ohd[ODATA+1] = cnt>>8;
	ohd[ODATASZ] = Dtop;
	ohd[ODATASZ+1] = Dtop>>8;
	n = fread(buf, 1, 256, Sdata);
	while (n > 0) {
		fwrite(buf, 1, n, outfile);
		n = fread(buf, 1, 256, Sdata);
	}
	rewind(outfile);
	/* write final object header */
	ohd[OMAGIC] = O_MAGIC;
	ohd[OMAGIC+1] = 0;
	fwrite(ohd, 1, OHDSZ, outfile);
	fclose(outfile);
	fclose(Sdata);
	if (!debug) {
		remove(TMPDATA);
		remove(TMPCODE);
		remove(TMPRLOC);
	}
}

void nosegment(void) {
	error("emitting to unknown segment");
}

void bad_ops(void) {
	error("bad operand(s)");
}

void bigval(void) {
	error("value too big");
}

void csizechk(int len) {
	if ((unsigned) (Ctop + len) > (unsigned) CODESZ)
		fatal("code segment too big");
}

void dsizechk(int len) {
	if ((unsigned) (Dtop + len) > (unsigned) DATASZ)
		fatal("data segment too big");
}

void emit(int val, int count) {
	int	i;

	val &= 0xff;
	if (Segment == SCODE) {
		csizechk(count);
		for (i=count; i--; Ctop++)
			putcache(val);
	}
	else if (Segment == SDATA) {
		dsizechk(count);
		for (i=count; i--; Dtop++)
			fputc(val, Sdata);
	}
	else {
		nosegment();
	}
	if (debug) printf("emit(B): %02x * %d\n", val, count);
}

void emitword(int val, int count) {
	int	l, h, i;

	l = (val & 0xff);
	h = (val >> 8);
	if (Segment == SCODE) {
		csizechk(count<<1);
		for (i=count; i--; Ctop += 2) {
			putcache(l);
			putcache(h);
		}
	}
	else if (Segment == SDATA) {
		dsizechk(count<<1);
		for (i=count; i--; Dtop += 2) {
			fputc(l, Sdata);
			fputc(h, Sdata);
		}
	}
	else
		nosegment();
	if (debug) printf("emit(W): %04x * %d\n", val, count);
}

int strpos(char *s1, char *s2) {
	int	i, len;

	for (len = strlen(s1), i=0; i<len; i++)
		if (s1[i] == s2[0] && s1[i+1] == s2[1])
			return i;
	return -1;
}

int reg(char *s) {
	int	owop;
	int	p;

	if (strlen(s) != 2) return -1;
	owop = Wop;
	Wop = 1;
	if ((p = strpos("axcxdxbxspbpsidi", s)) >= 0 && !(p%2))
		return p>>1;
	Wop = 0;
	if ((p = strpos("alcldlblahchdhbh", s)) >= 0 && !(p%2))
		return p>>1;
	Wop = owop;
	return -1;
}

int sreg(char *s) {
	int  owop;

	owop = Wop;
	Wop = 1;
	if (!strcmp(s, "cs")) return 1;
	if (!strcmp(s, "ds")) return 3;
	if (!strcmp(s, "es")) return 0;
	if (!strcmp(s, "ss")) return 2;
	Wop = owop;
	return -1;
}

int indirect(char *s) {
	if (s[0] != '[') return -1;
	if (!strcmp(s, "[si]")) return 4;
	if (!strcmp(s, "[di]")) return 5;
	if (!strcmp(s, "[bx]")) return 7;
	if (!strcmp(s, "[bx+si]")) return 0;
	if (!strcmp(s, "[bx+di]")) return 1;
	if (!strcmp(s, "[bp+si]")) return 2;
	if (!strcmp(s, "[bp+di]")) return 3;
	return -1;
}

int inddisp(char *s) {
	if (s[0] != '[') return -1;
	if (!strncmp(s, "[bp]", 4)) return 6;
	if (!('0' <= s[4] && s[4] <= '9') && !('a' <= s[4] && s[4] <= 'f'))
		return -1;
	if (s[3] != '+' && s[3] != '-') return -1;
	if (!strncmp(s, "[bx", 3)) return 7;
	if (!strncmp(s, "[bp", 3)) return 6;
	if (!strncmp(s, "[di", 3)) return 5;
	if (!strncmp(s, "[si", 3)) return 4;
	return -1;
}

int xtoi(char *s) {
	int  n, radix, neg;

	if (*s == '\'') return *(++s);
	if (s[strlen(s)-1] == 'h')
		radix = 16;
	else
		radix = 10;
	if (*s == '-') {
		neg = 1;
		s++;
	}
	else if (*s == '+') {
		neg = 0;
		s++;
	}
	else
		neg = 0;
	for (n=0; *s; s++ ) {
		if (isdigit(*s))
			n = n * radix + (*s-'0');
		else if (radix == 16 && *s >= 'a' && *s <= 'f')
			n = n * radix + (*s-'W');
		else
			break;
	}
	return neg? -n: n;
}

void rrasm(int o1, int o2, int m1, int m2) {
	emit(o1 | Wop, 1);
	emit(o2 | 0xc0 | m1 | (m2<<3), 1);
}


void riasm(int b2, int o1, int o2, int m1, int m2) {
	emit(o1 | b2 | Wop, 1);
	emit(o2 | m2 | (m1<<3), 1);
}

void rmasm(int b2, int o1, int o2, int m1, int m2, char *sym) {
	emit(o1 | b2 | Wop, 1);
	emit(o2 | m2 | (m1<<3), 1);
	emitword(findaddr(sym, SDATA, 0, 1, 0)+Off2, 1);
}

void rnasm(int o1, int o2, int m1, int val) {
	if (o1 == 0xc6) {
		emit(0xb0 | (Wop<<3) | m1, 1);
	}
	else {
		emit(o1 | Wop, 1);
		emit(o2 | 0xc0 | m1, 1);
	}
	if (Wop)
		emitword(val, 1);
	else if (val > 255 || val < -127)
		bigval();
	else
		emit(val, 1);
}

void roasm(int m1, char *sym) {
	char	*p;
	int	n;

	emit(0xb0 | 8 | m1, 1);
	n = 0;
	if ((p = strchr(sym, '+')) != NULL) {
		*p++ = 0;
		n = xtoi(p);
	}
	emitword(findaddr(sym, classof(sym), 0, 1, 0)+n, 1);
}

void irasm(int o1, int o2, int m1, int m2) {
	emit(o1 | Wop, 1);
	emit(o2 | m1 | (m2<<3), 1);
}

mrasm(int o1, int o2, int m1, int m2, char *sym) {
	emit(o1 | Wop, 1);
	emit(o2 | m1 | (m2<<3), 1);
	emitword(findaddr(sym, SDATA, 0, 1, 0)+Off1, 1);
}

void inasm(int o1, int o2, int m1, int val) {
	emit(o1 | Wop, 1);
	emit(o2 | m1, 1);
	if (Wop)
		emitword(val, 1);
	else if (val > 255 || val < -127)
		bigval();
	else
		emit(val, 1);
}

void rdasm(int b2, int o1, int o2, int m1, int m2, int val) {
	emit(o1 | b2 | Wop, 1);
	if (val > 127 || val < -128) {
		emit(o2 | 0x80 | (m1<<3) | m2, 1);
		emitword(val, 1);
	}
	else {
		emit(o2 | 0x40 | (m1<<3) | m2, 1);
		emit(val, 1);
	}
}

void drasm(int o1, int o2, int m1, int m2, int val) {
	emit(o1 | Wop, 1);
	if (val > 127 || val < -128) {
		emit(o2 | 0x80 | m1 | (m2<<3), 1);
		emitword(val, 1);
	}
	else {
		emit(o2 | 0x40 | m1 | (m2<<3), 1);
		emit(val, 1);
	}
}

void asm1(int immed, int op1, int op2) {
	int	m1, m2;

	if ((m1 = reg(Oper1)) >= 0) {
		if (immed == 0xc6) {
			if ((m2 = sreg(Oper2)) >= 0) {
				emit(0x8c, 1);
				emit(0xc0 | m1 | (m2<<3), 1);
				return;
			}
		}
		if ((m2 = reg(Oper2)) >= 0) {
			rrasm(op1, op2, m1, m2);
		}
		else if (isalpha(Oper2[0]) || Oper2[0] == '_') {
			if (!strcmp(Oper2, "DGROUP")) {
				rnasm(immed, op1, m1, 0);
				dreloc();
			}
			else if (!strcmp(Oper2, "offset")) {
				roasm(m1, Aoper);
				if (Linked) reloc(Ctop-2, classof(Aoper));
			}
			else {
				rmasm(2, op1, op2, m1, 6, Oper2);
				if (Linked) reloc(Ctop-2, SDATA);
			}
		}
		else if (isdigit(Oper2[0]) || Oper2[0] == '\'' ||
			Oper2[0] == '-')
		{
			rnasm(immed, op1, m1, xtoi(Oper2));
		}
		else if ((m2 = indirect(Oper2)) >= 0)
			riasm(2, op1, op2, m1, m2);
		else if ((m2 = inddisp(Oper2)) >= 0)
			rdasm(2, op1, op2, m1, m2, xtoi(&Oper2[3]));
		else
			bad_ops();
	}
	else if (immed == 0xc6 && (m1 = sreg(Oper1)) >= 0) {
		if ((m2 = reg(Oper2)) < 0)
			bad_ops();
		emit(0x8e, 1);
		emit(0xc0 | (m1<<3) | m2, 1);
	}
	else if (isalpha(Oper1[0]) || Oper1[0] == '_') {
		if (!strcmp(Oper1, "DGROUP")) {
			error("DGROUP must not be an lvalue!");
	}
	if ((m2 = reg(Oper2)) >= 0) {
		mrasm(op1, op2, 6, m2, Oper1);
		if (Linked) reloc(Ctop-2, SDATA);
	}
	else
		bad_ops();
	}
	else if ((m1 = indirect(Oper1)) >= 0) {
		if ((m2 = reg(Oper2)) >= 0)
			irasm(op1, op2, m1, m2);
		else if (isdigit(Oper2[0]) || Oper2[0] == '\'' ||
			Oper2[0] == '-'
		)
			inasm(immed, immed==0xc6? 0: op1, m1, xtoi(Oper2));
		else
			bad_ops();
	}
	else if ((m1 = inddisp(Oper1)) >= 0) {
		if ((m2 = reg(Oper2)) >= 0)
			drasm(op1, op2, m1, m2, xtoi(&Oper1[3]));
	else
		bad_ops();
	}
	else
		bad_ops();
}

void leaasm(int op1, int op2) {
	int	m1, m2;

	if ((m1 = reg(Oper1)) >= 0) {
		if (isalpha(Oper2[0]) || Oper2[0] == '_') {
			rmasm(0, op1, op2, m1, 6, Oper2);
			if (Linked) reloc(Ctop-2, SDATA);
		}
		else if ((m2 = indirect(Oper2)) >= 0)
			riasm(0, op1, op2, m1, m2);
		else if ((m2 = inddisp(Oper2)) >= 0)
			rdasm(0, op1, op2, m1, m2, xtoi(&Oper2[3]));
		else
			bad_ops();
	}
	else
		bad_ops();
}

void rasm(int o1, int o2, int m1) {
	emit(o1 | Wop, 1);
	emit(o2 | 0xc0 | m1, 1);
}

void iasm(int o1, int o2, int m1) {
	emit(o1 | Wop, 1);
	emit(o2 | m1, 1);
}

void masm(int o1, int o2, int m1, char *sym) {
	emit(o1 | Wop, 1);
	emit(o2 | m1, 1);
	emitword(findaddr(sym, SDATA, 0, 1, 0)+Off1, 1);
}

void asm2(int op1, int op2) {
	int	m1;

	if ((m1 = reg(Oper1)) >= 0)
		rasm(op1, op2, m1);
	else if ((m1 = indirect(Oper1)) >= 0)
		iasm(op1, op2, m1);
	else if (isalpha(Oper1[0]) || Oper1[0] == '_')
		masm(op1, op2, 6, Oper1);
	else
		bad_ops();
}

void jcasm(int op, int a1, int a2, int jlong) {
	int	dest, disp;

	if (!isalpha(Oper1[0]) && Oper1[0] != '_' || reg(Oper1) >= 0) {
		if (!jlong) error("invalid indirect branch");
		asm2(a1, a2);
		return;
	}
	emit(op, 1);
	dest = findaddr(Oper1, SCODE, !jlong, 0, 1)+Off1;
	disp = dest - (Ctop+(jlong? 2: 1));
	if (jlong)
		emitword(disp, 1);
	else if (dest != 0xffff && (disp < -128 || disp > 127))
		error("short branch out of range");
	else
		emit(disp&0xff, 1);
}

void ppasm(int op, int ops) {
	int	m1;

	if ((m1 = reg(Oper1)) >= 0)
		emit(op | m1, 1);
	else if ((m1 = sreg(Oper1)) >= 0)
		emit(ops | (m1<<3), 1);
	else
		bad_ops();
}

void srasm(int op1, int op2) {
	if (Oper2[0] == '1' && Oper2[1] == 0)
		asm2(op1, op2);
	else if (!strcmp(Oper2, "cl"))
		asm2(op1|2, op2);
	else
		bad_ops();
}

void asmint(void) {
	if (Oper1[0] == '3' && Oper1[1] == 0)
		emit(0xcc, 1);
	else if (isdigit(Oper1[0])) {
		emit(0xcd, 1);
		emit(xtoi(Oper1), 1);
	}
	else
		bad_ops();
}

void generate(void) {
	switch (Instr[0]) {
	case 'a':
	if (!strcmp(Instr, "aam"))	{ emitword(0xd40a, 1); return; }
	if (!strcmp(Instr, "aas"))	{ emit(0x3f, 1); return; }
	if (!strcmp(Instr, "adc"))	{ asm1(0x80, 0x10, 0); return; }
	if (!strcmp(Instr, "add"))	{ asm1(0x80, 0, 0); return; }
	if (!strcmp(Instr, "and"))	{ asm1(0x80, 0x20, 0); return; }
	break;

	case 'c':
	if (!strcmp(Instr, "call"))	{ jcasm(0xe8, 0xff, 0x10, 1); return; }
	if (!strcmp(Instr, "cbw"))	{ emit(0x98, 1); return; }
	if (!strcmp(Instr, "clc"))	{ emit(0xf8, 1); return; }
	if (!strcmp(Instr, "cld"))	{ emit(0xfc, 1); return; }
	if (!strcmp(Instr, "cli"))	{ emit(0xfa, 1); return; }
	if (!strcmp(Instr, "cmc"))	{ emit(0xf5, 1); return; }
	if (!strcmp(Instr, "cmp"))	{ asm1(0x80, 0x38, 0); return; }
	if (!strcmp(Instr, "cmpsb"))	{ emit(0xa6, 1); return; }
	if (!strcmp(Instr, "cmpsw"))	{ emit(0xa7, 1); return; }
	if (!strcmp(Instr, "cwd"))	{ emit(0x99, 1); return; }
	break;

	case 'd':
	if (!strcmp(Instr, "daa"))	{ emit(0x27, 1); return; }
	if (!strcmp(Instr, "das"))	{ emit(0x2f, 1); return; }
	if (!strcmp(Instr, "dec"))	{ asm2(0xfe, 8); return; }
	if (!strcmp(Instr, "div"))	{ asm2(0xf6, 0x30); return; }
	break;

	case 'h':
	if (!strcmp(Instr, "hlt"))	{ emit(0xf4, 1); return; }
	break;

	case 'i':
	if (!strcmp(Instr, "idiv"))	{ asm2(0xf6, 0x38); return; }
	if (!strcmp(Instr, "imul"))	{ asm2(0xf6, 0x28); return; }
	/*if (!strcmp(Instr, "in"))	{ return; }*/
	if (!strcmp(Instr, "inc"))	{ asm2(0xfe, 0); return; }
	if (!strcmp(Instr, "int"))	{ asmint(); return; }
	if (!strcmp(Instr, "into"))	{ emit(0xce, 1); return; }
	if (!strcmp(Instr, "iret"))	{ emit(0xcf, 1); return; }
	break;

	case 'j':
	if (!strcmp(Instr, "ja"))	{ jcasm(0x77, 0, 0, 0); return; }
	if (!strcmp(Instr, "jae"))	{ jcasm(0x73, 0, 0, 0); return; }
	if (!strcmp(Instr, "jnc"))	{ jcasm(0x73, 0, 0, 0); return; }
	if (!strcmp(Instr, "jc"))	{ jcasm(0x72, 0, 0, 0); return; }
	if (!strcmp(Instr, "jb"))	{ jcasm(0x72, 0, 0, 0); return; }
	if (!strcmp(Instr, "jbe"))	{ jcasm(0x76, 0, 0, 0); return; }
	if (!strcmp(Instr, "jcxz"))	{ jcasm(0xe3, 0, 0, 0); return; }
	if (!strcmp(Instr, "je"))	{ jcasm(0x74, 0, 0, 0); return; }
	if (!strcmp(Instr, "jz"))	{ jcasm(0x74, 0, 0, 0); return; }
	if (!strcmp(Instr, "jg"))	{ jcasm(0x7f, 0, 0, 0); return; }
	if (!strcmp(Instr, "jge"))	{ jcasm(0x7d, 0, 0, 0); return; }
	if (!strcmp(Instr, "jl"))	{ jcasm(0x7c, 0, 0, 0); return; }
	if (!strcmp(Instr, "jle"))	{ jcasm(0x7e, 0, 0, 0); return; }
	if (!strcmp(Instr, "jmp"))	{ if (Short)
						jcasm(0xeb, 0, 0, 0);
				  	else
						jcasm(0xe9, 0xff, 0x20, 1);
						return;
					}
	if (!strcmp(Instr, "jmps"))	{ jcasm(0xeb, 0, 0, 0); return; }
	if (!strcmp(Instr, "jne"))	{ jcasm(0x75, 0, 0, 0); return; }
	if (!strcmp(Instr, "jnz"))	{ jcasm(0x75, 0, 0, 0); return; }
	if (!strcmp(Instr, "jno"))	{ jcasm(0x71, 0, 0, 0); return; }
	if (!strcmp(Instr, "jnp"))	{ jcasm(0x7b, 0, 0, 0); return; }
	if (!strcmp(Instr, "jns"))	{ jcasm(0x79, 0, 0, 0); return; }
	if (!strcmp(Instr, "jo"))	{ jcasm(0x70, 0, 0, 0); return; }
	if (!strcmp(Instr, "jp"))	{ jcasm(0x7a, 0, 0, 0); return; }
	if (!strcmp(Instr, "js"))	{ jcasm(0x78, 0, 0, 0); return; }
	break;

	case 'l':
	if (!strcmp(Instr, "lahf"))	{ emit(0x9f, 1); return; }
	if (!strcmp(Instr, "lea"))	{ leaasm(0x8d, 0); return; }
	if (!strcmp(Instr, "lock"))	{ emit(0xf0, 1); return; }
	if (!strcmp(Instr, "lodsb"))	{ emit(0xac, 1); return; }
	if (!strcmp(Instr, "lodsw"))	{ emit(0xad, 1); return; }
	if (!strcmp(Instr, "loop"))	{ jcasm(0xe2, 0, 0, 0); return; }
	if (!strcmp(Instr, "loopz"))	{ jcasm(0xe1, 0, 0, 0); return; }
	if (!strcmp(Instr, "loopnz"))	{ jcasm(0xe0, 0, 0, 0); return; }
	break;

	case 'm':
	if (!strcmp(Instr, "mov"))	{ asm1(0xc6, 0x88, 0); return; }
	if (!strcmp(Instr, "movsb"))	{ emit(0xa4, 1); return; }
	if (!strcmp(Instr, "movsw"))	{ emit(0xa5, 1); return; }
	if (!strcmp(Instr, "mul"))	{ asm2(0xf6, 0x20); return; }
	break;

	case 'n':
	if (!strcmp(Instr, "neg"))	{ asm2(0xf6, 0x18); return; }
	if (!strcmp(Instr, "nop"))	{ emit(0x90, 1); return; }
	if (!strcmp(Instr, "not"))	{ asm2(0xf6, 0x10); return; }
	break;

	case 'o':
	if (!strcmp(Instr, "or"))	{ asm1(0x80, 8, 0); return; }
	/*if (!strcmp(Instr, "out"))	{ return; }*/
	break;

	case 'p':
	if (!strcmp(Instr, "pop"))	{ ppasm(0x58, 7); return; }
	if (!strcmp(Instr, "popf"))	{ emit(0x9d, 1); return; }
	if (!strcmp(Instr, "push"))	{ ppasm(0x50, 6); return; }
	if (!strcmp(Instr, "pushf"))	{ emit(0x9c, 1); return; }
	break;

	case 'r':
	if (!strcmp(Instr, "rcl"))	{ srasm(0xd0, 0x10); return; }
	if (!strcmp(Instr, "rcr"))	{ srasm(0xd0, 0x18); return; }
	if (!strcmp(Instr, "rep"))	{ emit(0xf3, 1); return; }
	if (!strcmp(Instr, "repz"))	{ emit(0xf3, 1); return; }
	if (!strcmp(Instr, "repnz"))	{ emit(0xf2, 1); return; }
	if (!strcmp(Instr, "ret"))	{ emit(0xc3, 1); return; }
	if (!strcmp(Instr, "rol"))	{ srasm(0xd0, 0); return; }
	if (!strcmp(Instr, "ror"))	{ srasm(0xd0, 8); return; }
	break;

	case 's':
	if (!strcmp(Instr, "sahf"))	{ emit(0x9e, 1); return; }
	if (!strcmp(Instr, "sar"))	{ srasm(0xd0, 0x38); return; }
	if (!strcmp(Instr, "sbb"))	{ asm1(0x80, 0x18, 0); return; }
	if (!strcmp(Instr, "scasb"))	{ emit(0xae, 1); return; }
	if (!strcmp(Instr, "scasw"))	{ emit(0xaf, 1); return; }
	if (!strcmp(Instr, "shl"))	{ srasm(0xd0, 0x20); return; }
	if (!strcmp(Instr, "sal"))	{ srasm(0xd0, 0x20); return; }
	if (!strcmp(Instr, "shr"))	{ srasm(0xd0, 0x28); return; }
	if (!strcmp(Instr, "stc"))	{ emit(0xf9, 1); return; }
	if (!strcmp(Instr, "std"))	{ emit(0xfd, 1); return; }
	if (!strcmp(Instr, "sti"))	{ emit(0xfb, 1); return; }
	if (!strcmp(Instr, "stosb"))	{ emit(0xaa,1 );return; }
	if (!strcmp(Instr, "stosw"))	{ emit(0xab,1 );return; }
	if (!strcmp(Instr, "sub"))	{ asm1(0x80, 0x28, 0); return; }
	break;

	case 't':
	if (!strcmp(Instr, "test"))	{ asm1(0xf6, 0x84, 0); return; }
	break;

	case 'w':
	if (!strcmp(Instr, "wait"))	{ emit(0x9b, 1); return; }
	break;

	case 'x':
	if (!strcmp(Instr, "xchg"))	{ asm1(0x80, 0x86, 0); return; }
	if (!strcmp(Instr, "xlat"))	{ emit(0xd7, 1); return; }
	if (!strcmp(Instr, "xor"))	{ asm1(0x80, 0x30, 0); return; }
	break;
	}	/* end of switch */

	error("illegal instruction");
}

int skip(int i) {
	while (Linebuf[i] == ' ' || Linebuf[i] == '\t' && Linebuf[i] != ',')
		i++;
	return i;
}

int field(int i, int d) {
	while (Linebuf[i] != ' ' && Linebuf[i] != '\t' && Linebuf[i] && Linebuf[i] != d)
		i++;
	return i;
}

int empty(int i) {
	for (; Linebuf[i] != ';' && Linebuf[i]; i++)
		if (Linebuf[i] != ' ' && Linebuf[i] != '\t')
			error("trailing characters");
}

void mksym(char *name, int segmt, int class, int addr) {
	int	i;

	for (i=0; i<Symtop; i += SSIZE) {
		if (!strcmp(&Symbols[i], name)) {
			if (!(Symbols[i+SCLASS] == PUBLIC && class == LOCAL) &&
			    !(Symbols[i+SCLASS] == LOCAL && class == PUBLIC) &&
			    Symbols[i+SCLASS] != UNDEFD
			)
				error("duplicate symbol");
			if (class == LOCAL) {
				Symbols[i+SSEGMT] = segmt;
				resolve(&Symbols[i], addr);
				Symbols[i+SMARK] = Symbols[i+SMARK+1] = 0xff;
			}
			if (class && Symbols[i+SCLASS] != PUBLIC)
				Symbols[i+SCLASS] = class;
			if (addr != -1) {
				Symbols[i+SADDR] = addr;
				Symbols[i+SADDR+1] = (addr >> 8);
			}
			if (debug)
				printf("adjust %s\tc=%c\tt=%c\ta=%04x\n",
			 		name, Symbols[i+SSEGMT],
			 		Symbols[i+SCLASS],
			 		(Symbols[i+SADDR]&0xff) +
						(Symbols[i+SADDR+1]<<8));
			return;
		}
	}
	strncpy(&Symbols[Symtop], name, 14);
	Symbols[Symtop+14] = 0;
	Symbols[Symtop+SSEGMT] = segmt;
	Symbols[Symtop+SCLASS] = class;
	Symbols[Symtop+SADDR] = (addr & 0xff);
	Symbols[Symtop+SADDR+1] = (addr >> 8);
	Symbols[Symtop+SMARK] = Symbols[Symtop+SMARK+1] = 0xff;
	if ((Symtop += SSIZE) >= SYMSZ)
		fatal("symbol table overflow");
	if (debug) printf("newsym=%s\tsegmt=%c\tclass=%c\taddr=%04x\n",
				name, segmt, class, addr);
}

char *findmac(char *name, int test);

void mkmac(char *name, char *val) {
	int  len;

	if (findmac(name, 1)) error("macro redefinition");
	Macpool[Mactop++] = (len = strlen(name)+1);
	strcpy(&Macpool[Mactop], name);
	Mactop += len;
	Macpool[Mactop++] = (len = strlen(val)+1);
	strcpy(&Macpool[Mactop], val);
	Mactop += len;
	if (Mactop >= MACSZ) fatal("macro pool overflow");
	if (debug) printf("add macro:\t%s=%s\n", name, val);
}

int findaddr(char *name, int segmt, int shrt, int map, int rel) {
	int	i, a;

	Linked = 1;
	for (i=0; i<Symtop; i+=SSIZE) {
		if (!strcmp(&Symbols[i], name)) {
			if (	segmt != SNONE &&
				Symbols[i+SSEGMT] != SNONE &&
				Symbols[i+SSEGMT] != segmt
			)
				warn("cross segment reference");
			a = Symbols[i+SADDR] + (Symbols[i+SADDR+1]<<8);
			if (a == 0xffff) {
				Linked = 0;
				mark(name, Symbols[i+SSEGMT], Ctop, shrt, rel);
				if (map) a = 0;
			}
			return a;
		}
	}
	mksym(name, segmt, UNDEFD, -1);
	mark(name, segmt, Ctop, shrt, rel);
	Linked = 0;
	return map? 0: 0xffff;
}

char *findmac(char *name, int test) {
	int	i, len;

	for (i=0; i<Mactop; ) {
		len = Macpool[i++];
		if (!strcmp(&Macpool[i], name)) {
			i += (len+1);
			if (debug)
				printf("macro resolved:\t%s=%s\n",
					name, &Macpool[i]);
			return &Macpool[i];
		}
		i += len;
		len = Macpool[i++];
		i += len;
	}
	return test? NULL: name;
}

void split(void) {
	int	p, i, c;
	char	*q;

	SegPfx = Short = Wop = 0;
	Aoper = Label = Instr = Oper1 = Oper2 = "";
	Off1 = Off2 = 0;
	p = i = skip(0);
	i = field(i, ':');
	c = Linebuf[i];
	Linebuf[i] = 0;
	if (!Linebuf[p]) {
		empty(i);
		return;
	}
	q = &Linebuf[p];
	if (	c == ':' ||
		(Segment == SDATA && strcmp(q, "db") &&
		strcmp(q, "dw") &&
		strcmp(q, "extrn") &&
		strcmp(q, "public") &&
		strcmp(q, "end") &&
		q[0] != '.')
	) {
		Label = findmac(&Linebuf[p], 0);
		p = i = skip(i+1);
		i = field(i, 0);
		Linebuf[i] = 0;
	}
	if (!Linebuf[p]) {
		empty(i);
		return;
	}
	Instr = findmac(&Linebuf[p], 0);
	p = i = skip(i+1);
	if (	!strcmp(Instr, "extrn") ||
		!strcmp(Instr, "public") ||
		!strcmp(Instr, "db") ||
		!strcmp(Instr, "dw")
	) {
		Oper1 = findmac(&Linebuf[p], 0);
		return;
	}
	i = field(i, ',');
	Linebuf[i] = 0;
	if (!Linebuf[p]) {
		empty(i);
		return;
	}
	if (	!strcmp(&Linebuf[p], "word") ||
		!strcmp(&Linebuf[p], "byte") ||
		!strcmp(&Linebuf[p], "near") ||
		!strcmp(&Linebuf[p], "short")
	) {
		if (Linebuf[p] == 'w')
			Wop = 1;
		else if (Linebuf[p] == 's')
			Short = 1;
		c = Linebuf[p];
		p = i = skip(i+1);
		i = field(i, 0);
		if (c != 's') {
			p = i = skip(i+1);
			i = field(i, ',');
		}
		Linebuf[i] = 0;
	}
	if (!Linebuf[p]) {
		empty(i);
		return;
	}
	if (!strncmp(&Linebuf[p+1], "s:", 2)) {
		SegPfx = 1;
		switch(Linebuf[p]) {
		case 'c':	emit(0x2e, 1); break;
		case 'd':	emit(0x3e, 1); break;
		case 'e':	emit(0x26, 1); break;
		case 's':	emit(0x36, 1); break;
		}
		p += 3;
	}
	Oper1 = findmac(&Linebuf[p], 0);
	p = i = skip(i+1);
	i = field(i, 0);
	Linebuf[i] = 0;
	if (!Linebuf[p]) {
		empty(i);
		return;
	}
	if (!strncmp(&Linebuf[p+1], "s:", 2)) {
		SegPfx = 1;
		switch(Linebuf[p]) {
		case 'c':	emit(0x2e, 1); break;
		case 'd':	emit(0x3e, 1); break;
		case 'e':	emit(0x26, 1); break;
		case 's':	emit(0x36, 1); break;
		}
		p += 3;
	}
	Oper2 = findmac(&Linebuf[p], 0);
	p = i = skip(i+1);
	i = field(i, 0);
	Linebuf[i] = 0;
	if (!Linebuf[p]) {
		empty(i);
		return;
	}
	Aoper = findmac(&Linebuf[p], 0);
	empty(i);
}

void dodecl(char *list, int type) {
	int	p, i;

	for (p = 0;;) {
		while (list[p] == ' ' || list[p] == '\t')
			p++;
		if (!list[p]) return;
		for (i=p; list[i] && list[i] != ','; i++)
			;
		if (list[i]) list[i++] = 0;
		mksym(&list[p], Segment, type, -1);
		p = i;
	}
}

void dodata(int word) {
	char	*p, *arg;
	char	buf[128];
	int	addr;

	p = Oper1;
	while (*p == ' ' || *p == '\t') p++;
	while (*p != ' ' && *p != '\t' && *p) p++;
	while (*p == ' ' || *p == '\t') p++;
	if (!strncmp(p, "dup", 3)) {
		p += 3;
		while (*p == ' ' || *p == '\t') p++;
		if (word)
			emitword(xtoi(Oper1), xtoi(p));
		else
			emit(xtoi(Oper1), xtoi(p));
		return;
	}
	for (p = strcpy(buf, Oper1); *p; ) {
		for (arg = p; *arg == ' ' || *arg == '\t'; arg++)
			;
		if (!(*arg)) break;
		if (*arg == '"') {
			for (++arg; *arg != '"' && *arg; arg++) {
				if (word)
					emitword(*arg, 1);
				else
					emit(*arg, 1);
			}
			p = *arg? arg+1 : arg;
			if (*p == ',') p++;
		}
		else {
			p = arg;
			while (*p != ' ' && *p != '\t' && *p != ',' && *p)
				p++;
			if (*p) *p++ = 0;
			if (isalpha(*arg)) {
				addr = findaddr(arg, SCODE, 0, 1, 0);
				emitword(addr, 1);
				if (Linked) reloc(Ctop-2, SCODE);
			}
			else if (word)
				emitword(xtoi(arg), 1);
			else
				emit(xtoi(arg), 1);
		}
	}
}

void offsets(void) {
	char	*p, *q1, *q2;

	if (Oper1 && (isalpha(*Oper1) || *Oper1 == '_')) {
		for (q1=NULL, p=Oper1; *p; p++)
			if (!q1 && (*p == '+' || *p == '-')) q1 = p;
		if (q1) {
			Off1 = atoi(q1);
			*q1 = 0;
		}
	}
	if (Oper2 && (isalpha(*Oper2) || *Oper2 == '_')) {
		for (q2=NULL, p=Oper2; *p; p++)
			if (!q2 && (*p == '+' || *p == '-')) q2 = p;
		if (q2) {
			Off2 = atoi(q2);
			*q2 = 0;
		}
	}
}

void assemble(void) {
	if (!Label[0] && !Instr[0]) return;
	if (!strcmp(Instr, ".code")) {
		Segment = SCODE;
		return;
	}
	if (!strcmp(Instr, ".data")) {
		Segment = SDATA;
		return;
	}
	if (!strcmp(Instr, ".stack")) {
		Segment = SNONE;
		return;
	}
	if (!strcmp(Instr, "quirks") || !strcmp(Instr, ".model") ||
		!strcmp(Instr, "end")
	)
		return;
	if (!strcmp(Instr, "public")) {
		dodecl(Oper1, PUBLIC);
		return;
	}
	if (!strcmp(Instr, "extrn")) {
		dodecl(Oper1, EXTRN);
		return;
	}
	if (!strcmp(Oper1, "equ")) {
		mkmac(Instr, Oper2);
		return;
	}
	if (Label[0])
		mksym(Label, Segment, LOCAL,
			(Segment == SCODE? Ctop: Dtop) - SegPfx);
	if (!strcmp(Instr, "db")) {
		dodata(0);
		return;
	}
	if (!strcmp(Instr, "dw")) {
		dodata(1);
		return;
	}
	if (Instr[0]) generate();
}

void process(void) {
	char	*p;
	int	**x;

	setjmp(&Restart);
	fgets(Linebuf, MAXLN, Infile);
	while (!feof(Infile)) {
		Line++;
		Linebuf[strlen(Linebuf)-1] = 0;
		if (p = strchr(Linebuf, ';')) *p = 0;
		split();
		offsets();
		assemble();
		fgets(Linebuf, MAXLN, Infile);
	}
}

notmp(char *name) {
	fprintf(stderr, "could not create tmp file: %s\n", name);
	exit(1);
}

usage() {
	printf("usage: s86 [-dv] [-o file] { file | - } ...\n");
	exit(1);
}

int main(int argc, char **argv) {
	int	i;
	char	*p;
	int	verbose;
	char	of[81];
	char	*objname;

	init();
	verbose = 0;
	objname = NULL;
	for (i=1; i<argc && *argv[i] == '-'; i++) {
		p = argv[i];
		if (*++p == 0) break;
		while (*p) {
			switch(*p++) {
			case 'v':	verbose = 1; break;
			case 'd':	debug = 1; break;
			case 'o':	if (*p == 0) {
						if ((p = argv[++i]) == NULL)
							usage();
					}
					objname = p;
					p += strlen(p);
					break;
			default:	usage();
			}
		}
	}
	if (i >= argc) usage();
	while (i < argc) {
		p = argv[i++];
		if (*p == '-' && *(p+1) == 0) {
			if (verbose) puts("(stdin)");
			Infile = stdin;
		}
		else if ((Infile = fopen(p, "r")) == NULL) {
			fprintf(stderr, "no such file: %s\n", p);
			continue;
		}
		else if (verbose) {
			puts(p);
		}
		if ((Scode = fopen(TMPCODE, "wb+")) == NULL) {
			if (Infile != stdin) fclose(Infile);
			notmp(TMPCODE);
		}
		if ((Sdata = fopen(TMPDATA, "wb+")) == NULL) {
			if (Infile != stdin) fclose(Infile);
			remove(TMPCODE);
			notmp(TMPDATA);
		}
		if ((Sreloc = fopen(TMPRLOC, "wb+")) == NULL) {
			if (Infile != stdin) fclose(Infile);
			remove(TMPCODE);
			remove(TMPDATA);
			notmp(TMPRLOC);
		}
		Line = 0;
		DosReltop = Reltop = Mactop = Ctop = Dtop = Symtop = 0;
		Ncached = 0;
		Cachebot = 0;
		Segment = SNONE;
		Errcnt = 0;
		process();
		eject(p, objname);
		if (Errcnt) {
			printf("%d error(s)\n", Errcnt);
			strcpy(of, p);
			if ((p = strchr(of, '.')) != NULL) *p = 0;
			strcat(of, ".o");
			remove(of);
		}
		if (Infile != stdin) fclose(Infile);
	}
	return (Errcnt != 0);
}
