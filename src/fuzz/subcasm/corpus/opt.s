	.text
	.data
COpt_sum_lim:	.quad	0
	.lcomm	L1,16
	.lcomm	L2,16
	.text
	.globl	Copt_init
Copt_init:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
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
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
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
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$1, %rax
	movq	%rax, COpt_sum_lim
	movq	$0, %rax
	orq	%rax, %rax
	jnz	L6
	jmp	L4
L6:
	movq	$8, %rax
	jmp	L5
L4:
	movq	$8, %rax
L5:
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	$1, %rax
	movq	%rax, -8(%rbp)
L7:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L11
	jmp	L9
L11:
	jmp	L8
L10:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L7
L8:
	movq	COpt_sum_lim, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	movq	%rax, COpt_sum_lim
	jmp	L10
L9:
L3:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L12,8
	.lcomm	L13,8
	.text
Cfold2:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
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
	movq	$L13, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
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
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L16
L17:
L18:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	COpt_sum_lim, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L20
	incq	%rdx
L20:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L21
	jmp	L19
L21:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	COpt_sum_lim, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L22
	incq	%rdx
L22:
	movq	%rdx, %rax
L19:
	orq	%rax, %rax
	jnz	L24
	jmp	L23
L24:
	movq	16(%rbp), %rax
	jmp	L14
L23:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L25:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	COpt_sum_lim, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L27
	incq	%rdx
L27:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L28
	jmp	L26
L28:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	COpt_sum_lim, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L29
	incq	%rdx
L29:
	movq	%rdx, %rax
L26:
	orq	%rax, %rax
	jnz	L31
	jmp	L30
L31:
	movq	16(%rbp), %rax
	jmp	L14
L30:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L32:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L34
	jmp	L33
L34:
	movq	16(%rbp), %rax
	jmp	L14
L33:
	movq	COpt_sum_lim, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L36
	jmp	L35
L36:
	movq	16(%rbp), %rax
	jmp	L14
L35:
	jmp	L15
L37:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L39
	jmp	L38
L39:
	movq	16(%rbp), %rax
	jmp	L14
L38:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rax, -8(%rbp)
	jmp	L15
L40:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L42
	jmp	L41
L42:
	movq	16(%rbp), %rax
	jmp	L14
L41:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L43:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L44:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	orq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L45:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	xorq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L46:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$63, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L48
	jmp	L47
L48:
	movq	16(%rbp), %rax
	jmp	L14
L47:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L49:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$63, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L51
	jmp	L50
L51:
	movq	16(%rbp), %rax
	jmp	L14
L50:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L52:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L53
	incq	%rdx
L53:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L54:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L55
	incq	%rdx
L55:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L56:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L57
	incq	%rdx
L57:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L58:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L59
	incq	%rdx
L59:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L60:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L61
	incq	%rdx
L61:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L62:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L63
	incq	%rdx
L63:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	L15
L64:
	movq	16(%rbp), %rax
	jmp	L14
	jmp	L15
	jmp	L15
L16:
	movq	$L65, %rdx
	jmp	switch
L65:
	.quad	17
	.quad	32, L17
	.quad	1, L18
	.quad	41, L25
	.quad	28, L32
	.quad	14, L37
	.quad	27, L40
	.quad	4, L43
	.quad	5, L44
	.quad	6, L45
	.quad	25, L46
	.quad	37, L49
	.quad	15, L52
	.quad	31, L54
	.quad	22, L56
	.quad	16, L58
	.quad	26, L60
	.quad	17, L62
	.quad	L64
L15:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	jmp	L14
L14:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L66,8
	.lcomm	L67,8
	.text
Cfold1:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L66, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
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
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L70
L71:
	movq	-8(%rbp), %rax
	notq	%rax
	movq	%rax, -8(%rbp)
	jmp	L69
L72:
	movq	-8(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	movq	%rax, -8(%rbp)
	jmp	L69
L73:
	movq	-8(%rbp), %rax
	negq	%rax
	movq	%rax, -8(%rbp)
	jmp	L69
L74:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	movq	%rax, -8(%rbp)
	jmp	L69
L75:
	movq	16(%rbp), %rax
	jmp	L68
	jmp	L69
	jmp	L69
L70:
	movq	$L76, %rdx
	jmp	switch
L76:
	.quad	4
	.quad	30, L71
	.quad	24, L72
	.quad	29, L73
	.quad	39, L74
	.quad	L75
L69:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	jmp	L68
L68:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L77,8
	.lcomm	L78,8
	.text
Creduce:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-64, %rsp
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	$L77, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L80
	incq	%rdx
L80:
	movq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L81
	incq	%rdx
L81:
	movq	%rdx, %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	orq	%rax, %rax
	jnz	L83
	jmp	L82
L83:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L82:
	movq	-48(%rbp), %rax
	orq	%rax, %rax
	jnz	L85
	jmp	L84
L85:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
L84:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L88
	incq	%rdx
L88:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L89
	jmp	L86
L89:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L90
	incq	%rdx
L90:
	movq	%rdx, %rax
L86:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L91
	jmp	L87
L91:
	movq	-48(%rbp), %rax
	orq	%rax, %rax
	jnz	L92
	jmp	L87
L92:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L93
	incq	%rdx
L93:
	movq	%rdx, %rax
L87:
	orq	%rax, %rax
	jnz	L95
	jmp	L94
L95:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	jmp	L79
L94:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L98
	incq	%rdx
L98:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L99
	jmp	L96
L99:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L100
	incq	%rdx
L100:
	movq	%rdx, %rax
L96:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L101
	jmp	L97
L101:
	movq	-40(%rbp), %rax
	orq	%rax, %rax
	jnz	L102
	jmp	L97
L102:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L103
	incq	%rdx
L103:
	movq	%rdx, %rax
L97:
	orq	%rax, %rax
	jnz	L105
	jmp	L104
L105:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	jmp	L79
L104:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$41, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L107
	incq	%rdx
L107:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L108
	jmp	L106
L108:
	movq	-48(%rbp), %rax
	orq	%rax, %rax
	jnz	L109
	jmp	L106
L109:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L110
	incq	%rdx
L110:
	movq	%rdx, %rax
L106:
	orq	%rax, %rax
	jnz	L112
	jmp	L111
L112:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	jmp	L79
L111:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$41, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L114
	incq	%rdx
L114:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L115
	jmp	L113
L115:
	movq	-40(%rbp), %rax
	orq	%rax, %rax
	jnz	L116
	jmp	L113
L116:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L117
	incq	%rdx
L117:
	movq	%rdx, %rax
L113:
	orq	%rax, %rax
	jnz	L119
	jmp	L118
L119:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$29, %rax
	pushq	%rax
	call	Cmkunop
	addq	$16, %rsp
	jmp	L79
L118:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$28, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L121
	incq	%rdx
L121:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L122
	jmp	L120
L122:
	movq	-40(%rbp), %rax
	orq	%rax, %rax
	jnz	L123
	jmp	L120
L123:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L124
	incq	%rdx
L124:
	movq	%rdx, %rax
L120:
	orq	%rax, %rax
	jnz	L126
	jmp	L125
L126:
	movq	$0, %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	jmp	L79
L125:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$28, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L128
	incq	%rdx
L128:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L129
	jmp	L127
L129:
	movq	-48(%rbp), %rax
	orq	%rax, %rax
	jnz	L130
	jmp	L127
L130:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L131
	incq	%rdx
L131:
	movq	%rdx, %rax
L127:
	orq	%rax, %rax
	jnz	L133
	jmp	L132
L133:
	movq	$0, %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	jmp	L79
L132:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$28, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L135
	incq	%rdx
L135:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L136
	jmp	L134
L136:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$14, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L137
	incq	%rdx
L137:
	movq	%rdx, %rax
L134:
	orq	%rax, %rax
	jnz	L139
	jmp	L138
L139:
	movq	$63, %rax
	movq	%rax, -24(%rbp)
	movq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	$0, %rax
	movq	%rax, -16(%rbp)
L140:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L144
	jmp	L142
L144:
	jmp	L141
L143:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	movq	%rax, -8(%rbp)
	jmp	L140
L141:
	movq	-48(%rbp), %rax
	orq	%rax, %rax
	jnz	L146
	jmp	L145
L146:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L147
	incq	%rdx
L147:
	movq	%rdx, %rax
L145:
	orq	%rax, %rax
	jnz	L149
	jmp	L148
L149:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$28, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L151
	jmp	L150
L151:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$25, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	jmp	L79
	jmp	L152
L150:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$37, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	jmp	L79
L152:
	jmp	L153
L148:
	movq	-40(%rbp), %rax
	orq	%rax, %rax
	jnz	L155
	jmp	L154
L155:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L156
	incq	%rdx
L156:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L157
	jmp	L154
L157:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$28, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L158
	incq	%rdx
L158:
	movq	%rdx, %rax
L154:
	orq	%rax, %rax
	jnz	L160
	jmp	L159
L160:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$25, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	jmp	L79
L159:
L153:
	jmp	L143
L142:
L138:
	movq	16(%rbp), %rax
	jmp	L79
L79:
	addq	$64, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L161,16
	.lcomm	L162,16
	.text
	.globl	Cfold_reduce
Cfold_reduce:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L161, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L162, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L165
	jmp	L164
L165:
	movq	$0, %rax
	jmp	L163
L164:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfold_reduce
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfold_reduce
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L167
	jmp	L166
L167:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L168
	incq	%rdx
L168:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L169
	jmp	L166
L169:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L170
	jmp	L166
L170:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L171
	incq	%rdx
L171:
	movq	%rdx, %rax
L166:
	orq	%rax, %rax
	jnz	L173
	jmp	L172
L173:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfold2
	addq	$8, %rsp
	movq	%rax, 16(%rbp)
	jmp	L174
L172:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L176
	jmp	L175
L176:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L177
	incq	%rdx
L177:
	movq	%rdx, %rax
L175:
	orq	%rax, %rax
	jnz	L179
	jmp	L178
L179:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfold1
	addq	$8, %rsp
	movq	%rax, 16(%rbp)
L178:
L174:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L182
	jmp	L180
L182:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L183
	jmp	L180
L183:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L184
	incq	%rdx
L184:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L185
	jmp	L181
L185:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L186
	incq	%rdx
L186:
	movq	%rdx, %rax
L181:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L180:
	orq	%rax, %rax
	jnz	L188
	jmp	L187
L188:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Creduce
	addq	$8, %rsp
	movq	%rax, 16(%rbp)
L187:
	movq	16(%rbp), %rax
	jmp	L163
L163:
	popq	%rbp
	ret
	.data
	.lcomm	L189,16
	.lcomm	L190,16
	.text
	.globl	Creorder_ops
Creorder_ops:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L189, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L189, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L190, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L193
	jmp	L192
L193:
	movq	$0, %rax
	jmp	L191
L192:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Creorder_ops
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Creorder_ops
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L195
	incq	%rdx
L195:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L196
	jmp	L194
L196:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L197
	incq	%rdx
L197:
	movq	%rdx, %rax
L194:
	orq	%rax, %rax
	jnz	L199
	jmp	L198
L199:
	movq	16(%rbp), %rax
	jmp	L191
L198:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L204
	incq	%rdx
L204:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L205
	jmp	L200
L205:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$38, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L206
	incq	%rdx
L206:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L207
	jmp	L201
L207:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L208
	jmp	L201
L208:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$18, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L209
	incq	%rdx
L209:
	movq	%rdx, %rax
L201:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L200:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L210
	jmp	L202
L210:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L211
	incq	%rdx
L211:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L212
	jmp	L203
L212:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L213
	incq	%rdx
L213:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L214
	jmp	L203
L214:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$28, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L215
	incq	%rdx
L215:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L216
	jmp	L203
L216:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L217
	incq	%rdx
L217:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L218
	jmp	L203
L218:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L219
	incq	%rdx
L219:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L220
	jmp	L203
L220:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$6, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L221
	incq	%rdx
L221:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L222
	jmp	L203
L222:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$15, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L223
	incq	%rdx
L223:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L224
	jmp	L203
L224:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$31, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L225
	incq	%rdx
L225:
	movq	%rdx, %rax
L203:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L202:
	orq	%rax, %rax
	jnz	L227
	jmp	L226
L227:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L229
	jmp	L228
L229:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L228:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L226:
	movq	16(%rbp), %rax
	jmp	L191
L191:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L230,16
	.lcomm	L231,16
	.text
	.globl	Coptimize
Coptimize:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L230, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L230, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L231, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfold_reduce
	addq	$8, %rsp
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	call	Creorder_ops
	addq	$8, %rsp
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	jmp	L232
L232:
	popq	%rbp
	ret

