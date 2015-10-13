/*
 *	NMH's Simple C Compiler, 2011,2012,2014
 *	strncpy()
 */

#include <string.h>

char *strncpy(char *d, char *s, int n) {
	char	*p;

	for (p = d; n && *s; n--)
		*p++ = *s++;
	while (n--) *p++ = 0;
	return d;
}
