/*
 *	NMH's Simple C Compiler, 2012
 *	clearerr()
 */

#include <stdio.h>

void clearerr(FILE *f) {
	f->iom &= ~_FERROR;
}
