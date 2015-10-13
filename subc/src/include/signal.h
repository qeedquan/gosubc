/*
 *	NMH's Simple C Compiler, 2012
 *	signal.h
 */

#define SIGINT	2
#define SIGILL	4
#define SIGABRT	6
#define SIGFPE	8
#define SIGSEGV	11
#define SIGTERM	15

#define SIG_DFL	(int(*)())0
#define SIG_IGN	(int(*)())1
#define SIG_ERR	(int(*)())2

int	raise(int sig);
int	signal(int sig, int (*handler)());
