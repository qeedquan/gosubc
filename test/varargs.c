/*
 *	NMH's Simple C Compiler, 2014
 *	_va_start(), _va_arg(), _va_end()
 */

#include <varargs.h>

/* Expect address of last known argument, return vararg pointer */

void **_va_start(void *last) {
	return (void **) last + 1;
}

/* Extract vararg, advance pointer */

void *_va_arg(void **ap) {
	return *((void **) *ap)++;
}

void _va_end(void **ap) {}
