/*
 *	NMH's Simple C Compiler, 2012
 *	qsort()
 */

#include <stdlib.h>

/* In fact we are using the shellsort algorithm (TCPL, ed2, pg62) */

void qsort(void *list, int count, int size, int (*cmp)()) {
	int	gap, i, j, k, tmp;
	char	*p, *x1, *x2;

	p = list;
	for (gap = count/2; gap > 0; gap /= 2) {
		for (i = gap; i < count; i++) {
			for (j = i-gap; j >= 0; j -= gap) {
				if (cmp(p+j*size, p+(j+gap)*size) <= 0)
					break;
				x1 = p + j * size;
				x2 = p + (j+gap) * size;
				for (k = 0; k < size; k++) {
					tmp = x1[k];
					x1[k] = x2[k];
					x2[k] = tmp;
				}
			}
		}
	}
}
