/*
 *	NMH's Simple C Compiler, 2012,2014
 *	fputs()
 */

#include <stdio.h>
#include <string.h>

int _fwrite(char *p, int len, FILE *f);

int fputs(char *s, FILE *f) {
	int	k;

	k = strlen(s);
#ifdef __dos
	if (_faddcr && '\n' == s[k-1] && (f == stdout || f == stderr)) {
		if (_fwrite(s, k-1, f) != k-1)
			return EOF;
		return fputc('\n', f);
	}
	else
#endif
	if (_fwrite(s, k, f) != k)
		return EOF;
	return k;
}
