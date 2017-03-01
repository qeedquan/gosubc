/*
 *	NMH's Simple C Compiler, 2012
 *	rewind()
 */

#include <stdio.h>

void rewind(FILE *f) {
	fseek(f, 0, SEEK_SET);
}
