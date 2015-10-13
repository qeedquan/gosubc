/*
 *	NMH's Simple C Compiler, 2012
 *	atoi()
 */

#include <stdlib.h>
#include <stdio.h>

int atoi(char *s) {
	return strtol(s, NULL, 10);
}
