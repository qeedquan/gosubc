/*
 * Quick-and-dirty crt0 test program.
 * Nils M Holm, 2014
 * In the public domain
 *
 * The executable program *must* be called "systest" or
 * the execve() tests will fail!
 *
 * The program will delete the files TESTFILE and
 * TESTFILE2 (below) silently!
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define TESTFILE	"___test.___"
#define TESTFILE2	"___test2.___"

int	verbose = 0;

void error(char *s) {
	kprintf(1, "error: %s\n", s);
}

int main(int argc, char **argv) {
	char	*n, *m, *k;
	int	fd, fd2;
	int	i, j;
	char	buf[256];
	int	p[4];
	char	*a[4], *e[2];

	if (argc > 1) {
		switch (argv[1][0]) {
		case 'q':
			_exit(5);
		case 'a':
			if (argc > 2 && memcmp(argv[2], "0123456789", 10))
				error("argc/argv");
			_exit(0);
		case 'e':
			if ((n = getenv("FOO")) == NULL ||
			    memcmp(n, "BAR",3)
			)
				error("environ");
			_exit(0);
		case 'v':
			verbose = 1;
			break;
		default:
			_exit(1);
		}
	}

	if (verbose) kprintf(1, "sbrk\n");
	n = _sbrk(1024);
	m = _sbrk(-1024);
	k = _sbrk(0);
	if (n + 1024 != m || k != n)
		error("_sbrk()");

	if (verbose) kprintf(1, "creat\n");
	fd  = _creat(TESTFILE, 0644);
	if (fd < 0)
		error("_creat() of new file");
	_close(fd);
	fd = _creat(TESTFILE, 0644);
	if (fd < 0)
		error("_creat() of existing file");

	if (verbose) kprintf(1, "write\n");
	for (i=0; i<256; i++)
		buf[i] = i;
	for (i=0; i<256; i += 16)
		if (_write(fd, buf, i) != i)
			error("_write()");

	if (verbose) kprintf(1, "close\n");
	if (_close(fd) < 0) error("_close()");

	if (verbose) kprintf(1, "open\n");
	fd = _open(TESTFILE, O_RDONLY);
	if (fd < 0)
		error("_open in read-only mode");
	if (verbose) kprintf(1, "read\n");
	for (i=0; i<256; i += 16) {
		if (_read(fd, buf, i) != i)
			error("_read()");
		for (j=0; j<i; j++)
			if (buf[j] != j)
				error("_read() read wrong data");
	}
	if (_write(fd, "1234567890", 10) >= 0)
		error("_write() could write read-only file");
	_close(fd);

	fd = _open(TESTFILE, O_WRONLY);
	if (fd < 0)
		error("_open in write-only mode");
	if (_write(fd, "0123456789", 10) != 10)
		error("_write() could not write write-only file");
	_close(fd);
	fd = _open(TESTFILE, O_RDONLY);
	_read(fd, buf, 10);
	if (memcmp(buf, "0123456789", 10))
		error("_read() from write-only file returned wrong data");
	_close(fd);

	fd = _open(TESTFILE, O_RDWR);
	if (fd < 0)
		error("_open in read-write mode");
	if (_write(fd, "9876543210", 10) != 10)
		error("_write() could not write read/write file");
	_close(fd);
	fd = _open(TESTFILE, O_RDONLY);
	_read(fd, buf, 10);
	if (memcmp(buf, "9876543210", 10))
		error("_read() from read/write file returned wrong data");
	_close(fd);

	fd = _open(TESTFILE, O_RDWR);
	if (fd < 0)
		error("_open in read-write mode (2)");
	if (verbose) kprintf(1, "lseek\n");
	if (_lseek(fd, 250, SEEK_SET) != 250)
		error("lseek() from beginning of file");
	if (_write(fd, "1111111111", 10) != 10)
		error("_write() could not write read/write file (2)");
	if (_lseek(fd, -10, SEEK_END) != 1910)
		error("lseek() from end of file");
	if (_write(fd, "2222222222", 10) != 10)
		error("_write() could not write read/write file (3)");
	if (_lseek(fd, -1000, SEEK_CUR) != 920)
		error("lseek() relative backward");
	if (_write(fd, "3333333333", 10) != 10)
		error("_write() could not write read/write file (4)");
	if (_lseek(fd, 500, SEEK_CUR) != 1430)
		error("lseek() relative forward");
	if (_write(fd, "4444444444", 10) != 10)
		error("_write() could not write read/write file (5)");
	_close(fd);

	p[0] = 250;
	p[1] = 1910;
	p[2] = 920;
	p[3] = 1430;
	for (i=0; i<4; i++) {
		fd = _open(TESTFILE, O_RDONLY);
		if (fd < 0)
			error("_open in read-only mode (3)");
		for (j=0; j<p[i]; j += 10)
			_read(fd, buf, 10);
		if (_read(fd, buf, 10) != 10)
			error("_read() (2)");
		for (j=0; j<10; j++)
			if (buf[j] != i+1+'0')
				error("_read() with lseek()"
					" returned wrong data");
		_close(fd);
	}

	if (verbose) kprintf(1, "rename\n");
	if (_rename(TESTFILE, TESTFILE2) < 0)
		error("_rename() existing file");
	if (_rename(TESTFILE, TESTFILE2) == 0)
		error("_rename() non-existing file returned success");
	if ((fd = _open(TESTFILE, O_RDONLY)) >= 0) {
		error("_rename() left original link");
		_close(fd);
	}
	if ((fd = _open(TESTFILE2, O_RDONLY)) < 0)
		error("_rename() failed to create new link");
	else
		_close(fd);

	if (verbose) kprintf(1, "unlink\n");
	if (_unlink(TESTFILE2) < 0)
		error("_unlink() existing file");
	if (_unlink(TESTFILE2) == 0)
		error("_unlink() non-existing file returned success");
	if ((fd = _open(TESTFILE2, O_RDONLY)) >= 0) {
		error("_unlink() failed to remove link");
		_close(fd);
	}

#ifndef __dos
	if (verbose) kprintf(1, "fork/exit/wait\n");
	for (i=0; i<3; i++) {
		switch (_fork()) {
		case -1:
			error("_fork()");
			break;
		case 0:	
			_exit(i);
		default:
			_wait(&j);
			if (j != i<<8)
				error("_wait() returned wrong exit code");
		}
	}

	if (verbose) kprintf(1, "execve\n");
	switch(_fork()) {
	case -1:
		error("_fork() (2)");
		break;
	case 0:
		a[0] = "./systest";
		a[1] = "q";
		a[2] = NULL;
		_execve("./systest", a, NULL);
		error("execve()");
		_exit(1);
	case 1:
		_wait(&j);
		if (j != 5<<8)
			error("_wait() with execve(): wrong exit code");
	}

	if (verbose) kprintf(1, "argc/argv\n");
	switch(_fork()) {
	case -1:
		error("_fork() (3)");
		break;
	case 0:
		a[0] = "./systest";
		a[1] = "a";
		a[2] = "0123456789";
		a[3] = NULL;
		_execve("./systest", a, NULL);
		error("execve() (2)");
		_exit(1);
	case 1:
		_wait(&j);
	}

	if (verbose) kprintf(1, "environ\n");
	switch(_fork()) {
	case -1:
		error("_fork() (4)");
		break;
	case 0:
		a[0] = "./systest";
		a[1] = "e";
		a[2];
		e[0] = "FOO=BAR";
		e[1] = NULL;
		_execve("./systest", a, e);
		error("execve() (3)");
		_exit(1);
	case 1:
		_wait(&j);
	}
#endif

	if (verbose) kprintf(1, "time\n");
	kprintf(0, "_time() returned %d\n", _time());

	if (verbose) kprintf(1, "exit\n");
	_exit(0);
	error("_exit()");
}
