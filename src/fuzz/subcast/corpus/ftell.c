/*
 *	NMH's Simple C Compiler, 2012
 *	ftell()
 */

#include <stdio.h>
#include <unistd.h>
#include <errno.h>

int ftell(FILE *f) {
	int	adjust = 0, pos;

	if ((f->mode & _IOACC) != _IONBF) {
		adjust = f->end - f->ptr;
		if (_FREAD == f->last) {
			adjust = -adjust;
			if (f->ch != EOF) adjust--;
		}
	}
	if ((pos = _lseek(f->fd, 0, SEEK_CUR)) < 0) {
		errno = EIO;
		return -1;
	}
	return pos + adjust;
}
