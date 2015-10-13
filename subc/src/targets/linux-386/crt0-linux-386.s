#
#	NMH's Simple C Compiler, 2011--2014
#	C runtime module for Linux/386
#

# Calling conventions: %ebx,%ecx,%edx,stack return in %eax
# System call: %eax=call#, arguments as above,
#              carry indicates error,
#              return/error value in %eax

	.data
	.globl	Cenviron
Cenviron:
	.long	0

	.text
	.globl	_start
_start:
	call	C_init		#INIT
	leal	4(%esp),%esi	# argv
	movl	0(%esp),%ecx	# argc
	movl	%ecx,%eax	# environ = &argv[argc+1]
	incl	%eax
	shll	$2,%eax
	addl	%esi,%eax
	movl	%eax,Cenviron
	pushl	%esi
	pushl	%ecx
	call	Cmain
	addl	$8,%esp
	pushl	%eax
x:	call	Cexit		#EXIT
	xorl	%ebx,%ebx
	divl	%ebx
	jmp	x

# internal switch(expr) routine
# %esi = switch table, %eax = expr

	.globl	switch
switch:	pushl	%esi
	movl	%edx,%esi
	movl	%eax,%ebx
	cld
	lodsl
	movl	%eax,%ecx
next:	lodsl
	movl	%eax,%edx
	lodsl
	cmpl	%edx,%ebx
	jnz	no
	popl	%esi
	jmp	*%eax
no:	loop	next
	lodsl
	popl	%esi
	jmp	*%eax

# int setjmp(jmp_buf env);

	.globl	Csetjmp
Csetjmp:
	movl	4(%esp),%edx	# env
	movl	%esp,(%edx)
	addl	$4,(%edx)
	movl	%ebp,4(%edx)
	movl	(%esp),%eax
	movl	%eax,8(%edx)
	xorl	%eax,%eax
	ret

# void longjmp(jmp_buf env, int v);

	.globl	Clongjmp
Clongjmp:
	movl	8(%esp),%eax	# v
	orl	%eax,%eax
	jne	vok
	incl	%eax
vok:	movl	4(%esp),%edx	# env
	movl	(%edx),%esp
	movl	4(%edx),%ebp
	movl	8(%edx),%edx
	jmp	*%edx

# void _exit(int rc);

	.globl	C_exit
C_exit:	movl	4(%esp),%ebx	# rc
	movl	$1,%eax
	int	$0x80
	ret

# int _sbrk(int size);

	.data
curbrk:	.long	0

	.text
	.globl	C_sbrk
C_sbrk:
	cmpl	$0,curbrk
	jnz	sbrk
	xorl	%ebx,%ebx	# get break
	movl	$45,%eax	# brk
	int	$0x80
	movl	%eax,curbrk
sbrk:	cmpl	$0,4(%esp)	# size
	jnz	setbrk
	mov	curbrk,%eax	# size==0, return break
	ret
setbrk:	movl	curbrk,%ebx	# set new break
	addl	4(%esp),%ebx
	movl	$45,%eax	# brk
	int	$0x80
	cmpl	%eax,curbrk	# brk(x)==curbrk -> error
	jnz	sbrkok
	movl	$-1,%eax
	ret
sbrkok:	movl	curbrk,%ebx	# update curr. break
	movl	%eax,curbrk
	movl	%ebx,%eax
	ret

# int _write(int fd, void *buf, int len);

	.globl	C_write
C_write:
	movl	12(%esp),%edx	# len
	movl	8(%esp),%ecx	# buf
	movl	4(%esp),%ebx	# fd
	movl	$4,%eax
	int	$0x80
	ret

# int _read(int fd, void *buf, int len);

	.globl	C_read
C_read:	movl	12(%esp),%edx	# len
	movl	8(%esp),%ecx	# buf
	movl	4(%esp),%ebx	# fd
	movl	$3,%eax
	int	$0x80
	ret

# int _lseek(int fd, int pos, int how);

	.globl	C_lseek
C_lseek:
	movl	12(%esp),%edx	# how
	movl	8(%esp),%ecx	# pos
	movl	4(%esp),%ebx	# fd
	movl	$19,%eax
	int	$0x80
	ret

# int _creat(char *path, int mode);

	.globl	C_creat
C_creat:
	movl	8(%esp),%ecx	# mode
	movl	4(%esp),%ebx	# path
	movl	$8,%eax
	int	$0x80
	ret

# int _open(char *path, int flags);

	.globl	C_open
C_open:	movl	8(%esp),%ecx	# flags
	movl	4(%esp),%ebx	# path
	movl	$5,%eax
	int	$0x80
	ret

# int _close(int fd);

	.globl	C_close
C_close:
	movl	4(%esp),%ebx	# fd
	movl	$6,%eax
	int	$0x80
	ret

# int _unlink(char *path);

	.globl	C_unlink
C_unlink:
	movl	4(%esp),%ebx	# path
	movl	$10,%eax
	int	$0x80
	ret

# int _rename(char *old, char *new);

	.globl	C_rename
C_rename:
	movl	8(%esp),%ecx	# new
	movl	4(%esp),%ebx	# old
	mov	$38,%eax
	int	$0x80
	ret

# int _fork(void);

	.globl	C_fork
C_fork:	movl	$2,%eax
	int	$0x80
	ret

# int _wait(int *rc);

	.globl	C_wait
C_wait:	movl	$-1,%ebx
	movl	4(%esp),%ecx	# rc
	xorl	%edx,%edx
	movl	$7,%eax
	int	$0x80
	ret

# int _execve(char *path, char *argv[], char *envp[]);

	.globl	C_execve
C_execve:
	movl	12(%esp),%edx	# envp
	movl	8(%esp),%ecx	# argv
	movl	4(%esp),%ebx	# path
	movl	$11,%eax
	int	$0x80
	ret

# int _time(void);

	.globl	C_time
C_time:	xorl	%ebx,%ebx
	movl	$13,%eax
	int	$0x80
	ret

# int raise(int sig);

	.globl	Craise
Craise:
	movl	$20,%eax
	int	$0x80
	movl	%eax,%ebx
	movl	4(%esp),%ecx	# sig
	movl	$37,%eax
	int	$0x80

# int signal(int sig, int (*fn)());

	.globl	Csignal
Csignal:
	movl	8(%esp),%ecx	# fn
	movl	4(%esp),%ebx	# sig
	movl	$48,%eax
	int	$0x80
	ret

