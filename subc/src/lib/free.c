/*
 *	NMH's Simple C Compiler, 2011,2012
 *	free()
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern int	*_arena, _asize;

void free(void *p) {
	int	*pi;

	if (NULL == p) return;
	pi = p;
	if (pi < _arena || _arena + _asize < pi || pi[-1] >= 0) {
		_write(2, "bad pointer in free()\n", 22);
		abort();
	}
	--pi;
	*pi = -*pi;
}
