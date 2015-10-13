/*
 *	NMH's Simple C Compiler, 2011,2012,2014
 *	sprintf()
 */

#include <stdio.h>
#include <string.h>

extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);

int sprintf(char *buf, char *fmt, ...) {
	return _vformat(0, 0, buf, fmt, (void **) &fmt + 1);
}
