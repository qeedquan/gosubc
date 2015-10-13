/*
 *	NMH's Simple C Compiler, 2011,2012
 *	rename()
 */

#include <unistd.h>

int rename(char *old, char *new) {
	return _rename(old, new);
}
