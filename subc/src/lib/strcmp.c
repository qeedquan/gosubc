/*
 *	NMH's Simple C Compiler, 2011,2012
 *	strcmp()
 */

#include <string.h>

int strcmp(char *s1, char *s2) {
	while (*s1 && *s1 == *s2)
		s1++, s2++;
	return *s1 - *s2;
}
