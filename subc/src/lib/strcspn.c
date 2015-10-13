/*
 *	NMH's Simple C Compiler, 2012
 *	strcspn()
 */

#include <string.h>

int strcspn(char *s, char *set) {
	int	i = 0;

	while (*s && !strchr(set, *s))
		s++, i++;
	return i;
}
