	.text
	.data
	.globl	CErrors
CErrors:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cfail
Cfail:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$102, %rax
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
	movq	$108, %rax
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
	movq	$102, %rax
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
	movq	$108, %rax
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
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	.data
L4:
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	33
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L4, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	movq	CErrors, %rax
	incq	CErrors
L3:
	popq	%rbp
	ret
	.data
	.globl	Ccaught
Ccaught:	.quad	0
	.lcomm	L5,8
	.lcomm	L6,8
	.text
	.globl	Ccatch
Ccatch:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L5, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
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
	movq	$L6, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$1, %rax
	movq	%rax, Ccaught
L7:
	popq	%rbp
	ret
	.data
	.lcomm	L8,8
	.lcomm	L9,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L8, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
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
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L11:
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L11, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
	.data
L12:
	.byte	'T'
	.byte	'h'
	.byte	'i'
	.byte	's'
	.byte	32
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'y'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	's'
	.byte	'u'
	.byte	'l'
	.byte	't'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'a'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'd'
	.byte	'u'
	.byte	'm'
	.byte	'p'
	.byte	46
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L12, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
	.data
L13:
	.byte	'I'
	.byte	'f'
	.byte	32
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'd'
	.byte	'o'
	.byte	'e'
	.byte	's'
	.byte	44
	.byte	32
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	32
	.byte	't'
	.byte	'h'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'u'
	.byte	'n'
	.byte	'c'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
	.data
L14:
	.byte	'y'
	.byte	'o'
	.byte	'u'
	.byte	'r'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	47
	.byte	'c'
	.byte	'r'
	.byte	't'
	.byte	'0'
	.byte	46
	.byte	's'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	'h'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	's'
	.byte	46
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
	movq	$L14, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
	.data
L15:
	.byte	'I'
	.byte	'f'
	.byte	32
	.byte	't'
	.byte	'h'
	.byte	'e'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	'e'
	.byte	44
	.byte	32
	.byte	'p'
	.byte	'l'
	.byte	'e'
	.byte	'a'
	.byte	's'
	.byte	'e'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	32
	.byte	't'
	.byte	'h'
	.byte	'e'
	.byte	32
	.byte	'a'
	.byte	'u'
	.byte	't'
	.byte	'h'
	.byte	'o'
	.byte	'r'
	.byte	33
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L15, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
	.data
L16:
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L16, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$16, %rsp
	movq	$Ccatch, %rax
	pushq	%rax
	movq	$6, %rax
	pushq	%rax
	call	Csignal
	addq	$16, %rsp
	movq	$6, %rax
	pushq	%rax
	call	Craise
	addq	$8, %rsp
	movq	Ccaught, %rax
	orq	%rax, %rax
	jz	L18
	jmp	L17
L18:
	.data
L19:
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L19, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L17:
	movq	$0, %rax
	movq	%rax, Ccaught
	movq	$1, %rax
	pushq	%rax
	movq	$6, %rax
	pushq	%rax
	call	Csignal
	addq	$16, %rsp
	movq	$6, %rax
	pushq	%rax
	call	Craise
	addq	$8, %rsp
	movq	Ccaught, %rax
	orq	%rax, %rax
	jnz	L21
	jmp	L20
L21:
	.data
L22:
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L22, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L20:
	movq	CErrors, %rax
	orq	%rax, %rax
	jnz	L25
	jmp	L23
L25:
	movq	$1, %rax
	jmp	L24
L23:
	movq	$0, %rax
L24:
	jmp	L10
L10:
	popq	%rbp
	ret

