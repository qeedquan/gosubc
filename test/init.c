/*
 *	NMH's Simple C Compiler, 2012--2013
 *	C runtime initialization for Unix systems
 */

#include <stdio.h>
#include <errno.h>

int	errno = EOK;

FILE	*_files[FOPEN_MAX];

FILE	*stdin, *stdout, *stderr;

#ifdef debug
pra(x) {
	char	*d;

	d = "0123456789abcdef";
	_write(1, d+((x>>28)&15), 1);
	_write(1, d+((x>>24)&15), 1);
	_write(1, d+((x>>20)&15), 1);
	_write(1, d+((x>>16)&15), 1);
	_write(1, d+((x>>12)&15), 1);
	_write(1, d+((x>> 8)&15), 1);
	_write(1, d+((x>> 4)&15), 1);
	_write(1, d+((x>> 0)&15), 1);
	_write(1, "\n", 1);
}
#endif

void _init(void) {
	int	i;

	for (i=0; i<FOPEN_MAX; i++)
		_files[i] = NULL;
	stdin = fdopen(0, "r");
	stdout = fdopen(1, "w");
	stderr = fdopen(2, "w");
	stdin->mode = _IOLBF;
	stdout->mode = _IOLBF;
	stderr->mode = _IOLBF;
}
