#
#	NMH's Simple C Compiler, 2012--2016
#	C runtime module for NetBSD/386
#

# Calling conventions: stack, return in %eax
# System call: %eax=call#, arguments on stack,
#              push additional dummy value last,
#              carry indicates error,
#              return/error value in %eax


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
	.long	0
environ:
	.long	0

# End of voodoo stuff

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
C_exit:	pushl	4(%esp)		# rc
	pushl	$0
	movl	$1,%eax		# SYS_exit
	int	$0x80
	addl	$8,%esp
	ret

# int _sbrk(int size);

	.data
	.extern	end
curbrk:	.long	end

	.text
	.globl	C_sbrk
C_sbrk:	movl	curbrk,%eax
	addl	4(%esp),%eax	# size
	pushl	%eax
	pushl	%eax
	movl	$17,%eax	# SYS_break
	int	$0x80
	jnc	brkok
	addl	$8,%esp
	movl	$-1,%eax
	ret
brkok:	addl	$8,%esp
	movl	curbrk,%eax
	movl	4(%esp),%ebx	# size
	addl	%ebx,curbrk
	ret

# int _write(int fd, void *buf, int len);

	.globl	C_write
C_write:
	pushl	12(%esp)	# len
	pushl	12(%esp)	# buf
	pushl	12(%esp)	# fd
	pushl	$0
	movl	$4,%eax		# SYS_write
	int	$0x80
	jnc	wrtok
	negl	%eax
wrtok:	addl	$16,%esp
	ret

# int _read(int fd, void *buf, int len);

	.globl	C_read
C_read:	pushl	12(%esp)	# len
	pushl	12(%esp)	# buf
	pushl	12(%esp)	# fd
	pushl	$0
	movl	$3,%eax		# SYS_read
	int	$0x80
	jnc	reaok
	negl	%eax
reaok:	addl	$16,%esp
	ret

# int _lseek(int fd, int pos, int how);

	.globl	C_lseek
C_lseek:
	pushl	12(%esp)	# how
	movl	12(%esp),%eax	# pos
	cdq
	pushl	%edx		# off_t, high word
	pushl	%eax		# off_t, low word
	pushl	$0		# pad
	pushl	20(%esp)	# fd
	pushl	$0
	movl	$199,%eax	# SYS_lseek
	int	$0x80
	jnc	lskok
	negl	%eax
lskok:	addl	$24,%esp
	ret

# int _creat(char *path, int mode);

	.globl	C_creat
C_creat:
	pushl	8(%esp)		# mode
	pushl	$0x601		# O_CREAT | O_TRUNC | O_WRONLY
	pushl	12(%esp)	# path
	pushl	$0
	movl	$5,%eax		# SYS_open
	int	$0x80
	jnc	crtok
	negl	%eax
crtok:	addl	$16,%esp
	ret

# int _open(char *path, int flags);

	.globl	C_open
C_open:	pushl	8(%esp)		# flags
	pushl	8(%esp)		# path
	pushl	$0
	movl	$5,%eax		# SYS_open
	int	$0x80
	jnc	opnok
	negl	%eax
opnok:	addl	$12,%esp
	ret

# int _close(int fd);

	.globl	C_close
C_close:
	pushl	4(%esp)		# fd
	pushl	$0
	movl	$6,%eax		# SYS_close
	int	$0x80
	jnc	clsok
	negl	%eax
clsok:	addl	$8,%esp
	ret

# int _unlink(char *path);

	.globl	C_unlink
C_unlink:
	pushl	4(%esp)		# path
	pushl	$0
	movl	$10,%eax	# SYS_unlink
	int	$0x80
	jnc	unlok
	negl	%eax
unlok:	addl	$8,%esp
	ret

# int _rename(char *old, char *new);

	.globl	C_rename
C_rename:
	pushl	8(%esp)		# new
	pushl	8(%esp)		# old
	pushl	$0
	movl	$128,%eax	# SYS_rename
	int	$0x80
	jnc	renok
	negl	%eax
renok:	addl	$12,%esp
	ret

# int _fork(void);

	.globl	C_fork
C_fork:	pushl	$0
	movl	$2,%eax		# SYS_fork
	int	$0x80
	jnc	frkok
	negl	%eax
frkok:	addl	$4,%esp
	ret

# int _wait(int *rc);

	.globl	C_wait
C_wait:	pushl	$0		# rusage
	pushl	$0		# options
	pushl	12(%esp)	# rc
	pushl	$-1		# wpid
	pushl	$0
	movl	$449,%eax	# SYS_wait4
	int	$0x80
	jnc	watok
	negl	%eax
watok:	addl	$20,%esp
	ret

# int _execve(char *path, char *argv[], char *envp[]);

	.globl	C_execve
C_execve:
	pushl	12(%esp)	# envp
	pushl	12(%esp)	# argv
	pushl	12(%esp)	# path
	pushl	$0
	movl	$59,%eax	# SYS_execve
	int	$0x80
	jnc	excok
	negl	%eax
excok:	addl	$16,%esp
	ret

# int _time(void);

	.globl	C_time
C_time:	subl	$16,%esp
	pushl	%esp		# struct timespec
	pushl	$0		# CLOCK_REALTIME
	pushl	$0
	movl	$427,%eax	# SYS_clock_gettime
	int	$0x80
	jnc	timok
	negl	%eax
	addl	$28,%esp
	ret
timok:	movl	12(%esp),%eax
	addl	$28,%esp
	ret

# int raise(int sig);

	.globl	Craise
Craise:
	pushl	$0
	movl	$20,%eax	# SYS_getpid
	int	$0x80
	addl	$4,%esp
	pushl	4(%esp)		# sig
	pushl	%eax
	pushl	%eax
	movl	$37,%eax	# SYS_kill
	int	$0x80
	jnc	rasok
	negl	%eax
rasok:	addl	$12,%esp
	ret

# int signal(int sig, int (*fn)());

	.globl	Csignal
Csignal:
	movl	4(%esp),%ebx	# sig
	movl	8(%esp),%eax	# fn /act
	subl	$24,%esp	# struct sigaction oact
	subl	$24,%esp	# struct sigaction act
	movl	%eax,(%esp)	# act.sa_handler / sa_action
	movl	$0,%eax
	movl	%eax,4(%esp)	# act.sa_mask
	movl	%eax,8(%esp)
	movl	%eax,12(%esp)
	movl	%eax,16(%esp)
	movl	%eax,20(%esp)	# act.sa_flags
	movl	%esp,%esi
	movl	%esi,%edi	# oact
	addl	$24,%edi
	pushl	$2		# vers
	leal	_sigtramp,%eax
	pushl	%eax		# tramp
	pushl	%edi		# oact
	pushl	%esi		# act
	pushl	%ebx		# sig
	pushl	$0
	movl	$340,%eax	# SYS___sigaction_sigtramp
	int	$0x80
	jnc	sacok
	addl	$72,%esp
	mov	$2,%eax		# SIG_ERR
	ret
sacok:	movl	48(%esp),%eax	# oact.sa_handler / sa_action
	addl	$72,%esp
	ret

_sigtramp:
	# Assume the handler doesn't corrupt arguments passed on stack
	movl	8(%esp),%eax	# address of ucontext
	pushl	%eax
	pushl	$0
	movl	$308,%eax	# SYS_setcontext
	int	$0x80
	movl	$42, 4(%esp)	# setcontext should not return
	movl	$1, %eax	# SYS_exit
	int	$0x80
