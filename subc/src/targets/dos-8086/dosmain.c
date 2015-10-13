/*
 *	NMH's Simple C Compiler, 2014
 *	Minimal compiler controller for DOS
 */

#include "defs.h"
#define extern_
 #include "data.h"
#undef extern_
#include "decl.h"

char	*Asmfile;

void cleanup(void) {
	remove(Asmfile);
}

static void cmderror(char *s, char *a) {
	fprintf(stderr, "sccmain: ");
	fprintf(stderr, s, a);
	fputc('\n', stderr);
	exit(EXIT_FAILURE);
}

static void compile(char *infile, char *outfile, char *def) {
	init();
	defarg(def);
	if ((Infile = fopen(infile, "r")) == NULL)
		cmderror("no such file: %s", infile);
	if ((Outfile = fopen(outfile, "r")) != NULL)
		cmderror("will not overwrite file: %s",
			outfile);
	if ((Outfile = fopen(outfile, "w")) == NULL)
		cmderror("cannot create file: %s", outfile);
	genprelude();
	Token = scan();
	while (XEOF != Token)
		top();
	genpostlude();
	fclose(Infile);
	fclose(Outfile);
}

int main(int argc, char **argv) {
	if (argc < 3 || argc > 4) {
		fprintf(stderr, "usage: sccmain file.c file.s");
		exit(1);
	}
	Asmfile = argv[2];
	compile(argv[1], argv[2], argv[3]);
	return EXIT_SUCCESS;
}
