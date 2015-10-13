/*
 *	NMH's Simple C Compiler, 2012
 *	strpbrk()
 */

#include <string.h>
#include <stdio.h>

char *strpbrk(char *s, char *set) {
	while (*s && !strchr(set, *s))
		s++;
	return *s? s: NULL;
}
