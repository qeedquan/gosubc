/*
 *	NMH's Simple C Compiler, 2011,2014
 *	ctype functions
 */

#include <ctype.h>

enum {
	U = 0x01,	/* upper case */
	L = 0x02,	/* lower case */
	C = 0x04,	/* control */
	D = 0x08,	/* decimal */
	X = 0x10,	/* hex letter */
	P = 0x20,	/* punctuation */
	S = 0x40,	/* space */
	G = 0x80	/* graph */
};

static char ctypes[] = {
	C,	C,	C,	C,	C,	C,	C,	C,
	C,	C|S,	C|S,	C|S,	C|S,	C|S,	C,	C,
	C,	C,	C,	C,	C,	C,	C,	C,
	C,	C,	C,	C,	C,	C,	C,	C,
	S,	G|P,	G|P,	G|P,	G|P,	G|P,	G|P,	G|P,
	G|P,	G|P,	G|P,	G|P,	G|P,	G|P,	G|P,	G|P,
	G|D,	G|D,	G|D,	G|D,	G|D,	G|D,	G|D,	G|D,
	G|D,	G|D,	G|P,	G|P,	G|P,	G|P,	G|P,	G|P,
	G|P,	G|U|X,	G|U|X,	G|U|X,	G|U|X,	G|U|X,	G|U|X,	G|U,
	G|U,	G|U,	G|U,	G|U,	G|U,	G|U,	G|U,	G|U,
	G|U,	G|U,	G|U,	G|U,	G|U,	G|U,	G|U,	G|U,
	G|U,	G|U,	G|U,	G|P,	G|P,	G|P,	G|P,	G|P,
	G|P,	G|L|X,	G|L|X,	G|L|X,	G|L|X,	G|L|X,	G|L|X,	G|L,
	G|L,	G|L,	G|L,	G|L,	G|L,	G|L,	G|L,	G|L,
	G|L,	G|L,	G|L,	G|L,	G|L,	G|L,	G|L,	G|L,
	G|L,	G|L,	G|L,	G|P,	G|P,	G|P,	G|P,	C,
	};

int isalnum(int c) { return 0 != (ctypes[c & 127] & (D|U|L)); }
int isalpha(int c) { return 0 != (ctypes[c & 127] & (U|L)); }
int iscntrl(int c) { return 0 != (ctypes[c & 127] & C); }
int isdigit(int c) { return 0 != (ctypes[c & 127] & D); }
int isgraph(int c) { return 0 != (ctypes[c & 127] & G); }
int islower(int c) { return 0 != (ctypes[c & 127] & L); }
int isprint(int c) { return ' ' == c || isgraph(c); }
int ispunct(int c) { return 0 != (ctypes[c & 127] & P); }
int isspace(int c) { return 0 != (ctypes[c & 127] & S); }
int isupper(int c) { return 0 != (ctypes[c & 127] & U); }
int isxdigit(int c){ return 0 != (ctypes[c & 127] & (D|X)); }

int tolower(int c) {
	return isupper(c)? c - 'A' + 'a': c;
}

int toupper(int c) {
	return islower(c)? c - 'a' + 'A': c;
}
