/* seeems like constant folding for SubC is wrong here */

#include <stdio.h>

int main(void)
{
	int a = 1 >> 2;
	int b = 1 >> 0;
	printf("%d %d\n", a, b);
}
