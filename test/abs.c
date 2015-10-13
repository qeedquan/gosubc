/*
 *	NMH's Simple C Compiler, 2011
 *	abs()
 */

#include <stdlib.h>

int abs(int n) {
	return n<0? -n: n;
}
