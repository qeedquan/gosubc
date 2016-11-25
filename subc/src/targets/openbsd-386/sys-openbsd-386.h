/*
 *	NMH's Simple C Compiler, 2013-2016
 *	OpenBSD/386 environment
 */

#define OS		"OpenBSD"
#define ASCMD		"as -o %s %s"
#define LDCMD		"ld -static -o %s %s/lib/%scrt0.o"
#define SYSLIBC		"/usr/lib/crtbegin.o /usr/lib/libc.a"
