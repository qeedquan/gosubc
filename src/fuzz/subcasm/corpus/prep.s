	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cplaymac
Cplaymac:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
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
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
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
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CMp, %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L5
	jmp	L4
L5:
	.data
L6:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'c'
	.byte	'r'
	.byte	'o'
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$L6, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L4:
	movq	$CMacc, %rax
	pushq	%rax
	movq	CMp, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cnext
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CMacp, %rax
	pushq	%rax
	movq	CMp, %rax
	incq	CMp
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L7,8
	.lcomm	L8,8
	.text
	.globl	Cgetln
Cgetln:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L7, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CInfile, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfgets
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L11
	jmp	L10
L11:
	movq	$0, %rax
	jmp	L9
L10:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jnz	L13
	jmp	L12
L13:
	decq	-8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L12:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jnz	L15
	jmp	L14
L15:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$13, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L16
	incq	%rdx
L16:
	movq	%rdx, %rax
L14:
	orq	%rax, %rax
	jnz	L18
	jmp	L17
L18:
	decq	-8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L17:
	movq	-8(%rbp), %rax
	jmp	L9
L9:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L19,8
	.lcomm	L20,8
	.text
Cdefmac:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-560, %rsp
	movq	$L19, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscanraw
	movq	%rax, CToken
	movq	$46, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L23
	jmp	L22
L23:
	.data
L24:
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
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	35
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'i'
	.byte	'n'
	.byte	'e'
	.byte	39
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L24, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L22:
	movq	$CText, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	movq	CPutback, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L26
	jmp	L25
L26:
	leaq	-544(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L27
L25:
	movq	$511, %rax
	pushq	%rax
	leaq	-544(%rbp), %rax
	pushq	%rax
	call	Cgetln
	addq	$16, %rsp
L27:
	leaq	-544(%rbp), %rax
	movq	%rax, -552(%rbp)
L28:
	movq	-552(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L32
	jmp	L30
L32:
	jmp	L29
L31:
	movq	-552(%rbp), %rax
	incq	-552(%rbp)
	jmp	L28
L29:
	jmp	L31
L30:
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cfindmac
	addq	$8, %rsp
	movq	%rax, -560(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L34
	jmp	L33
L34:
	leaq	-544(%rbp), %rax
	pushq	%rax
	movq	$CMtext, %rax
	pushq	%rax
	movq	-560(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L36
	jmp	L35
L36:
	.data
L37:
	.byte	'm'
	.byte	'a'
	.byte	'c'
	.byte	'r'
	.byte	'o'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'i'
	.byte	'n'
	.byte	'i'
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
	.text
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$L37, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L35:
	jmp	L38
L33:
	movq	$0, %rax
	pushq	%rax
	movq	-552(%rbp), %rax
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
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
L38:
	movq	CLine, %rax
	incq	CLine
L21:
	addq	$560, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L39,8
	.lcomm	L40,8
	.text
Cundef:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L39, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscanraw
	movq	%rax, CToken
	movq	$CText, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L43
	jmp	L42
L43:
	.data
L44:
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
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	35
	.byte	'u'
	.byte	'n'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	39
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L44, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L42:
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cfindmac
	addq	$8, %rsp
	movq	%rax, -32(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L46
	jmp	L45
L46:
	.data
L47:
	.byte	35
	.byte	'u'
	.byte	'n'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	39
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
	movq	$CNames, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L47, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L45:
L41:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L48,8
	.lcomm	L49,8
	.text
Cinclude:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-1096, %rsp
	movq	$L48, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cskip
	movq	%rax, -1048(%rbp)
	pushq	%rax
	movq	$60, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L52
	jmp	L51
L52:
	movq	$62, %rax
	movq	%rax, -1048(%rbp)
L51:
	.data
L53:
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$512, %rax
	pushq	%rax
	movq	$L53, %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	leaq	-520(%rbp), %rax
	pushq	%rax
	call	Cgetln
	addq	$16, %rsp
	movq	%rax, -1056(%rbp)
	movq	CLine, %rax
	incq	CLine
	movq	-1056(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L55
	jmp	L54
L55:
	leaq	-520(%rbp), %rax
	pushq	%rax
	movq	-1056(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-1048(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L56
	incq	%rdx
L56:
	movq	%rdx, %rax
L54:
	orq	%rax, %rax
	jnz	L58
	jmp	L57
L58:
	.data
L59:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'd'
	.byte	'e'
	.byte	'l'
	.byte	'i'
	.byte	'm'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	35
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'l'
	.byte	'u'
	.byte	'd'
	.byte	'e'
	.byte	39
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L59, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L57:
	movq	-1056(%rbp), %rax
	orq	%rax, %rax
	jnz	L61
	jmp	L60
L61:
	leaq	-520(%rbp), %rax
	pushq	%rax
	movq	-1056(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L60:
	movq	$34, %rax
	pushq	%rax
	movq	-1048(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L63
	jmp	L62
L63:
	leaq	-520(%rbp), %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	jmp	L64
L62:
	.data
L65:
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L65, %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L66:
	.byte	47
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'l'
	.byte	'u'
	.byte	'd'
	.byte	'e'
	.byte	47
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L66, %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	leaq	-520(%rbp), %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
L64:
	.data
L67:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L67, %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -1064(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L69
	jmp	L68
L69:
	.data
L70:
	.byte	'c'
	.byte	'a'
	.byte	'n'
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'l'
	.byte	'u'
	.byte	'd'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
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
	leaq	-1040(%rbp), %rax
	pushq	%rax
	movq	$L70, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	jmp	L71
L68:
	movq	CInclev, %rax
	incq	CInclev
	call	Cnext
	movq	%rax, -1088(%rbp)
	movq	CLine, %rax
	movq	%rax, -1096(%rbp)
	movq	CFile, %rax
	movq	%rax, -1080(%rbp)
	movq	CInfile, %rax
	movq	%rax, -1072(%rbp)
	movq	$1, %rax
	movq	%rax, CLine
	movq	$10, %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	leaq	-1040(%rbp), %rax
	movq	%rax, CFile
	movq	-1064(%rbp), %rax
	movq	%rax, CInfile
	call	Cscan
	movq	%rax, CToken
L73:
	movq	CToken, %rax
	pushq	%rax
	movq	$72, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L74
	jmp	L72
L74:
	call	Ctop
	jmp	L73
L72:
	movq	-1096(%rbp), %rax
	movq	%rax, CLine
	movq	-1080(%rbp), %rax
	movq	%rax, CFile
	movq	-1072(%rbp), %rax
	movq	%rax, CInfile
	movq	-1064(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	movq	-1088(%rbp), %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	movq	CInclev, %rax
	decq	CInclev
L71:
L50:
	addq	$1096, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L75,8
	.lcomm	L76,8
	.text
Cifdef:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L75, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L75, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L75, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L75, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L75, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L75, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CIsp, %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L79
	jmp	L78
L79:
	.data
L80:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	39
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	39
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L80, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L78:
	call	Cscanraw
	movq	%rax, CToken
	movq	$CText, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L82
	jmp	L81
L82:
	.data
L83:
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
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	39
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L83, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L81:
	movq	$1, %rax
	pushq	%rax
	call	Cfrozen
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L85
	jmp	L84
L85:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	incq	CIsp
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$80, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L86
L84:
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cfindmac
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L87
	incq	%rdx
L87:
	movq	%rdx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L89
	jmp	L88
L89:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	incq	CIsp
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$79, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L90
L88:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	incq	CIsp
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$80, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L90:
L86:
L77:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L91,8
	.lcomm	L92,8
	.text
Cp_else:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L91, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CIsp, %rax
	orq	%rax, %rax
	jz	L95
	jmp	L94
L95:
	.data
L96:
	.byte	39
	.byte	35
	.byte	'e'
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	39
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'h'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	39
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'd'
	.byte	'e'
	.byte	'f'
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
	movq	$L96, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	jmp	L97
L94:
	movq	$2, %rax
	pushq	%rax
	call	Cfrozen
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L99
	jmp	L98
L99:
	jmp	L100
L98:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
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
	movq	$79, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L102
	jmp	L101
L102:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$76, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L103
L101:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
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
	movq	$80, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L105
	jmp	L104
L105:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$75, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L106
L104:
	.data
L107:
	.byte	39
	.byte	35
	.byte	'e'
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	39
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'h'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	39
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'd'
	.byte	'e'
	.byte	'f'
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
	movq	$L107, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L106:
L103:
L100:
L97:
L93:
	popq	%rbp
	ret
	.data
	.lcomm	L108,8
	.lcomm	L109,8
	.text
Cendif:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L108, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CIsp, %rax
	orq	%rax, %rax
	jz	L112
	jmp	L111
L112:
	.data
L113:
	.byte	39
	.byte	35
	.byte	'e'
	.byte	'n'
	.byte	'd'
	.byte	'i'
	.byte	'f'
	.byte	39
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'h'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	39
	.byte	35
	.byte	'i'
	.byte	'f'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L113, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	jmp	L114
L111:
	movq	CIsp, %rax
	decq	CIsp
L114:
L110:
	popq	%rbp
	ret
	.data
	.lcomm	L115,8
	.lcomm	L116,8
	.text
Cpperror:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-520, %rsp
	movq	$L115, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CPutback, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L119
	jmp	L118
L119:
	leaq	-520(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L120
L118:
	movq	$511, %rax
	pushq	%rax
	leaq	-520(%rbp), %rax
	pushq	%rax
	call	Cgetln
	addq	$16, %rsp
L120:
	.data
L121:
	.byte	35
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
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
	.text
	leaq	-520(%rbp), %rax
	pushq	%rax
	movq	$L121, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L117:
	addq	$520, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L122,8
	.lcomm	L123,8
	.text
Csetline:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-520, %rsp
	movq	$L122, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L122, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CPutback, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L126
	jmp	L125
L126:
	leaq	-520(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L127
L125:
	movq	$511, %rax
	pushq	%rax
	leaq	-520(%rbp), %rax
	pushq	%rax
	call	Cgetln
	addq	$16, %rsp
L127:
	leaq	-520(%rbp), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, CLine
L124:
	addq	$520, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L128,8
	.lcomm	L129,8
	.text
Cjunkln:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L128, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L129, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L132:
	movq	CInfile, %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L134
	jmp	L133
L134:
	movq	CInfile, %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	pushq	%rax
	movq	$10, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L135
	incq	%rdx
L135:
	movq	%rdx, %rax
L133:
	orq	%rax, %rax
	jnz	L136
	jmp	L131
L136:
	jmp	L132
L131:
	movq	CLine, %rax
	incq	CLine
L130:
	popq	%rbp
	ret
	.data
	.lcomm	L137,8
	.lcomm	L138,8
	.text
	.globl	Cfrozen
Cfrozen:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L137, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L137, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L137, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L137, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L137, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L137, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L137, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L138, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CIsp, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L142
	incq	%rdx
L142:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L143
	jmp	L140
L143:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$80, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L144
	incq	%rdx
L144:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L145
	jmp	L141
L145:
	movq	$CIfdefstk, %rax
	pushq	%rax
	movq	CIsp, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$76, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L146
	incq	%rdx
L146:
	movq	%rdx, %rax
L141:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L140:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	jmp	L139
L139:
	popq	%rbp
	ret
	.data
	.lcomm	L147,8
	.lcomm	L148,8
	.text
	.globl	Cpreproc
Cpreproc:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L147, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L147, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L148, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$35, %rax
	pushq	%rax
	call	Cputback
	addq	$8, %rsp
	call	Cscanraw
	movq	%rax, CToken
	movq	$1, %rax
	pushq	%rax
	call	Cfrozen
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L151
	jmp	L150
L151:
	movq	CToken, %rax
	pushq	%rax
	movq	$79, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L152
	incq	%rdx
L152:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L153
	jmp	L150
L153:
	movq	CToken, %rax
	pushq	%rax
	movq	$80, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L154
	incq	%rdx
L154:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L155
	jmp	L150
L155:
	movq	CToken, %rax
	pushq	%rax
	movq	$75, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L156
	incq	%rdx
L156:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L157
	jmp	L150
L157:
	movq	CToken, %rax
	pushq	%rax
	movq	$77, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L158
	incq	%rdx
L158:
	movq	%rdx, %rax
L150:
	orq	%rax, %rax
	jnz	L160
	jmp	L159
L160:
	call	Cjunkln
	jmp	L149
L159:
	movq	CToken, %rax
	jmp	L162
L163:
	call	Cdefmac
	jmp	L161
L164:
	call	Cundef
	jmp	L161
L165:
	call	Cinclude
	jmp	L161
L166:
	movq	$1, %rax
	pushq	%rax
	call	Cifdef
	addq	$8, %rsp
	jmp	L161
L167:
	movq	$0, %rax
	pushq	%rax
	call	Cifdef
	addq	$8, %rsp
	jmp	L161
L168:
	call	Cp_else
	jmp	L161
L169:
	call	Cendif
	jmp	L161
L170:
	call	Cpperror
	jmp	L161
L171:
	call	Csetline
	jmp	L161
L172:
	call	Cjunkln
	jmp	L161
L173:
	call	Cjunkln
	jmp	L161
	jmp	L161
	jmp	L161
L162:
	movq	$L174, %rdx
	jmp	switch
L174:
	.quad	10
	.quad	74, L163
	.quad	84, L164
	.quad	81, L165
	.quad	79, L166
	.quad	80, L167
	.quad	75, L168
	.quad	77, L169
	.quad	78, L170
	.quad	82, L171
	.quad	83, L172
	.quad	L173
L161:
L149:
	popq	%rbp
	ret

