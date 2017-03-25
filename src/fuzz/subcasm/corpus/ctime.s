	.text
	.data
Cndays:	.quad	31
	.quad	28
	.quad	31
	.quad	30
	.quad	31
	.quad	30
	.quad	31
	.quad	31
	.quad	30
	.quad	31
	.quad	30
	.quad	31
	.lcomm	L1,8
	.lcomm	L2,8
	.lcomm	L3,104
	.text
	.globl	Cctime
Cctime:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-104, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$109, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$109, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L5:
	.byte	'S'
	.byte	'u'
	.byte	'n'
	.byte	0
	.byte	'M'
	.byte	'o'
	.byte	'n'
	.byte	0
	.byte	'T'
	.byte	'u'
	.byte	'e'
	.byte	0
	.byte	'W'
	.byte	'e'
	.byte	'd'
	.byte	0
	.byte	'T'
	.byte	'h'
	.byte	'u'
	.byte	0
	.byte	'F'
	.byte	'r'
	.byte	'i'
	.byte	0
	.byte	'S'
	.byte	'a'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L5, %rax
	movq	%rax, -96(%rbp)
	.data
L6:
	.byte	'J'
	.byte	'a'
	.byte	'n'
	.byte	0
	.byte	'F'
	.byte	'e'
	.byte	'b'
	.byte	0
	.byte	'M'
	.byte	'a'
	.byte	'r'
	.byte	0
	.byte	'A'
	.byte	'p'
	.byte	'r'
	.byte	0
	.byte	'M'
	.byte	'a'
	.byte	'y'
	.byte	0
	.byte	'J'
	.byte	'u'
	.byte	'n'
	.byte	0
	.byte	'J'
	.byte	'u'
	.byte	'l'
	.byte	0
	.byte	'A'
	.byte	'u'
	.byte	'g'
	.byte	0
	.byte	'S'
	.byte	'e'
	.byte	'p'
	.byte	0
	.byte	'O'
	.byte	'c'
	.byte	't'
	.byte	0
	.byte	'N'
	.byte	'o'
	.byte	'v'
	.byte	0
	.byte	'D'
	.byte	'e'
	.byte	'c'
	.byte	0
	.text
	movq	$L6, %rax
	movq	%rax, -104(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$86400, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$31536000, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$31536000, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	pushq	%rax
	movq	$86400, %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	$1970, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -40(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$86400, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rax, -48(%rbp)
	movq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	$0, %rax
	movq	%rax, -16(%rbp)
	movq	%rax, -24(%rbp)
L8:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L9
	jmp	L7
L9:
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$Cndays, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$86400, %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	jmp	L8
L7:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -56(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$86400, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rax, -64(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$86400, %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	-64(%rbp), %rax
	incq	-64(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$3600, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rax, -72(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$3600, %rax
	pushq	%rax
	movq	-72(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$60, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rax, -80(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$60, %rax
	pushq	%rax
	movq	-80(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -88(%rbp)
	.data
L10:
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	'2'
	.byte	'd'
	.byte	32
	.byte	37
	.byte	'2'
	.byte	'd'
	.byte	58
	.byte	37
	.byte	'0'
	.byte	'2'
	.byte	'd'
	.byte	58
	.byte	37
	.byte	'0'
	.byte	'2'
	.byte	'd'
	.byte	32
	.byte	37
	.byte	'0'
	.byte	'4'
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-88(%rbp), %rax
	pushq	%rax
	movq	-80(%rbp), %rax
	pushq	%rax
	movq	-72(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	-104(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	-96(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L10, %rax
	pushq	%rax
	movq	$L3, %rax
	pushq	%rax
	call	Csprintf
	addq	$72, %rsp
	movq	$L3, %rax
	jmp	L4
L4:
	addq	$104, %rsp
	popq	%rbp
	ret

