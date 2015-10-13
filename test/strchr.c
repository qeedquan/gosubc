/*
 *	NMH's Simple C Compiler, 2011
 *	strchr()
 */

#include <stdio.h>
#include <string.h>

char *strchr(char *s, int c) {
	while (*s && *s != c)
		s++;
	return *s || !c? s: NULL;
}
