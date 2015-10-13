/*
 *	NMH's Simple C Compiler, 2013,2014
 *	system() for Windows/386
 */

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <limits.h>
#include <windows.h>
#include <stdio.h>
#include <errno.h>

static char system_buf[0x10000];

int system(char *cmd) {
	char	*p;
	int	ret;
	int	translate = 0;
	struct _STARTUPINFO		si;
	struct _PROCESS_INFORMATION	pi;

	memset(&si, 0, sizeof(struct _STARTUPINFO));
	memset(&pi, 0, sizeof(struct _PROCESS_INFORMATION));
	si.cb = sizeof(struct _STARTUPINFO);
	strcpy(system_buf, "/c ");
	p = system_buf + 3;

	translate = 1;
	while (*cmd) {
		*p = *cmd;
		if (translate && *p == '/')
			*p = '\\';
		else if (*p == ' ')
			translate = 0;
		p++;
		cmd++;
	}
	*p = '\0';
	if (	!CreateProcessA("c:\\windows\\system32\\cmd.exe",
			system_buf, (void*)0, (void*)0,
			0, 0, (void*)0, (void*)0, &si, &pi))
	{
		return -1;
	}
	WaitForSingleObject(pi.hProcess, 0xFFFFFFFF);
	GetExitCodeProcess(pi.hProcess, &ret);
	CloseHandle(pi.hProcess);
	CloseHandle(pi.hThread);
	return ret;
}
