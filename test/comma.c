#include <stdio.h>

int
main()
{
	int g = 2;
	g     = (1 < (0, 1));
	printf("%d\n", g);
	return 0;
}
