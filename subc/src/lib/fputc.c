/*
 *	NMH's Simple C Compiler, 2011,2012,2014
 *	fputc()
 */

#include <stdio.h>
#include <unistd.h>
#include <errno.h>

int _fsync(FILE *f);

int fputc(int c, FILE *f) {
	char	b[1];

#ifdef __dos
	if (_faddcr && '\n' == c && (f == stdout || f == stderr))
		fputc('\r', f);
#endif
	if ((f->iom & _FWRITE) == 0)
		return EOF;
	if (f->iom & _FERROR)
		return EOF;
	f->last = _FWRITE;
	if ((f->mode & _IOACC) == _IONBF) {
		*b = c;
		if (_write(f->fd, b, 1) == 1)
			return c;
		else {
			errno = EIO;
			return EOF;
		}
	}
	if (f->end >= f->size)
		if (!_fsync(f))
			return EOF;
	f->buf[f->end++] = c;
	if ((f->mode & _IOACC) == _IOLBF)
		if (!_fsync(f))
			return EOF;
	return c;
}
