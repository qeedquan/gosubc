/*
 *	NMH's Simple C Compiler, 2012,2014
 *	sscanf()
 */

#include <stdio.h>
#include <string.h>

extern int _vscan(int mode, void *src, char *fmt, void **varg);

int sscanf(char *src, char *fmt, ...) {
	return _vscan(0, src, fmt, (void **) &fmt + 1);
}
