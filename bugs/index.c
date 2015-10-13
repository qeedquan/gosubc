/* SubC only allows int indices, should implicitly cast these */

int main(void)
{
	char x;
	int a[10];
	x = 0;
	a[x] = 1;
	return 0;
}
