/*
 *	NMH's Simple C Compiler, 2012
 *	puts()
 */

#include <stdio.h>
#include <string.h>

int _fwrite(char *p, int len, FILE *f);

int puts(char *s) {
	int	k;

	k = strlen(s);
	if (_fwrite(s, k, stdout) != k)
		return EOF;
	return putchar('\n');
}
