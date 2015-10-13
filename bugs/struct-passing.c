/* should not be allowed to declare record values, since we can't pass anything to it */
struct file
{
	int x;
};

void foo(struct file f)
{
}

int main(void)
{
}
