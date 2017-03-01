/*
 *	NMH's Simple C Compiler, 2012
 *	tmpfile()
 */

#include <stdio.h>

FILE *tmpfile(void) {
	FILE	*f;
	char	s[L_tmpnam];

	if (tmpnam(s) == NULL) return NULL;
	if ((f = fopen(s, "w+")) == NULL) return NULL;
	remove(s);
	return f;
}
