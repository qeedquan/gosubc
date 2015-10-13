/*
 *	NMH's Simple C Compiler, 2012,2014
 *	kprintf()
 */

#include <unistd.h>

extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);

int kprintf(int fd, char *fmt, ...) {
	return _vformat(-1, 0, (void *) fd, fmt, (void **) &fmt + 1);
}
