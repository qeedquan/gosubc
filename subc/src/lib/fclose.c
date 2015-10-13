/*
 *	NMH's Simple C Compiler, 2012
 *	fclose()
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern FILE	*_files[];

int fclose(FILE *f) {
	int	i;

	if (NULL == f) return EOF;
	if (_FCLOSED == f->iom) return EOF;
	if (_FWRITE == f->last && fflush(f))
		return EOF;
	_close(f->fd);
	if (f->buf != NULL && (f->mode & _IOUSR) == 0)
		free(f->buf);
	for (i=0; i<FOPEN_MAX; i++)
		if (f == _files[i]) {
			_files[i] = NULL;
			break;
		}
	free(f);
	return 0;
}
