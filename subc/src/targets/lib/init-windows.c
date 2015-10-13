/*
 *	NMH's Simple C Compiler, 2013,2014
 *	CRT initialization and Windows to posix wrapper.
 */

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <limits.h>
#include <windows.h>
#include <stdio.h>
#include <errno.h>

int	errno = EOK;

FILE	*_files[FOPEN_MAX];

FILE	*stdin, *stdout, *stderr;

char	**environ;

static void	*_openfiles[OPENMAX];

extern int	main(int argc, char *argv[]);

void _init(void) {
	int	i;

	for (i=0; i<FOPEN_MAX; i++)
		_files[i] = NULL;
	stdin = fdopen(0, "r");
	stdout = fdopen(1, "w");
	stderr = fdopen(2, "w");
	stdin->mode = _IOLBF;
	stdout->mode = _IOLBF;
	stderr->mode = _IOLBF;
}

static char **cmd2arg(char *cmd, int *argc) {
	char	*p;
	int	a;
	int	b;
	int	q;
	char	**ret;
	char	buf[2048];
	int	i;

	p = cmd;
	a = 2;
	while (*p) {
		if (*p == ' ') a++;
		p++;
	}
	ret = malloc(a * sizeof(char**));
	p = cmd;
	i = 0;
	a = 0;
	q = 0;
	while (*p) {
		b = 0;
		while (*p == '\\') {
			b++;
			p++;
		} 
		if (b != 0) {
			if (*p == '"') b = b >> 1;
			while (b > 0) { 
				buf[i] = '\\';
				i++;
				b--;
			}
			buf[i] = *p;
			i++;
			p++;
			continue;
		}
		if (q == 0) {
			if (*p == ' ') {
				buf[i] = '\0';
				ret[a] = strdup(buf);
				a++;
				i = 0;
				while (*(p + 1) == ' ') p++;
			}
			else if (*p == '"') {
				q = 1;
			}
			else { 
				buf[i] = *p;
				i++;
			}
		}
		else {
			if (*p == '"') {
				q = 0;
			}
			else {
				buf[i] = *p;
				i++;
			}
		}
		p++;
	}
	if (i > 0) {
		buf[i] = '\0';
		ret[a] = strdup(buf);
		a++;
	}
	ret[a] = (char*) 0;
	*argc = a;
	return ret;
}

char **split_env(char *env) {
	char	**ret;
	char	*p;
	int	n;

	p = env;
	n = 0;
	while (*p) {
		while (*p) p++;
		n++;
		p++;
	}
	ret = malloc((n + 1) * sizeof(char**));
	if (ret == (char**) 0) return (char**) 0;
	p = env;
	n = 0;
	while (*p) {
		ret[n] = p;
		while (*p) p++;
		n++;
		p++;
	}
	ret[n] = (char*) 0;
	return ret;
}

void mainCRTStartup(void) {
	int	ret;
	char	**argv;
	int	argc;
	int	i;
	char	*e;

	for (i = 3;i < OPENMAX; i++) {
		_openfiles[i] = (void*)-1;
	}
	_openfiles[0] = GetStdHandle(-10);
	_openfiles[1] = GetStdHandle(-11);
	_openfiles[2] = GetStdHandle(-12);
	e = GetEnvironmentA();
	environ = split_env(e); 
	e = GetCommandLineA();
	argv = (void*)cmd2arg((char*) e, (int*) &argc);
	_init();
	ret = main(argc, argv);
	exit(ret);
}

int _unlink(char *path) {
	int	ret;

	ret = DeleteFileA(path);
	if (ret == 0) return -1;
	return 0;
}

int _creat(char *path, int mode) {
	int	ret;
	int	fd = 0;

	while ((fd < OPENMAX) && ((int)_openfiles[fd] != -1))
		fd++;
	if (fd >= OPENMAX) return -1;
	_openfiles[fd] = CreateFileA(path, 0x10000000, 0, (void*)0,
					2, 0, (void*)0);
	if ((int)_openfiles[fd] == -1)
		return -1;
	return fd;
}

int _open(char *path, int flags) {
	int	fd = 0;
	int	create = 0;
	int	rw = 0;

	while ((fd < OPENMAX) && ((int)_openfiles[fd] != -1))
		fd++;
	if (fd >= OPENMAX) return -1;
	switch (flags) {
	case 0: /*read*/
		create = 3;
		rw = 0x80000000;
		break;
	case 1: /*write*/
		create = 4;
		rw = 0x40000000;
		break;
	case 2: /*read/write*/
		create = 3;
		rw = 0xC0000000;
		break;
	}
	_openfiles[fd] = CreateFileA(path, rw, 0, (void*)0,
					create, 0x00000080, (void*)0);
	if ((int)_openfiles[fd] == -1)
		return -1;
	return fd;
}

int _lseek(int fd, int pos, int how) {
 	int	ret;
	int	end;
	int 	n;

 	if (fd >= OPENMAX) return -1;
	n = SetFilePointer(_openfiles[fd], pos, (void*)0, how);
	end = SetFilePointer(_openfiles[fd], 0, (void*)0, 2);
	ret = SetFilePointer(_openfiles[fd], n, (void*)0, 0);
	if (ret > end) 
		SetEndOfFile(_openfiles[fd]);
 	return ret;
}

int _read(int fd, void *buf, int len) {
	int	ret;
	int	r = -1;

	if (fd >= OPENMAX) return -1;
	ret = ReadFile(_openfiles[fd], buf, len, &r, (void*)0); 
	if (ret == 0) return -1;
	return r;
}

int _write(int fd, void *buf, int len) {
	int	ret;
	int	w;

	if (fd >= OPENMAX || fd < 0) return -1;
	ret = WriteFile(_openfiles[fd], buf, len, &w, (void*)0); 
	if (ret == 0) return -1;
	return w;
}

int _close(int fd) {
	int	ret;

	if (fd >= OPENMAX) return -1;
	ret = CloseHandle(_openfiles[fd]);
	_openfiles[fd] = (void*)-1;
	if (ret == 0) return -1;
	return 0;
}

int _execve(char *path, char *argv[], char *envp[]) {
	return -1;
}

void _exit(int rc) {
	ExitProcess(rc);
}

int _fork(void) {
	return -1;
}

int _rename(char *old, char *new) {
	int	ret;

	ret = MoveFileA(old, new);
	if (ret == 0) return -1;
	return 0;
}

void *_sbrk(int size) {
	int	osize;
	static void	*h = 0;
	static int	heap_size = 0;
	static char	*heap_mem;

	osize = heap_size;
	heap_size = heap_size + size;
	if (h == (void *) 0) {
		h = HeapCreate(1, 0x40000000, 0);
		if (h == (void*) 0)
			h = GetProcessHeap();
	}
	if (osize == 0) {
		heap_mem = HeapAlloc(h, 0, size);
	}
	else {
		heap_mem = HeapReAlloc(h, 0x00000010, heap_mem, heap_size);
	}
	if (heap_mem == (char*) 0)
		return (void*) -1;
	return heap_mem + osize;
}

static void sub(int *a, int *b) {
	int	i;

	for (i = 0; i < 3; i++) {
		if (a[i] < b[i]) {
			a[i + 1]--;
			a[i] += 0x00010000;
		}
		a[i] = a[i] - b[i];
	}
	a[i] = a[i] - b[i];
}

static void shift_left(int *b) {
	int	i;

	for (i = 3; i > 0; i--) {
		b[i] = ((b[i] << 1) & 0xFFFF) | ((b[i - 1] >> 15) & 0x1);
	}
	b[i] = (b[i] << 1) & 0xFFFF;
}

static void shift_right(int *b) {
	int	i;

	for (i = 0; i < 3; i++) {
		b[i] = (b[i] >> 1) | ((b[i + 1] << 15) & 0x8000);
	}
	b[i] = (b[i] >> 1);
}

static int is_lower(int *a, int *b) {
	int	i;

	for (i = 3; i >= 0; i--) {
		if (a[i] < b[i]) {
			return 1;
		}
		else if (a[i] > b[i]) {
			return 0;
		}
	}
	return 0;
}

static int div(int *a, int *b) {
	int	n = 0;
	int	r = 0;

	while (is_lower(b, a)) {
		if (n & 0x80000000) return 0;
		shift_left(b);
		if (n == 0) {
			n = 1;
		}
		else {
			n = n << 1;
		}
	}
	while (n > 0) {
		shift_right(b);
		if (!is_lower(a, b)) {
			sub(a, b);
			r = r | n;
		}
		n = n >> 1;
	}
	return r;
}

int _time(void) {
	struct _SYSTEMTIME	sysTimeStruct;
	struct _FILETIME	fTime;
	int	big[4];
	int	opr[4];

	GetSystemTime(&sysTimeStruct);
	if (SystemTimeToFileTime(&sysTimeStruct, &fTime)) {
		big[3] = (fTime.dwHighDateTime >> 16) & 0x0000FFFF;
		big[2] = fTime.dwHighDateTime & 0x0000FFFF;
		big[1] = (fTime.dwLowDateTime >> 16) & 0x0000FFFF;
		big[0] = fTime.dwLowDateTime & 0x0000FFFF;
		/* Subtract the value for 1970-01-01 00:00 (UTC) */
		opr[3] = 0x0000019d;
		opr[2] = 0x0000b1de;
		opr[1] = 0x0000d53e;
		opr[0] = 0x00008000;
		sub(big, opr);
		/* convert from 100ns to seconds */
		opr[3] = 0;
		opr[2] = 0;
		opr[1] = (10000000 >> 16) & 0x0000FFFF;
		opr[0] = 10000000  & 0x0000FFFF;
		return div(big, opr);
	}
	return 0;
}

int _wait(int *rc) {
	return -1;
}

int raise(int sig) {
	return -1;
}

int signal(int sig, int (*handler)()) {
	return (int) (SIG_ERR);
}
