/*
 *	NMH's Simple C Compiler, 2012,2014
 *	printf()
 */

#include <stdio.h>

extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);

int printf(char *fmt, ...) {
	return _vformat(1, 0, stdout, fmt, (void **) &fmt + 1);
}
