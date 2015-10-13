/*
 *	NMH's Simple C Compiler, 2012,2014
 *	fprintf()
 */

#include <stdio.h>

extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);

int fprintf(FILE *f, char *fmt, ...) {
	return _vformat(1, 0, f, fmt, (void **) &fmt + 1);
}
