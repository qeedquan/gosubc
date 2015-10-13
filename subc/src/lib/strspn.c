/*
 *	NMH's Simple C Compiler, 2012
 *	strspn()
 */

#include <string.h>

int strspn(char *s, char *set) {
	int	i = 0;

	while (*s && strchr(set, *s))
		s++, i++;
	return i;
}
