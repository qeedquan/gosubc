	.text
	.data
	.lcomm	L1,16
	.lcomm	L2,16
	.text
Cfgets_raw:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
L5:
	movq	24(%rbp), %rax
	decq	24(%rbp)
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L6
	jmp	L4
L6:
	movq	$1, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L8
	jmp	L7
L8:
	movq	$3, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L3
L7:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L10
	jmp	L9
L10:
	jmp	L4
L9:
	jmp	L5
L4:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L11,8
	.lcomm	L12,8
	.text
	.globl	Cfgets
Cfgets:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L11, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L15
	jmp	L14
L15:
	movq	$0, %rax
	jmp	L13
L14:
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L17
	jmp	L16
L17:
	movq	$0, %rax
	jmp	L13
L16:
	movq	$16, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	$56, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L19
	jmp	L18
L19:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	pushq	%rax
	movq	$56, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$56, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	decq	24(%rbp)
L18:
	movq	$24, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L21
	jmp	L20
L21:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfgets_raw
	addq	$24, %rsp
	jmp	L13
L20:
	movq	$64, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	$0, %rax
	movq	%rax, -32(%rbp)
L23:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L25
	incq	%rdx
L25:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L26
	jmp	L24
L26:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L27
	incq	%rdx
L27:
	movq	%rdx, %rax
L24:
	orq	%rax, %rax
	jnz	L28
	jmp	L22
L28:
	movq	32(%rbp), %rax
	pushq	%rax
	call	C_refill
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L30
	jmp	L29
L30:
	movq	$0, %rax
	jmp	L13
L29:
	movq	$40, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$32, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	movq	$32, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemchr
	addq	$24, %rsp
	movq	%rax, -32(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L32
	jmp	L31
L32:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$32, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L33
L31:
	movq	$40, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$32, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
L33:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L35
	jmp	L34
L35:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
L34:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 24(%rbp)
	jmp	L23
L22:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	jmp	L13
L13:
	addq	$32, %rsp
	popq	%rbp
	ret

