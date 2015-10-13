/*
 *	NMH's Simple C Compiler, 2012
 *	strtol()
 */

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>

int strtol(char *s, char **endp, int base) {
	int	sign = 1, ok = 0;
	char	*p, *digits, *src;
	int	v = 0;

	if (base < 0 || base > 36) {
		errno = EINVAL;
		return 0;
	}
	src = s;
	while (isspace(*s)) s++;
	if ('-' == *s) sign = -1, s++;
	else if ('+' == *s) s++;
	if ((0 == base || 16 == base) && '0' == *s && 'x' == s[1]) {
		base = 16;
		s += 2;
	}
	else if ((0 == base || 8 == base) && '0' == *s) {
		base = 8;
		s++;
	}
	if (0 == base) base = 10;
	digits = "0123456789abcdefghijklmnopqrstuvwxyz";
	for (;;) {
		p = strchr(digits, tolower(*s));
		if (!p || p - digits >= base) break;
		v = v * base + p - digits;
		s++;
		ok = 1;
	}
	if (endp) *endp = ok? s: src;
	return v * sign;
}
