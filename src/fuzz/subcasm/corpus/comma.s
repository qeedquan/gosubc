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
	movq	$1, %rax
	pushq	%rax
	movq	$0, %rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L4
	incq	%rdx
L4:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.data
L5:
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L5, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	$0, %rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L6
	incq	%rdx
L6:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.data
L7:
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L7, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	$0, %rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L8
	incq	%rdx
L8:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.data
L9:
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L9, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	$0, %rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L10
	incq	%rdx
L10:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	.data
L11:
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L11, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$0, %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret

