/*
 *	NMH's Simple C Compiler, 2014
 *	Minimal runtime for SubC on DOS
 */

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>

#define NFILE	8
#define NCHAR	1000

static FILE	Filestcs[NFILE];
static char	Buffers[NFILE*BUFSIZ];
static char	Strpool[NCHAR];
static int	Strtop = 0;

int	errno;
FILE	*stdin, *stdout, *stderr;

char *strdup(char *s) {
	int	k;
	char	*p;

	k = strlen(s)+1;
	if (k + Strtop >= NCHAR) return NULL;
	p = &Strpool[Strtop];
	Strtop += k;
	memcpy(p, s, k);
	return p;
}

FILE *fdopen(int fd, char *mode) {
	int	i;
	FILE	*f;

	for (i=0; i<NFILE; i++) {
		if (_FCLOSED == Filestcs[i].mode) {
			f = &Filestcs[i];
			f->iom = f->mode = 'r' == *mode? _FREAD: _FWRITE;
			f->buf = &Buffers[i*BUFSIZ];
			f->fd = fd;
			f->ptr = 0;
			f->end = 0;
			f->size = BUFSIZ;
			f->ch = EOF;
			return f;
		}
	}
	return NULL;
}

FILE *fopen(char *path, char *mode) {
	int	fd;

	if ('w' == *mode) {
		if ((fd = _creat(path, 0644)) < 0)
			return NULL;
	}
	else {
		if ((fd = _open(path, O_RDONLY)) < 0)
			return NULL;
	}
	return fdopen(fd, mode);
}

int fflush(FILE *f) {
	if (_FWRITE == f->mode && f->end)
		_write(f->fd, f->buf, f->end);
	f->end = 0;
	return 0;
}

int _fwrite(void *buf, int len, FILE *f) {
	if (f->size - f->end <= len) {
		memcpy(&f->buf[f->end], buf, len);
		f->end += len;
		return len;
	}
	fflush(f);
	return _write(f->fd, buf, len);
}

int fwrite(void *buf, int size, int count, FILE *f) {
	return _fwrite(buf, size*count, f);
}

int fputc(int c, FILE *f) {
	if (f->end >= f->size) fflush(f);
	f->buf[f->end++] = c;
	return c;
}

int fclose(FILE *f) {
	fflush(f);
	f->mode = _FCLOSED;
	return 0;
}

int fgetc(FILE *f) {
	if (_FERROR == f->iom)
		return EOF;
	if (f->ptr >= f->end) {
		f->end = _read(f->fd, f->buf, BUFSIZ);
		if (f->end < 1) {
			f->iom = _FERROR;
			return EOF;
		}
		f->ptr = 0;
	}
	return f->buf[f->ptr++];
}

char *fgets(char *buf, int len, FILE *f) {
	int	c;
	char	*p;

	p = buf;
	while (len-- > 1) {
		c = fgetc(f);
		if (EOF == c) break;
		*p++ = c;
		if ('\n' == c) break;
	}
	*p = 0;
	return buf;
}

int feof(FILE *f) {
	return _FERROR == f->iom;
}

void exit(int rc) {
	int	i;

	for (i=0; i<NFILE; i++)
		fclose(&Filestcs[i]);
	_exit(rc);
}

void _init(void) {
	int	i;

	for (i=0; i<NFILE; i++)
		Filestcs[i].mode = _FCLOSED;
	stdin = fdopen(0, "r");
	stdout = fdopen(1, "w");
	stderr = fdopen(2, "w");
}
