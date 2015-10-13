/*
 *	NMH's Simple C Compiler, 2011,2012
 *	strcat()
 */

#include <string.h>

char *strcat(char *d, char *a) {
	char	*p;

	for (p = d; *p; p++)
		;
	while (*a) *p++ = *a++;
	*p = 0;
	return d;
}
