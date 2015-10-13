/*
 *	NMH's Simple C Compiler, 2011,2012
 *	strdup()
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *strdup(char *s) {
	char	*p;

	if ((p = malloc(strlen(s)+1)) == NULL)
		return NULL;
	strcpy(p, s);
	return p;
}
