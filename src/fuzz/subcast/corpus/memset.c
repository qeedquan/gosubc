/*
 *	NMH's Simple C Compiler, 2011,2012
 *	memset()
 */

#include <string.h>

void *memset(void *p, int c, int n) {
	char	*q;

	q = p;
	while (n--) *(char *)p++ = c;
	return q;
}
