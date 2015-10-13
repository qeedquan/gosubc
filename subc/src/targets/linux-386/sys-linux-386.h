/*
 *	NMH's Simple C Compiler, 2013,2014
 *	Linux/386 environment
 */

#define OS		"Linux"
#define ASCMD		"as -o %s %s"
#define LDCMD		"ld -o %s %s/lib/%scrt0.o"
#define SYSLIBC		""
