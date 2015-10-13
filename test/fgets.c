/*
 *	NMH's Simple C Compiler, 2012,2014
 *	fgets()
 */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int _refill(FILE *f);

static char *fgets_raw(char *s, int len, FILE *f) {
	char	*p;

	p = s;
	while (len-- > 1) {
		if (_read(f->fd, p, 1) != 1) {
			errno = EIO;
			return NULL;
		}
		if ('\n' == *p++) break;
	}
	*p = 0;
	return s;
}

char *fgets(char *s, int len, FILE *f) {
	int	k;
	char	*p, *buf, *pn;

	if ((f->iom & _FREAD) == 0) return NULL;
	if (f->iom & _FERROR) return NULL;
	f->last = _FREAD;
	p = s;
	if (f->ch != EOF) {
		*p++ = f->ch;
		f->ch = EOF;
		len--;
	}
	if ((f->mode & _IOACC) == _IONBF)
		return fgets_raw(s, len, f);
	buf = f->buf;
	pn = NULL;
	while (len > 1 && NULL == pn) {
		if (!_refill(f))
			return NULL;
		if ((pn = memchr(buf + f->ptr, '\n', f->end - f->ptr)) != NULL)
			k = pn - buf - f->ptr + 1;
		else
			k = f->end - f->ptr;
		if (len-1 < k) k = len-1;
		memcpy(p, buf + f->ptr, k);
		f->ptr += k;
		p += k;
		len -= k;
	}
	*p = 0;
	return s;
}
