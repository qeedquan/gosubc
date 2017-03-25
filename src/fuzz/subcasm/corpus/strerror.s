	.text
	.data
	.lcomm	L1,16
	.lcomm	L2,16
	.text
	.globl	Cstrerror
Cstrerror:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$115, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	16(%rbp), %rax
	jmp	L5
L6:
	.data
L7:
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L7, %rax
	jmp	L3
L8:
	.data
L9:
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L9, %rax
	jmp	L3
L10:
	.data
L11:
	.byte	'a'
	.byte	'c'
	.byte	'c'
	.byte	'e'
	.byte	's'
	.byte	's'
	.byte	32
	.byte	'd'
	.byte	'e'
	.byte	'n'
	.byte	'i'
	.byte	'e'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L11, %rax
	jmp	L3
L12:
	.data
L13:
	.byte	'i'
	.byte	'n'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	47
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L13, %rax
	jmp	L3
L14:
	.data
L15:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L15, %rax
	jmp	L3
L16:
	.data
L17:
	.byte	'i'
	.byte	'n'
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'd'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'u'
	.byte	'm'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L17, %rax
	jmp	L3
L18:
	.data
L19:
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'o'
	.byte	'r'
	.byte	'y'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L19, %rax
	jmp	L3
L20:
	.data
L21:
	.byte	'u'
	.byte	'n'
	.byte	'k'
	.byte	'n'
	.byte	'o'
	.byte	'w'
	.byte	'n'
	.byte	32
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L21, %rax
	jmp	L3
	jmp	L4
L5:
	movq	$L22, %rdx
	jmp	switch
L22:
	.quad	7
	.quad	0, L6
	.quad	1, L8
	.quad	2, L10
	.quad	3, L12
	.quad	4, L14
	.quad	5, L16
	.quad	6, L18
	.quad	L20
L4:
L3:
	popq	%rbp
	ret

