/*
 *	NMH's Simple C Compiler, 2011,2012
 *	memmove()
 */

#include <string.h>

void *memmove(void *d, void *s, int n) {
	char	*p;

	if (d < s) return memcpy(d, s, n);
	p = d + n;
	s += n;
	while (n--) *--p = *(char *)--s;
	return d;
}
