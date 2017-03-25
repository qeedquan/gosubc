	.text
	.data
	.globl	Cverbose
Cverbose:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cerror
Cerror:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$111, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$111, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L4:
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L4, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$24, %rsp
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L5,8
	.lcomm	L6,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-392, %rsp
	movq	$L5, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L9
	jmp	L8
L9:
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L11
L12:
	movq	$5, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L13:
	.data
L15:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L16
	incq	%rdx
L16:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L17
	jmp	L14
L17:
	movq	$10, %rax
	pushq	%rax
	movq	$L15, %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
L14:
	orq	%rax, %rax
	jnz	L19
	jmp	L18
L19:
	.data
L20:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'c'
	.byte	47
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'v'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L20, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L18:
	movq	$0, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L21:
	.data
L22:
	.byte	'F'
	.byte	'O'
	.byte	'O'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L24:
	.byte	'B'
	.byte	'A'
	.byte	'R'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L22, %rax
	pushq	%rax
	call	Cgetenv
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L25
	incq	%rdx
L25:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L26
	jmp	L23
L26:
	movq	$3, %rax
	pushq	%rax
	movq	$L24, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
L23:
	orq	%rax, %rax
	jnz	L28
	jmp	L27
L28:
	.data
L29:
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	'i'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	0
	.text
	movq	$L29, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L27:
	movq	$0, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L30:
	movq	$1, %rax
	movq	%rax, Cverbose
	jmp	L10
L31:
	movq	$1, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
	jmp	L10
L11:
	movq	$L32, %rdx
	jmp	switch
L32:
	.quad	4
	.quad	113, L12
	.quad	97, L13
	.quad	101, L21
	.quad	118, L30
	.quad	L31
L10:
L8:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L34
	jmp	L33
L34:
	.data
L35:
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L35, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L33:
	movq	$1024, %rax
	pushq	%rax
	call	C_sbrk
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$-1024, %rax
	pushq	%rax
	call	C_sbrk
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	$0, %rax
	pushq	%rax
	call	C_sbrk
	addq	$8, %rsp
	movq	%rax, -24(%rbp)
	movq	$1024, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L37
	incq	%rdx
L37:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L38
	jmp	L36
L38:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L39
	incq	%rdx
L39:
	movq	%rdx, %rax
L36:
	orq	%rax, %rax
	jnz	L41
	jmp	L40
L41:
	.data
L42:
	.byte	95
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	0
	.text
	movq	$L42, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L40:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L44
	jmp	L43
L44:
	.data
L45:
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L45, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L43:
	.data
L46:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$420, %rax
	pushq	%rax
	movq	$L46, %rax
	pushq	%rax
	call	C_creat
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L48
	jmp	L47
L48:
	.data
L49:
	.byte	95
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	40
	.byte	41
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	'w'
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
	movq	$L49, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L47:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	.data
L50:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$420, %rax
	pushq	%rax
	movq	$L50, %rax
	pushq	%rax
	call	C_creat
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L52
	jmp	L51
L52:
	.data
L53:
	.byte	95
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	40
	.byte	41
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'f'
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
	.text
	movq	$L53, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L51:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L55
	jmp	L54
L55:
	.data
L56:
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L56, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L54:
	movq	$0, %rax
	movq	%rax, -48(%rbp)
L57:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$256, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L61
	jmp	L59
L61:
	jmp	L58
L60:
	movq	-48(%rbp), %rax
	incq	-48(%rbp)
	jmp	L57
L58:
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L60
L59:
	movq	$0, %rax
	movq	%rax, -48(%rbp)
L62:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$256, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L66
	jmp	L64
L66:
	jmp	L63
L65:
	movq	$16, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -48(%rbp)
	jmp	L62
L63:
	movq	-48(%rbp), %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L68
	jmp	L67
L68:
	.data
L69:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L69, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L67:
	jmp	L65
L64:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L71
	jmp	L70
L71:
	.data
L72:
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L72, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L70:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L74
	jmp	L73
L74:
	.data
L75:
	.byte	95
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L75, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L73:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L77
	jmp	L76
L77:
	.data
L78:
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L78, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L76:
	.data
L79:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L79, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L81
	jmp	L80
L81:
	.data
L82:
	.byte	95
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	0
	.text
	movq	$L82, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L80:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L84
	jmp	L83
L84:
	.data
L85:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L85, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L83:
	movq	$0, %rax
	movq	%rax, -48(%rbp)
L86:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$256, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L90
	jmp	L88
L90:
	jmp	L87
L89:
	movq	$16, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -48(%rbp)
	jmp	L86
L87:
	movq	-48(%rbp), %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L92
	jmp	L91
L92:
	.data
L93:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	0
	.text
	movq	$L93, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L91:
	movq	$0, %rax
	movq	%rax, -56(%rbp)
L94:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L98
	jmp	L96
L98:
	jmp	L95
L97:
	movq	-56(%rbp), %rax
	incq	-56(%rbp)
	jmp	L94
L95:
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L100
	jmp	L99
L100:
	.data
L101:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'd'
	.byte	'a'
	.byte	't'
	.byte	'a'
	.byte	0
	.text
	movq	$L101, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L99:
	jmp	L97
L96:
	jmp	L89
L88:
	.data
L102:
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	'6'
	.byte	'7'
	.byte	'8'
	.byte	'9'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L102, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L104
	jmp	L103
L104:
	.data
L105:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L105, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L103:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	.data
L106:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$1, %rax
	pushq	%rax
	movq	$L106, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L108
	jmp	L107
L108:
	.data
L109:
	.byte	95
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	45
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'm'
	.byte	'o'
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
	movq	$L109, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L107:
	.data
L110:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L110, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L112
	jmp	L111
L112:
	.data
L113:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	45
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'f'
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
	movq	$L113, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L111:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	.data
L114:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L114, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	$10, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	.data
L115:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L115, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L117
	jmp	L116
L117:
	.data
L118:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'r'
	.byte	'o'
	.byte	'm'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	45
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'd'
	.byte	'a'
	.byte	't'
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L118, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L116:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	.data
L119:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$2, %rax
	pushq	%rax
	movq	$L119, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L121
	jmp	L120
L121:
	.data
L122:
	.byte	95
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'm'
	.byte	'o'
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
	movq	$L122, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L120:
	.data
L123:
	.byte	'9'
	.byte	'8'
	.byte	'7'
	.byte	'6'
	.byte	'5'
	.byte	'4'
	.byte	'3'
	.byte	'2'
	.byte	'1'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L123, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L125
	jmp	L124
L125:
	.data
L126:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	47
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
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
	movq	$L126, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L124:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	.data
L127:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L127, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	$10, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	.data
L128:
	.byte	'9'
	.byte	'8'
	.byte	'7'
	.byte	'6'
	.byte	'5'
	.byte	'4'
	.byte	'3'
	.byte	'2'
	.byte	'1'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L128, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L130
	jmp	L129
L130:
	.data
L131:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'r'
	.byte	'o'
	.byte	'm'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	47
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'd'
	.byte	'a'
	.byte	't'
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L131, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L129:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	.data
L132:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$2, %rax
	pushq	%rax
	movq	$L132, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L134
	jmp	L133
L134:
	.data
L135:
	.byte	95
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'2'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L135, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L133:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L137
	jmp	L136
L137:
	.data
L138:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L138, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L136:
	movq	$0, %rax
	pushq	%rax
	movq	$250, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	pushq	%rax
	movq	$250, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L140
	jmp	L139
L140:
	.data
L141:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'r'
	.byte	'o'
	.byte	'm'
	.byte	32
	.byte	'b'
	.byte	'e'
	.byte	'g'
	.byte	'i'
	.byte	'n'
	.byte	'n'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L141, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L139:
	.data
L142:
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L142, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L144
	jmp	L143
L144:
	.data
L145:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	47
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'2'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L145, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L143:
	movq	$2, %rax
	pushq	%rax
	movq	$-10, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	pushq	%rax
	movq	$1910, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L147
	jmp	L146
L147:
	.data
L148:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'r'
	.byte	'o'
	.byte	'm'
	.byte	32
	.byte	'e'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'f'
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
	movq	$L148, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L146:
	.data
L149:
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L149, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L151
	jmp	L150
L151:
	.data
L152:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	47
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'3'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L152, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L150:
	movq	$1, %rax
	pushq	%rax
	movq	$-1000, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	pushq	%rax
	movq	$920, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L154
	jmp	L153
L154:
	.data
L155:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'l'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'v'
	.byte	'e'
	.byte	32
	.byte	'b'
	.byte	'a'
	.byte	'c'
	.byte	'k'
	.byte	'w'
	.byte	'a'
	.byte	'r'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L155, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L153:
	.data
L156:
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L156, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L158
	jmp	L157
L158:
	.data
L159:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	47
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'4'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L159, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L157:
	movq	$1, %rax
	pushq	%rax
	movq	$500, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	pushq	%rax
	movq	$1430, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L161
	jmp	L160
L161:
	.data
L162:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'l'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'v'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'w'
	.byte	'a'
	.byte	'r'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L162, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L160:
	.data
L163:
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L163, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L165
	jmp	L164
L165:
	.data
L166:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	47
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'5'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L166, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L164:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	leaq	-344(%rbp), %rax
	pushq	%rax
	movq	$250, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-344(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1910, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-344(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$920, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-344(%rbp), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1430, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$0, %rax
	movq	%rax, -48(%rbp)
L167:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L171
	jmp	L169
L171:
	jmp	L168
L170:
	movq	-48(%rbp), %rax
	incq	-48(%rbp)
	jmp	L167
L168:
	.data
L172:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L172, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L174
	jmp	L173
L174:
	.data
L175:
	.byte	95
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'3'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L175, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L173:
	movq	$0, %rax
	movq	%rax, -56(%rbp)
L176:
	movq	-56(%rbp), %rax
	pushq	%rax
	leaq	-344(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L180
	jmp	L178
L180:
	jmp	L177
L179:
	movq	$10, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	jmp	L176
L177:
	movq	$10, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	jmp	L179
L178:
	movq	$10, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L182
	jmp	L181
L182:
	.data
L183:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	32
	.byte	40
	.byte	'2'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L183, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L181:
	movq	$0, %rax
	movq	%rax, -56(%rbp)
L184:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L188
	jmp	L186
L188:
	jmp	L185
L187:
	movq	-56(%rbp), %rax
	incq	-56(%rbp)
	jmp	L184
L185:
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L190
	jmp	L189
L190:
	.data
L191:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'h'
	.byte	32
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'd'
	.byte	'a'
	.byte	't'
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L191, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L189:
	jmp	L187
L186:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	jmp	L170
L169:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L193
	jmp	L192
L193:
	.data
L194:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	10
	.byte	0
	.text
	movq	$L194, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L192:
	.data
L195:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L196:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'2'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L196, %rax
	pushq	%rax
	movq	$L195, %rax
	pushq	%rax
	call	C_rename
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L198
	jmp	L197
L198:
	.data
L199:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.text
	movq	$L199, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L197:
	.data
L200:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L201:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'2'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L201, %rax
	pushq	%rax
	movq	$L200, %rax
	pushq	%rax
	call	C_rename
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L203
	jmp	L202
L203:
	.data
L204:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'c'
	.byte	'e'
	.byte	's'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L204, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L202:
	.data
L205:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L205, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L207
	jmp	L206
L207:
	.data
L208:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'l'
	.byte	'e'
	.byte	'f'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'r'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L208, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
L206:
	.data
L209:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'2'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L209, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L211
	jmp	L210
L211:
	.data
L212:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	'w'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L212, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	jmp	L213
L210:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
L213:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L215
	jmp	L214
L215:
	.data
L216:
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	10
	.byte	0
	.text
	movq	$L216, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L214:
	.data
L217:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'2'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L217, %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L219
	jmp	L218
L219:
	.data
L220:
	.byte	95
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.text
	movq	$L220, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L218:
	.data
L221:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'2'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L221, %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L223
	jmp	L222
L223:
	.data
L224:
	.byte	95
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'c'
	.byte	'e'
	.byte	's'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L224, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L222:
	.data
L225:
	.byte	95
	.byte	95
	.byte	95
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'2'
	.byte	46
	.byte	95
	.byte	95
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L225, %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L227
	jmp	L226
L227:
	.data
L228:
	.byte	95
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	0
	.text
	movq	$L228, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	movq	-32(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
L226:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L230
	jmp	L229
L230:
	.data
L231:
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	47
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	47
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	10
	.byte	0
	.text
	movq	$L231, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L229:
	movq	$0, %rax
	movq	%rax, -48(%rbp)
L232:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L236
	jmp	L234
L236:
	jmp	L233
L235:
	movq	-48(%rbp), %rax
	incq	-48(%rbp)
	jmp	L232
L233:
	call	C_fork
	jmp	L238
L239:
	.data
L240:
	.byte	95
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	0
	.text
	movq	$L240, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	jmp	L237
L241:
	movq	-48(%rbp), %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L242:
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	C_wait
	addq	$8, %rsp
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L244
	jmp	L243
L244:
	.data
L245:
	.byte	95
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	41
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'c'
	.byte	'o'
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
	movq	$L245, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L243:
	jmp	L237
L238:
	movq	$L246, %rdx
	jmp	switch
L246:
	.quad	2
	.quad	-1, L239
	.quad	0, L241
	.quad	L242
L237:
	jmp	L235
L234:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L248
	jmp	L247
L248:
	.data
L249:
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	10
	.byte	0
	.text
	movq	$L249, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L247:
	call	C_fork
	jmp	L251
L252:
	.data
L253:
	.byte	95
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	40
	.byte	'2'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L253, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	jmp	L250
L254:
	.data
L255:
	.byte	46
	.byte	47
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$L255, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L256:
	.byte	'q'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L256, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L257:
	.byte	46
	.byte	47
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
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
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$L257, %rax
	pushq	%rax
	call	C_execve
	addq	$24, %rsp
	.data
L258:
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	41
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
	call	Cerror
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L259:
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	C_wait
	addq	$8, %rsp
	movq	$1280, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L261
	jmp	L260
L261:
	.data
L262:
	.byte	95
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	41
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'h'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	58
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L262, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L260:
	jmp	L250
L251:
	movq	$L263, %rdx
	jmp	switch
L263:
	.quad	3
	.quad	-1, L252
	.quad	0, L254
	.quad	1, L259
	.quad	L250
L250:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L265
	jmp	L264
L265:
	.data
L266:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'c'
	.byte	47
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'v'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L266, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L264:
	call	C_fork
	jmp	L268
L269:
	.data
L270:
	.byte	95
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	40
	.byte	'3'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L270, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	jmp	L267
L271:
	.data
L272:
	.byte	46
	.byte	47
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$L272, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L273:
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L273, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L274:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L274, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$24, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L275:
	.byte	46
	.byte	47
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
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
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$L275, %rax
	pushq	%rax
	call	C_execve
	addq	$24, %rsp
	.data
L276:
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	40
	.byte	'2'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L276, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L277:
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	C_wait
	addq	$8, %rsp
	jmp	L267
L268:
	movq	$L278, %rdx
	jmp	switch
L278:
	.quad	3
	.quad	-1, L269
	.quad	0, L271
	.quad	1, L277
	.quad	L267
L267:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L280
	jmp	L279
L280:
	.data
L281:
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	'i'
	.byte	'r'
	.byte	'o'
	.byte	'n'
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
	movq	$L281, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L279:
	call	C_fork
	jmp	L283
L284:
	.data
L285:
	.byte	95
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	40
	.byte	'4'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L285, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	jmp	L282
L286:
	.data
L287:
	.byte	46
	.byte	47
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$L287, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L288:
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L288, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	.data
L289:
	.byte	'F'
	.byte	'O'
	.byte	'O'
	.byte	61
	.byte	'B'
	.byte	'A'
	.byte	'R'
	.byte	0
	.text
	leaq	-392(%rbp), %rax
	pushq	%rax
	movq	$L289, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-392(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L290:
	.byte	46
	.byte	47
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-392(%rbp), %rax
	pushq	%rax
	leaq	-376(%rbp), %rax
	pushq	%rax
	movq	$L290, %rax
	pushq	%rax
	call	C_execve
	addq	$24, %rsp
	.data
L291:
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	40
	.byte	'3'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L291, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L292:
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	C_wait
	addq	$8, %rsp
	jmp	L282
L283:
	movq	$L293, %rdx
	jmp	switch
L293:
	.quad	3
	.quad	-1, L284
	.quad	0, L286
	.quad	1, L292
	.quad	L282
L282:
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L295
	jmp	L294
L295:
	.data
L296:
	.byte	't'
	.byte	'i'
	.byte	'm'
	.byte	'e'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L296, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L294:
	.data
L297:
	.byte	95
	.byte	't'
	.byte	'i'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	call	C_time
	pushq	%rax
	movq	$L297, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Ckprintf
	addq	$24, %rsp
	movq	Cverbose, %rax
	orq	%rax, %rax
	jnz	L299
	jmp	L298
L299:
	.data
L300:
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L300, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
L298:
	movq	$0, %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
	.data
L301:
	.byte	95
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	41
	.byte	0
	.text
	movq	$L301, %rax
	pushq	%rax
	call	Cerror
	addq	$8, %rsp
L7:
	addq	$392, %rsp
	popq	%rbp
	ret

