/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Archiver
 *	Nils M Holm, 1993,1995,2014
 *	In the public domain
 */

#include <stdio.h>
#include <string.h>
#include "arc.h"
#include "sym.h"
#include "obj.h"
#include "exe.h"

#define BUFSZ	4096

#define ARTMP	"ar00000.tmp"

char	Buffer[BUFSZ];
char	Arh[ARH_LEN];

void quit(char *m, char *n) {
	if (n == NULL)
		fprintf(stderr, "sar: %s\n", m);
	else
		fprintf(stderr, "sar: %s: %s\n", m, n);
	exit(1);
}

void readerr(void) {
	quit("file read error", NULL);
}

void writeerr(void) {
	quit("file write error (disk full?)", NULL);
}

void add(FILE *arc, char *name) {
	FILE	*in;
	int	n, size;
	char	*p, *q, *ip;

	if ((in = fopen(name, "rb")) == NULL) {
		fprintf(stderr, "no such file: %s\n", name);
		return;
	}
	fseek(in, 0, SEEK_END);
	size = ftell(in);
	if (size >> 16) {
		fclose(in);
		fprintf(stderr, "file too large: %s\n", name);
		return;
	}
	rewind(in);
	for (p=name, q=NULL; *p; p++)
		if (*p == '/' || *p == '\\') q = p;
	name = q? q+1: name;
	if (strlen(name) > 13) {
		fclose(in);
		fprintf(stderr, "name too long: %s\n", name);
		return;
	}
	strcpy(&Arh[AR_MAGIC], A_MAGIC);
	strcpy(&Arh[AR_NAME], name);
	ip = &Arh[AR_SIZE];
	ip[0] = size;
	ip[1] = size >> 8;
	fwrite(Arh, 1, ARH_LEN, arc);
	n = fread(Buffer, 1, BUFSZ, in);
	while (n > 0) {
		fwrite(Buffer, 1, n, arc);
		size = n;
		n = fread(Buffer, 1, BUFSZ, in);
	}
	while (size++%16) fputc(0, arc);
	fclose(in);
}

void toc(FILE *arc, int v) {
	char	*ip;
	int	i, start;

	for (start = 1;;) {
		i = fread(Arh, 1, ARH_LEN, arc);
		if (feof(arc) && !start) return;
		start = 0;
		if (i != ARH_LEN) quit("file read error", NULL);
		if (strncmp(&Arh[AR_MAGIC], A_MAGIC, 2))
			quit("magic match failed", NULL);
		ip = &Arh[AR_SIZE];
		i = ip[0] + (ip[1]<<8);
		if (v)
			printf("%5d\t%s\n", i, &Arh[AR_NAME]);
		else
			printf("%s\n", &Arh[AR_NAME]);

		ufseek(arc, 1*i, SEEK_CUR);
		while (i++%16) fgetc(arc);
	}
}

void extract(FILE *arc, char **vlist, int verbose) {
	int	i, size, n, start, doit;
	char	**argp, *ip;
	char	*p;
	FILE	*out;

	for (start=1; ; ) {
		i = fread(Arh, 1, ARH_LEN, arc);
		if (feof(arc) && !start) return;
		start = 0;
		if (i != ARH_LEN) quit("file read error", NULL);
		if (strncmp(&Arh[AR_MAGIC], A_MAGIC, 2))
			quit("magic match failed", NULL);
		doit = 0;
		if (vlist == NULL) {
			doit = 1;
		}
		else {
			for (argp = vlist; *argp; argp++) {
				p = *argp;
				if (!strcmp(&Arh[AR_NAME], p)) {
					doit = 1;
					break;
				}
			}
		}
		ip = &Arh[AR_SIZE];
		i = ip[0] + (ip[1]<<8);
		if (doit) {
			if (verbose) printf("- %s\n", &Arh[AR_NAME]);
			if ((out = fopen(&Arh[AR_NAME], "wb")) == NULL)
				quit("cannot create file", &Arh[AR_NAME]);
			size = i;
			while (size) {
				if (feof(arc))
					quit("unexpected EOF in archive",
						NULL);
				if (size > BUFSZ) {
					n = fread(Buffer, 1, BUFSZ, arc);
					size -= BUFSZ;
				}
				else {
					n = fread(Buffer, 1, size, arc);
					size = 0;
				}
				if (fwrite(Buffer, 1, n, out) != n) {
					fclose(out);
					remove(&Arh[AR_NAME]);
					writeerr();
				}
			}
			fclose(out);
		}
		else {
			ufseek(arc, i, SEEK_CUR);
		}
		while (i++%16) fgetc(arc);
	}
}

void ranlib(char *name, int verbose) {
	FILE	*arc, *tmp;
	int	i, n, size, rd, start, isize, j, k;
	char	*ip;
	int	lpos;
	int	addr;
	char	sym[SSIZE];
	char	ohd[OHDSZ];

	if ((arc = fopen(name, "rb")) == NULL)
		quit("no such file", name);
	if ((tmp = fopen(ARTMP, "wb")) == NULL)
		quit("cannot create tmp file", ARTMP);
	strcpy(&Arh[AR_MAGIC], "  ");
	if (fwrite(Arh, 1, ARH_LEN, tmp) != ARH_LEN) writeerr();
	isize = 0;
	for (start=1; ; ) {
		i = fread(Arh, 1, ARH_LEN, arc);
		if (feof(arc) && !start) break;
		lpos = ftell(arc);
		addr = ((lpos>>4) & 0xffff);
		if (strncmp(&Arh[AR_MAGIC], A_MAGIC, 2)) {
			remove(ARTMP);
			quit("magic match failed", NULL);
		}
		start = 0;
		if (i != ARH_LEN) quit("file read error", NULL);
		if (verbose)
			printf("module: %s (%04x0)\n", &Arh[AR_NAME], addr);
		ip = &Arh[AR_SIZE];
		size = ip[0] + (ip[1]<<8);
		if ((rd = fread(ohd, 1, OHDSZ, arc)) != OHDSZ) {
			remove(ARTMP);
			readerr();
		}
		j = ohd[OEXTP] + (ohd[OEXTP+1]<<8);
		k = ohd[OPUBP] + (ohd[OPUBP+1]<<8);
		n = (j - k) / SSIZE;
		if (ohd[OMAGIC] != O_MAGIC) {
			remove(ARTMP);
			quit("not an object file", &Arh[AR_NAME]);
		}
		while (n--) {
			if ((i = fread(sym, 1, SSIZE, arc)) != SSIZE) {
				remove(ARTMP);
				readerr();
			}
			rd += i;
			ip = &sym[SADDR];
			ip[0] = addr;
			ip[1] = addr >> 8;
			if (verbose) printf("+ %s\n", sym);
			if (fwrite(sym, 1, SSIZE, tmp) != SSIZE) {
				remove(ARTMP);
				writeerr();
			}
			isize += SSIZE;
		}
		ufseek(arc, size - rd, SEEK_CUR);
		while (size++%16) fgetc(arc);
	}
	fputc(0, tmp);
	isize++;
	for (i=isize; i++%16; ) fputc(0, tmp);
	clearerr(arc);
	rewind(arc);
	n = fread(Buffer, 1, BUFSZ, arc);
	while (n) {
		if (fwrite(Buffer, 1, n, tmp) != n) {
			remove(ARTMP);
			writeerr();
		}
		n = fread(Buffer, 1, BUFSZ, arc);
	}
	rewind(tmp);
	strcpy(&Arh[AR_MAGIC], A_MAGIC);
	strcpy(&Arh[AR_NAME], SYMDEF);
	ip = &Arh[AR_SIZE];
	ip[0] = isize;
	ip[1] = isize >> 8;
	if (fwrite(Arh, 1, ARH_LEN, tmp) != ARH_LEN) writeerr();
	fclose(arc);
	fclose(tmp);
	remove(name);
	if (rename(ARTMP, name))
		quit("rename failed, archive saved in", ARTMP);
}

void usage(void) {
	printf("usage:\tsar -c [-v] archive file ...\n");
	printf("\tsar -c [-v] -f listfile archive\n");
	printf("\tsar -t [-v] archive\n");
	printf("\tsar -x [-v] archive [ member ... ]\n");
	printf("\tsar -r [-v] archive\n");
	exit(1);
}

int main(int argc, char **argv) {
	FILE	*list, *arc;
	char	*p, *aname, fname[81];
	char	*listfile;
	int	verbose;
	int	a_creat, a_toc, a_extr, a_ran;
	int	i;

	a_creat = a_toc = a_extr = a_ran = 0;
	verbose = 0;
	listfile = NULL;
	for (i=1; i<argc && *argv[i] == '-'; i++) {
		p = argv[i];
		p++;
		while (*p) switch(*p++) {
			case 'v':	verbose = 1; break;
			case 'c':	a_creat++; break;
			case 't':	a_toc++; break;
			case 'x':	a_extr++; break;
			case 'r':	a_ran++; break;
			case 'f':	if (*p == 0) {
						if ((p = argv[++i]) == NULL)
							usage();
					}
					listfile = p;
					p += strlen(p);
					break;
			default:	usage();
		}
	}
	if (i >= argc) usage();
	if (a_creat + a_toc + a_extr + a_ran != 1) usage();
	if (a_creat) {
		if (i+1 >= argc && listfile == NULL) usage();
		if ((arc = fopen(aname = argv[i], "wb")) == NULL)
			quit("cannot create", p);
		i++;
		if (verbose) printf("creating archive: %s\n", aname);
		if (listfile) {
			if ((list = fopen(listfile, "r")) == NULL) {
				fclose(arc);
				remove(aname);
				quit("no such file", listfile);
			}
			fgets(fname, 81, list);
			while (!feof(list)) {
				fname[strlen(fname)-1] = 0;
				if (verbose) printf("+ %s\n", fname);
				add(arc, fname);
				fgets(fname, 81, list);
			}
			fclose(list);
		}
		else {
			while (i < argc) {
				p = argv[i++];
				if (verbose) printf("+ %s\n", p);
				add(arc, p);
			}
		}
		fclose(arc);
	}
	else if (a_toc) {
		if ((arc = fopen(aname = argv[i], "rb")) == NULL)
			quit("no such file", p);
		toc(arc, verbose);
		fclose(arc);
	}
	else if (a_extr) {
		if ((arc = fopen(aname = argv[i], "rb")) == NULL)
			quit("no such file", p);
		i++;
		if (i >= argc)
			extract(arc, NULL, verbose);
		else
			extract(arc, &argv[i], verbose);
		fclose(arc);
	}
	else {	/* ranlib */
		ranlib(argv[i], verbose);
	}
	return 0;
}
