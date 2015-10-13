/*
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

char	**Argv;
int	Argc;
int	Fd = 0;
char	Buffer[BUFSIZ];
int	Len = 0;

void wrong(char *s) {
	fprintf(stderr, "sys: %s: wrong arguments\n", s);
	exit(1);
}

int fdatoi(char *s) {
	if (!strcmp(s, "fd"))
		return Fd;
	else
		return atoi(s);
}

char **do_sbrk(char **argv, int *resp) {
	int	n;

	if (argv[1]) {
		n = atoi(argv[1]);
		printf("_sbrk(%d)", n);
		*resp = (int) _sbrk(n);
		return argv + 2;
	}
	else {
		wrong("sbrk");
	}
}

char **do_creat(char **argv, int *resp) {
	int	n;

	if (argv[1] && argv[2]) {
		sscanf(argv[2], "%o", &n);
		printf("_creat(\"%s\",0%o)", argv[1], n);
		Fd = *resp = (int) _creat(argv[1], n);
		return argv + 3;
	}
	else {
		wrong("creat");
	}
}

char **do_open(char **argv, int *resp) {
	int	n;

	if (argv[1] && argv[2]) {
		n = atoi(argv[2]);
		printf("_open(\"%s\",%d)", argv[1], n);
		Fd = *resp = (int) _open(argv[1], n);
		return argv + 3;
	}
	else {
		wrong("open");
	}
}

char **do_write(char **argv, int *resp) {
	int	fd, n;

	if (argv[1] && argv[2] && argv[3]) {
		fd = fdatoi(argv[1]);
		n = atoi(argv[3]);
		printf("_write(%d,\"%s\",%d)", fd, argv[2], n);
		*resp = (int) _write(fd, argv[2], n);
		return argv + 4;
	}
	else {
		wrong("write");
	}
}

char **do_read(char **argv, int *resp) {
	int	fd, n;

	if (argv[1] && argv[2]) {
		fd = fdatoi(argv[1]);
		n = atoi(argv[2]);
		if (n > BUFSIZ) {
			fprintf(stderr,
				"sys: read: buffer too large (max=%d)\n",
				BUFSIZ);
			exit(1);
		}
		printf("_read(%d,buffer,%d)", fd, n);
		Len = *resp = (int) _read(fd, Buffer, n);
		return argv + 3;
	}
	else {
		wrong("read");
	}
}

char **do_buffer(char **argv, int *resp) {
	printf("buffer: -----\n");
	fflush(stdout);
	_write(1, Buffer, Len);
	if (Len) putchar('\n');
	printf("------------- ");
	*resp = Len;
	return argv + 1;
}

char **do_close(char **argv, int *resp) {
	int	n;

	if (argv[1]) {
		n = fdatoi(argv[1]);
		printf("_close(%d)", n);
		*resp = (int) _close(n);
		return argv + 2;
	}
	else {
		wrong("close");
	}
}

char **do_lseek(char **argv, int *resp) {
	int	fd, n, how;

	if (argv[1] && argv[2] && argv[3]) {
		fd = fdatoi(argv[1]);
		n = atoi(argv[2]);
		how = atoi(argv[3]);
		printf("_lseek(%d,%d,%d)", fd, n, how);
		*resp = (int) _lseek(fd, n, how);
		return argv + 4;
	}
	else {
		wrong("lseek");
	}
}

char **do_rename(char **argv, int *resp) {
	if (argv[1] && argv[2]) {
		printf("_rename(\"%s\",\"%s\")", argv[1], argv[2]);
		*resp = (int) _rename(argv[1], argv[2]);
		return argv + 3;
	}
	else {
		wrong("rename");
	}
}

char **do_unlink(char **argv, int *resp) {
	if (argv[1]) {
		printf("_unlink(\"%s\")", argv[1]);
		*resp = (int) _unlink(argv[1]);
		return argv + 2;
	}
	else {
		wrong("unlink");
	}
}

char **do_time(char **argv, int *resp) {
	printf("_time()");
	*resp = (int) _time();
	return argv + 1;
}

char **do_fork(char **argv, int *resp) {
	printf("_fork()");
	*resp = (int) _fork();
	return argv + 1;
}

char **do_wait(char **argv, int *resp) {
	int	rc, n;

	if (argv[1]) {
		n = atoi(argv[1]);
		switch (_fork()) {
		case 0:
			_exit(n);
		case -1:
			fprintf(stderr, "sys: fork() failed!\n");
			exit(1);
		default:
			printf("_wait(&rc)");
			*resp = (int) _wait(&rc);
		}
		printf(" [rc: %d (%x)]", rc, rc);
		return argv + 2;
	}
	else {
		wrong("wait");
	}
}

char **do_exit(char **argv, int *resp) {
	int	n;

	if (argv[1]) {
		n = atoi(argv[1]);
		printf("_exit(%d)\n", n);
		_exit(n);
		fprintf(stderr, "sys: exit() failed!\n");
		return argv + 2;
	}
	else {
		wrong("unlink");
	}
}

char **do_execve(char **argv, int *resp) {
	#define	MAXARGS 10
	int	n;
	char	*a[MAXARGS+1], *prog;

	if (argv[1]) {
		prog = *++argv;
		printf("_execve(\"%s\", args, environ) -----\n", prog);
		n = 0;
		while (*argv) {
			printf("argv[%d]: \"%s\"\n", n, *argv);
			if (n >= MAXARGS) {
				fprintf(stderr, "sys: execve(): too "
						"many arguments (max: 10)\n");
				exit(1);
			}
			a[n++] = *argv++;
		}
		a[n] = NULL;
		printf("-----\n");
		*resp = (int) _execve(prog, a, environ);
		return argv;
	}
	else {
		wrong("execve");
	}
}

char **do_args(void) {
	int	i;

	printf("args -----\nargc = %d\n", Argc);
	for (i=0; i<Argc; i++)
		printf("argv[%d] = \"%s\"\n", i, Argv[i]);
	printf("argv[%d] = %p\n-----\n", i, Argv[i]);
	exit(0);
}

char **do_env(char **argv, int *resp) {
	printf("environ -----\n");
	while (*environ)
		printf("%s\n", *environ++);
	*resp = 0;
	printf("-----");
	return argv+1;
}

char **do_getenv(char **argv, int *resp) {
	if (argv[1]) {
		printf("getenv(\"%s\")", argv[1]);
		*resp = (int) getenv(argv[1]);
		if (*resp)
			printf(" [value: \"%s\"]", *resp);
		else
			printf(" [no value]", *resp);
		return argv + 2;
	}
	else {
		wrong("getenv");
	}
}

char **call(char **argv) {
	int	res;

	if (!strcmp("args", *argv)) argv = do_args();
	else if (!strcmp("buffer", *argv)) argv = do_buffer(argv, &res);
	else if (!strcmp("close", *argv)) argv = do_close(argv, &res);
	else if (!strcmp("creat", *argv)) argv = do_creat(argv, &res);
	else if (!strcmp("env", *argv)) argv = do_env(argv, &res);
	else if (!strcmp("execve", *argv)) argv = do_execve(argv, &res);
	else if (!strcmp("exit", *argv)) argv = do_exit(argv, &res);
	else if (!strcmp("fork", *argv)) argv = do_fork(argv, &res);
	else if (!strcmp("getenv", *argv)) argv = do_getenv(argv, &res);
	else if (!strcmp("lseek", *argv)) argv = do_lseek(argv, &res);
	else if (!strcmp("open", *argv)) argv = do_open(argv, &res);
	else if (!strcmp("read", *argv)) argv = do_read(argv, &res);
	else if (!strcmp("rename", *argv)) argv = do_rename(argv, &res);
	else if (!strcmp("sbrk", *argv)) argv = do_sbrk(argv, &res);
	else if (!strcmp("time", *argv)) argv = do_time(argv, &res);
	else if (!strcmp("unlink", *argv)) argv = do_unlink(argv, &res);
	else if (!strcmp("wait", *argv)) argv = do_wait(argv, &res);
	else if (!strcmp("write", *argv)) argv = do_write(argv, &res);
	else {
		fprintf(stderr, "sys: %s: unknown operation\n", argv[0]);
		exit(1);
	}
	printf(" returned %d (%p)\n", res, res);
	return argv;
}

void usage(int x) {
	printf("Usage: sys command [: ...]\n");
	if (x) exit(0);
}

void longusage(void) {
	putchar('\n');
	usage(0);
	printf(	"\n"
		"command summary:\n\n"
		"args              print arc/argv, ignore other commands\n"
		"buffer            display buffer filled by read()\n"
		"close n           close(n)\n"
		"creat name mode   creat(name,mode), mode is octal\n"
		"env               print environ\n"
		"execve name ...   execve(n), should not return\n"
		"exit n            exit(n), will not return (obviously)\n"
		"fork              fork(), will return in parent and child!\n"
		"getenv name       getenv(name)\n"
		"lseek n pos how   lseek(n,pos,how), how: 0=abs,1=end,2=cur\n"
		"open name flags   open(name,flags), flags: 0=ro,1=wo,2=rw\n"
		"read n len        read(n,buffer,len), buffer is internal\n"
		"rename old new    rename(old,new)\n"
		"sbrk n            sbrk(n)\n"
		"time              time()\n"
		"unlink name       unlink(name)\n"
		"wait n            wait() expect exit code n<<8\n"
		"write n text len  write(n,text,len)\n"
		"\n"
		"'fd' can be used in the place of a numeric file descriptor\n"
		"to refer to a previously open()ed or creat()ed file.\n"
		"\n");
	exit(0);
}

int main(int argc, char **argv) {
	Argc = argc;
	Argv = argv;
	++argv;
	if (!*argv)
		usage(1);
	if (	*argv &&
		(!strcmp(*argv, "-h") ||
		 !strcmp(*argv, "-?"))
	)
		longusage();
	while (*argv) {
		argv = call(argv);
		if (*argv) {
			if (**argv != ':') {
				fprintf(stderr, "sys: arguments left "
						"(missing ':'?)\n");
				exit(1);
			}
			argv++;
		}
	}
}
