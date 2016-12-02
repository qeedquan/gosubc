#include <stdio.h>

int
main()
{
	int g = 2;
	g     = (1 < (0, 1));
	printf("%d\n", g);
	g     = (1 < (0, 2));
	printf("%d\n", g);
	g     = (1 < (0, 3));
	printf("%d\n", g);
	g     = (1 < (0, 4));
	printf("%d\n", g);
	return 0;
}
