/*
 *	NMH's Simple C Compiler, 2012
 *	calloc()
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void *calloc(int count, int size) {
	void	*p;

	if ((p = malloc(count * size)) == NULL)
		return NULL;
	memset(p, 0, count * size);
	return p;

}
