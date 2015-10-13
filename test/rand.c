/*
 *	NMH's Simple C Compiler, 2012,2014
 *	rand() and srand()
 */

#include <stdlib.h>

static int _seed = 57005;

int rand(void) {
	int	rot;

	rot = ((_seed>>0) ^ (_seed>>2) ^ (_seed>>3) ^ (_seed>>5)) & 1;
	_seed = ((_seed>>1) & 0x7fff) | (rot<<15);
	return _seed;
}

void srand(int n) {
	_seed = n? n & 0xffff: 57005;
}
