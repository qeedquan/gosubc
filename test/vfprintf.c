/*
 *	NMH's Simple C Compiler, 2014
 *	vfprintf()
 */

#include <stdio.h>

extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);

int vfprintf(FILE *f, char *fmt, void **args) {
	return _vformat(1, 0, f, fmt, args);
}
