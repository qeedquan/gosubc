BEGIN {
	IFS="\t"
}
/^\|/	{
	printf("\treset();\n");
	printf("\tr = (int) (%s);\n", $2);
	split($7, a, ",");
	for (i=1; i<4; i++)
		printf("\tEa[%d] = %s;\n", i-1, a[i]);
	split($8, a, ",");
	for (i=1; i<4; i++)
		printf("\tEp[%d] = (void *) ((int) %s);\n", i-1, a[i]);
	printf "\ttest(\"%s\", (int) %s, (int) %s, (int) %s, (int) %s);\n", \
		$2, $3, $4, $5, $6
	next
}
{
	print $0
}
