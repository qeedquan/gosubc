/*
 *	NMH's Simple C Compiler, 2012
 *	fflush()
 */

#include <stdio.h>
#include <unistd.h>
#include <errno.h>

static int _fflush(FILE *f) {
	int	p, e;

	if (f->iom & _FERROR) return 0;
	f->ch = EOF;
	if (f->last != _FWRITE) {
		f->ptr = f->end = 0;
		return 0;
	}
	if ((f->mode & _IOACC) == _IONBF) return 0;
	p = f->ptr;
	e = f->end;
	f->ptr = f->end = 0;
	if (e-p == 0 || _write(f->fd, f->buf + p, e-p) == e-p)
		return 0;
	errno = EIO;
	return -1;
}

extern FILE	*_files[];

int fflush(FILE *f) {
	int	i, rc = 0;

	if (f != NULL) return _fflush(f);
	for (i = 0; i < FOPEN_MAX; i++)
		if (!_fflush(_files[i])) rc = -1;
	return rc;
}
