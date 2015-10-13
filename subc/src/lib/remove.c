/*
 *	NMH's Simple C Compiler, 2011,2012
 *	remove()
 */

#include <unistd.h>

int remove(char *path) {
	return _unlink(path);
}
