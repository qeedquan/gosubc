	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cgetenv
Cgetenv:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
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
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
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
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	Cenviron, %rax
	movq	%rax, -8(%rbp)
L4:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L8
	jmp	L6
L8:
	jmp	L5
L7:
	movq	-8(%rbp), %rax
	addq	$8, -8(%rbp)
	jmp	L4
L5:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L10
	incq	%rdx
L10:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L11
	jmp	L9
L11:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$61, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L12
	incq	%rdx
L12:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L13
	jmp	L9
L13:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L9:
	orq	%rax, %rax
	jnz	L15
	jmp	L14
L15:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	jmp	L3
L14:
	jmp	L7
L6:
	movq	$0, %rax
	jmp	L3
L3:
	addq	$16, %rsp
	popq	%rbp
	ret

