	.text
	.data
	.lcomm	L1,16
	.lcomm	L2,16
	.text
Cenumdecl:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$0, -8(%rbp)
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
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
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L5
	jmp	L4
L5:
	call	Cscan
	movq	%rax, CToken
L4:
	call	Clbrace
L7:
	movq	CToken, %rax
	pushq	%rax
	movq	$56, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L8
	jmp	L6
L8:
	movq	$CText, %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	call	Cident
	movq	CToken, %rax
	pushq	%rax
	movq	$29, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L10
	jmp	L9
L10:
	call	Cscan
	movq	%rax, CToken
	call	Cconstexpr
	movq	%rax, -8(%rbp)
L9:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L12
	jmp	L11
L12:
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$4, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	jmp	L13
L11:
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$4, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	call	Caddloc
	addq	$56, %rsp
L13:
	movq	$35, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L15
	jmp	L14
L15:
	jmp	L6
L14:
	call	Cscan
	movq	%rax, CToken
	call	Ceofcheck
	orq	%rax, %rax
	jnz	L17
	jmp	L16
L17:
	jmp	L3
L16:
	jmp	L7
L6:
	call	Crbrace
	call	Csemi
L3:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L18,16
	.lcomm	L19,16
	.text
Cinitlist:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-48, %rsp
	movq	$0, -8(%rbp)
	movq	$L18, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cgendata
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgenname
	addq	$8, %rsp
	movq	CToken, %rax
	pushq	%rax
	movq	$64, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L22
	jmp	L21
L22:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L24
	jmp	L23
L24:
	.data
L25:
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	'm'
	.byte	'a'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L25, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L23:
	movq	CValue, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cgendefs
	addq	$16, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cgendefb
	addq	$8, %rsp
	movq	CValue, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	call	Cgenalign
	addq	$8, %rsp
	call	Cscan
	movq	%rax, CToken
	movq	CValue, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	jmp	L20
L21:
	call	Clbrace
L27:
	movq	$56, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L28
	jmp	L26
L28:
	call	Cconstexpr
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L30
	jmp	L29
L30:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L32
	incq	%rdx
L32:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L33
	jmp	L31
L33:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$255, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L34
	incq	%rdx
L34:
	movq	%rdx, %rax
L31:
	orq	%rax, %rax
	jnz	L36
	jmp	L35
L36:
	.data
L37:
	.byte	37
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$L37, %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
	.data
L38:
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'r'
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
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$L38, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L35:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgendefb
	addq	$8, %rsp
	jmp	L39
L29:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgendefw
	addq	$8, %rsp
L39:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L41
	jmp	L40
L41:
	call	Cscan
	movq	%rax, CToken
	jmp	L42
L40:
	jmp	L26
L42:
	call	Ceofcheck
	orq	%rax, %rax
	jnz	L44
	jmp	L43
L44:
	movq	$0, %rax
	jmp	L20
L43:
	jmp	L27
L26:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L46
	jmp	L45
L46:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenalign
	addq	$8, %rsp
L45:
	call	Cscan
	movq	%rax, CToken
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L48
	jmp	L47
L48:
	.data
L49:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'f'
	.byte	'e'
	.byte	'w'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'r'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L49, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L47:
	movq	-8(%rbp), %rax
	jmp	L20
L20:
	addq	$48, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L50,16
	.lcomm	L51,16
	.text
	.globl	Cprimtype
Cprimtype:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-40, %rsp
	movq	$L50, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$33, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L58
	jmp	L53
L58:
	movq	$1, %rax
	jmp	L54
L53:
	movq	$49, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L59
	jmp	L55
L59:
	movq	$2, %rax
	jmp	L54
L55:
	movq	$65, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L60
	jmp	L56
L60:
	movq	$8192, %rax
	jmp	L54
L56:
	movq	$68, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L61
	jmp	L57
L61:
	movq	$16384, %rax
	jmp	L54
L57:
	movq	$7, %rax
L54:
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$16384, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L63
	incq	%rdx
L63:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L64
	jmp	L62
L64:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$8192, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L65
	incq	%rdx
L65:
	movq	%rdx, %rax
L62:
	orq	%rax, %rax
	jnz	L67
	jmp	L66
L67:
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jz	L69
	jmp	L68
L69:
	call	Cscan
	movq	%rax, CToken
	movq	$CText, %rax
	pushq	%rax
	leaq	-40(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	leaq	-40(%rbp), %rax
	movq	%rax, 24(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L71
	jmp	L70
L71:
	.data
L72:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'u'
	.byte	'c'
	.byte	't'
	.byte	47
	.byte	'u'
	.byte	'n'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L72, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	jmp	L52
L70:
L68:
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cfindstruct
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L74
	incq	%rdx
L74:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L75
	jmp	L73
L75:
	movq	$CPrims, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L76
	incq	%rdx
L76:
	movq	%rdx, %rax
L73:
	orq	%rax, %rax
	jnz	L78
	jmp	L77
L78:
	.data
L79:
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'u'
	.byte	'c'
	.byte	't'
	.byte	47
	.byte	'u'
	.byte	'n'
	.byte	'i'
	.byte	'o'
	.byte	'n'
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
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$L79, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L77:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	orq	%rcx, %rax
	movq	%rax, -8(%rbp)
L66:
	movq	-8(%rbp), %rax
	jmp	L52
L52:
	addq	$40, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L80,16
	.lcomm	L81,16
	.text
Cpmtrdecls:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-72, %rsp
	movq	$L80, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$60, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L84
	jmp	L83
L84:
	movq	$0, %rax
	jmp	L82
L83:
	movq	$0, %rax
	movq	%rax, -56(%rbp)
	movq	$16, %rax
	movq	%rax, -64(%rbp)
L85:
	jmp	L86
L88:
	jmp	L85
L86:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L90
	incq	%rdx
L90:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L91
	jmp	L89
L91:
	movq	CToken, %rax
	pushq	%rax
	movq	$41, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L92
	incq	%rdx
L92:
	movq	%rdx, %rax
L89:
	orq	%rax, %rax
	jnz	L94
	jmp	L93
L94:
	call	Cscan
	movq	%rax, CToken
	movq	$1, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	negq	%rax
	movq	%rax, -56(%rbp)
	jmp	L87
	jmp	L95
L93:
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L97
	jmp	L96
L97:
	movq	$2, %rax
	movq	%rax, -32(%rbp)
	jmp	L98
L96:
	movq	$33, %rax
	pushq	%rax
	movq	CToken, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L100
	incq	%rdx
L100:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L101
	jmp	L99
L101:
	movq	$49, %rax
	pushq	%rax
	movq	CToken, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L102
	incq	%rdx
L102:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L103
	jmp	L99
L103:
	movq	$69, %rax
	pushq	%rax
	movq	CToken, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L104
	incq	%rdx
L104:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L105
	jmp	L99
L105:
	movq	$65, %rax
	pushq	%rax
	movq	CToken, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L106
	incq	%rdx
L106:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L107
	jmp	L99
L107:
	movq	$68, %rax
	pushq	%rax
	movq	CToken, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L108
	incq	%rdx
L108:
	movq	%rdx, %rax
L99:
	orq	%rax, %rax
	jnz	L110
	jmp	L109
L110:
	.data
L111:
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	'i'
	.byte	'f'
	.byte	'i'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'a'
	.byte	't'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L111, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$60, %rax
	pushq	%rax
	call	Csynch
	addq	$8, %rsp
	movq	%rax, CToken
	movq	-56(%rbp), %rax
	jmp	L82
L109:
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$60, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L113
	incq	%rdx
L113:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L114
	jmp	L112
L114:
	movq	$7, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L115
	incq	%rdx
L115:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L116
	jmp	L112
L116:
	movq	-56(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L112:
	orq	%rax, %rax
	jnz	L118
	jmp	L117
L118:
	movq	$0, %rax
	jmp	L82
L117:
L98:
L95:
	movq	$1, %rax
	movq	%rax, -48(%rbp)
	leaq	-72(%rbp), %rax
	pushq	%rax
	leaq	-72(%rbp), %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cdeclarator
	addq	$56, %rsp
	movq	%rax, -40(%rbp)
	movq	$0, %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddloc
	addq	$56, %rsp
	movq	$8, %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	incq	-56(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L120
	jmp	L119
L120:
	call	Cscan
	movq	%rax, CToken
	jmp	L121
L119:
	jmp	L87
L121:
	jmp	L88
L87:
	movq	-56(%rbp), %rax
	jmp	L82
L82:
	addq	$72, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L122,16
	.lcomm	L123,16
	.text
	.globl	Cpointerto
Cpointerto:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L122, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
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
	movq	$5, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L126
	incq	%rdx
L126:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L127
	jmp	L125
L127:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$6, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L128
	incq	%rdx
L128:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L129
	jmp	L125
L129:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L130
	incq	%rdx
L130:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L131
	jmp	L125
L131:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L132
	incq	%rdx
L132:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L133
	jmp	L125
L133:
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$32768, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L134
	incq	%rdx
L134:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L135
	jmp	L125
L135:
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$49152, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L136
	incq	%rdx
L136:
	movq	%rdx, %rax
L125:
	orq	%rax, %rax
	jnz	L138
	jmp	L137
L138:
	.data
L139:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'l'
	.byte	'e'
	.byte	'v'
	.byte	'e'
	.byte	'l'
	.byte	's'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'd'
	.byte	'i'
	.byte	'r'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L139, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L137:
	movq	$-57345, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	jmp	L141
L142:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$24576, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L124
L143:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$32768, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L124
L144:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$40960, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L124
L145:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$49152, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L124
	jmp	L140
L141:
	movq	$L146, %rdx
	jmp	switch
L146:
	.quad	4
	.quad	8192, L142
	.quad	24576, L143
	.quad	16384, L144
	.quad	40960, L145
	.quad	L140
L140:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L153
	jmp	L147
L153:
	movq	$4, %rax
	jmp	L148
L147:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L154
	jmp	L149
L154:
	movq	$3, %rax
	jmp	L148
L149:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L155
	jmp	L150
L155:
	movq	$8, %rax
	jmp	L148
L150:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L156
	jmp	L151
L156:
	movq	$6, %rax
	jmp	L148
L151:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L157
	jmp	L152
L157:
	movq	$5, %rax
	jmp	L148
L152:
	movq	$9, %rax
L148:
	jmp	L124
L124:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L158,16
	.lcomm	L159,16
	.text
Cdeclarator:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$1, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$L158, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L162
	jmp	L161
L162:
	call	Cscan
	movq	%rax, CToken
	movq	40(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L164
	jmp	L163
L164:
	call	Cscan
	movq	%rax, CToken
	movq	40(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$1, %rax
	movq	%rax, -16(%rbp)
L163:
	jmp	L165
L161:
	movq	CToken, %rax
	pushq	%rax
	movq	$53, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L167
	jmp	L166
L167:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L169
	jmp	L168
L169:
	.data
L170:
	.byte	'f'
	.byte	'u'
	.byte	'n'
	.byte	'c'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	's'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'm'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	39
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L170, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L168:
	call	Cscan
	movq	%rax, CToken
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L171:
	.byte	40
	.byte	42
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	41
	.byte	40
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L171, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cmatch
	addq	$16, %rsp
L166:
L165:
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L173
	jmp	L172
L173:
	.data
L174:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
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
	.byte	'a'
	.byte	't'
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
	movq	$CText, %rax
	pushq	%rax
	movq	$L174, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L175
L172:
	movq	$CText, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	call	Cscan
	movq	%rax, CToken
L175:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L177
	jmp	L176
L177:
	call	Crparen
	call	Clparen
	call	Crparen
L176:
	movq	16(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L179
	jmp	L178
L179:
	movq	CToken, %rax
	pushq	%rax
	movq	$29, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L180
	incq	%rdx
L180:
	movq	%rdx, %rax
L178:
	orq	%rax, %rax
	jnz	L182
	jmp	L181
L182:
	call	Cscan
	movq	%rax, CToken
	movq	56(%rbp), %rax
	pushq	%rax
	call	Cconstexpr
	popq	%rdx
	movq	%rax, (%rdx)
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L184
	jmp	L183
L184:
	movq	56(%rbp), %rax
	pushq	%rax
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$255, %rax
	popq	%rcx
	andq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L183:
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L186
	jmp	L185
L186:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L185:
	orq	%rax, %rax
	jnz	L188
	jmp	L187
L188:
	.data
L189:
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'z'
	.byte	'e'
	.byte	'r'
	.byte	'o'
	.byte	32
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L189, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L187:
	movq	64(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L190
L181:
	movq	16(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L192
	jmp	L191
L192:
	movq	CToken, %rax
	pushq	%rax
	movq	$53, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L193
	incq	%rdx
L193:
	movq	%rdx, %rax
L191:
	orq	%rax, %rax
	jnz	L195
	jmp	L194
L195:
	call	Cscan
	movq	%rax, CToken
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cpmtrdecls
	popq	%rdx
	movq	%rax, (%rdx)
	call	Crparen
	movq	$3, %rax
	jmp	L160
	jmp	L196
L194:
	movq	CToken, %rax
	pushq	%rax
	movq	$52, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L198
	jmp	L197
L198:
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jnz	L200
	jmp	L199
L200:
	.data
L201:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'l'
	.byte	'e'
	.byte	'v'
	.byte	'e'
	.byte	'l'
	.byte	's'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'd'
	.byte	'i'
	.byte	'r'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
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
	.text
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$L201, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L199:
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$57, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L203
	jmp	L202
L203:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L205
	jmp	L204
L205:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L206
L204:
	movq	$2, %rax
	movq	%rax, -8(%rbp)
	movq	48(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$29, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L208
	jmp	L207
L208:
	call	Cscan
	movq	%rax, CToken
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L210
	jmp	L209
L210:
	.data
L211:
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'r'
	.byte	'a'
	.byte	'y'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'p'
	.byte	'p'
	.byte	'o'
	.byte	'r'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L211, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L209:
	movq	48(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	call	Cinitlist
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L213
	jmp	L212
L213:
	.data
L214:
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'r'
	.byte	'a'
	.byte	'y'
	.byte	's'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'p'
	.byte	'p'
	.byte	'o'
	.byte	'r'
	.byte	't'
	.byte	'e'
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
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$L214, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L212:
	movq	64(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L215
L207:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L217
	jmp	L216
L217:
	.data
L218:
	.byte	'a'
	.byte	'u'
	.byte	't'
	.byte	'o'
	.byte	'm'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'y'
	.byte	45
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'r'
	.byte	'a'
	.byte	'y'
	.byte	32
	.byte	'l'
	.byte	'a'
	.byte	'c'
	.byte	'k'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$L218, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L216:
L215:
L206:
	jmp	L219
L202:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cconstexpr
	popq	%rdx
	movq	%rax, (%rdx)
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L221
	jmp	L220
L221:
	.data
L222:
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
	.byte	'r'
	.byte	'a'
	.byte	'y'
	.byte	32
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L222, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	48(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L220:
	movq	$2, %rax
	movq	%rax, -8(%rbp)
	call	Crbrack
L219:
L197:
L196:
L190:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L224
	jmp	L223
L224:
	.data
L225:
	.byte	39
	.byte	'v'
	.byte	'o'
	.byte	'i'
	.byte	'd'
	.byte	39
	.byte	32
	.byte	'i'
	.byte	's'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'a'
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$L225, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L223:
	movq	-8(%rbp), %rax
	jmp	L160
L160:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L226,16
	.lcomm	L227,16
	.text
Clocaldecls:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-104, %rsp
	movq	$0, -56(%rbp)
	movq	$L226, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L226, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L227, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	movq	%rax, CNli
L230:
	movq	CToken, %rax
	pushq	%rax
	movq	$30, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L232
	incq	%rdx
L232:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L233
	jmp	L231
L233:
	movq	CToken, %rax
	pushq	%rax
	movq	$44, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L234
	incq	%rdx
L234:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L235
	jmp	L231
L235:
	movq	CToken, %rax
	pushq	%rax
	movq	$58, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L236
	incq	%rdx
L236:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L237
	jmp	L231
L237:
	movq	CToken, %rax
	pushq	%rax
	movq	$63, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L238
	incq	%rdx
L238:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L239
	jmp	L231
L239:
	movq	CToken, %rax
	pushq	%rax
	movq	$70, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L240
	incq	%rdx
L240:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L241
	jmp	L231
L241:
	movq	CToken, %rax
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L242
	incq	%rdx
L242:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L243
	jmp	L231
L243:
	movq	CToken, %rax
	pushq	%rax
	movq	$33, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L244
	incq	%rdx
L244:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L245
	jmp	L231
L245:
	movq	CToken, %rax
	pushq	%rax
	movq	$69, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L246
	incq	%rdx
L246:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L247
	jmp	L231
L247:
	movq	CToken, %rax
	pushq	%rax
	movq	$43, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L248
	incq	%rdx
L248:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L249
	jmp	L231
L249:
	movq	CToken, %rax
	pushq	%rax
	movq	$65, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L250
	incq	%rdx
L250:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L251
	jmp	L231
L251:
	movq	CToken, %rax
	pushq	%rax
	movq	$68, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L252
	incq	%rdx
L252:
	movq	%rdx, %rax
L231:
	orq	%rax, %rax
	jnz	L253
	jmp	L229
L253:
	movq	CToken, %rax
	pushq	%rax
	movq	$43, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L255
	jmp	L254
L255:
	movq	$0, %rax
	pushq	%rax
	call	Cenumdecl
	addq	$8, %rsp
	jmp	L230
L254:
	movq	$0, %rax
	movq	%rax, -80(%rbp)
	movq	%rax, -88(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$30, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L257
	incq	%rdx
L257:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L258
	jmp	L256
L258:
	movq	CToken, %rax
	pushq	%rax
	movq	$58, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L259
	incq	%rdx
L259:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L260
	jmp	L256
L260:
	movq	CToken, %rax
	pushq	%rax
	movq	$63, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L261
	incq	%rdx
L261:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L262
	jmp	L256
L262:
	movq	CToken, %rax
	pushq	%rax
	movq	$70, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L263
	incq	%rdx
L263:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L264
	jmp	L256
L264:
	movq	CToken, %rax
	pushq	%rax
	movq	$44, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L265
	incq	%rdx
L265:
	movq	%rdx, %rax
L256:
	orq	%rax, %rax
	jnz	L267
	jmp	L266
L267:
	movq	CToken, %rax
	pushq	%rax
	movq	$63, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L268
	incq	%rdx
L268:
	movq	%rdx, %rax
	movq	%rax, -80(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$44, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L269
	incq	%rdx
L269:
	movq	%rdx, %rax
	movq	%rax, -88(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L271
	incq	%rdx
L271:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L272
	jmp	L270
L272:
	movq	CToken, %rax
	pushq	%rax
	movq	$33, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L273
	incq	%rdx
L273:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L274
	jmp	L270
L274:
	movq	CToken, %rax
	pushq	%rax
	movq	$69, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L275
	incq	%rdx
L275:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L276
	jmp	L270
L276:
	movq	CToken, %rax
	pushq	%rax
	movq	$65, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L277
	incq	%rdx
L277:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L278
	jmp	L270
L278:
	movq	CToken, %rax
	pushq	%rax
	movq	$68, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L279
	incq	%rdx
L279:
	movq	%rdx, %rax
L270:
	orq	%rax, %rax
	jnz	L281
	jmp	L280
L281:
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	call	Cscan
	movq	%rax, CToken
	jmp	L282
L280:
	movq	$2, %rax
	movq	%rax, -32(%rbp)
L282:
	jmp	L283
L266:
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	call	Cscan
	movq	%rax, CToken
L283:
	movq	-32(%rbp), %rax
	movq	%rax, -96(%rbp)
L284:
	jmp	L285
L287:
	jmp	L284
L285:
	movq	-96(%rbp), %rax
	movq	%rax, -32(%rbp)
	call	Ceofcheck
	orq	%rax, %rax
	jnz	L289
	jmp	L288
L289:
	movq	$0, %rax
	jmp	L228
L288:
	movq	$1, %rax
	movq	%rax, -48(%rbp)
	movq	$0, %rax
	movq	%rax, -64(%rbp)
	movq	%rax, -72(%rbp)
	leaq	-72(%rbp), %rax
	pushq	%rax
	leaq	-64(%rbp), %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cdeclarator
	addq	$56, %rsp
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	movq	%rax, -104(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	-104(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	movq	%rax, -104(%rbp)
	movq	-80(%rbp), %rax
	orq	%rax, %rax
	jnz	L291
	jmp	L290
L291:
	movq	-64(%rbp), %rax
	pushq	%rax
	call	Clabel
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddloc
	addq	$56, %rsp
	jmp	L292
L290:
	movq	-88(%rbp), %rax
	orq	%rax, %rax
	jnz	L294
	jmp	L293
L294:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddloc
	addq	$56, %rsp
	jmp	L295
L293:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	-104(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -56(%rbp)
	movq	$0, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddloc
	addq	$56, %rsp
L295:
L292:
	movq	-72(%rbp), %rax
	orq	%rax, %rax
	jnz	L297
	jmp	L296
L297:
	movq	-80(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L296:
	orq	%rax, %rax
	jnz	L299
	jmp	L298
L299:
	movq	CNli, %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L301
	jmp	L300
L301:
	.data
L302:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'r'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L302, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$0, %rax
	movq	%rax, CNli
L300:
	movq	$CLIaddr, %rax
	pushq	%rax
	movq	CNli, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CLIval, %rax
	pushq	%rax
	movq	CNli, %rax
	incq	CNli
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L298:
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L304
	jmp	L303
L304:
	call	Cscan
	movq	%rax, CToken
	jmp	L305
L303:
	jmp	L286
L305:
	jmp	L287
L286:
	call	Csemi
	jmp	L230
L229:
	movq	-56(%rbp), %rax
	jmp	L228
L228:
	addq	$104, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L306,8
	.lcomm	L307,8
	.text
Cintcmp:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L306, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L306, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L306, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L306, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L306, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L306, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L306, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L307, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L310:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L312
	jmp	L311
L312:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L313
	incq	%rdx
L313:
	movq	%rdx, %rax
L311:
	orq	%rax, %rax
	jnz	L314
	jmp	L309
L314:
	movq	16(%rbp), %rax
	addq	$8, 16(%rbp)
	movq	24(%rbp), %rax
	addq	$8, 24(%rbp)
	jmp	L310
L309:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	jmp	L308
L308:
	popq	%rbp
	ret
	.data
	.lcomm	L315,16
	.lcomm	L316,16
	.text
Csignature:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-272, %rsp
	movq	$L315, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L315, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L316, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L319
	jmp	L318
L319:
	.data
L320:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
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
	.byte	'p'
	.byte	'a'
	.byte	'r'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L320, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L318:
	movq	$0, %rax
	movq	%rax, -272(%rbp)
L321:
	movq	-272(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L326
	incq	%rdx
L326:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L327
	jmp	L325
L327:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L328
	incq	%rdx
L328:
	movq	%rdx, %rax
L325:
	orq	%rax, %rax
	jnz	L329
	jmp	L323
L329:
	jmp	L322
L324:
	movq	-272(%rbp), %rax
	incq	-272(%rbp)
	jmp	L321
L322:
	leaq	-264(%rbp), %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$CPrims, %rax
	decq	32(%rbp)
	pushq	%rax
	movq	32(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L324
L323:
	leaq	-264(%rbp), %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L331
	jmp	L330
L331:
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	call	Cgalloc
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$1, %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	leaq	-264(%rbp), %rax
	pushq	%rax
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	jmp	L332
L330:
	leaq	-264(%rbp), %rax
	pushq	%rax
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cintcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L334
	jmp	L333
L334:
	.data
L335:
	.byte	'd'
	.byte	'e'
	.byte	'c'
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'd'
	.byte	'o'
	.byte	'e'
	.byte	's'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'o'
	.byte	't'
	.byte	'o'
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L335, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L333:
L332:
L317:
	addq	$272, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L336,8
	.lcomm	L337,8
	.text
	.globl	Cdecl
Cdecl:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-72, %rsp
	movq	$0, -48(%rbp)
	movq	$L336, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L336, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L336, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L336, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L336, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L337, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L337, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L337, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L337, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L337, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	movq	%rax, -32(%rbp)
L339:
	jmp	L340
L342:
	jmp	L339
L340:
	movq	-32(%rbp), %rax
	movq	%rax, 24(%rbp)
	movq	$0, %rax
	movq	%rax, -56(%rbp)
	movq	$0, %rax
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rax
	pushq	%rax
	leaq	-56(%rbp), %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	pushq	%rax
	leaq	24(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cdeclarator
	addq	$56, %rsp
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L344
	jmp	L343
L344:
	movq	$3, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L347
	jmp	L345
L347:
	movq	$6, %rax
	jmp	L346
L345:
	movq	$2, %rax
L346:
	movq	%rax, 16(%rbp)
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	%rax, CThisfn
	movq	$1024, %rax
	pushq	%rax
	movq	CLocs, %rax
	pushq	%rax
	movq	CThisfn, %rax
	pushq	%rax
	call	Csignature
	addq	$24, %rsp
	movq	CToken, %rax
	pushq	%rax
	movq	$51, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L349
	jmp	L348
L349:
	movq	$6, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L353
	jmp	L350
L353:
	movq	$3, %rax
	jmp	L351
L350:
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L354
	jmp	L352
L354:
	movq	$1, %rax
	jmp	L351
L352:
	movq	16(%rbp), %rax
L351:
	movq	%rax, 16(%rbp)
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	%rax, CThisfn
	call	Cscan
	movq	%rax, CToken
	call	Clocaldecls
	movq	%rax, -72(%rbp)
	call	Cgentext
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L356
	jmp	L355
L356:
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenpublic
	addq	$8, %rsp
L355:
	call	Cgenaligntext
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenname
	addq	$8, %rsp
	call	Cgenentry
	movq	-72(%rbp), %rax
	pushq	%rax
	call	Cgenstack
	addq	$8, %rsp
	call	Cgenlocinit
	call	Clabel
	movq	%rax, CRetlab
	movq	$0, %rax
	pushq	%rax
	call	Ccompound
	addq	$8, %rsp
	movq	CRetlab, %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	-72(%rbp), %rax
	negq	%rax
	pushq	%rax
	call	Cgenstack
	addq	$8, %rsp
	call	Cgenexit
	movq	$1, %rax
	pushq	%rax
	movq	CO_debug, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L358
	jmp	L357
L358:
	.data
L359:
	.byte	'L'
	.byte	'O'
	.byte	'C'
	.byte	'A'
	.byte	'L'
	.byte	'S'
	.byte	58
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$1024, %rax
	pushq	%rax
	movq	CLocs, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$L359, %rax
	pushq	%rax
	call	Cdumpsyms
	addq	$32, %rsp
L357:
	jmp	L360
L348:
	call	Csemi
L360:
	call	Cclrlocs
	jmp	L338
L343:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L362
	incq	%rdx
L362:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L363
	jmp	L361
L363:
	movq	-64(%rbp), %rax
L361:
	orq	%rax, %rax
	jnz	L365
	jmp	L364
L365:
	.data
L366:
	.byte	'i'
	.byte	'n'
	.byte	'i'
	.byte	't'
	.byte	'i'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'z'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	39
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	39
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$L366, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L364:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L368
	jmp	L367
L368:
	call	Cscan
	movq	%rax, CToken
	jmp	L369
L367:
	jmp	L341
L369:
	jmp	L342
L341:
	call	Csemi
L338:
	addq	$72, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L370,16
	.lcomm	L371,16
	.text
	.globl	Cstructdecl
Cstructdecl:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-112, %rsp
	movq	$0, -48(%rbp)
	movq	$0, -112(%rbp)
	movq	$L370, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L370, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L371, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	movq	$CText, %rax
	pushq	%rax
	leaq	-96(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	call	Cident
	movq	$51, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L374
	jmp	L373
L374:
	leaq	-96(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L377
	jmp	L375
L377:
	movq	$68, %rax
	jmp	L376
L375:
	movq	$65, %rax
L376:
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdecl
	addq	$16, %rsp
	jmp	L372
L373:
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$7, %rax
	pushq	%rax
	movq	$6, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L380
	jmp	L378
L380:
	movq	$16384, %rax
	jmp	L379
L378:
	movq	$8192, %rax
L379:
	pushq	%rax
	leaq	-96(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	%rax, -104(%rbp)
	call	Cscan
	movq	%rax, CToken
L382:
	movq	CToken, %rax
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L384
	incq	%rdx
L384:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L385
	jmp	L383
L385:
	movq	CToken, %rax
	pushq	%rax
	movq	$33, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L386
	incq	%rdx
L386:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L387
	jmp	L383
L387:
	movq	CToken, %rax
	pushq	%rax
	movq	$69, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L388
	incq	%rdx
L388:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L389
	jmp	L383
L389:
	movq	CToken, %rax
	pushq	%rax
	movq	$65, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L390
	incq	%rdx
L390:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L391
	jmp	L383
L391:
	movq	CToken, %rax
	pushq	%rax
	movq	$68, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L392
	incq	%rdx
L392:
	movq	%rdx, %rax
L383:
	orq	%rax, %rax
	jnz	L393
	jmp	L381
L393:
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$0, %rax
	movq	%rax, -24(%rbp)
	call	Cscan
	movq	%rax, CToken
L394:
	jmp	L395
L397:
	jmp	L394
L395:
	call	Ceofcheck
	orq	%rax, %rax
	jnz	L399
	jmp	L398
L399:
	jmp	L372
L398:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	-32(%rbp), %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	leaq	-16(%rbp), %rax
	pushq	%rax
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cdeclarator
	addq	$56, %rsp
	movq	%rax, -40(%rbp)
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	leaq	-72(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L401
	jmp	L400
L401:
	.data
L402:
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'u'
	.byte	'c'
	.byte	't'
	.byte	47
	.byte	'u'
	.byte	'n'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'b'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	's'
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'k'
	.byte	'n'
	.byte	'o'
	.byte	'w'
	.byte	'n'
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
	.text
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	$L402, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L400:
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L404
	jmp	L403
L404:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-112(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L407
	jmp	L405
L407:
	movq	-24(%rbp), %rax
	jmp	L406
L405:
	movq	-112(%rbp), %rax
L406:
	movq	%rax, -112(%rbp)
	jmp	L408
L403:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	movq	%rax, -48(%rbp)
L408:
	movq	$35, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L410
	jmp	L409
L410:
	jmp	L396
L409:
	call	Cscan
	movq	%rax, CToken
	jmp	L397
L396:
	call	Csemi
	jmp	L382
L381:
	call	Crbrace
	call	Csemi
	movq	$CSizes, %rax
	pushq	%rax
	movq	-104(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L413
	jmp	L411
L413:
	movq	-112(%rbp), %rax
	jmp	L412
L411:
	movq	-48(%rbp), %rax
L412:
	popq	%rdx
	movq	%rax, (%rdx)
L372:
	addq	$112, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L414,8
	.lcomm	L415,8
	.text
	.globl	Ctop
Ctop:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$1, -16(%rbp)
	movq	$L414, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L414, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L414, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L414, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	jmp	L418
L419:
	movq	$2, %rax
	movq	%rax, -16(%rbp)
	call	Cscan
	movq	%rax, CToken
	jmp	L417
L420:
	movq	$3, %rax
	movq	%rax, -16(%rbp)
	call	Cscan
	movq	%rax, CToken
	jmp	L417
L421:
	call	Cscan
	movq	%rax, CToken
	jmp	L417
	jmp	L417
L418:
	movq	$L422, %rdx
	jmp	switch
L422:
	.quad	3
	.quad	44, L419
	.quad	63, L420
	.quad	70, L421
	.quad	L417
L417:
	movq	CToken, %rax
	jmp	L424
L425:
	movq	$1, %rax
	pushq	%rax
	call	Cenumdecl
	addq	$8, %rsp
	jmp	L423
L426:
L427:
	movq	CToken, %rax
	pushq	%rax
	movq	$68, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L428
	incq	%rdx
L428:
	movq	%rdx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cstructdecl
	addq	$16, %rsp
	jmp	L423
L429:
L430:
L431:
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cdecl
	addq	$16, %rsp
	jmp	L423
L432:
	movq	$2, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cdecl
	addq	$16, %rsp
	jmp	L423
L433:
	.data
L434:
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	'i'
	.byte	'f'
	.byte	'i'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'a'
	.byte	't'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L434, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$61, %rax
	pushq	%rax
	call	Csynch
	addq	$8, %rsp
	movq	%rax, CToken
	jmp	L423
	jmp	L423
L424:
	movq	$L435, %rdx
	jmp	switch
L435:
	.quad	7
	.quad	43, L425
	.quad	65, L426
	.quad	68, L427
	.quad	33, L429
	.quad	49, L430
	.quad	69, L431
	.quad	46, L432
	.quad	L433
L423:
L416:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L436,8
	.lcomm	L437,8
	.text
Cstats:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L436, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L436, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L436, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L436, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L436, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L436, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L437, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L437, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L437, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L437, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L437, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L437, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L439:
	.byte	'M'
	.byte	'e'
	.byte	'm'
	.byte	'o'
	.byte	'r'
	.byte	'y'
	.byte	32
	.byte	'u'
	.byte	's'
	.byte	'a'
	.byte	'g'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	'S'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	47
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	44
	.byte	32
	.byte	'N'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	47
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	44
	.byte	32
	.byte	'N'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	47
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	10
	.byte	0
	.text
	movq	$4096, %rax
	pushq	%rax
	movq	CNdmax, %rax
	pushq	%rax
	movq	$16384, %rax
	pushq	%rax
	movq	CNbot, %rax
	pushq	%rax
	movq	$1024, %rax
	pushq	%rax
	movq	CGlobs, %rax
	pushq	%rax
	movq	$L439, %rax
	pushq	%rax
	call	Cprintf
	addq	$56, %rsp
L438:
	popq	%rbp
	ret
	.data
	.lcomm	L440,8
	.lcomm	L441,8
	.text
	.globl	Cdefarg
Cdefarg:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L440, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L440, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L440, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L440, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L440, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L440, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L440, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L441, %rax
	pushq	%rax
	movq	$7, %rax
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
	je	L444
	jmp	L443
L444:
	jmp	L442
L443:
	movq	$61, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L446
	jmp	L445
L446:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L447
L445:
	.data
L448:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L448, %rax
	movq	%rax, -8(%rbp)
L447:
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cglobname
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$5, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L450
	jmp	L449
L450:
	decq	-8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$61, %rax
	popq	%rdx
	movb	%al, (%rdx)
L449:
L442:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L451,8
	.lcomm	L452,8
	.text
	.globl	Cprogram
Cprogram:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L451, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L451, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L452, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cinit
	movq	40(%rbp), %rax
	pushq	%rax
	call	Cdefarg
	addq	$8, %rsp
	movq	24(%rbp), %rax
	movq	%rax, CInfile
	movq	32(%rbp), %rax
	movq	%rax, COutfile
	movq	16(%rbp), %rax
	movq	%rax, CBasefile
	movq	%rax, CFile
	call	Cgenprelude
	call	Cscan
	movq	%rax, CToken
L455:
	movq	CToken, %rax
	pushq	%rax
	movq	$72, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L456
	jmp	L454
L456:
	call	Ctop
	jmp	L455
L454:
	call	Cgenpostlude
	movq	$2, %rax
	pushq	%rax
	movq	CO_debug, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L458
	jmp	L457
L458:
	.data
L459:
	.byte	'G'
	.byte	'L'
	.byte	'O'
	.byte	'B'
	.byte	'A'
	.byte	'L'
	.byte	'S'
	.byte	0
L460:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	CGlobs, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$L460, %rax
	pushq	%rax
	movq	$L459, %rax
	pushq	%rax
	call	Cdumpsyms
	addq	$32, %rsp
L457:
	movq	$4, %rax
	pushq	%rax
	movq	CO_debug, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L462
	jmp	L461
L462:
	call	Cstats
L461:
L453:
	popq	%rbp
	ret

