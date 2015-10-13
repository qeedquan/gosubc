#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define boolean char

static void nsieve(int m) {
	int	count = 0, i, j;
	boolean	*flags;

	flags = malloc(m * sizeof(boolean));
	memset(flags, 1, m);
	for (i = 2; i < m; ++i) {
		if (flags[i]) {
			++count;
			for (j = i << 1; j < m; j += i)
				flags[j] = 0;
		}
	}
	free(flags);
	printf("primes up to %8d %8d\n", m, count);
}

int main(int argc, char *argv[]) {
	int	m;

	m = atoi(argv[1]);
	nsieve(10000 << m);
	return 0;
}
