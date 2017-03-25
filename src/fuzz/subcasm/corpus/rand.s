	.text
	.data
C_seed:	.quad	57005
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Crand
Crand:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	C_seed, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	pushq	%rax
	movq	C_seed, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	popq	%rcx
	xorq	%rcx, %rax
	pushq	%rax
	movq	C_seed, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	popq	%rcx
	xorq	%rcx, %rax
	pushq	%rax
	movq	C_seed, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	popq	%rcx
	xorq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	C_seed, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	pushq	%rax
	movq	$32767, %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$15, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	popq	%rcx
	orq	%rcx, %rax
	movq	%rax, C_seed
	movq	C_seed, %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L4,8
	.lcomm	L5,8
	.text
	.globl	Csrand
Csrand:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L4, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L4, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L4, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L4, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L4, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L4, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L9
	jmp	L7
L9:
	movq	$65535, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	jmp	L8
L7:
	movq	$57005, %rax
L8:
	movq	%rax, C_seed
L6:
	popq	%rbp
	ret

