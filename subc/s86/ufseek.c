#include <stdio.h>

#define K16	16384

void ufseek(FILE *fd, int pos, int how) {
	if (pos < 0) {
		fseek(fd, K16, how);
		pos -= K16;
		how = SEEK_CUR;
		fseek(fd, K16, how);
		pos -= K16;
	}
	fseek(fd, pos, how);
}
