	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$2, -8(%rbp)
	movq	$L1, %rax
	pushq	%rax
	movq	$109, %rax
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
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$109, %rax
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
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L4:
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$4, %rax
	orq	%rax, %rax
	jz	L6
	jmp	L5
L6:
	movq	$3, %rax
L5:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L7
	incq	%rdx
L7:
	movq	%rdx, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L4, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$0, %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret

