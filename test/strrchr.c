/*
 *	NMH's Simple C Compiler, 2011
 *	strrchr()
 */

#include <stdio.h>
#include <string.h>

char *strrchr(char *s, int c) {
	char	*p;

	p = NULL;
	while (*s)
		if (*s++ == c)
			p = s-1;
	return p;
}
