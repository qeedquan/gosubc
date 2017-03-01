/*
 *	NMH's Simple C Compiler, 2012
 *	ferror()
 */

#include <stdio.h>

int ferror(FILE *f) {
	return (f->iom & _FERROR) != 0;
}
