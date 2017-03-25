	.text
	.data
	.globl	CLevel
CLevel:	.quad	0
	.globl	CBars
	.comm	CBars,104
	.lcomm	L1,8
	.lcomm	L2,8
	.text
Cmknode:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
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
	movq	$107, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
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
	movq	$101, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
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
	movq	$101, %rax
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
	movq	$3, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	CNdtop, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$4096, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L5
	jmp	L4
L5:
	.data
L6:
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'r'
	.byte	'e'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'l'
	.byte	'e'
	.byte	'x'
	.byte	32
	.byte	40
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	's'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L6, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L4:
	movq	$CNodes, %rax
	pushq	%rax
	movq	CNdtop, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	CNdtop, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, CNdtop
	movq	CNdtop, %rax
	pushq	%rax
	movq	CNdmax, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L8
	jmp	L7
L8:
	movq	CNdtop, %rax
	movq	%rax, CNdmax
L7:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	48(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	-8(%rbp), %rax
	jmp	L3
L3:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L9,8
	.lcomm	L10,8
	.text
	.globl	Cmkleaf
Cmkleaf:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L9, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L10, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L11
L11:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L12,8
	.lcomm	L13,8
	.text
	.globl	Cmkunop
Cmkunop:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L12, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L14
L14:
	popq	%rbp
	ret
	.data
	.lcomm	L15,8
	.lcomm	L16,8
	.text
	.globl	Cmkunop1
Cmkunop1:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L15, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L17
L17:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L18,8
	.lcomm	L19,8
	.text
	.globl	Cmkunop2
Cmkunop2:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L18, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	leaq	-16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L20
L20:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L21,8
	.lcomm	L22,8
	.text
	.globl	Cmkbinop
Cmkbinop:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L21, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
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
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L23
L23:
	popq	%rbp
	ret
	.data
	.lcomm	L24,16
	.lcomm	L25,16
	.text
	.globl	Cmkbinop1
Cmkbinop1:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L24, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	40(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L26
L26:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L27,16
	.lcomm	L28,16
	.text
	.globl	Cmkbinop2
Cmkbinop2:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L27, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L27, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	48(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	leaq	-16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cmknode
	addq	$40, %rsp
	jmp	L29
L29:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L30,16
	.lcomm	L31,16
	.text
	.globl	Cemitcond
Cemitcond:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L30, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$9, %rax
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
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L34
	jmp	L33
L34:
	movq	24(%rbp), %rax
	pushq	%rax
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
	pushq	%rax
	call	Cemitcond
	addq	$16, %rsp
L33:
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
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
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
	pushq	%rax
	call	Cgenbrfalse
	addq	$8, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	call	Ccommit
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
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
L32:
	popq	%rbp
	ret
	.data
	.lcomm	L35,16
	.lcomm	L36,16
	.text
	.globl	Cemitargs
Cemitargs:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L35, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
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
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L39
	jmp	L38
L39:
	jmp	L37
L38:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemitargs
	addq	$8, %rsp
L37:
	popq	%rbp
	ret
	.data
	.lcomm	L40,16
	.lcomm	L41,16
	.text
Cemittree1:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L40, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$10, %rax
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
	je	L44
	jmp	L43
L44:
	jmp	L42
L43:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L46
L47:
	jmp	L45
L48:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenaddr
	addq	$8, %rsp
	jmp	L45
L49:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenlit
	addq	$8, %rsp
	jmp	L45
L50:
L51:
L52:
L53:
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-24(%rbp), %rax
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
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L55
L56:
	movq	$1, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgeninc
	addq	$24, %rsp
	jmp	L54
L57:
	movq	$1, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgeninc
	addq	$24, %rsp
	jmp	L54
L58:
	movq	$0, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgeninc
	addq	$24, %rsp
	jmp	L54
L59:
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgeninc
	addq	$24, %rsp
	jmp	L54
	jmp	L54
L55:
	movq	$L60, %rdx
	jmp	switch
L60:
	.quad	4
	.quad	34, L56
	.quad	33, L57
	.quad	36, L58
	.quad	35, L59
	.quad	L54
L54:
	jmp	L45
L61:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenscaleby
	addq	$8, %rsp
	jmp	L45
L62:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	jmp	L45
L63:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenldlab
	addq	$8, %rsp
	jmp	L45
L64:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-24(%rbp), %rax
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
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenrval
	addq	$8, %rsp
	jmp	L45
L65:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Cgenbool
	jmp	L45
L66:
L67:
L68:
L69:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L71
L72:
	call	Cgenbool
	jmp	L70
L73:
	call	Cgenlognot
	jmp	L70
L74:
	call	Cgenneg
	jmp	L70
L75:
	call	Cgennot
	jmp	L70
L76:
	call	Cgenscale
	jmp	L70
	jmp	L70
L71:
	movq	$L77, %rdx
	jmp	switch
L77:
	.quad	5
	.quad	7, L72
	.quad	24, L73
	.quad	29, L74
	.quad	30, L75
	.quad	39, L76
	.quad	L70
L70:
	jmp	L45
L78:
L79:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L82
	jmp	L80
L82:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenbrtrue
	addq	$8, %rsp
	jmp	L81
L80:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenbrfalse
	addq	$8, %rsp
L81:
	movq	$0, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	jmp	L45
L83:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemitcond
	addq	$16, %rsp
	call	Ccommit
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	jmp	L45
L84:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	$0, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	jmp	L45
L85:
L86:
L87:
L88:
L89:
L90:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L92
L93:
	movq	$1, %rax
	pushq	%rax
	call	Cqueue_cmp
	addq	$8, %rsp
	jmp	L91
L94:
	movq	$2, %rax
	pushq	%rax
	call	Cqueue_cmp
	addq	$8, %rsp
	jmp	L91
L95:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jnz	L98
	jmp	L96
L98:
	movq	$7, %rax
	jmp	L97
L96:
	movq	$3, %rax
L97:
	pushq	%rax
	call	Cqueue_cmp
	addq	$8, %rsp
	jmp	L91
L99:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jnz	L102
	jmp	L100
L102:
	movq	$8, %rax
	jmp	L101
L100:
	movq	$4, %rax
L101:
	pushq	%rax
	call	Cqueue_cmp
	addq	$8, %rsp
	jmp	L91
L103:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jnz	L106
	jmp	L104
L106:
	movq	$9, %rax
	jmp	L105
L104:
	movq	$5, %rax
L105:
	pushq	%rax
	call	Cqueue_cmp
	addq	$8, %rsp
	jmp	L91
L107:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jnz	L110
	jmp	L108
L110:
	movq	$10, %rax
	jmp	L109
L108:
	movq	$6, %rax
L109:
	pushq	%rax
	call	Cqueue_cmp
	addq	$8, %rsp
	jmp	L91
	jmp	L91
L92:
	movq	$L111, %rdx
	jmp	switch
L111:
	.quad	6
	.quad	15, L93
	.quad	31, L94
	.quad	22, L95
	.quad	16, L99
	.quad	26, L103
	.quad	17, L107
	.quad	L91
L91:
	jmp	L45
L112:
L113:
L114:
L115:
L116:
L117:
L118:
L119:
L120:
L121:
L122:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	jmp	L124
L125:
	movq	$1, %rax
	pushq	%rax
	call	Cgenshl
	addq	$8, %rsp
	jmp	L123
L126:
	movq	$1, %rax
	pushq	%rax
	call	Cgenshr
	addq	$8, %rsp
	jmp	L123
L127:
	movq	$1, %rax
	pushq	%rax
	call	Cgendiv
	addq	$8, %rsp
	jmp	L123
L128:
	movq	$1, %rax
	pushq	%rax
	call	Cgenmod
	addq	$8, %rsp
	jmp	L123
L129:
	call	Cgenand
	jmp	L123
L130:
	call	Cgenior
	jmp	L123
L131:
	call	Cgenxor
	jmp	L123
L132:
	call	Cgenmul
	jmp	L123
L133:
	movq	$1, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	Cgenadd
	addq	$24, %rsp
	jmp	L123
L134:
	movq	$1, %rax
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
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenadd
	addq	$24, %rsp
	jmp	L123
L135:
	movq	$1, %rax
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
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgensub
	addq	$24, %rsp
	jmp	L123
	jmp	L123
L124:
	movq	$L136, %rdx
	jmp	switch
L136:
	.quad	11
	.quad	25, L125
	.quad	37, L126
	.quad	14, L127
	.quad	27, L128
	.quad	4, L129
	.quad	5, L130
	.quad	6, L131
	.quad	28, L132
	.quad	1, L133
	.quad	32, L134
	.quad	41, L135
	.quad	L123
L123:
	jmp	L45
L137:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemitargs
	addq	$8, %rsp
	call	Ccommit
	call	Cspill
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgencall
	addq	$8, %rsp
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
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	call	Cgenstack
	addq	$8, %rsp
	jmp	L45
L138:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemitargs
	addq	$8, %rsp
	call	Ccommit
	call	Cspill
	movq	$0, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenrval
	addq	$8, %rsp
	call	Cgencalr
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
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	call	Cgenstack
	addq	$8, %rsp
	jmp	L45
L139:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$18, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L141
	jmp	L140
L141:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	jmp	L142
L140:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
	call	Ccommit
L142:
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-24(%rbp), %rax
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
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenstore
	addq	$8, %rsp
	jmp	L45
	jmp	L45
L46:
	movq	$L143, %rdx
	jmp	switch
L143:
	.quad	40
	.quad	18, L47
	.quad	2, L48
	.quad	23, L49
	.quad	34, L50
	.quad	33, L51
	.quad	36, L52
	.quad	35, L53
	.quad	40, L61
	.quad	20, L62
	.quad	21, L63
	.quad	38, L64
	.quad	7, L65
	.quad	24, L66
	.quad	29, L67
	.quad	30, L68
	.quad	39, L69
	.quad	8, L78
	.quad	9, L79
	.quad	19, L83
	.quad	12, L84
	.quad	15, L85
	.quad	31, L86
	.quad	22, L87
	.quad	16, L88
	.quad	26, L89
	.quad	17, L90
	.quad	27, L112
	.quad	25, L113
	.quad	37, L114
	.quad	14, L115
	.quad	4, L116
	.quad	5, L117
	.quad	6, L118
	.quad	28, L119
	.quad	41, L120
	.quad	32, L121
	.quad	1, L122
	.quad	10, L137
	.quad	11, L138
	.quad	3, L139
	.quad	L45
L45:
L42:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L144,16
	.lcomm	L145,16
	.text
	.globl	Cemittree
Cemittree:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L144, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L144, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L145, %rax
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
	call	Coptimize
	addq	$8, %rsp
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cemittree1
	addq	$8, %rsp
L146:
	popq	%rbp
	ret

