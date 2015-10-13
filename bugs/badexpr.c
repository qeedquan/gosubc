/* both compiler miscompile this at the moment */

int
main(void)
{
	int x = 0;
	x < 256; /* miscompiled, cause a crash */
	return 0;
}
