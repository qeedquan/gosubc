	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
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
	movq	$-2, %rax
	movb	%al, -8(%rbp)
	xorq	%rax, %rax
	movb	-8(%rbp), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L5
	jmp	L4
L5:
	.data
L6:
	.byte	'c'
	.byte	'h'
	.byte	'a'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	's'
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L6, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L4:
	movq	$254, %rax
	pushq	%rax
	xorq	%rax, %rax
	movb	-8(%rbp), %al
	popq	%rcx
	cmpq	%rax, %rcx
	je	L8
	jmp	L7
L8:
	.data
L9:
	.byte	'w'
	.byte	'r'
	.byte	'a'
	.byte	'p'
	.byte	'p'
	.byte	'e'
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L9, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L7:
	.data
L10:
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	xorq	%rax, %rax
	movb	-8(%rbp), %al
	pushq	%rax
	movq	$L10, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$0, %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret

