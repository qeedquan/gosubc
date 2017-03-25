	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cnext
Cnext:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
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
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
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
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CPutback, %rax
	orq	%rax, %rax
	jnz	L5
	jmp	L4
L5:
	movq	CPutback, %rax
	movq	%rax, -8(%rbp)
	movq	$0, %rax
	movq	%rax, CPutback
	movq	-8(%rbp), %rax
	jmp	L3
L4:
	movq	CMp, %rax
	orq	%rax, %rax
	jnz	L7
	jmp	L6
L7:
	movq	$CMacp, %rax
	pushq	%rax
	movq	CMp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L9
	jmp	L8
L9:
	movq	$CMacp, %rax
	pushq	%rax
	movq	CMp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CMacc, %rax
	decq	CMp
	pushq	%rax
	movq	CMp, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	jmp	L3
	jmp	L10
L8:
	movq	$CMacp, %rax
	pushq	%rax
	movq	CMp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rax), %rax
	incq	(%rdx)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L3
L10:
L6:
	movq	CInfile, %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L12
	jmp	L11
L12:
	movq	CLine, %rax
	incq	CLine
L11:
	movq	-8(%rbp), %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L13,8
	.lcomm	L14,8
	.text
	.globl	Cputback
Cputback:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L13, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, CPutback
L15:
	popq	%rbp
	ret
	.data
	.lcomm	L16,8
	.lcomm	L17,8
	.text
Chexchar:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movq	$L16, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$L17, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L20:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	call	Cisxdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L21
	jmp	L19
L21:
	.data
L22:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	movq	$L22, %rax
	pushq	%rax
	call	Cchrpos
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
	movq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	L20
L19:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jz	L24
	jmp	L23
L24:
	.data
L25:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'd'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	't'
	.byte	's'
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	92
	.byte	'x'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L25, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L23:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$255, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L27
	jmp	L26
L27:
	.data
L28:
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	32
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'r'
	.byte	'a'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	92
	.byte	'x'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L28, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L26:
	movq	-24(%rbp), %rax
	jmp	L18
L18:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L29,8
	.lcomm	L30,8
	.text
Cscanch:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L29, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
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
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$92, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L33
	jmp	L32
L33:
	call	Cnext
	movq	%rax, -16(%rbp)
	jmp	L35
L36:
	movq	$7, %rax
	jmp	L31
L37:
	movq	$8, %rax
	jmp	L31
L38:
	movq	$12, %rax
	jmp	L31
L39:
	movq	$10, %rax
	jmp	L31
L40:
	movq	$13, %rax
	jmp	L31
L41:
	movq	$9, %rax
	jmp	L31
L42:
	movq	$11, %rax
	jmp	L31
L43:
	movq	$92, %rax
	jmp	L31
L44:
	movq	$290, %rax
	jmp	L31
L45:
	movq	$39, %rax
	jmp	L31
L46:
L47:
L48:
L49:
L50:
L51:
L52:
L53:
	movq	$0, %rax
	movq	%rax, -24(%rbp)
	movq	%rax, -8(%rbp)
L54:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L59
	jmp	L58
L59:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$56, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L60
	incq	%rdx
L60:
	movq	%rdx, %rax
L58:
	orq	%rax, %rax
	jnz	L61
	jmp	L56
L61:
	jmp	L55
L57:
	call	Cnext
	movq	%rax, -16(%rbp)
	jmp	L54
L55:
	incq	-8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L63
	jmp	L62
L63:
	jmp	L56
L62:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
	jmp	L57
L56:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	-24(%rbp), %rax
	jmp	L31
L64:
	call	Chexchar
	jmp	L31
L65:
	.data
L66:
	.byte	'u'
	.byte	'n'
	.byte	'k'
	.byte	'n'
	.byte	'o'
	.byte	'w'
	.byte	'n'
	.byte	32
	.byte	'e'
	.byte	's'
	.byte	'c'
	.byte	'a'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	'e'
	.byte	'q'
	.byte	'u'
	.byte	'e'
	.byte	'n'
	.byte	'c'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$L66, %rax
	pushq	%rax
	call	Cscnerror
	addq	$16, %rsp
	movq	$32, %rax
	jmp	L31
	jmp	L34
L35:
	movq	$L67, %rdx
	jmp	switch
L67:
	.quad	19
	.quad	97, L36
	.quad	98, L37
	.quad	102, L38
	.quad	110, L39
	.quad	114, L40
	.quad	116, L41
	.quad	118, L42
	.quad	92, L43
	.quad	34, L44
	.quad	39, L45
	.quad	48, L46
	.quad	49, L47
	.quad	50, L48
	.quad	51, L49
	.quad	52, L50
	.quad	53, L51
	.quad	54, L52
	.quad	55, L53
	.quad	120, L64
	.quad	L65
L34:
	jmp	L68
L32:
	movq	-16(%rbp), %rax
	jmp	L31
L68:
L31:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L69,8
	.lcomm	L70,8
	.text
Cscanint:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$0, -32(%rbp)
	movq	$L69, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L69, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L70, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	movq	%rax, -8(%rbp)
	movq	$10, %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L73
	jmp	L72
L73:
	movq	$CText, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	incq	-32(%rbp)
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, 16(%rbp)
	pushq	%rax
	movq	$120, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L75
	jmp	L74
L75:
	movq	$16, %rax
	movq	%rax, -16(%rbp)
	movq	$CText, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	incq	-32(%rbp)
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, 16(%rbp)
	jmp	L76
L74:
	movq	$8, %rax
	movq	%rax, -16(%rbp)
L76:
L72:
L78:
	.data
L79:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	movq	$L79, %rax
	pushq	%rax
	call	Cchrpos
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L80
	jmp	L77
L80:
	movq	$CText, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	incq	-32(%rbp)
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L82
	jmp	L81
L82:
	.data
L83:
	.byte	'i'
	.byte	'n'
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'd'
	.byte	32
	.byte	'd'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'g'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	'l'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L83, %rax
	pushq	%rax
	call	Cscnerror
	addq	$16, %rsp
L81:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	call	Cnext
	movq	%rax, 16(%rbp)
	jmp	L78
L77:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$CText, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L71
L71:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L84,8
	.lcomm	L85,8
	.text
Cscanstr:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L84, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L84, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L85, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$34, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$1, %rax
	movq	%rax, -8(%rbp)
L87:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$510, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L91
	jmp	L89
L91:
	jmp	L88
L90:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L87
L88:
	call	Cscanch
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$34, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L93
	jmp	L92
L93:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$34, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	movq	%rax, CValue
	jmp	L86
L92:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L90
L89:
	.data
L94:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	0
	.text
	movq	$L94, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L86
L86:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L95,16
	.lcomm	L96,16
	.text
Cscanident:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$0, -8(%rbp)
	movq	$L95, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L96, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L99:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cisalpha
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L101
	jmp	L100
L101:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L102
	jmp	L100
L102:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$95, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L103
	incq	%rdx
L103:
	movq	%rdx, %rax
L100:
	orq	%rax, %rax
	jnz	L104
	jmp	L98
L104:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L106
	jmp	L105
L106:
	.data
L107:
	.byte	'i'
	.byte	'd'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	'i'
	.byte	'f'
	.byte	'i'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L107, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L108
L105:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L110
	jmp	L109
L110:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
L109:
L108:
	call	Cnext
	movq	%rax, 16(%rbp)
	jmp	L99
L98:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L97
L97:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L111,8
	.lcomm	L112,8
	.text
	.globl	Cskip
Cskip:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L111, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L112, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L112, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L112, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L112, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L112, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, -8(%rbp)
	movq	$0, %rax
	movq	%rax, -24(%rbp)
L114:
	jmp	L115
L117:
	jmp	L114
L115:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L119
	jmp	L118
L119:
	.data
L120:
	.byte	60
	.byte	'E'
	.byte	'O'
	.byte	'F'
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L120, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	$-1, %rax
	jmp	L113
L118:
L122:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L124
	incq	%rdx
L124:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L125
	jmp	L123
L125:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L126
	incq	%rdx
L126:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L127
	jmp	L123
L127:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L128
	incq	%rdx
L128:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L129
	jmp	L123
L129:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$13, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L130
	incq	%rdx
L130:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L131
	jmp	L123
L131:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$12, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L132
	incq	%rdx
L132:
	movq	%rdx, %rax
L123:
	orq	%rax, %rax
	jnz	L133
	jmp	L121
L133:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L135
	jmp	L134
L135:
	movq	$1, %rax
	movq	%rax, -24(%rbp)
L134:
	call	Cnext
	movq	%rax, -8(%rbp)
	jmp	L122
L121:
	movq	-24(%rbp), %rax
	orq	%rax, %rax
	jnz	L137
	jmp	L136
L137:
	movq	$35, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L138
	incq	%rdx
L138:
	movq	%rdx, %rax
L136:
	orq	%rax, %rax
	jnz	L140
	jmp	L139
L140:
	call	Cpreproc
	call	Cnext
	movq	%rax, -8(%rbp)
	jmp	L117
L139:
	movq	$0, %rax
	movq	%rax, -24(%rbp)
	movq	$47, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L142
	jmp	L141
L142:
	jmp	L116
L141:
	call	Cnext
	movq	%rax, -8(%rbp)
	movq	$42, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L144
	incq	%rdx
L144:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L145
	jmp	L143
L145:
	movq	$47, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L146
	incq	%rdx
L146:
	movq	%rdx, %rax
L143:
	orq	%rax, %rax
	jnz	L148
	jmp	L147
L148:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$47, %rax
	movq	%rax, -8(%rbp)
	jmp	L116
L147:
	movq	$47, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L150
	jmp	L149
L150:
L152:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L153
	jmp	L151
L153:
	movq	$10, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L155
	jmp	L154
L155:
	jmp	L151
L154:
	jmp	L152
L151:
	jmp	L156
L149:
	movq	$0, %rax
	movq	%rax, -16(%rbp)
L158:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L159
	jmp	L157
L159:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$47, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L161
	incq	%rdx
L161:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L162
	jmp	L160
L162:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$42, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L163
	incq	%rdx
L163:
	movq	%rdx, %rax
L160:
	orq	%rax, %rax
	jnz	L165
	jmp	L164
L165:
	call	Cnext
	movq	%rax, -8(%rbp)
	jmp	L157
L164:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	L158
L157:
L156:
	jmp	L117
L116:
	movq	-8(%rbp), %rax
	jmp	L113
L113:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L166,8
	.lcomm	L167,8
	.text
Ckeyword:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L166, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L167, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L170
L171:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L173
L174:
	.data
L175:
	.byte	35
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'i'
	.byte	'n'
	.byte	'e'
	.byte	0
	.text
	movq	$L175, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L177
	jmp	L176
L177:
	movq	$74, %rax
	jmp	L168
L176:
	jmp	L172
L178:
	.data
L179:
	.byte	35
	.byte	'e'
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L179, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L181
	jmp	L180
L181:
	movq	$75, %rax
	jmp	L168
L180:
	.data
L182:
	.byte	35
	.byte	'e'
	.byte	'n'
	.byte	'd'
	.byte	'i'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L182, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L184
	jmp	L183
L184:
	movq	$77, %rax
	jmp	L168
L183:
	.data
L185:
	.byte	35
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	0
	.byte	0
	.text
	movq	$L185, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L187
	jmp	L186
L187:
	movq	$78, %rax
	jmp	L168
L186:
	jmp	L172
L188:
	.data
L189:
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L189, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L191
	jmp	L190
L191:
	movq	$79, %rax
	jmp	L168
L190:
	.data
L192:
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'n'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.text
	movq	$L192, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L194
	jmp	L193
L194:
	movq	$80, %rax
	jmp	L168
L193:
	.data
L195:
	.byte	35
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'l'
	.byte	'u'
	.byte	'd'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L195, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L197
	jmp	L196
L197:
	movq	$81, %rax
	jmp	L168
L196:
	jmp	L172
L198:
	.data
L199:
	.byte	35
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L199, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L201
	jmp	L200
L201:
	movq	$82, %rax
	jmp	L168
L200:
	jmp	L172
L202:
	.data
L203:
	.byte	35
	.byte	'p'
	.byte	'r'
	.byte	'a'
	.byte	'g'
	.byte	'm'
	.byte	'a'
	.byte	0
	.text
	movq	$L203, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L205
	jmp	L204
L205:
	movq	$83, %rax
	jmp	L168
L204:
	jmp	L172
L206:
	.data
L207:
	.byte	35
	.byte	'u'
	.byte	'n'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L207, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L209
	jmp	L208
L209:
	movq	$84, %rax
	jmp	L168
L208:
	jmp	L172
	jmp	L172
L173:
	movq	$L210, %rdx
	jmp	switch
L210:
	.quad	6
	.quad	100, L174
	.quad	101, L178
	.quad	105, L188
	.quad	108, L198
	.quad	112, L202
	.quad	117, L206
	.quad	L172
L172:
	jmp	L169
L211:
	.data
L212:
	.byte	'a'
	.byte	'u'
	.byte	't'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L212, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L214
	jmp	L213
L214:
	movq	$30, %rax
	jmp	L168
L213:
	jmp	L169
L215:
	.data
L216:
	.byte	'b'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L216, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L218
	jmp	L217
L218:
	movq	$31, %rax
	jmp	L168
L217:
	jmp	L169
L219:
	.data
L220:
	.byte	'c'
	.byte	'a'
	.byte	's'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L220, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L222
	jmp	L221
L222:
	movq	$32, %rax
	jmp	L168
L221:
	.data
L223:
	.byte	'c'
	.byte	'h'
	.byte	'a'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L223, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L225
	jmp	L224
L225:
	movq	$33, %rax
	jmp	L168
L224:
	.data
L226:
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'u'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L226, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L228
	jmp	L227
L228:
	movq	$36, %rax
	jmp	L168
L227:
	jmp	L169
L229:
	.data
L230:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'a'
	.byte	'u'
	.byte	'l'
	.byte	't'
	.byte	0
	.text
	movq	$L230, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L232
	jmp	L231
L232:
	movq	$38, %rax
	jmp	L168
L231:
	.data
L233:
	.byte	'd'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L233, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L235
	jmp	L234
L235:
	movq	$39, %rax
	jmp	L168
L234:
	jmp	L169
L236:
	.data
L237:
	.byte	'e'
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L237, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L239
	jmp	L238
L239:
	movq	$42, %rax
	jmp	L168
L238:
	.data
L240:
	.byte	'e'
	.byte	'n'
	.byte	'u'
	.byte	'm'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L240, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L242
	jmp	L241
L242:
	movq	$43, %rax
	jmp	L168
L241:
	.data
L243:
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	0
	.byte	0
	.text
	movq	$L243, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L245
	jmp	L244
L245:
	movq	$44, %rax
	jmp	L168
L244:
	jmp	L169
L246:
	.data
L247:
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L247, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L249
	jmp	L248
L249:
	movq	$45, %rax
	jmp	L168
L248:
	jmp	L169
L250:
	.data
L251:
	.byte	'i'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L251, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L253
	jmp	L252
L253:
	movq	$47, %rax
	jmp	L168
L252:
	.data
L254:
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L254, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L256
	jmp	L255
L256:
	movq	$49, %rax
	jmp	L168
L255:
	jmp	L169
L257:
	.data
L258:
	.byte	'r'
	.byte	'e'
	.byte	'g'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'e'
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
	movq	$L258, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L260
	jmp	L259
L260:
	movq	$58, %rax
	jmp	L168
L259:
	.data
L261:
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	0
	.byte	0
	.text
	movq	$L261, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L263
	jmp	L262
L263:
	movq	$59, %rax
	jmp	L168
L262:
	jmp	L169
L264:
	.data
L265:
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'o'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L265, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L267
	jmp	L266
L267:
	movq	$62, %rax
	jmp	L168
L266:
	.data
L268:
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'c'
	.byte	0
	.byte	0
	.text
	movq	$L268, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L270
	jmp	L269
L270:
	movq	$63, %rax
	jmp	L168
L269:
	.data
L271:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'u'
	.byte	'c'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$L271, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L273
	jmp	L272
L273:
	movq	$65, %rax
	jmp	L168
L272:
	.data
L274:
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	0
	.byte	0
	.text
	movq	$L274, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L276
	jmp	L275
L276:
	movq	$66, %rax
	jmp	L168
L275:
	jmp	L169
L277:
	.data
L278:
	.byte	'u'
	.byte	'n'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L278, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L280
	jmp	L279
L280:
	movq	$68, %rax
	jmp	L168
L279:
	jmp	L169
L281:
	.data
L282:
	.byte	'v'
	.byte	'o'
	.byte	'i'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L282, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L284
	jmp	L283
L284:
	movq	$69, %rax
	jmp	L168
L283:
	.data
L285:
	.byte	'v'
	.byte	'o'
	.byte	'l'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L285, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L287
	jmp	L286
L287:
	movq	$70, %rax
	jmp	L168
L286:
	jmp	L169
L288:
	.data
L289:
	.byte	'w'
	.byte	'h'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L289, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L291
	jmp	L290
L291:
	movq	$71, %rax
	jmp	L168
L290:
	jmp	L169
	jmp	L169
L170:
	movq	$L292, %rdx
	jmp	switch
L292:
	.quad	13
	.quad	35, L171
	.quad	97, L211
	.quad	98, L215
	.quad	99, L219
	.quad	100, L229
	.quad	101, L236
	.quad	102, L246
	.quad	105, L250
	.quad	114, L257
	.quad	115, L264
	.quad	117, L277
	.quad	118, L281
	.quad	119, L288
	.quad	L169
L169:
	movq	$0, %rax
	jmp	L168
L168:
	popq	%rbp
	ret
	.data
	.lcomm	L293,8
	.lcomm	L294,8
	.text
Cmacro:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L293, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L293, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L293, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L293, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L293, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L293, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L294, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L294, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L294, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L294, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L294, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L294, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfindmac
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L297
	jmp	L296
L297:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$5, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L298
	incq	%rdx
L298:
	movq	%rdx, %rax
L296:
	orq	%rax, %rax
	jnz	L300
	jmp	L299
L300:
	movq	$0, %rax
	jmp	L295
L299:
	movq	$CMtext, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cplaymac
	addq	$8, %rsp
	movq	$1, %rax
	jmp	L295
L295:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L301,8
	.lcomm	L302,8
	.text
Cscanpp:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L301, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L301, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L301, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L301, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L301, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L301, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L301, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L302, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$-1, %rax
	pushq	%rax
	movq	CRejected, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L305
	jmp	L304
L305:
	movq	CRejected, %rax
	movq	%rax, -16(%rbp)
	movq	$-1, %rax
	movq	%rax, CRejected
	movq	$CRejtext, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	CRejval, %rax
	movq	%rax, CValue
	movq	-16(%rbp), %rax
	jmp	L303
L304:
L306:
	jmp	L307
L309:
	jmp	L306
L307:
	movq	$0, %rax
	movq	%rax, CValue
	call	Cskip
	movq	%rax, -8(%rbp)
	movq	$4, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cmemset
	addq	$24, %rsp
	movq	$CText, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L311
L312:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L314
	jmp	L313
L314:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$12, %rax
	jmp	L303
	jmp	L315
L313:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$73, %rax
	jmp	L303
L315:
L316:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L318
	jmp	L317
L318:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$23, %rax
	jmp	L303
	jmp	L319
L317:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$2, %rax
	jmp	L303
L319:
L320:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$38, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L322
	jmp	L321
L322:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$38, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$16, %rax
	jmp	L303
	jmp	L323
L321:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L325
	jmp	L324
L325:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$19, %rax
	jmp	L303
	jmp	L326
L324:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$13, %rax
	jmp	L303
L326:
L323:
L327:
	movq	$53, %rax
	jmp	L303
L328:
	movq	$60, %rax
	jmp	L303
L329:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L331
	jmp	L330
L331:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$28, %rax
	jmp	L303
	jmp	L332
L330:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$1, %rax
	jmp	L303
L332:
L333:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$43, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L335
	jmp	L334
L335:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$43, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$48, %rax
	jmp	L303
	jmp	L336
L334:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L338
	jmp	L337
L338:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$25, %rax
	jmp	L303
	jmp	L339
L337:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$3, %rax
	jmp	L303
L339:
L336:
L340:
	movq	$35, %rax
	jmp	L303
L341:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$45, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L343
	jmp	L342
L343:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$45, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$37, %rax
	jmp	L303
	jmp	L344
L342:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L346
	jmp	L345
L346:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$22, %rax
	jmp	L303
	jmp	L347
L345:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$62, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L349
	jmp	L348
L349:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$62, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$18, %rax
	jmp	L303
	jmp	L350
L348:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$4, %rax
	jmp	L303
L350:
L347:
L344:
L351:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L353
	jmp	L352
L353:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$27, %rax
	jmp	L303
	jmp	L354
L352:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L303
L354:
L355:
	movq	$34, %rax
	jmp	L303
L356:
	movq	$61, %rax
	jmp	L303
L357:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$60, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L359
	jmp	L358
L359:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$60, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L361
	jmp	L360
L361:
	movq	$CText, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$21, %rax
	jmp	L303
	jmp	L362
L360:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$5, %rax
	jmp	L303
L362:
	jmp	L363
L358:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L365
	jmp	L364
L365:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$10, %rax
	jmp	L303
	jmp	L366
L364:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$9, %rax
	jmp	L303
L366:
L363:
L367:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L369
	jmp	L368
L369:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$11, %rax
	jmp	L303
	jmp	L370
L368:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$29, %rax
	jmp	L303
L370:
L371:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$62, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L373
	jmp	L372
L373:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$62, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L375
	jmp	L374
L375:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$26, %rax
	jmp	L303
	jmp	L376
L374:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$6, %rax
	jmp	L303
L376:
	jmp	L377
L372:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L379
	jmp	L378
L379:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$8, %rax
	jmp	L303
	jmp	L380
L378:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$7, %rax
	jmp	L303
L380:
L377:
L381:
	movq	$55, %rax
	jmp	L303
L382:
	movq	$52, %rax
	jmp	L303
L383:
	movq	$57, %rax
	jmp	L303
L384:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L386
	jmp	L385
L386:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$20, %rax
	jmp	L303
	jmp	L387
L385:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$14, %rax
	jmp	L303
L387:
L388:
	movq	$51, %rax
	jmp	L303
L389:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$124, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L391
	jmp	L390
L391:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$124, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$17, %rax
	jmp	L303
	jmp	L392
L390:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L394
	jmp	L393
L394:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$24, %rax
	jmp	L303
	jmp	L395
L393:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$15, %rax
	jmp	L303
L395:
L392:
L396:
	movq	$56, %rax
	jmp	L303
L397:
	movq	$67, %rax
	jmp	L303
L398:
	.data
L399:
	.byte	60
	.byte	'E'
	.byte	'O'
	.byte	'F'
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L399, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	$72, %rax
	jmp	L303
L400:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cscanch
	movq	%rax, CValue
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$39, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L402
	jmp	L401
L402:
	.data
L403:
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	39
	.byte	92
	.byte	39
	.byte	39
	.byte	32
	.byte	'a'
	.byte	't'
	.byte	32
	.byte	'e'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'c'
	.byte	'h'
	.byte	'a'
	.byte	'r'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	'l'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L403, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L401:
	movq	$CText, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$39, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$50, %rax
	jmp	L303
L404:
	movq	$CText, %rax
	pushq	%rax
	call	Cscanstr
	addq	$8, %rsp
	movq	%rax, CValue
	movq	$64, %rax
	jmp	L303
L405:
	movq	$CText, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$511, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cnext
	pushq	%rax
	call	Cscanident
	addq	$24, %rsp
	movq	$CText, %rax
	pushq	%rax
	call	Ckeyword
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L407
	jmp	L406
L407:
	movq	-16(%rbp), %rax
	jmp	L303
L406:
	.data
L408:
	.byte	'u'
	.byte	'n'
	.byte	'k'
	.byte	'n'
	.byte	'o'
	.byte	'w'
	.byte	'n'
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'e'
	.byte	'p'
	.byte	'r'
	.byte	'o'
	.byte	'c'
	.byte	'e'
	.byte	's'
	.byte	's'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L408, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$46, %rax
	jmp	L303
L409:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L411
	jmp	L410
L411:
	movq	$CText, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rdx
	movb	%al, (%rdx)
	popq	%rdx
	movb	%al, (%rdx)
	movq	$CText, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L413
	jmp	L412
L413:
	movq	$41, %rax
	jmp	L303
L412:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	.data
L414:
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'l'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	39
	.byte	46
	.byte	46
	.byte	46
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L414, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$41, %rax
	jmp	L303
L410:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	$40, %rax
	jmp	L303
L415:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L417
	jmp	L416
L417:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cscanint
	addq	$8, %rsp
	movq	%rax, CValue
	movq	$50, %rax
	jmp	L303
	jmp	L418
L416:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cisalpha
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L420
	jmp	L419
L420:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$95, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L421
	incq	%rdx
L421:
	movq	%rdx, %rax
L419:
	orq	%rax, %rax
	jnz	L423
	jmp	L422
L423:
	movq	$512, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cscanident
	addq	$24, %rsp
	movq	%rax, CValue
	movq	CExpandmac, %rax
	orq	%rax, %rax
	jnz	L425
	jmp	L424
L425:
	movq	$CText, %rax
	pushq	%rax
	call	Cmacro
	addq	$8, %rsp
L424:
	orq	%rax, %rax
	jnz	L427
	jmp	L426
L427:
	jmp	L310
L426:
	movq	$CText, %rax
	pushq	%rax
	call	Ckeyword
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L429
	jmp	L428
L429:
	movq	-16(%rbp), %rax
	jmp	L303
L428:
	movq	$46, %rax
	jmp	L303
	jmp	L430
L422:
	.data
L431:
	.byte	'f'
	.byte	'u'
	.byte	'n'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'c'
	.byte	'h'
	.byte	'a'
	.byte	'r'
	.byte	'a'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L431, %rax
	pushq	%rax
	call	Cscnerror
	addq	$16, %rsp
	jmp	L310
L430:
L418:
	jmp	L310
L311:
	movq	$L432, %rdx
	jmp	switch
L432:
	.quad	28
	.quad	33, L312
	.quad	37, L316
	.quad	38, L320
	.quad	40, L327
	.quad	41, L328
	.quad	42, L329
	.quad	43, L333
	.quad	44, L340
	.quad	45, L341
	.quad	47, L351
	.quad	58, L355
	.quad	59, L356
	.quad	60, L357
	.quad	61, L367
	.quad	62, L371
	.quad	63, L381
	.quad	91, L382
	.quad	93, L383
	.quad	94, L384
	.quad	123, L388
	.quad	124, L389
	.quad	125, L396
	.quad	126, L397
	.quad	-1, L398
	.quad	39, L400
	.quad	34, L404
	.quad	35, L405
	.quad	46, L409
	.quad	L415
L310:
	jmp	L309
L308:
L303:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L433,8
	.lcomm	L434,8
	.text
	.globl	Cscan
Cscan:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L433, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L433, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L433, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L433, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L433, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L434, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L434, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L434, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L434, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L434, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L436:
	call	Cscanpp
	movq	%rax, -8(%rbp)
	movq	CInclev, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L440
	jmp	L439
L440:
	movq	CIsp, %rax
	orq	%rax, %rax
	jnz	L441
	jmp	L439
L441:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$72, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L442
	incq	%rdx
L442:
	movq	%rdx, %rax
L439:
	orq	%rax, %rax
	jnz	L444
	jmp	L443
L444:
	.data
L445:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	39
	.byte	35
	.byte	'e'
	.byte	'n'
	.byte	'd'
	.byte	'i'
	.byte	'f'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L445, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L443:
L438:
	movq	$1, %rax
	pushq	%rax
	call	Cfrozen
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L446
	jmp	L436
L446:
L437:
	movq	CSyntoken, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L448
	jmp	L447
L448:
	movq	$0, %rax
	movq	%rax, CSyntoken
L447:
	movq	-8(%rbp), %rax
	jmp	L435
L435:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L449,8
	.lcomm	L450,8
	.text
	.globl	Cscanraw
Cscanraw:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L449, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L449, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L450, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CIsp, %rax
	movq	%rax, -16(%rbp)
	movq	$0, %rax
	movq	%rax, CIsp
	movq	$0, %rax
	movq	%rax, CExpandmac
	call	Cscan
	movq	%rax, -8(%rbp)
	movq	$1, %rax
	movq	%rax, CExpandmac
	movq	-16(%rbp), %rax
	movq	%rax, CIsp
	movq	-8(%rbp), %rax
	jmp	L451
L451:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L452,8
	.lcomm	L453,8
	.text
	.globl	Creject
Creject:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L452, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L453, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	movq	%rax, CRejected
	movq	CValue, %rax
	movq	%rax, CRejval
	movq	$CText, %rax
	pushq	%rax
	movq	$CRejtext, %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
L454:
	popq	%rbp
	ret

