/*
 *	NMH's Simple C Compiler, 2012
 *	fgetpos()
 */

#include <stdio.h>

int fgetpos(FILE *f, int *pos) {
	int	n;

	if ((n = ftell(f)) < 0) return -1;
	*pos = n;
	return 0;
}
