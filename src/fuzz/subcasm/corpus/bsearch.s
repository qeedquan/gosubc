	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cbsearch
Cbsearch:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-40, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$98, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$98, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, -40(%rbp)
	movq	40(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
L5:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	48(%rbp), %rax
	call	*%rax
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L7
	incq	%rdx
L7:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L8
	jmp	L6
L8:
	movq	-40(%rbp), %rax
L6:
	orq	%rax, %rax
	jnz	L9
	jmp	L4
L9:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L11
	jmp	L10
L11:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L12
L10:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
L12:
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, -40(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jb	L14
	jmp	L13
L14:
	movq	24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L13:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jae	L17
	jmp	L16
L17:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
L16:
L15:
	jmp	L5
L4:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L19
	jmp	L18
L19:
	movq	-8(%rbp), %rax
	jmp	L3
L18:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
L21:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L23
	incq	%rdx
L23:
	movq	%rdx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L24
	incq	%rdx
L24:
	movq	%rdx, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L25
	incq	%rdx
L25:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L26
	jmp	L22
L26:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jb	L27
	incq	%rdx
L27:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L28
	jmp	L22
L28:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jae	L29
	incq	%rdx
L29:
	movq	%rdx, %rax
L22:
	orq	%rax, %rax
	jnz	L30
	jmp	L20
L30:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L32
	jmp	L31
L32:
	movq	-8(%rbp), %rax
	jmp	L3
	jmp	L33
L31:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L35
	jmp	L34
L35:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L36
L34:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
L36:
L33:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	48(%rbp), %rax
	call	*%rax
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	jmp	L21
L20:
	movq	-24(%rbp), %rax
	orq	%rax, %rax
	jnz	L39
	jmp	L37
L39:
	movq	$0, %rax
	jmp	L38
L37:
	movq	-8(%rbp), %rax
L38:
	jmp	L3
L3:
	addq	$40, %rsp
	popq	%rbp
	ret

