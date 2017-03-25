	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cstrtol
Cstrtol:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-48, %rsp
	movq	$1, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -48(%rbp)
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
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
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L5
	incq	%rdx
L5:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L6
	jmp	L4
L6:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$36, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L7
	incq	%rdx
L7:
	movq	%rdx, %rax
L4:
	orq	%rax, %rax
	jnz	L9
	jmp	L8
L9:
	movq	$5, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L3
L8:
	movq	16(%rbp), %rax
	movq	%rax, -40(%rbp)
L11:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L12
	jmp	L10
L12:
	movq	16(%rbp), %rax
	incq	16(%rbp)
	jmp	L11
L10:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$45, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L14
	jmp	L13
L14:
	movq	$-1, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	incq	16(%rbp)
	jmp	L15
L13:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$43, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L17
	jmp	L16
L17:
	movq	16(%rbp), %rax
	incq	16(%rbp)
L16:
L15:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L20
	incq	%rdx
L20:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L21
	jmp	L18
L21:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L22
	incq	%rdx
L22:
	movq	%rdx, %rax
L18:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L23
	jmp	L19
L23:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$48, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L24
	incq	%rdx
L24:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L25
	jmp	L19
L25:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$120, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L26
	incq	%rdx
L26:
	movq	%rdx, %rax
L19:
	orq	%rax, %rax
	jnz	L28
	jmp	L27
L28:
	movq	$16, %rax
	movq	%rax, 32(%rbp)
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, 16(%rbp)
	jmp	L29
L27:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L32
	incq	%rdx
L32:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L33
	jmp	L30
L33:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L34
	incq	%rdx
L34:
	movq	%rdx, %rax
L30:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L35
	jmp	L31
L35:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$48, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L36
	incq	%rdx
L36:
	movq	%rdx, %rax
L31:
	orq	%rax, %rax
	jnz	L38
	jmp	L37
L38:
	movq	$8, %rax
	movq	%rax, 32(%rbp)
	movq	16(%rbp), %rax
	incq	16(%rbp)
L37:
L29:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L40
	jmp	L39
L40:
	movq	$10, %rax
	movq	%rax, 32(%rbp)
L39:
	.data
L41:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	'6'
	.byte	'7'
	.byte	'8'
	.byte	'9'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	'h'
	.byte	'i'
	.byte	'j'
	.byte	'k'
	.byte	'l'
	.byte	'm'
	.byte	'n'
	.byte	'o'
	.byte	'p'
	.byte	'q'
	.byte	'r'
	.byte	's'
	.byte	't'
	.byte	'u'
	.byte	'v'
	.byte	'w'
	.byte	'x'
	.byte	'y'
	.byte	'z'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L41, %rax
	movq	%rax, -32(%rbp)
L42:
	jmp	L43
L45:
	jmp	L42
L43:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L47
	jmp	L46
L47:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L48
	incq	%rdx
L48:
	movq	%rdx, %rax
L46:
	orq	%rax, %rax
	jnz	L50
	jmp	L49
L50:
	jmp	L44
L49:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rax
	incq	16(%rbp)
	movq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	L45
L44:
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L52
	jmp	L51
L52:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jnz	L55
	jmp	L53
L55:
	movq	16(%rbp), %rax
	jmp	L54
L53:
	movq	-40(%rbp), %rax
L54:
	popq	%rdx
	movq	%rax, (%rdx)
L51:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	jmp	L3
L3:
	addq	$48, %rsp
	popq	%rbp
	ret

