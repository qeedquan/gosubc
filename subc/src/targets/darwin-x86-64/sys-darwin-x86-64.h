/*
 *	NMH's Simple C Compiler, 2013,2014
 *	Darwin/x86-64 environment
 */

#define OS		"Darwin"
#define ASCMD		"/usr/bin/as -arch x86_64 -g -o %s %s"
#define LDCMD		"/usr/bin/ld -arch x86_64 -macosx_version_min 10.0 -o %s %s/lib/%scrt0.o"
#define SYSLIBC		"/usr/lib/libc.dylib /usr/lib/crt1.o "
