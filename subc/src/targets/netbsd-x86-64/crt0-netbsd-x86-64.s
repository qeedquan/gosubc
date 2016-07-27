#
#	NMH's Simple C Compiler, 2012--2016
#	C runtime module for FreeBSD/x86-64
#

# Calling conventions: %rdi,%rsi,%rdx,%r10,%r8,%r9,stack; return in %rax

# NetBSD voodoo stuff

	.section ".note.netbsd.ident", "a"
	.long   7, 4, 1
	.ascii "NetBSD\0"
	.p2align 2
	.long   400000003
	.data
	.p2align 3
	.globl	__progname
	.globl	environ
__progname:
	.quad	0
environ:
	.quad	0

# End of voodoo stuff

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
x:	call	Cexit		#EXIT
	xorq	%rbx,%rbx
	divq	%rbx
	jmp	x

# internal switch(expr) routine
# %rsi = switch table, %rax = expr

	.globl	switch
switch:	pushq	%rsi
	movq	%rdx,%rsi
	movq	%rax,%rbx
	cld
	lodsq
	movq	%rax,%rcx
next:	lodsq
	movq	%rax,%rdx
	lodsq
	cmpq	%rdx,%rbx
	jnz	no
	popq	%rsi
	jmp	*%rax
no:	loop	next
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
C_exit:	movq	8(%rsp),%rdi	# rc
	movq	$1,%rax		# SYS_exit
	syscall
	ret

# int _sbrk(int size);

	.data
	.extern	end
curbrk:	.quad	end
	.text
	.globl	C_sbrk
C_sbrk:	movq	curbrk,%rdi
	addq	8(%rsp),%rdi	# size
	movq	$17,%rax	# SYS_break
	syscall
	jnc	brkok
	movq	$-1,%rax
	ret
brkok:	movq	curbrk,%rax
	movq	8(%rsp),%rbx	# size
	addq	%rbx,curbrk
	ret

# int _write(int fd, void *buf, int len);

	.globl	C_write
C_write:
	movq	24(%rsp),%rdx	# len
	movq	16(%rsp),%rsi	# buf
	movq	8(%rsp),%rdi	# fd
	movq	$4,%rax		# SYS_write
	syscall
	jnc	wrtok
	negq	%rax
wrtok:	ret

# int _read(int fd, void *buf, int len);

	.globl	C_read
C_read:	movq	24(%rsp),%rdx	# len
	movq	16(%rsp),%rsi	# buf
	movq	8(%rsp),%rdi	# fd
	movq	$3,%rax		# SYS_read
	syscall
	jnc	redok
	negq	%rax
redok:	ret

# int _lseek(int fd, int pos, int how);

	.globl	C_lseek
C_lseek:
	movq	24(%rsp),%rdx	# how
	movq	16(%rsp),%rsi	# pos
	movq	8(%rsp),%rdi	# fd
	movq	$19,%rax	# SYS_compat43_olseek
	syscall
	jnc	lskok
	negq	%rax
lskok:	ret

# int _creat(char *path, int mode);

	.globl	C_creat
C_creat:
	movq	16(%rsp),%rdx	# mode
	movq	$0x601,%rsi	# O_CREAT | O_TRUNC | O_WRONLY
	movq	8(%rsp),%rdi	# path
	movq	$5,%rax		# SYS_open
	syscall
	jnc	crtok
	negq	%rax
crtok:	ret

# int _open(char *path, int flags);

	.globl	C_open
C_open: movq	16(%rsp),%rsi	# flags
	movq	8(%rsp),%rdi	# path
	xorq	%rax,%rax
	movq	$5,%rax		# SYS_open
	syscall
	jnc	opnok
	negq	%rax
opnok:	ret

# int _close(int fd);

	.globl	C_close
C_close:
	movq	8(%rsp),%rdi	# fd
	movq	$6,%rax		# SYS_close
	syscall
	jnc	clsok
	negq	%rax
clsok:	ret

# int _unlink(char *path);

	.globl	C_unlink
C_unlink:
	movq	8(%rsp),%rdi	# path
	movq	$10,%rax	# SYS_unlink
	syscall
	jnc	unlok
	negq	%rax
unlok:	ret

# int _rename(char *old, char *new);

	.globl	C_rename
C_rename:
	movq	16(%rsp),%rsi	# new
	movq	8(%rsp),%rdi	# old
	movq	$128,%rax	# SYS_rename
	syscall
	jnc	renok
	negq	%rax
renok:	ret

# int _fork(void);

	.globl	C_fork
C_fork:	movq	$2,%rax
	syscall
	jnc	frkok
	negq	%rax
frkok:	ret

# int _wait(int *rc);

	.text
	.globl	C_wait
C_wait:	movq	$0,%r10		# rusage
	movq	$0,%rdx		# options
	movq	8(%rsp),%rsi	# rc
	movq	$-1,%rdi	# wpid
	movq	$7,%rax		# SYS_compat_50_wait4
	syscall
	jnc	watok
	negq	%rax
watok:	movq	$0xffffffff,%rbx
	movq	8(%rsp),%rsi	# rc
	andq	%rbx,(%rsi)
	ret

# int _execve(char *path, char *argv[], char *envp[]);

	.globl	C_execve
C_execve:
	movq	24(%rsp),%rdx	# envp
	movq	16(%rsp),%rsi	# argv
	movq	8(%rsp),%rdi	# path
	movq	$59,%rax	# SYS_execve
	syscall
	jnc	excok
	negq	%rax
excok:	ret

# int _time(void);

	.globl	C_time
C_time:	subq	$16,%rsp
	movq	%rsp,%rsi	# struct timespec
	movq	$0,%rdi		# CLOCK_REALTIME
	movq	$232,%rax	# SYS_compat_50_clock_gettime
	syscall
	jnc	timok
	negq	%rax
	addq	$16,%rsp
	ret
timok:	xorq	%rax,%rax
	movl	(%rsp),%eax
	addq	$16,%rsp
	ret

# int raise(int sig);

	.globl	Craise
Craise:
	movq	$20,%rax	# SYS_getpid
	syscall
	movq	%rax,%rdi
	movq	8(%rsp),%rsi	# sig
	movq	$37,%rax	# SYS_kill
	syscall
	jnc	rasok
	negq	%rax
rasok:	ret

# int signal(int sig, int (*fn)());

	.globl	Csignal
Csignal:
	movq	8(%rsp),%rdi	# sig
	movq	16(%rsp),%rax	# fn /act
	leaq	_sighands,%rbx
	cmpq	$2,%rax		# SIG_ERR
	jle	1f
	cmpq	$64,%rdi	# size of _sighands array
	jge	1f		# the kernel should reject it anyways
	movq	%rax,0(%rbx,%rdi,8)
	leaq	_sighandler,%rax
1:
	subq	$32,%rsp	# struct sigaction oact
	subq	$32,%rsp	# struct sigaction act
	movq	%rax,(%rsp)	# act.sa_handler / sa_action
	movq	$0,%rax
	movl	%eax,8(%rsp)	# act.sa_flags / act.sa_mask
	movl	%eax,12(%rsp)
	movl	%eax,16(%rsp)
	movl	%eax,20(%rsp)
	movl	%eax,24(%rsp)
	movl	%eax,28(%rsp)
	movq	%rsp,%rsi	# act
	movq	%rsp,%rdx	# oact
	addq	$32,%rdx
	leaq	_sigtramp,%r10	# tramp
	movq	$2,%r8		# vers
	movq	$340,%rax	# SYS___sigaction_sigtramp
	syscall
	jnc	sacok
	addq	$64,%rsp
	movq	$2,%rax		# SIG_ERR
	ret
sacok:	movq	32(%rsp),%rax	# oact.sa_handler / sa_action
	addq	$64,%rsp
	ret

_sighandler:
	# translate kernel ABI to subc ABI, and handles signal return
	pushq	%rdx		# save ucontext
	pushq	%rdi		# signo
	leaq	_sighands,%rbx
	call	*0(%rbx,%rdi,8)
	addq	$8,%rsp
	popq	%rdi
	movq	$308,%rax	# SYS_setcontext
	syscall
	movq	$42,%rdi
	movq	$1,%rax		# SYS_exit
	syscall

_sigtramp:
	jmp	_sigtramp	# not used, but kernel requires
				# non-NULL sigtramp

	.comm _sighands, 8*64	# saves the signal handlers, max 64 signals
