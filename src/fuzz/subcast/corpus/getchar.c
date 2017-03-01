/*
 *	NMH's Simple C Compiler, 2012
 *	getchar()
 */

#include <stdio.h>

int getchar(void) {
	return fgetc(stdin);
}
