/*
 *	NMH's Simple C Compiler, 2012
 *	fgetc()
 */

#include <stdio.h>
#include <unistd.h>
#include <errno.h>

int _refill(FILE *f);

int fgetc(FILE *f) {
	char	c, b[1];

	if ((f->iom & _FREAD) == 0)
		return EOF;
	if (f->iom & _FERROR)
		return EOF;
	f->last = _FREAD;
	if (f->ch != EOF) {
		c = f->ch;
		f->ch = EOF;
		return c;
	}
	if ((f->mode & _IOACC) == _IONBF)
		if (_read(f->fd, b, 1) == 1)
			return *b;
		else {
			errno = EIO;
			return EOF;
		}
	if (f->ptr >= f->end)
		if (!_refill(f))
			return EOF;
	return f->buf[f->ptr++];
}
