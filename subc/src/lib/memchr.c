/*
 *	NMH's Simple C Compiler, 2012
 *	memchr()
 */

#include <stdio.h>
#include <string.h>

void *memchr(void *p, int c, int n) {
	while (n--) {
		if (*(char *)p == c) return p;
		p++;
	}
	return NULL;
}
