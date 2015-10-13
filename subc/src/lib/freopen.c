/*
 *	NMH's Simple C Compiler, 2012
 *	freopen()
 */

#include <stdio.h>
#include <unistd.h>
#include <errno.h>

int _openfd(char *path, char *mode);
int _openmode(char *mode);

FILE *freopen(char *path, char *mode, FILE *f) {
	int	fd, om;

	if ((om = _openmode(mode)) == _FCLOSED) {
		errno = EINVAL;
		return NULL;
	}
	if (f->iom & (_FREAD|_FWRITE) == _FREAD|_FWRITE)
		;
	else if (f->iom & _FREAD && *mode != 'r') {
		fclose(f);
		return NULL;
	}
	else if (f->iom & _FWRITE && *mode != 'w' && *mode != 'a') {
		fclose(f);
		return NULL;
	}
	if (path) {
		fd = _openfd(path, mode);
		if (fd < 0) {
			fclose(f);
			return NULL;
		}
		_close(f->fd);
		f->fd = fd;
	}
	f->iom  = om;
	f->last = _FCLOSED;
	f->ptr  = 0;
	f->end  = 0;
	f->ch   = EOF;
	return f;
}
