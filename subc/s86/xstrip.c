/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Strip symbol tables
 *	Nils M Holm, 1993,1994,2013,2014
 *	In the public domain
 */

#include <stdlib.h>
#include <stdio.h>
#include "obj.h"
#include "exe.h"

#define unsigned	char *

#define TMPFILE	"st00000.tmp"
#define CBUFL	16384		/* DON'T CHANGE! */

char	*symfile;
int	o_force, o_verbose;
char	*cbuf;

void error(char *m, char *n) {
	fputs("xstrip: ", stderr);
	fprintf(stderr, m, n);
	fputc('\n', stderr);
}

void readerr(void) {
	error("fatal: file read error", NULL);
	exit(1);
}

void writeerr(void) {
	error("fatal: file write error", NULL);
	exit(1);
}

void strip(char *name) {
	FILE	*f, *tmp, *sym;
	char	xh[XHDR_SZ], magic[2];
	int	p2, off, i;

	if (o_verbose) puts(name);
	if ((f = fopen(name, "rb")) == NULL) {
		error("no such file: %s", name);
		return;
	}
	if (fread(xh, 1, XHDR_SZ, f) != XHDR_SZ) {
		error("bad exe file: %s", name);
		fclose(f);
		return;
	}
	if (memcmp(&xh[X_MAGIC], XMAGIC, 2)) {
		error("magic match failed: %s", name);
		fclose(f);
		return;
	}
	p2 = 0;
	off = xh[X_NPAGES] + (xh[X_NPAGES+1] << 8);
	if (xh[X_NPAGES] > 128) {
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
	if (fread(magic, 1, 2, f) != 2) {
		error("file has no symbol table: %s", name);
		fclose(f);
		return;
	}
	if (magic[0] != S_MAGIC && !o_force) {
		error("invalid symbol table: %s", name);
		fclose(f);
		return;
	}
	if ((tmp = fopen(TMPFILE, "wb")) == NULL) {
		error("cannot open tmp file: %s", TMPFILE);
		fclose(f);
		return;
	}
	rewind(f);
	if (p2) {
		for (i=0; i<4; i++) {
			if (fread(cbuf, 1, CBUFL, f) != CBUFL) readerr();
			if (fwrite(cbuf, 1, CBUFL, tmp) != CBUFL) writeerr();
		}
	}
	while (off) {
		i = (unsigned) off > (unsigned) CBUFL? CBUFL: off;
		if (fread(cbuf, 1, i, f) != i) readerr();
		if (fwrite(cbuf, 1, i, tmp) != i) writeerr();
		off -= i;
	}
	if (symfile) {
		if ((sym = fopen(symfile, "wb")) == NULL) {
			error("cannot create symbol file: %s\n", symfile);
		}
		else {
			i = fread(cbuf, 1, CBUFL, f);
			while (i) {
				fwrite(cbuf, 1, i, sym);
				i = fread(cbuf, 1, CBUFL, f);
			}
			fclose(sym);
		}
	}
	fclose(tmp);
	fclose(f);
	if (remove(name) < 0) {
		error("access denied: %s", name);
		remove(TMPFILE);
		return;
	}
	if (rename(TMPFILE, name) < 0) {
		error("fatal: cannot rename: %s", name);
		exit(1);
	}
}

void usage(void) {
	printf("usage: xstrip [-fv] [-s symfile] file ...\n");
	exit(1);
}

int main(int argc, char **argv) {
	char	*p;
	int	i;

	symfile = NULL;
	o_force = o_verbose = 0;
	if ((cbuf = malloc(CBUFL)) == NULL) {
		error("out of memory", NULL);
		exit(1);
	}
	for (i = 1; i < argc && *argv[i] == '-'; i++) {
		p = argv[i];
		p++;
		while (*p) switch(*p++) {
			case 'f':	o_force = 1; break;
			case 'v':	o_verbose = 1; break;
			case 's':	if (*p == 0) {
						if ((p = argv[++i]) == NULL)
							usage();
					}
					symfile = p;
					p += strlen(p);
					break;
			default:	usage();
		}
	}
	if (i >= argc) usage();
	if (i < argc-1 && symfile) {
		error("xstrip: too many files with -s", NULL);
		exit(1);
	}
	while (i < argc) {
		p = argv[i++];
		strip(p);
	}
	return 0;
}
