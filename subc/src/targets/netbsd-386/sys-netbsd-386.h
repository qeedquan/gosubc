/*
 *	NMH's Simple C Compiler, 2016
 *	NetBSD/386 environment
 */

#define OS		"NetBSD"
#define ASCMD		"as -o %s %s"
#define LDCMD		"ld -o %s %s/lib/%scrt0.o"
#define SYSLIBC		""
