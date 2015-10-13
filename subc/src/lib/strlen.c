/*
 *	NMH's Simple C Compiler, 2011
 *	strlen()
 */

#include <string.h>

int strlen(char *s) {
	char	*p;

	for (p = s; *p; p++)
		;
	return p - s;
}
