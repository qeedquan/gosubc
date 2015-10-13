#
#	NMH's Simple C Compiler, 2011--2014
#	C runtime module for Linux/amd64
#

# Calling conventions: %rdi,%rsi,%rdx,%r10,%r8,%r9,stack; return in %rax
# System call: %rax=call#, arguments as above,
#              carry indicates error,
#              return/error value in %rax

	.data
	.globl	Cenviron
Cenviron:
	.quad	0

	.text
	.globl	_start
_start:
	call	C_init		#INIT
	leaq	8(%rsp),%rsi	# argv
	movq	0(%rsp),%rcx	# argc
	movq	%rcx,%rax	# environ = &argv[argc+1]
	incq	%rax
	shlq	$3,%rax
	addq	%rsi,%rax
	movq	%rax,Cenviron
	pushq	%rsi
	pushq	%rcx
	call	Cmain
	addq	$16,%rsp
	pushq	%rax
x:
	call	Cexit		#EXIT
	xorq	%rbx,%rbx
	divq	%rbx
	jmp	x

# internal switch(expr) routine
# %rsi = switch table, %rax = expr

	.globl	switch
switch:
	pushq	%rsi
	movq	%rdx,%rsi
	movq	%rax,%rbx
	cld
	lodsq
	movq	%rax,%rcx
next:
	lodsq
	movq	%rax,%rdx
	lodsq
	cmpq	%rdx,%rbx
	jnz	no
	popq	%rsi
	jmp	*%rax
no:
	loop	next
	lodsq
	popq	%rsi
	jmp	*%rax

# int setjmp(jmp_buf env);

	.globl	Csetjmp
Csetjmp:
	movq	8(%rsp),%rdx	# env
	movq	%rsp,(%rdx)
	addq	$8,(%rdx)
	movq	%rbp,8(%rdx)
	movq	(%rsp),%rax
	movq	%rax,16(%rdx)
	xorq	%rax,%rax
	ret

# void longjmp(jmp_buf env, int v);

	.globl	Clongjmp
Clongjmp:
	movq	16(%rsp),%rax	# v
	orq	%rax,%rax
	jne	vok
	incq	%rax
vok:	movq	8(%rsp),%rdx	# env
	movq	(%rdx),%rsp
	movq	8(%rdx),%rbp
	movq	16(%rdx),%rdx
	jmp	*%rdx

# void _exit(int rc);

	.globl	C_exit
C_exit:
	movq	8(%rsp),%rdi	# rc
	movq	$231,%rax
	syscall
	ret

# int _sbrk(int size);

	.data
curbrk:
	.quad	0

	.text
	.globl	C_sbrk
C_sbrk:
	cmpq	$0,curbrk
	jnz	sbrk
	xorq	%rdi,%rdi	# get break
	movq	$12,%rax	# brk
	syscall
	movq	%rax,curbrk
sbrk:
	cmpq	$0,8(%rsp)	# size
	jnz	setbrk
	mov	curbrk,%rax	# size==0, return break
	ret
setbrk:
	movq	curbrk,%rdi	# set new break
	addq	8(%rsp),%rdi	# size
	movq	$12,%rax	# brk
	syscall
	cmpq	%rax,curbrk	# brk(x)==curbrk -> error
	jnz	sbrkok
	movq	$-1,%rax
	ret
sbrkok:
	movq	curbrk,%rbx	# update curr. break
	movq	%rax,curbrk
	movq	%rbx,%rax
	ret

# int _write(int fd, void *buf, int len);

	.globl	C_write
C_write:
	movq	24(%rsp),%rdx	# len
	movq	16(%rsp),%rsi	# buf
	movq	8(%rsp),%rdi	# fd
	movq	$1,%rax
	syscall
	ret

# int _read(int fd, void *buf, int len);

	.globl	C_read
C_read:
	movq	24(%rsp),%rdx	# len
	movq	16(%rsp),%rsi	# buf
	movq	8(%rsp),%rdi	# fd
	movq	$0,%rax
	syscall
	ret

# int _lseek(int fd, int pos, int how);

	.globl	C_lseek
C_lseek:
	movq	24(%rsp),%rdx	# how
	movq	16(%rsp),%rsi	# pos
	movq	8(%rsp),%rdi	# fd
	movq	$8,%rax
	syscall
	ret

# int _creat(char *path, int mode);

	.globl	C_creat
C_creat:
	movq	16(%rsp),%rsi	# mode
	movq	8(%rsp),%rdi	# path
	movq	$85,%rax
	syscall
	ret

# int _open(char *path, int flags);

	.globl	C_open
C_open:
	movq	16(%rsp),%rsi	# flags
	movq	8(%rsp),%rdi	# path
	movq	$2,%rax
	syscall
	ret

# int _close(int fd);

	.globl	C_close
C_close:
	movq	8(%rsp),%rdi	# fd
	movq	$3,%rax
	syscall
	ret

# int _unlink(char *path);

	.globl	C_unlink
C_unlink:
	movq	8(%rsp),%rdi	# path
	movq	$87,%rax
	syscall
	ret

# int _rename(char *old, char *new);

	.globl	C_rename
C_rename:
	movq	16(%rsp),%rsi	# new
	movq	8(%rsp),%rdi	# old
	mov	$82,%rax
	syscall
	ret

# int _fork(void);

	.globl	C_fork
C_fork:
	movq	$57,%rax
	syscall
	ret

# int _wait(int *rc);

	.globl	C_wait
C_wait:
	movq	$-1,%rdi
	movq	8(%rsp),%rsi	# rc
	movq	$0, (%rsi)
	xorq	%rdx,%rdx
	xorq	%r10,%r10
	movq	$61,%rax	# wait4
	syscall
	ret

# int _execve(char *path, char *argv[], char *envp[]);

	.globl	C_execve
C_execve:
	movq	24(%rsp),%rdx	# envp
	movq	16(%rsp),%rsi	# argv
	movq	8(%rsp),%rdi	# path
	movq	$59,%rax
	syscall
	ret

# int _time(void);

	.globl	C_time
C_time:
	leaq	-16(%rsp),%rdi
	xorq	%rsi,%rsi
	movq	$96,%rax	# gettimeofday
	syscall
	movq	-16(%rsp),%rax
	ret

# int raise(int sig);

	.globl	Craise
Craise:
	movq	$39,%rax	# getpid
	syscall
	movq	%rax,%rdi
	movq	8(%rsp),%rsi	# sig
	movq	$62,%rax
	syscall
	ret

# int signal(int sig, int (*fn)());

	.globl	Csignal
Csignal:

#	If your signal handlers segfault, uncomment the below code
#	and link against /usr/lib/libc.a.
#
#	movq	8(%rsp),%rdi	# sig
#	movq	16(%rsp),%rsi	# fn /act
#	call	signal
#	ret

	movq	16(%rsp),%rax	# fn
	movq	%rax,-32(%rsp)
	movq	$0x10000000,-24(%rsp)	# SA_RESTART
	xorq	%rax,%rax
	movq	%rax,-16(%rsp)
	movq	%rax,-8(%rsp)
	movq	8(%rsp),%rdi	# sig
	leaq	-32(%rsp),%rsi
	leaq	-64(%rsp),%rdx
	movq	$8,%r10
	movq	$13,%rax
	syscall
	cmpq	$0,%rax
	jz	1f
	movq	$2,%rax	# SIG_ERR
	ret
1:
	movq	-64(%rsp),%rax
	ret

