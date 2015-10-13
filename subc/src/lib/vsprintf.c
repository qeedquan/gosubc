/*
 *	NMH's Simple C Compiler, 2014
 *	vsprintf()
 */

#include <stdio.h>

extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);

int vsprintf(char *buf, char *fmt, void **args) {
	return _vformat(0, 0, buf, fmt, args);
}
