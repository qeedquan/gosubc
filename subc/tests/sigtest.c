/*
 * Ad-hoc signal() test
 * Nils M Holm, 2014
 * In the public domain
 */

#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

int	Errors = 0;

void fail(char *name) {
	puts(name);
	puts(" failed!");
	Errors++;
}

volatile caught = 0;

int catch(void) {
	caught = 1;
}

int main(int argc, char **argv) {
	kprintf(1, "==========================================\n");
	kprintf(1, "This test may result in a core dump.\n");
	kprintf(1, "If it does, see the signal() function of\n");
	kprintf(1, "your lib/crt0.s file for hints.\n");
	kprintf(1, "If there are none, please mail the author!\n");
	kprintf(1, "==========================================\n");
	signal(SIGABRT, catch);
	raise(SIGABRT);
	if (!caught) fail("signal-1");
	caught = 0;
	signal(SIGABRT, SIG_IGN);
	raise(SIGABRT);
	if (caught) fail("signal-1");
	return Errors? EXIT_FAILURE: EXIT_SUCCESS;
}
