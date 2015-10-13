/*
 *	NMH's Simple C Compiler, 2011,2012
 *	fopen()
 */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int _openfd(char *path, char *mode) {
	int	i, plus, fd = -1;

	plus = strchr(mode, '+')? 1: 0;
	if ('w' == *mode) {
		fd = _creat(path, 0666);
		if (fd < 0) errno = EACCESS;
		if (fd >= 0 && plus) {
			_close(fd);
			fd = _open(path, 2);
		}
	}
	else if ('r' == *mode) {
		fd = _open(path, plus? 2: 0);
		if (fd < 0) errno = ENOENT;
	}
	else if ('a' == *mode) {
		fd = _open(path, plus? 2: 1);
		if (fd < 0) {
			fd = _creat(path, 0644);
			if (fd < 0) errno = EACCESS;
			_close(fd);
			fd = _open(path, plus? 2: 1);
		}
		_lseek(fd, 0, SEEK_END);
	}
	else {
		errno = EINVAL;
	}
	return fd;
}

FILE *fopen(char *path, char *mode) {
	int	fd;
	FILE	*f;

	fd = _openfd(path, mode);
	if (fd < 0) return NULL;
	return fdopen(fd, mode);
}
