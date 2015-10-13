#
#	NMH's Simple C Compiler, 2011--2014
#	C runtime module for OpenBSD/386
#

# Calling conventions: stack, return in %eax

# OpenBSD voodoo stuff

.section ".note.openbsd.ident", "a"
	.p2align	2
	.long		8,4,1
	.ascii		"OpenBSD\0"
	.long		0
	.p2align	2

# End of voodoo stuff

	.section	.rodata
.LC0:
	.string	""

	.data
	.globl environ
	.align 4
environ:	
	.long	0

	.data
	.align 4
__progname_storage:	
	.fill 256,1,0

	.data
	.globl	__progname
	.align 4
__progname:
	.long	.LC0

	.text
	.align  4
	.globl  __start
	.globl  _start
_start:
__start:
	pushl	%ebx			# ps_strings
	pushl   %ecx                    # obj
	pushl   %edx                    # cleanup
	movl    12(%esp),%eax           # argc
	leal    20(%esp,%eax,4),%ecx    # envp
	leal    16(%esp),%edx           # argv
	pushl   %ecx
	pushl   %edx
	pushl   %eax
	call    ___start 
	# NOT REACHED

	.text
___start:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	16(%ebp), %eax	# envp
	movl	%eax, environ
	movl	%eax, Cenviron
	
	movl	12(%ebp), %eax	# argv
	movl	(%eax), %eax	# argv[0]
	pushl	%eax
	call	populate_progname
	addl	$4, %esp
	
	call	C_init		#INIT
	
	movl	12(%ebp), %esi	# argv
	movl	8(%ebp), %ecx	# argc
	pushl	%esi
	pushl	%ecx
	call	Cmain
	addl	$8,%esp
	
	pushl	%eax
x:	call	Cexit		#EXIT
	xorl	%ebx,%ebx
	divl	%ebx
	jmp	x

	.text
populate_progname:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	cmpl	$0, 8(%ebp)
	jne	.L16
	jmp	.L15
.L16:
	subl	$8, %esp
	pushl	$47
	pushl	8(%ebp)
	call	_strrchr
	addl	$16, %esp
	movl	%eax, __progname
	cmpl	$0, __progname
	je	.L17
	incl	__progname
.L17:
	cmpl	$0, __progname
	jne	.L18
	movl	8(%ebp), %eax
	movl	%eax, __progname
.L18:
	movl	$__progname_storage, -4(%ebp)
.L19:
	movl	__progname, %eax
	cmpb	$0, (%eax)
	je	.L20
	cmpl	$__progname_storage+255, -4(%ebp)
	jb	.L22
	jmp	.L20
.L22:
	movl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	__progname, %eax
	incl	__progname
	movb	(%eax), %al
	movb	%al, (%edx)
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	.L19
.L20:
	movl	-4(%ebp), %eax
	movb	$0, (%eax)
	movl	$__progname_storage, __progname
.L15:
	leave			# ESP <- EBP, POP EBP
	ret
	
	.text
_strrchr:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	12(%ebp), %eax
	movb	%al, -5(%ebp)
	movl	$0, -12(%ebp)
.L25:
	movb	-5(%ebp), %al
	movl	8(%ebp), %edx
	cmpb	%al, (%edx)
	jne	.L28
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.L28:
	movl	8(%ebp), %edx
	cmpb	$0, (%edx)
	jne	.L27
	movl	-12(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L24
.L27:
	incl	8(%ebp)
	jmp	.L25
.L24:
	movl	-4(%ebp), %eax
	leave			# ESP <- EBP, POP EBP
	ret

	.data
	.globl	Cenviron
Cenviron:
	.long	0

# internal switch(expr) routine
# %esi = switch table, %eax = expr
	.text
	.globl	switch
switch:
	pushl	%esi
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
	.text
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
	.text
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
	.text
	.globl	C_exit
C_exit:
	pushl	4(%esp)		# rc
	call	_exit
	addl	$4,%esp
	ret

# int _sbrk(int size);
	.text
	.globl	C_sbrk
C_sbrk:
	pushl	4(%esp)		# size
	call	sbrk
	addl	$4,%esp
	ret

# int _write(int fd, void *buf, int len);
	.text
	.globl	C_write
C_write:
	pushl	12(%esp)	# len
	pushl	12(%esp)	# buf
	pushl	12(%esp)	# fd
	call	write
	addl	$12,%esp
	ret

# int _read(int fd, void *buf, int len);
	.text
	.globl	C_read
C_read:
	pushl	12(%esp)	# buf
	pushl	12(%esp)	# len
	pushl	12(%esp)	# fd
	call	read
	addl	$12,%esp
	ret

# int _lseek(int fd, int pos, int how);
	.text
	.globl	C_lseek
C_lseek:
	pushl	12(%esp)	# how
	movl	12(%esp),%eax	# pos
	cdq
	pushl	%edx		# off_t, high word
	pushl	%eax		# off_t, low word
	pushl	16(%esp)	# fd
	call	lseek
	addl	$16,%esp
	ret

# int _creat(char *path, int mode);
	.text
	.globl	C_creat
C_creat:
	pushl	8(%esp)		# mode
	pushl	8(%esp)		# path
	call	creat
	addl	$8,%esp
	ret

# int _open(char *path, int flags);
	.text
	.globl	C_open
C_open:
	pushl	8(%esp)		# flags
	pushl	8(%esp)		# path
	call	open
	addl	$8,%esp
	ret

# int _close(int fd);
	.text
	.globl	C_close
C_close:
	pushl	4(%esp)		# fd
	call	close
	addl	$4,%esp
	ret

# int _unlink(char *path);
	.text
	.globl	C_unlink
C_unlink:
	pushl	4(%esp)		# path
	call	unlink
	addl	$4,%esp
	ret

# int _rename(char *old, char *new);
	.text
	.globl	C_rename
C_rename:
	pushl	8(%esp)		# new
	pushl	8(%esp)		# old
	call	rename
	addl	$8,%esp
	ret

# int _fork(void);
	.text
	.globl	C_fork
C_fork:
	call	fork
	ret

# int _wait(int *rc);
	.text
	.globl	C_wait
C_wait:
	pushl	4(%esp)		# rc
	call	wait
	addl	$4,%esp
	ret

# int _execve(char *path, char *argv[], char *envp[]);
	.text
	.globl	C_execve
C_execve:
	pushl	12(%esp)	# envp
	pushl	12(%esp)	# argv
	pushl	12(%esp)	# argc
	call	execve
	addl	$12,%esp
	ret

# int _time(void);
	.text
	.globl	C_time
C_time:
	pushl	$0
	call	time
	addl	$4,%esp
	ret

# int raise(int sig);
	.text
	.globl	Craise
Craise:
	call	getpid
	pushl	4(%esp)		# sig
	pushl	%eax
	call	kill
	addl	$8,%esp
	ret

# int signal(int sig, int (*fn)());
	.text
	.globl	Csignal
Csignal:
	pushl	8(%esp)		# fn
	pushl	8(%esp)		# sig
	call	signal
	addl	$8,%esp
	ret
