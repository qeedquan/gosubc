/*
 *	NMH's Simple C Compiler, 2014
 *	system() for DOS
 */

#include <stdlib.h>
#include <stdio.h>

system(char *cmd) {
	void	*parmb[11];
	char	cmdln[129];
	char	fcb1[16], fcb2[16];
	char	*shell;

	if ((shell = getenv("COMSPEC")) == NULL)
		return -1;
	parmb[0] = NULL;
	parmb[1] = cmdln;
	parmb[3] = fcb1;
	parmb[5] = fcb2;
	strcpy(cmdln, "X/c ");
	if (strlen(cmd) > 124) return -1;
	strcat(cmdln, cmd);
	cmdln[0] = strlen(cmdln+1);
	return _system(shell, parmb);
}
