/*
 *	NMH's Simple C Compiler, 2011,2012
 *	strncat()
 */

#include <string.h>

char *strncat(char *d, char *a, int n) {
	char	*p;

	for (p = d; *p; p++)
		;
	for (; n && *a; n--)
		*p++ = *a++;
	*p = 0;
	return d;
}
