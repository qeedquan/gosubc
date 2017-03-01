/*
 *	NMH's Simple C Compiler, 2012
 *	fsetpos()
 */

#include <stdio.h>

int fsetpos(FILE *f, int *pos) {
	return fseek(f, *pos, SEEK_SET);
}
