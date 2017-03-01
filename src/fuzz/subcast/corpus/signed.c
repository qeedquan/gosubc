#include <stdio.h>

int main(void)
{
	char x;

	x = -2;
	if (x > 3)
		printf("char is unsigned\n");
	if (x == 254)
		printf("wrapped\n");
	printf("%d\n", x);
	return 0;
}
