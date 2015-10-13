/* SubC compiler will compile this, ours will reject this */
#include <stdio.h>

int main(void)
{
	int x = 1;
	switch (x)
	{
		case 1:
		case 1:
		case 1:
			printf("multiple switch case that are the same\n");
	}
}
