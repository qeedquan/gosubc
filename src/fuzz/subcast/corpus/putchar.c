/*
 *	NMH's Simple C Compiler, 2011,2012
 *	putchar()
 */

#include <stdio.h>

int putchar(int c) {
	return fputc(c, stdout);
}
