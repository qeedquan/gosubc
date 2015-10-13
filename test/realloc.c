/*
 *	NMH's Simple C Compiler, 2012,2014
 *	realloc()
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void *realloc(void *p, int size) {
	void    *new;
	int     k;

	if ((new = malloc(size)) == NULL)
		return NULL;
	if (p) {
		k = ((int *) p)[-1];
		if (k >= 0) {
			_write(2, "bad pointer in realloc()\n", 25);
			abort();
		}
		k = (-k-1) * sizeof(int);
		if (size < k) k = size;
		memcpy(new, p, k);
		free(p);
	}
	return new;
}
