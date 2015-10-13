/*
 *	NMH's Simple C Compiler, 2011
 *	getenv()
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *getenv(char *name) {
	char	**p;
	int	k;

	k = strlen(name);
	for (p = environ; *p; p++) {
		if (	strlen(*p) > k &&
			'=' == (*p)[k] &&
			!strncmp(*p, name, k)
		) {
			return (*p) + k+1;
		}
	}
	return NULL;
}
