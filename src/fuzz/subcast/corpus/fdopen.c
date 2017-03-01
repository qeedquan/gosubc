/*
 *	NMH's Simple C Compiler, 2011,2012
 *	fdopen()
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

int _openmode(char *mode) {
	if (strchr(mode, '+')) return _FREAD | _FWRITE;
	else if ('r' == *mode) return _FREAD;
	else if ('w' == *mode) return _FWRITE;
	else if ('a' == *mode) return _FWRITE;
	return _FCLOSED;
}

extern FILE	*_files[];

FILE *fdopen(int fd, char *mode) {
	int	i;
	FILE	*f;

	for (i = 0; i < FOPEN_MAX; i++)
		if (NULL == _files[i])
			break;
	if (i >= FOPEN_MAX) {
		errno = ENFILE;
		return NULL;
	}
	if ((f = malloc(sizeof(FILE))) == NULL)
		return NULL;
	_files[i] = f;
	f->buf  = NULL;
	f->fd   = fd;
	f->iom  = _openmode(mode);
	f->last = _FCLOSED;
	f->mode = _IOFBF;
	f->ptr  = 0;
	f->end  = 0;
	f->size = 0;
	f->ch   = EOF;
	if (_FCLOSED == f->iom) {
		fclose(f);
		errno = EINVAL;
		return NULL;
	}
	if (setvbuf(f, NULL, _IOFBF, 0) == EOF) {
		fclose(f);
		return NULL;
	}
	return f;
}
