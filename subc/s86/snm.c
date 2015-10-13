/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Print symbol tables
 *	Nils M Holm, 1993,1994,2013,2014
 *	In the public domain
 */

#include <stdio.h>
#include <string.h>
#include "obj.h"
#include "arc.h"
#include "exe.h"
#include "sym.h"

#define unsigned	char *

int	O_ext, O_all, O_verbose, O_marks;
char	*Fname, *Aname;

error(char *m, char *n) {
	fputs("snm: ", stderr);
	fprintf(stderr, m, n);
	fputc('\n', stderr);
}

void readerr(void) {
	error("fatal: file read error", NULL);
	exit(1);
}

void nm_sym(FILE *f) {
	char	sym[SSIZE];
	char	mk[MKSZ];
	int	n;

	n = fread(sym, 1, SSIZE, f);
	while (n == SSIZE) {
		if (!strchr("CDX", sym[SSEGMT]) || !sym[SSEGMT]) break;
		if (!strchr("ELPU", sym[SCLASS]) || !sym[SCLASS]) break;
		if ((sym[SCLASS] == EXTRN && !O_all && !O_ext) ||
		    (sym[SCLASS] == PUBLIC && O_ext)
		) {
			n = fread(sym, 1, SSIZE, f);
			continue;
		}
		if (O_verbose) {
			if (Aname && O_verbose > 1) printf("%-14s", Aname);
			printf("%c%c 0x%04x (%05d) %s",
				sym[SSEGMT], sym[SCLASS],
				sym[SADDR] + (sym[SADDR+1]<<8),
				sym[SADDR] + (sym[SADDR+1]<<8),
				sym);
		}
		else {
			printf(sym);
		}
		if (sym[SCLASS] == EXTRN) {
			if (O_marks) printf("\t[");
			fread(mk, 1, MKSZ, f);
			while (mk[MKFLAG] != 0xff) {
				if (O_marks)
					printf(" 0x%04x",
						mk[MKADDR] +
						(mk[MKADDR+1]<<8));
				fread(mk, 1, MKSZ, f);
			}
			if (O_marks) printf(" ]");
		}
		putchar('\n');
		n = fread(sym, 1, SSIZE, f);
	}
}

void nm_obj(FILE *f) {
	char	ohd[OHDSZ];
	int	off;

	rewind(f);
	if (fread(ohd, 1, OHDSZ, f) != OHDSZ)
		readerr();
	off = ohd[OPUBP] + (ohd[OPUBP+1]<<8);
	ufseek(f, off, SEEK_SET);
	nm_sym(f);
}

void nm_exec(FILE *f) {
	char	xh[XHDR_SZ];
	int	p2, off;
	char	magic[2];

	rewind(f);
	if (fread(xh, 1, XHDR_SZ, f) != XHDR_SZ) {
		error("bad executable file: %s", Fname);
		return;
	}
	p2 = 0;
	off = xh[X_NPAGES] + (xh[X_NPAGES+1]<<8);
	if (off > 128) {
		p2 = 1;
		off -= 128;
	}
	off = (off-1) * 512 + xh[X_NBYTES] + (xh[X_NBYTES+1]<<8);
	rewind(f);
	if (p2) {
		fseek(f, 30000, SEEK_CUR);
		fseek(f, 30000, SEEK_CUR);
		fseek(f,  5536, SEEK_CUR);
	}
	ufseek(f, off, SEEK_CUR);
	if (fread(&magic, 1, 2, f) != 2) {
		error("stripped executable: %s", Fname);
		return;
	}
	if (magic[0] != S_MAGIC || magic[1]) {
		error("invalid symbol table: %s", Fname);
		return;
	}
	nm_sym(f);
}

void nm_arc(FILE *f) {
	char	ah[ARH_LEN];
	char	ohd[OHDSZ];
	char	*ip;
	int	i;
	int	pos;

	rewind(f);
	for (;;) {
		i = fread(ah, 1, ARH_LEN, f);
		if (feof(f)) return;
		if (i != ARH_LEN) readerr();
		if (strncmp(&ah[AR_MAGIC], A_MAGIC, strlen(A_MAGIC)))
			error("magic match failed", NULL);
		Aname = &ah[AR_NAME];
		ip = &ah[AR_SIZE];
		i = ip[0] + (ip[1] << 8);
		pos = ftell(f);
		if (fread(ohd, 1, OHDSZ, f) != OHDSZ)
			readerr();
		if (ohd[OMAGIC] == O_MAGIC) {
			ufseek(f, pos, SEEK_SET);
			ufseek(f, ohd[OPUBP] + (ohd[OPUBP+1]<<8), SEEK_CUR);
			nm_sym(f);
		}
		ufseek(f, pos, SEEK_SET);
		ufseek(f, i, SEEK_CUR);
		while (i++%16) fgetc(f);
	}
}

void names(char *file) {
	FILE	*f;
	char	magic[2];
	int	(*type)();

	if (O_verbose > 1) printf("\n%s", file);
	if ((f = fopen(file, "rb")) == NULL) {
		error("cannot open: %s", file);
		return;
	}
	if (fread(&magic, 1, 2, f) != 2) {
		fclose(f);
		if (O_verbose) fputc('\n', stderr);
		error("short file: %s", file);
		return;
	}
	if (magic[0] == S_MAGIC && !magic[1]) {
		type = nm_sym;
		if (O_verbose > 1) puts(" (sld symbol table)");
	}
	else if (magic[0] == O_MAGIC && !magic[1]) {
		type = nm_obj;
		if (O_verbose > 1) puts(" (sld relocatable object)");
	}
	else if (!strncmp(magic, XMAGIC, strlen(XMAGIC))) {
		type = nm_exec;
		if (O_verbose > 1) puts(" (DOS exe file)");
	}
	else if (!strncmp(magic, A_MAGIC, strlen(A_MAGIC))) {
		type = nm_arc;
		if (O_verbose > 1) puts(" (sar archive)");
	}
	else {
		fclose(f);
		if (O_verbose > 1) fputc('\n', stderr);
		error("unknown file type: %s", file);
		return;
	}
	Fname = file;
	type(f);
	fclose(f);
}

void usage(void) {
	printf("usage: snm [-aemvv] file ...\n");
	exit(1);
}
 
int main(int argc, char **argv) {
	char	*p;
	int	i;

	O_ext = O_all; O_verbose = O_marks = 0;
	Aname = NULL;
	for (i=1; i<argc && *argv[i] == '-'; i++) {
		p = argv[i];
		p++;
		while (*p) switch(*p++) {
			case 'a':	O_all = 1; break;
			case 'e':	O_ext = 1; break;
			case 'v':	O_verbose++; break;
			case 'm':	O_marks = 1; break;
			default:	usage();
		}
	}
	if (i >= argc) usage();
	while (i < argc) {
		p = argv[i++];
		names(p);
	}
}
