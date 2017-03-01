/*
 *	NMH's Simple C Compiler, 2012
 *	feof()
 */

#include <stdio.h>

int feof(FILE *f) {
	return (f->iom & _FERROR) != 0;
}
