/*
 *	NMH's Simple C Compiler, 2012,2014
 *	scanf()
 */

#include <stdio.h>

extern int _vscan(int mode, void *dest, char *fmt, void **varg);

int scanf(char *fmt, ...) {
	return _vscan(1, stdin, fmt, (void **) &fmt + 1);
}
