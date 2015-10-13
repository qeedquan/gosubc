/*
 *	NMH's Simple C Compiler, 2012
 *	atexit()
 */

#include <stdlib.h>
#include <errno.h>

int	(*_exitfn)() = 0;

int atexit(int (*fn)()) {
	if (_exitfn) {
		errno = ENOMEM;
		return -1;
	}
	_exitfn = fn;
	return 0;
}
