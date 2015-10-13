/* should not allow these kind of operators on records */
struct foo
{
	int a, b, c;
};

union k
{
	int x, y, z;
};

int main(void)
{
	struct foo f;
	union k k;
	!f;
	!k;
}
