/*
 *	NMH's Simple C Compiler, 2011--2014
 *	Windows/386 (MinGW) environment
 */

#define OS		"Windows-MinGW"
#define AOUTNAME	"aout.exe"
#define ASCMD		"as -g -o %s %s"
#define LDCMD		"ld --subsystem console -e _mainCRTStartup -o %s %s/lib/%scrt0.o"
#define SYSLIBC		"c:/mingw/lib/libuser32.a c:/mingw/lib/libkernel32.a c:/mingw/lib/libgdi32.a"
