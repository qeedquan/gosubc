/*
 *	NMH's Simple C Compiler, 2011,2012
 *	strcpy()
 */

#include <string.h>

char *strcpy(char *d, char *s) {
	char	*p;

	p = d;
	while (*s) *p++ = *s++;
	*p = 0;
	return d;
}
