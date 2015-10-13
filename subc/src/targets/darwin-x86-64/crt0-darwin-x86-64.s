#
#	NMH's Simple C Compiler, 2014
#	C runtime module for Darwin/x86-64
#

# Calling conventions: ?

	.data
	.align	4
	.globl	Cenviron
Cenviron:
	.quad	0
	
	.data
	.align	4
InitialStackAlignment:
	.quad	0
StackAlignment:
	.quad	0
StackAlignmentRAX:
	.quad	0
	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp,%rbp
        subq    $32, %rsp
	
	xorq	%rax,%rax
	movq	%rax,InitialStackAlignment(%rip)
	movq	%rsp,%rax
	andb	$7,%al
	movb	%al,InitialStackAlignment(%rip)
		
        movl    %edi, -4(%rbp)	# argc
        movq    %rsi, -16(%rbp)	# argv
        movq    %rdx, -24(%rbp)	# envp

	pushq	%rdi
	call	C_init	#INIT
	popq	%rdi
	
	movq	-24(%rbp),%rax
	movq	%rax,Cenviron(%rip)
	
	xorq	%rcx,%rcx
	movq	-16(%rbp), %rsi
	pushq	%rsi		# argv
	movl	-4(%rbp),%ecx
	pushq	%rcx		# argc
	call	Cmain
	addq	$16,%rsp

        addq    $32, %rsp
        popq    %rbp
	ret
	
# internal switch(expr) routine
# %rsi = switch table, %rax = expr
	.text
	.globl	switch
switch:
	pushq	%rsi
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
	.text
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
	.text
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
	.text
	.globl	C_exit
C_exit:
	movq	8(%rsp),%rdi			# rc
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	call	_exit
	movq 	StackAlignment(%rip),%rsp
	ret

# int _sbrk(int size);
	.text
	.globl	C_sbrk
C_sbrk:
	movq	8(%rsp),%rdi			# size
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_sbrk
	movq 	StackAlignment(%rip),%rsp
	ret

# int _write(int fd, void *buf, int len);
	.text
	.globl	C_write
C_write:
	movq	24(%rsp),%rdx			# len
	movq	16(%rsp),%rsi			# buf
	movq	8(%rsp),%rdi			# fd
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_write
	movq 	StackAlignment(%rip),%rsp
	ret

# int _read(int fd, void *buf, int len);
	.text
	.globl	C_read
C_read:
	movq	24(%rsp),%rdx			# len
	movq	16(%rsp),%rsi			# buf
	movq	8(%rsp),%rdi			# fd
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_read
	movq 	StackAlignment(%rip),%rsp
	ret

# int _lseek(int fd, int pos, int how);
	.text
	.globl	C_lseek
C_lseek:
	movq	24(%rsp),%rdx			# how
	movq	16(%rsp),%rsi			# pos
	movq	8(%rsp),%rdi			# fd
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_lseek
	movq 	StackAlignment(%rip),%rsp
	ret

# int _creat(char *path, int mode);
	.text
	.globl	C_creat
C_creat:
	movq	16(%rsp),%rsi			# mode
	movq	8(%rsp),%rdi			# path
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_creat
	movq 	StackAlignment(%rip),%rsp
	ret

# int _open(char *path, int flags);
	.text
	.globl	C_open
C_open:
	movq	16(%rsp),%rsi			# flags
	movq	8(%rsp),%rdi			# path
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_open
	movq 	StackAlignment(%rip),%rsp
	ret

# int _close(int fd);
	.text
	.globl	C_close
C_close:
	movq	8(%rsp),%rdi			# fd
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_close
	movq 	StackAlignment(%rip),%rsp
	ret

# int _unlink(char *path);
	.text
	.globl	C_unlink
C_unlink:
	movq	8(%rsp),%rdi			# path
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_unlink
	movq 	StackAlignment(%rip),%rsp
	ret

# int _rename(char *old, char *new);
	.text
	.globl	C_rename
C_rename:
	movq	16(%rsp),%rsi			# new
	movq	8(%rsp),%rdi			# old
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_rename
	movq 	StackAlignment(%rip),%rsp
	ret

# int _fork(void);
	.text
	.globl	C_fork
C_fork:
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	call	_fork
	movq 	StackAlignment(%rip),%rsp
	ret

# int _wait(int *rc);
	.data
ww:	.quad	0
	.text
	.globl	C_wait
C_wait:
	leaq	ww(%rip),%rdi
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_wait
	movq 	StackAlignment(%rip),%rsp
	movq	8(%rsp),%rdx			# rc
	pushq	%rax
	pushq	%rbx
	movq	ww(%rip),%rax
	andb	$127,%al
	xorq	%rbx,%rbx
	movb	%ah,%bl
	test	%al,%al
	jz	wait_bye
	movq	ww(%rip),%rbx
wait_bye:
	movq	%rbx,(%rdx)
	popq	%rbx
	popq	%rax
	ret

# int _execve(char *path, char *argv[], char *envp[]);
	.text
	.globl	C_execve
C_execve:
	movq	24(%rsp),%rdx			# envp
	movq	16(%rsp),%rsi			# argv
	movq	8(%rsp),%rdi			# path
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_execve
	movq 	StackAlignment(%rip),%rsp
	ret

# int _time(void);
	.text
	.globl	C_time
C_time:
	xorq	%rdi,%rdi
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_time
	movq 	StackAlignment(%rip),%rsp
	ret

# int raise(int sig);
	.text
	.globl	Craise
Craise:
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_getpid
	movq 	StackAlignment(%rip),%rsp
	movq	%rax,%rdi
	movq	8(%rsp),%rsi			# sig
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_kill
	movq 	StackAlignment(%rip),%rsp
	ret

# int signal(int sig, int (*fn)());
	.text
	.globl	Csignal
Csignal:
	movq	16(%rsp),%rsi			# fn
	movq	8(%rsp),%rdi			# sig
	movq	%rax,StackAlignmentRAX(%rip)
	movq 	%rsp,StackAlignment(%rip)
	subq	$16,%rsp
	mov	%sp,%ax
	andb	$240,%al
	orb	InitialStackAlignment(%rip),%al
	mov	%ax,%sp
	movq	StackAlignmentRAX(%rip),%rax
	xorq	%rax,%rax
	call	_signal
	movq 	StackAlignment(%rip),%rsp
	ret
