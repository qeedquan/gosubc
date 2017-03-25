	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cqsort
Cqsort:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-64, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$113, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$113, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, -8(%rbp)
L4:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L8
	jmp	L6
L8:
	jmp	L5
L7:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, -8(%rbp)
	jmp	L4
L5:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
L9:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L13
	jmp	L11
L13:
	jmp	L10
L12:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L9
L10:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -24(%rbp)
L14:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L18
	jmp	L16
L18:
	jmp	L15
L17:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -24(%rbp)
	jmp	L14
L15:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	call	*%rax
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L20
	jmp	L19
L20:
	jmp	L16
L19:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
	movq	$0, %rax
	movq	%rax, -32(%rbp)
L21:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L25
	jmp	L23
L25:
	jmp	L22
L24:
	movq	-32(%rbp), %rax
	incq	-32(%rbp)
	jmp	L21
L22:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rdx
	movb	%al, (%rdx)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L24
L23:
	jmp	L17
L16:
	jmp	L12
L11:
	jmp	L7
L6:
L3:
	addq	$64, %rsp
	popq	%rbp
	ret

