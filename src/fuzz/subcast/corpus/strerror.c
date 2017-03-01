/*
 *	NMH's Simple C Compiler, 2012
 *	strerror()
 */

#include <string.h>
#include <errno.h>

char *strerror(int err) {
	switch (err) {
	case EOK:	return "no error";
	case ENOENT:	return "no such file";
	case EACCESS:	return "access denied";
	case EIO:	return "input/output error";
	case ENFILE:	return "too many open files";
	case EINVAL:	return "invalid argument";
	case ENOMEM:	return "out of memory";
	default:	return "unknown error";
	}
}
