/*
 *	NMH's Simple C Compiler, 2012,2014
 *	strtok()
 */

#include <string.h>
#include <stdio.h>

char *strtok(char *s, char *sep) {
	static char	*src = 0;
	char		*p;

	if (NULL == s) s = src;
	while (*s && strchr(sep, *s))
		s++;
	if (!*s) return NULL;
	for (p = s; *s && !strchr(sep, *s); s++)
		;
	if (*s && s[1]) *s++ = 0;
	src = s;
	return p;
}
