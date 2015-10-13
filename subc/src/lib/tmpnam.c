/*
 *	NMH's Simple C Compiler, 2012
 *	tmpnam()
 */

#include <stdio.h>
#include <string.h>

char *tmpnam(char *buf) {
	static int	id = 0;
	static char	tmp[L_tmpnam];
	FILE		*f;

	for (;;) {
		sprintf(tmp, "tmp%04x", id);
		if (++id > 32766) return NULL;
		if ((f = fopen(tmp, "r")) == NULL) {
			if (buf) {
				strcpy(buf, tmp);
				return buf;
			}
			return tmp;
		}
		fclose(f);
	}
}
