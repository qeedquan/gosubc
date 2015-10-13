/*
 *	NMH's Simple C Compiler, 2012
 *	perror()
 */

#include <stdio.h>
#include <string.h>
#include <errno.h>

void perror(char *msg) {
	fprintf(stderr, "%s: %s\n", msg, strerror(errno));
}
