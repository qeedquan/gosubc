/*
 *	NMH's Simple C Compiler, 2011,2012
 *	abort()
 */

#include <stdlib.h>
#include <signal.h>

void abort(void) {
	raise(SIGABRT);
}
