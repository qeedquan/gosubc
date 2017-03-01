/*
 *	NMH's Simple C Compiler, 2012,2014
 *	fscanf()
 */

#include <stdio.h>
#include <string.h>

extern int _vscan(int mode, void *src, char *fmt, void **varg);

int fscanf(FILE *f, char *fmt, ...) {
	return _vscan(1, f, fmt, (void **) &fmt + 1);
}
