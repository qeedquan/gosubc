/*
 *	NMH's Simple C Compiler, 2012
 *	bsearch()
 */

#include <stdlib.h>
#include <stdio.h>

void *bsearch(void *key, void *array, int count, int size, int (*cmp)()) {
	void	*p, *end;
	int	r, r2, delta;

	end = array + size * count;
	delta = count/2;
	p = array + delta * size;
	while ((r = cmp(p, key)) != 0 && delta) {
		if (r < 0)
			p += delta * size;
		else
			p -= delta * size;
		delta /= 2;
		if (p < array)
			p = array;
		else if (p >= end)
			p = end - size;
	}
	if (0 == r) return p;
	r2 = r;
	while (r2<0 == r<0 && p >= array && p < end) {
		if (0 == r)
			return p;
		else if (r < 0)
			p += size;
		else
			p -= size;
 		r = cmp(p, key);
	}
	return r? NULL: p;
}
