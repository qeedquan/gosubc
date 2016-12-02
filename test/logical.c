#include <stdio.h>
int
main()
{
	int i = 2;
	printf("%d\n", (4 || 3) + (i > 1));
	return 0;
}
