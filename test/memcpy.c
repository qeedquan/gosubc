/*
 *	NMH's Simple C Compiler, 2011,2012
 *	memcpy()
 */

#include <string.h>

void *memcpy(void *d, void *s, int n) {
	char	*p;

	p = d;
	while (n--) *p++ = *(char *)s++;
	return d;
}
