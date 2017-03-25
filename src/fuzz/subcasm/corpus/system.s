	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Csystem
Csystem:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-48, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	C_fork
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L5
	jmp	L4
L5:
	movq	$-1, %rax
	jmp	L3
	jmp	L6
L4:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jnz	L8
	jmp	L7
L8:
	leaq	-16(%rbp), %rax
	pushq	%rax
	call	C_wait
	addq	$8, %rsp
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L11
	jmp	L9
L11:
	movq	-16(%rbp), %rax
	jmp	L10
L9:
	movq	-16(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L10:
	jmp	L3
	jmp	L12
L7:
	.data
L13:
	.byte	47
	.byte	'b'
	.byte	'i'
	.byte	'n'
	.byte	47
	.byte	's'
	.byte	'h'
	.byte	0
	.text
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$L13, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L14:
	.byte	45
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L14, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L17:
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L18
	jmp	L15
L18:
	movq	16(%rbp), %rax
	jmp	L16
L15:
	movq	$L17, %rax
L16:
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	Cenviron, %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_execve
	addq	$24, %rsp
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L21
	jmp	L19
L21:
	movq	$-1, %rax
	jmp	L20
L19:
	movq	$0, %rax
L20:
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L12:
L6:
L3:
	addq	$48, %rsp
	popq	%rbp
	ret

