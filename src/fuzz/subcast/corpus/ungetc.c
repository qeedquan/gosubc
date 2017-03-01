/*
 *	NMH's Simple C Compiler, 2012
 *	ungetc()
 */

#include <stdio.h>
#include <unistd.h>

int ungetc(int c, FILE *f) {
	if (f->ch != EOF) return EOF;
	f->iom &= ~_FERROR;
	return f->ch = c;
}
