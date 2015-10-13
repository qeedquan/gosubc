/*
 *	NMH's Simple C Compiler, 2011,2012
 *	memcmp()
 */

#include <string.h>

int memcmp(void *p1, void *p2, int n) {
	while (n-- && *(char *)p1++ == *(char *)p2++)
		;
	return *(char *)--p1 - *(char *)--p2;
}
