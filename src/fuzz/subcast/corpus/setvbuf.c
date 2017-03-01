/*
 *	NMH's Simple C Compiler, 2012
 *	setvbuf()
 */

#include <stdio.h>
#include <stdlib.h>

static void freebuf(FILE *f) {
	if (f->buf != NULL && (f->mode & _IOUSR) == 0)
		free(f->buf);
}

int setvbuf(FILE *f, char *buf, int mode, int size) {
	if (0 == size) size = BUFSIZ;
	if (buf) {
		freebuf(f);
		f->mode = mode | _IOUSR;
	}
	else {
		if (_IONBF != mode)
			if ((buf = malloc(size)) == NULL)
				return EOF;
		freebuf(f);
		f->mode = mode;
	}
	f->buf = buf;
	f->size = size;
	return 0;
}
