/*
 *	NMH's Simple C Compiler, 2011,2012
 *	strncmp()
 */

#include <string.h>

int strncmp(char *s1, char *s2, int n) {
	while (n && *s1 && *s1 == *s2)
		s1++, s2++, n--;
	return n? *s1 - *s2: 0;
}
