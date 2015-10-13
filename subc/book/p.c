#include <stdio.h>

#define	MAX 20000

main() {
	int	i, j, p[MAX], k, ref = 0;

	for (k=0, i=3; k<MAX; i+=2) {
		for (j=0; j<k; j++) {
			ref++;
			if (i % p[j] == 0)
				break;
		}
		if (j < k) continue;
		ref++;
		p[k++] = i;
	}
	printf("%d %d\n", p[k-1], ref);
}
