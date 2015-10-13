/*
 *	NMH's Simple C Compiler, 2011,2012
 *	fwrite()
 */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int _fsync(FILE *f) {
	int	ptr, end, k, pn, p;
	char	*buf;

	if (f->end >= f->size) {
		ptr = f->ptr;
		end = f->end;
		f->end = f->ptr = 0;
		k = _write(f->fd, f->buf + ptr, end-ptr);
		if (k != end-ptr) {
			f->iom |= _FERROR;
			errno = EIO;
			return 0;
		}
	}
	else if ((f->mode & _IOACC) == _IOLBF) {
		ptr = f->ptr;
		end = f->end;
		buf = f->buf;
		pn = -1;
		for (p = ptr; p < end; p++)
			if ('\n' == buf[p]) pn = p+1;
		if (pn >= 0) {
			k = _write(f->fd, f->buf + ptr, pn-ptr);
			f->ptr = pn;
			if (k != pn - ptr) {
				f->iom |= _FERROR;
				errno = EIO;
				return 0;
			}
		}
	}
	return 1;
}

int _fwrite(void *p, int size, FILE *f) {
	int	k, len, total;

	if ((f->iom & _FWRITE) == 0) return 0;
	if (f->iom & _FERROR) return 0;
	f->last = _FWRITE;
	if ((f->mode & _IOACC) == _IONBF) {
		if ((k = _write(f->fd, p, size)) != size) {
			f->iom |= _FERROR;
			errno = EIO;
		}
		return k;
	}
	total = size;
	len = f->size;
	k = len - f->end;
	if (size < k) k = size;
	memcpy(f->buf + f->end, p, k);
	f->end += k;
	size -= k;
	p += k;
	if (!_fsync(f)) return 0;
	while (size > len) {
		if ((k = _write(f->fd, p, len)) != len) {
			f->iom |= _FERROR;
			errno = EIO;
			return total - size;
		}
		p += len;
		size -= len;
	}
	if (size != 0) {
		memcpy(f->buf, p, size);
		f->end = size;
	}
	if ((f->mode & _IOACC) == _IOLBF && !_fsync(f))
		return total-size;
	return total;
}

int fwrite(void *p, int size, int count, FILE *f) {
	int	k;

	if ((k = _fwrite(p, size * count, f)) < 0)
		return -1;
	return k / size;
}
