/*
 *	NMH's Simple C Compiler, 2011,2014
 *	unistd.h
 */

#define SEEK_SET	0
#define SEEK_CUR	1
#define SEEK_END	2

int	 _close(int fd);
int	 _creat(char *path, int mode);
int	 _execve(char *path, char *argv[], char *envp[]);
void	 _exit(int rc);
int	 _fork(void);
int	 _lseek(int fd, int pos, int how);
int	 _open(char *path, int flags);
int	 _read(int fd, void *buf, int len);
int	 _rename(char *old, char *new);
void	*_sbrk(int size);
int	 _time(void);
int	 _unlink(char *path);
int	 _wait(int *rc);
int	 _write(int fd, void *buf, int len);
