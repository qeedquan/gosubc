/*
 *	NMH's Simple C Compiler, 2011,2012
 *	exit()
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

extern int	(*_exitfn)();
extern FILE	*_files[];

void exit(int rc) {
	int	i;

	if (_exitfn) _exitfn();
	for (i = 0; i < FOPEN_MAX; i++)
		fclose(_files[i]);
	_exit(rc);
}
