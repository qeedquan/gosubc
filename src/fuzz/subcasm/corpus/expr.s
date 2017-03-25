	.text
	.data
CPrec:	.quad	7
	.quad	7
	.quad	7
	.quad	6
	.quad	6
	.quad	5
	.quad	5
	.quad	4
	.quad	4
	.quad	4
	.quad	4
	.quad	3
	.quad	3
	.quad	2
	.quad	1
	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
Crvalue:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
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
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
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
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
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
	movq	$16, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L5
	jmp	L4
L5:
	movq	$16, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$38, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	jmp	L3
	jmp	L6
L4:
	movq	16(%rbp), %rax
	jmp	L3
L6:
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L7,8
	.lcomm	L8,8
	.text
Cprimary:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-56, %rsp
	movq	$0, -8(%rbp)
	movq	$L7, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L7, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$8, %rax
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
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	popq	%rdx
	movq	%rax, (%rdx)
	popq	%rdx
	movq	%rax, (%rdx)
	movq	CToken, %rax
	jmp	L11
L12:
	movq	$CText, %rax
	pushq	%rax
	call	Cfindsym
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	$CText, %rax
	pushq	%rax
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	Ccopyname
	addq	$16, %rsp
	call	Cscan
	movq	%rax, CToken
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jz	L14
	jmp	L13
L14:
	movq	CToken, %rax
	pushq	%rax
	movq	$53, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L16
	jmp	L15
L16:
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$-1, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	$3, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	Caddglob
	addq	$64, %rsp
	movq	%rax, -16(%rbp)
	jmp	L17
L15:
	.data
L18:
	.byte	'u'
	.byte	'n'
	.byte	'd'
	.byte	'e'
	.byte	'c'
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'r'
	.byte	'i'
	.byte	'a'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.text
	leaq	-56(%rbp), %rax
	pushq	%rax
	movq	$L18, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$5, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	leaq	-56(%rbp), %rax
	pushq	%rax
	call	Caddloc
	addq	$56, %rsp
	movq	%rax, -16(%rbp)
L17:
L13:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$CPrims, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CTypes, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L20
	jmp	L19
L20:
	movq	CToken, %rax
	pushq	%rax
	movq	$53, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L22
	jmp	L21
L22:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
L21:
	movq	-8(%rbp), %rax
	jmp	L9
L19:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L24
	jmp	L23
L24:
	movq	$CVals, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	jmp	L9
L23:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L26
	jmp	L25
L26:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L9
L25:
	movq	$CPrims, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ccomptype
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L28
	jmp	L27
L28:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L9
L27:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$18, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L9
L29:
	movq	CValue, %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L9
L30:
	call	Cgendata
	call	Clabel
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -32(%rbp)
L32:
	movq	CToken, %rax
	pushq	%rax
	movq	$64, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L33
	jmp	L31
L33:
	movq	CValue, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cgendefs
	addq	$16, %rsp
	movq	CValue, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
	call	Cscan
	movq	%rax, CToken
	jmp	L32
L31:
	movq	$0, %rax
	pushq	%rax
	call	Cgendefb
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cgenalign
	addq	$8, %rsp
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$21, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L9
L34:
	call	Cscan
	movq	%rax, CToken
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cexprlist
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	call	Crparen
	movq	-8(%rbp), %rax
	jmp	L9
L35:
	.data
L36:
	.byte	's'
	.byte	'y'
	.byte	'n'
	.byte	't'
	.byte	'a'
	.byte	'x'
	.byte	32
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
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
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L36, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$61, %rax
	pushq	%rax
	call	Csynch
	addq	$8, %rsp
	movq	%rax, CToken
	movq	$0, %rax
	jmp	L9
	jmp	L10
L11:
	movq	$L37, %rdx
	jmp	switch
L37:
	.quad	4
	.quad	46, L12
	.quad	50, L29
	.quad	64, L30
	.quad	53, L34
	.quad	L35
L10:
L9:
	addq	$56, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L38,16
	.lcomm	L39,16
	.text
	.globl	Ctypematch
Ctypematch:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L38, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L42
	jmp	L41
L42:
	movq	$1, %rax
	jmp	L40
L41:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L44
	jmp	L43
L44:
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
L43:
	orq	%rax, %rax
	jnz	L46
	jmp	L45
L46:
	movq	$1, %rax
	jmp	L40
L45:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L48
	jmp	L47
L48:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L49
	incq	%rdx
L49:
	movq	%rdx, %rax
L47:
	orq	%rax, %rax
	jnz	L51
	jmp	L50
L51:
	movq	$1, %rax
	jmp	L40
L50:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L53
	incq	%rdx
L53:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L54
	jmp	L52
L54:
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L52:
	orq	%rax, %rax
	jnz	L56
	jmp	L55
L56:
	movq	$1, %rax
	jmp	L40
L55:
	movq	$0, %rax
	jmp	L40
L40:
	popq	%rbp
	ret
	.data
	.lcomm	L57,8
	.lcomm	L58,8
	.text
Cfnargs:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-416, %rsp
	movq	$0, -408(%rbp)
	movq	$L57, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L57, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L57, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L57, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L57, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L57, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L57, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L58, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L62
	jmp	L60
L62:
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	jmp	L61
L60:
	movq	$0, %rax
L61:
	movq	%rax, -32(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L64:
	movq	CToken, %rax
	pushq	%rax
	movq	$60, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L65
	jmp	L63
L65:
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Casgmnt
	addq	$8, %rsp
	movq	%rax, -416(%rbp)
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	-416(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -416(%rbp)
	movq	-416(%rbp), %rax
	pushq	%rax
	movq	-408(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	movq	%rax, -408(%rbp)
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ccomptype
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L67
	jmp	L66
L67:
	.data
L68:
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
	.byte	'p'
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'b'
	.byte	'y'
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L68, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
L66:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jnz	L70
	jmp	L69
L70:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
L69:
	orq	%rax, %rax
	jnz	L72
	jmp	L71
L72:
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ctypematch
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L74
	jmp	L73
L74:
	.data
L75:
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'u'
	.byte	'm'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	37
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	58
	.byte	32
	.byte	37
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
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L75, %rax
	pushq	%rax
	leaq	-136(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-136(%rbp), %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L73:
	movq	-32(%rbp), %rax
	addq	$8, -32(%rbp)
L71:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L77
	jmp	L76
L77:
	leaq	-400(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-400(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L76:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	(%rax), %rax
	incq	(%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L79
	jmp	L78
L79:
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$60, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L81
	jmp	L80
L81:
	.data
L82:
	.byte	't'
	.byte	'r'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	39
	.byte	44
	.byte	39
	.byte	32
	.byte	'i'
	.byte	'n'
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
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L82, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L80:
	jmp	L83
L78:
	jmp	L63
L83:
	jmp	L64
L63:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L85
	jmp	L84
L85:
	movq	$CTypes, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L86
	incq	%rdx
L86:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L87
	jmp	L84
L87:
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L84:
	orq	%rax, %rax
	jnz	L89
	jmp	L88
L89:
	movq	$CMtext, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$1, %rax
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
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	leaq	-400(%rbp), %rax
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
L88:
	call	Crparen
	movq	-408(%rbp), %rax
	jmp	L59
L59:
	addq	$416, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L90,8
	.lcomm	L91,8
	.text
	.globl	Cderef
Cderef:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L90, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	jmp	L94
L95:
	movq	$4, %rax
	jmp	L92
L96:
	movq	$2, %rax
	jmp	L92
L97:
	movq	$3, %rax
	jmp	L92
L98:
	movq	$1, %rax
	jmp	L92
L99:
	movq	$8, %rax
	jmp	L92
L100:
	movq	$1, %rax
	jmp	L92
L101:
	movq	$1, %rax
	jmp	L92
	jmp	L93
L94:
	movq	$L102, %rdx
	jmp	switch
L102:
	.quad	7
	.quad	6, L95
	.quad	4, L96
	.quad	5, L97
	.quad	3, L98
	.quad	9, L99
	.quad	8, L100
	.quad	10, L101
	.quad	L93
L93:
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
	jmp	L104
L105:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$24576, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L92
L106:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$8192, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L92
L107:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$40960, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L92
L108:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$16384, %rax
	popq	%rcx
	orq	%rcx, %rax
	jmp	L92
	jmp	L103
L104:
	movq	$L109, %rdx
	jmp	switch
L109:
	.quad	4
	.quad	32768, L105
	.quad	24576, L106
	.quad	49152, L107
	.quad	40960, L108
	.quad	L103
L103:
	movq	$-1, %rax
	jmp	L92
L92:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L110,16
	.lcomm	L111,16
	.text
Cindirection:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L110, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L111, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L114
	jmp	L113
L114:
	.data
L115:
	.byte	'd'
	.byte	'e'
	.byte	'r'
	.byte	'e'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'c'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'v'
	.byte	'o'
	.byte	'i'
	.byte	'd'
	.byte	32
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L115, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L113:
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cderef
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L117
	jmp	L116
L117:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L119
	jmp	L118
L119:
	.data
L120:
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
	.byte	32
	.byte	't'
	.byte	'h'
	.byte	'r'
	.byte	'o'
	.byte	'u'
	.byte	'g'
	.byte	'h'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
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
	.text
	movq	$CNames, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L120, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	jmp	L121
L118:
	.data
L122:
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
	.byte	32
	.byte	't'
	.byte	'h'
	.byte	'r'
	.byte	'o'
	.byte	'u'
	.byte	'g'
	.byte	'h'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L122, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L121:
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
L116:
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	jmp	L112
L112:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L123,8
	.lcomm	L124,8
	.text
Cbadcall:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L123, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L123, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
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
	movq	$L124, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L127
	jmp	L126
L127:
	.data
L128:
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'f'
	.byte	'u'
	.byte	'n'
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
	.byte	0
	.byte	0
	.text
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L128, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	jmp	L129
L126:
	.data
L130:
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'f'
	.byte	'u'
	.byte	'n'
	.byte	'c'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L130, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L129:
L125:
	popq	%rbp
	ret
	.data
	.lcomm	L131,8
	.lcomm	L132,8
	.text
Cargsok:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L131, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L131, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L131, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L131, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L131, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L131, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L131, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L132, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L136
	incq	%rdx
L136:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L137
	jmp	L134
L137:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L138
	incq	%rdx
L138:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L139
	jmp	L135
L139:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	negq	%rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L140
	incq	%rdx
L140:
	movq	%rdx, %rax
L135:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L134:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	jmp	L133
L133:
	popq	%rbp
	ret
	.data
	.lcomm	L141,16
	.lcomm	L142,16
	.text
Cstc_access:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L141, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L141, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$57344, %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L145
	jmp	L144
L145:
	call	Cscan
	movq	%rax, CToken
	.data
L146:
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
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	37
	.byte	's'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L149:
	.byte	45
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L150:
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	32(%rbp), %rax
	orq	%rax, %rax
	jnz	L151
	jmp	L147
L151:
	movq	$L149, %rax
	jmp	L148
L147:
	movq	$L150, %rax
L148:
	pushq	%rax
	movq	$L146, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$0, %rax
	jmp	L143
L144:
	movq	$CText, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$-57345, %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	call	Cfindmem
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L153
	jmp	L152
L153:
	.data
L154:
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
	.byte	'h'
	.byte	'a'
	.byte	's'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'b'
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
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L154, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L152:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$8192, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L157
	incq	%rdx
L157:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L158
	jmp	L155
L158:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$24576, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L159
	incq	%rdx
L159:
	movq	%rdx, %rax
L155:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L160
	jmp	L156
L160:
	movq	$CVals, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L156:
	orq	%rax, %rax
	jnz	L162
	jmp	L161
L162:
	movq	$CVals, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	movq	%rax, -24(%rbp)
L161:
	call	Cscan
	movq	%rax, CToken
	movq	$CPrims, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L164
	jmp	L163
L164:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L163:
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	jmp	L143
L143:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L165,8
	.lcomm	L166,8
	.text
Cpostfix:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-56, %rsp
	movq	$0, -8(%rbp)
	movq	$L165, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
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
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cprimary
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
L168:
	jmp	L169
L171:
	jmp	L168
L169:
	movq	CToken, %rax
	jmp	L173
L174:
L176:
	movq	CToken, %rax
	pushq	%rax
	movq	$52, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L177
	jmp	L175
L177:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cindirection
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	$1, %rax
	pushq	%rax
	leaq	-40(%rbp), %rax
	pushq	%rax
	call	Cexprlist
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L179
	jmp	L178
L179:
	.data
L180:
	.byte	'n'
	.byte	'o'
	.byte	'n'
	.byte	45
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'g'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'b'
	.byte	's'
	.byte	'c'
	.byte	'r'
	.byte	'i'
	.byte	'p'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L180, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L178:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L182
	incq	%rdx
L182:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L183
	jmp	L181
L183:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L184
	incq	%rdx
L184:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L185
	jmp	L181
L185:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L186
	incq	%rdx
L186:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L187
	jmp	L181
L187:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L188
	incq	%rdx
L188:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L189
	jmp	L181
L189:
	movq	$57344, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$24576, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L190
	incq	%rdx
L190:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L191
	jmp	L181
L191:
	movq	$57344, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$40960, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L192
	incq	%rdx
L192:
	movq	%rdx, %rax
L181:
	orq	%rax, %rax
	jnz	L194
	jmp	L193
L194:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$39, %rax
	pushq	%rax
	call	Cmkunop
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	jmp	L195
L193:
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Ccomptype
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L197
	jmp	L196
L197:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	pushq	%rax
	movq	$40, %rax
	pushq	%rax
	call	Cmkunop1
	addq	$24, %rsp
	movq	%rax, -16(%rbp)
L196:
L195:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	call	Crbrack
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L176
L175:
	jmp	L172
L198:
	call	Cscan
	movq	%rax, CToken
	leaq	-56(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfnargs
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L200
	jmp	L199
L200:
	movq	$CTypes, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L201
	incq	%rdx
L201:
	movq	%rdx, %rax
L199:
	orq	%rax, %rax
	jnz	L203
	jmp	L202
L203:
	movq	$CSizes, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cargsok
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L205
	jmp	L204
L205:
	.data
L206:
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'n'
	.byte	'u'
	.byte	'm'
	.byte	'b'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'u'
	.byte	'm'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L206, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L204:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
	jmp	L207
L202:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L209
	jmp	L208
L209:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cbadcall
	addq	$8, %rsp
L208:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$11, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L207:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L172
L210:
L211:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L213
	jmp	L212
L213:
	movq	CToken, %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L215
	jmp	L214
L215:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$36, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
	jmp	L216
L214:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$35, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
L216:
	jmp	L217
L212:
	.data
L218:
	.byte	'l'
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'q'
	.byte	'u'
	.byte	'i'
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'b'
	.byte	'e'
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	39
	.byte	37
	.byte	's'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L218, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L217:
	call	Cscan
	movq	%rax, CToken
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L172
L219:
	call	Cscan
	movq	%rax, CToken
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ccomptype
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L221
	jmp	L220
L221:
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstc_access
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	jmp	L222
L220:
	.data
L223:
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
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'b'
	.byte	'e'
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	39
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
	movq	$L223, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L222:
	jmp	L172
L224:
	call	Cscan
	movq	%rax, CToken
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$57344, %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movq	$24576, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L226
	incq	%rdx
L226:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L227
	jmp	L225
L227:
	movq	$40960, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L228
	incq	%rdx
L228:
	movq	%rdx, %rax
L225:
	orq	%rax, %rax
	jnz	L230
	jmp	L229
L230:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstc_access
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	jmp	L231
L229:
	.data
L232:
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
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
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
	.byte	'b'
	.byte	'e'
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	39
	.byte	45
	.byte	62
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
	movq	$L232, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L231:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L172
L233:
	movq	-8(%rbp), %rax
	jmp	L167
	jmp	L172
L173:
	movq	$L234, %rdx
	jmp	switch
L234:
	.quad	6
	.quad	52, L174
	.quad	53, L198
	.quad	48, L210
	.quad	37, L211
	.quad	40, L219
	.quad	18, L224
	.quad	L233
L172:
	jmp	L171
L170:
L167:
	addq	$56, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L235,16
	.lcomm	L236,16
	.text
Ccomp_size:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-40, %rsp
	movq	$0, -8(%rbp)
	movq	$L235, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L235, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L236, %rax
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
	movq	$33, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L239
	incq	%rdx
L239:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L240
	jmp	L238
L240:
	movq	CToken, %rax
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L241
	incq	%rdx
L241:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L242
	jmp	L238
L242:
	movq	CToken, %rax
	pushq	%rax
	movq	$69, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L243
	incq	%rdx
L243:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L244
	jmp	L238
L244:
	movq	CToken, %rax
	pushq	%rax
	movq	$65, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L245
	incq	%rdx
L245:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L246
	jmp	L238
L246:
	movq	CToken, %rax
	pushq	%rax
	movq	$68, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L247
	incq	%rdx
L247:
	movq	%rdx, %rax
L238:
	orq	%rax, %rax
	jnz	L249
	jmp	L248
L249:
	movq	CToken, %rax
	jmp	L251
L252:
	movq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	L250
L253:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	L250
L254:
L255:
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$1, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	jmp	L250
	jmp	L250
L251:
	movq	$L256, %rdx
	jmp	switch
L256:
	.quad	4
	.quad	33, L252
	.quad	49, L253
	.quad	65, L254
	.quad	68, L255
	.quad	L250
L250:
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L258
	jmp	L257
L258:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L260
	jmp	L259
L260:
	call	Cscan
	movq	%rax, CToken
L259:
	jmp	L261
L257:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L263
	jmp	L262
L263:
	.data
L264:
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'o'
	.byte	'f'
	.byte	40
	.byte	'v'
	.byte	'o'
	.byte	'i'
	.byte	'd'
	.byte	41
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
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L264, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L262:
L261:
	jmp	L265
L248:
	leaq	-40(%rbp), %rax
	pushq	%rax
	call	Cprefix
	addq	$8, %rsp
	leaq	-40(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L268
	jmp	L266
L268:
	leaq	-40(%rbp), %rax
	movq	(%rax), %rax
	jmp	L267
L266:
	movq	$0, %rax
L267:
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jnz	L271
	jmp	L269
L271:
	movq	$CSizes, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$CTypes, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CPrims, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	jmp	L270
L269:
	movq	$1, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
L270:
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L273
	jmp	L272
L273:
	.data
L274:
	.byte	'c'
	.byte	'a'
	.byte	'n'
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	'o'
	.byte	'f'
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
	movq	$L274, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L272:
L265:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$23, %rax
	pushq	%rax
	call	Cmkleaf
	addq	$16, %rsp
	jmp	L237
L237:
	addq	$40, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L275,8
	.lcomm	L276,8
	.text
Cprefix:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L275, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L276, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	jmp	L279
L280:
L281:
	movq	CToken, %rax
	movq	%rax, -16(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cprefix
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L283
	jmp	L282
L283:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L285
	jmp	L284
L285:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$34, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
	jmp	L286
L284:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$33, %rax
	pushq	%rax
	call	Cmkunop2
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
L286:
	jmp	L287
L282:
	.data
L288:
	.byte	'l'
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
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
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	37
	.byte	's'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L291:
	.byte	43
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L292:
	.byte	45
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$48, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L293
	jmp	L289
L293:
	movq	$L291, %rax
	jmp	L290
L289:
	movq	$L292, %rax
L290:
	pushq	%rax
	movq	$L288, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L287:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L294:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cindirection
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L295:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L297
	jmp	L296
L297:
	.data
L298:
	.byte	'b'
	.byte	'a'
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'a'
	.byte	'r'
	.byte	'y'
	.byte	32
	.byte	39
	.byte	43
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
	movq	$L298, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L296:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L299:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L301
	jmp	L300
L301:
	.data
L302:
	.byte	'b'
	.byte	'a'
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'a'
	.byte	'r'
	.byte	'y'
	.byte	32
	.byte	39
	.byte	45
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
	movq	$L302, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L300:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$29, %rax
	pushq	%rax
	call	Cmkunop
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L303:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cinttype
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L305
	jmp	L304
L305:
	.data
L306:
	.byte	'b'
	.byte	'a'
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	39
	.byte	126
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
	movq	$L306, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L304:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$30, %rax
	pushq	%rax
	call	Cmkunop
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L307:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$24, %rax
	pushq	%rax
	call	Cmkunop
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L308:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L310
	jmp	L309
L310:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L312
	jmp	L311
L312:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	Cmkunop1
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
L311:
	jmp	L313
L309:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L316
	incq	%rdx
L316:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L317
	jmp	L314
L317:
	movq	$CTypes, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L318
	incq	%rdx
L318:
	movq	%rdx, %rax
L314:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L319
	jmp	L315
L319:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ccomptype
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L315:
	orq	%rax, %rax
	jnz	L321
	jmp	L320
L321:
	.data
L322:
	.byte	'l'
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
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
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'a'
	.byte	'r'
	.byte	'y'
	.byte	32
	.byte	39
	.byte	38
	.byte	39
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L322, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L320:
L313:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L323:
	call	Cscan
	movq	%rax, CToken
	call	Clparen
	call	Ccomp_size
	movq	%rax, -8(%rbp)
	call	Crparen
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L277
L324:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cpostfix
	addq	$8, %rsp
	jmp	L277
	jmp	L278
L279:
	movq	$L325, %rdx
	jmp	switch
L325:
	.quad	9
	.quad	48, L280
	.quad	37, L281
	.quad	1, L294
	.quad	3, L295
	.quad	4, L299
	.quad	67, L303
	.quad	73, L307
	.quad	13, L308
	.quad	62, L323
	.quad	L324
L278:
L277:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L326,8
	.lcomm	L327,8
	.text
Ccast:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L326, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L326, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L326, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L326, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L326, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L327, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L327, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L327, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L327, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L327, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	pushq	%rax
	movq	$53, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L330
	jmp	L329
L330:
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L332
	incq	%rdx
L332:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L333
	jmp	L331
L333:
	movq	CToken, %rax
	pushq	%rax
	movq	$33, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L334
	incq	%rdx
L334:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L335
	jmp	L331
L335:
	movq	CToken, %rax
	pushq	%rax
	movq	$69, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L336
	incq	%rdx
L336:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L337
	jmp	L331
L337:
	movq	CToken, %rax
	pushq	%rax
	movq	$65, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L338
	incq	%rdx
L338:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L339
	jmp	L331
L339:
	movq	CToken, %rax
	pushq	%rax
	movq	$68, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L340
	incq	%rdx
L340:
	movq	%rdx, %rax
L331:
	orq	%rax, %rax
	jnz	L342
	jmp	L341
L342:
	movq	$0, %rax
	pushq	%rax
	movq	CToken, %rax
	pushq	%rax
	call	Cprimtype
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	jmp	L343
L341:
	call	Creject
	movq	$53, %rax
	movq	%rax, CToken
	.data
L344:
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L344, %rax
	pushq	%rax
	movq	$CText, %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cprefix
	addq	$8, %rsp
	jmp	L328
L343:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L346
	incq	%rdx
L346:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L347
	jmp	L345
L347:
	movq	CToken, %rax
	pushq	%rax
	movq	$53, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L348
	incq	%rdx
L348:
	movq	%rdx, %rax
L345:
	orq	%rax, %rax
	jnz	L350
	jmp	L349
L350:
	call	Cscan
	movq	%rax, CToken
	.data
L351:
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	40
	.byte	42
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
	.byte	0
	.text
	movq	$L351, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cmatch
	addq	$16, %rsp
	call	Crparen
	call	Clparen
	call	Crparen
	movq	$10, %rax
	movq	%rax, -8(%rbp)
	jmp	L352
L349:
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L354
	jmp	L353
L354:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L356
	jmp	L355
L356:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cpointerto
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
L355:
L353:
L352:
	call	Crparen
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cprefix
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	jmp	L328
	jmp	L357
L329:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cprefix
	addq	$8, %rsp
	jmp	L328
L357:
L328:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L358,8
	.lcomm	L359,8
	.text
	.globl	Cbinop
Cbinop:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L358, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L358, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L358, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L358, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L358, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L358, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L359, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L359, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L359, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L359, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L359, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L359, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	jmp	L362
L363:
	movq	$4, %rax
	jmp	L360
L364:
	movq	$6, %rax
	jmp	L360
L365:
	movq	$15, %rax
	jmp	L360
L366:
	movq	$16, %rax
	jmp	L360
L367:
	movq	$17, %rax
	jmp	L360
L368:
	movq	$22, %rax
	jmp	L360
L369:
	movq	$25, %rax
	jmp	L360
L370:
	movq	$26, %rax
	jmp	L360
L371:
	movq	$41, %rax
	jmp	L360
L372:
	movq	$27, %rax
	jmp	L360
L373:
	movq	$31, %rax
	jmp	L360
L374:
	movq	$5, %rax
	jmp	L360
L375:
	movq	$32, %rax
	jmp	L360
L376:
	movq	$37, %rax
	jmp	L360
L377:
	movq	$14, %rax
	jmp	L360
L378:
	movq	$28, %rax
	jmp	L360
L379:
	.data
L380:
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	58
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'k'
	.byte	'n'
	.byte	'o'
	.byte	'w'
	.byte	'n'
	.byte	32
	.byte	'b'
	.byte	'i'
	.byte	'n'
	.byte	'o'
	.byte	'p'
	.byte	0
	.text
	movq	$L380, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L360
	jmp	L361
L362:
	movq	$L381, %rdx
	jmp	switch
L381:
	.quad	16
	.quad	13, L363
	.quad	14, L364
	.quad	11, L365
	.quad	7, L366
	.quad	8, L367
	.quad	9, L368
	.quad	5, L369
	.quad	10, L370
	.quad	4, L371
	.quad	2, L372
	.quad	12, L373
	.quad	15, L374
	.quad	3, L375
	.quad	6, L376
	.quad	0, L377
	.quad	1, L378
	.quad	L379
L361:
L360:
	popq	%rbp
	ret
	.data
	.lcomm	L382,8
	.lcomm	L383,8
	.text
	.globl	Cmkop
Cmkop:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L382, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L382, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L382, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L382, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L382, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L383, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L383, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L383, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L383, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L383, %rax
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
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L386
	incq	%rdx
L386:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L387
	jmp	L385
L387:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L388
	incq	%rdx
L388:
	movq	%rdx, %rax
L385:
	orq	%rax, %rax
	jnz	L390
	jmp	L389
L390:
	movq	48(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cbinop
	addq	$8, %rsp
	pushq	%rax
	call	Cmkbinop2
	addq	$40, %rsp
	jmp	L384
	jmp	L391
L389:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$11, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L393
	incq	%rdx
L393:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L394
	jmp	L392
L394:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$12, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L395
	incq	%rdx
L395:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L396
	jmp	L392
L396:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L397
	incq	%rdx
L397:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L398
	jmp	L392
L398:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L399
	incq	%rdx
L399:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L400
	jmp	L392
L400:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L401
	incq	%rdx
L401:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L402
	jmp	L392
L402:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L403
	incq	%rdx
L403:
	movq	%rdx, %rax
L392:
	orq	%rax, %rax
	jnz	L405
	jmp	L404
L405:
	movq	48(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cbinop
	addq	$8, %rsp
	pushq	%rax
	call	Cmkbinop1
	addq	$32, %rsp
	jmp	L384
	jmp	L406
L404:
	movq	48(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cbinop
	addq	$8, %rsp
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	jmp	L384
L406:
L391:
L384:
	popq	%rbp
	ret
	.data
	.lcomm	L407,8
	.lcomm	L408,8
	.text
Cbinexpr:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-272, %rsp
	movq	$0, -160(%rbp)
	movq	$L407, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L407, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L408, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L411:
	movq	CToken, %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L413
	incq	%rdx
L413:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L414
	jmp	L412
L414:
	movq	CToken, %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L415
	incq	%rdx
L415:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L416
	jmp	L412
L416:
	movq	CToken, %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L417
	incq	%rdx
L417:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L418
	jmp	L412
L418:
	movq	CToken, %rax
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L419
	incq	%rdx
L419:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L420
	jmp	L412
L420:
	movq	CToken, %rax
	pushq	%rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L421
	incq	%rdx
L421:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L422
	jmp	L412
L422:
	movq	CToken, %rax
	pushq	%rax
	movq	$5, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L423
	incq	%rdx
L423:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L424
	jmp	L412
L424:
	movq	CToken, %rax
	pushq	%rax
	movq	$6, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L425
	incq	%rdx
L425:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L426
	jmp	L412
L426:
	movq	CToken, %rax
	pushq	%rax
	movq	$7, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L427
	incq	%rdx
L427:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L428
	jmp	L412
L428:
	movq	CToken, %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L429
	incq	%rdx
L429:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L430
	jmp	L412
L430:
	movq	CToken, %rax
	pushq	%rax
	movq	$9, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L431
	incq	%rdx
L431:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L432
	jmp	L412
L432:
	movq	CToken, %rax
	pushq	%rax
	movq	$10, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L433
	incq	%rdx
L433:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L434
	jmp	L412
L434:
	movq	CToken, %rax
	pushq	%rax
	movq	$11, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L435
	incq	%rdx
L435:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L436
	jmp	L412
L436:
	movq	CToken, %rax
	pushq	%rax
	movq	$12, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L437
	incq	%rdx
L437:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L438
	jmp	L412
L438:
	movq	CToken, %rax
	pushq	%rax
	movq	$13, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L439
	incq	%rdx
L439:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L440
	jmp	L412
L440:
	movq	CToken, %rax
	pushq	%rax
	movq	$14, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L441
	incq	%rdx
L441:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L442
	jmp	L412
L442:
	movq	CToken, %rax
	pushq	%rax
	movq	$15, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L443
	incq	%rdx
L443:
	movq	%rdx, %rax
L412:
	orq	%rax, %rax
	jnz	L444
	jmp	L410
L444:
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	leaq	-272(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
L446:
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L448
	incq	%rdx
L448:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L449
	jmp	L447
L449:
	movq	$CPrec, %rax
	pushq	%rax
	movq	CToken, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$CPrec, %rax
	pushq	%rax
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L450
	incq	%rdx
L450:
	movq	%rdx, %rax
L447:
	orq	%rax, %rax
	jnz	L451
	jmp	L445
L451:
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	call	Cmkop
	addq	$40, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	call	Cbinoptype
	addq	$24, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-160(%rbp), %rax
	decq	-160(%rbp)
	jmp	L446
L445:
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	incq	-160(%rbp)
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	call	Cscan
	movq	%rax, CToken
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-184(%rbp), %rax
	pushq	%rax
	call	Ccast
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-184(%rbp), %rax
	pushq	%rax
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-184(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$0, %rax
	movq	%rax, -192(%rbp)
	jmp	L411
L410:
L453:
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L454
	jmp	L452
L454:
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-272(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	call	Cmkop
	addq	$40, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
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
	call	Cbinoptype
	addq	$24, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-160(%rbp), %rax
	decq	-160(%rbp)
	jmp	L453
L452:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-192(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-272(%rbp), %rax
	movq	(%rax), %rax
	jmp	L409
L409:
	addq	$272, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L455,8
	.lcomm	L456,8
	.text
Ccond2:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-56, %rsp
	movq	$0, -32(%rbp)
	movq	$0, -48(%rbp)
	movq	$1, -56(%rbp)
	movq	$L455, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L455, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L455, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L455, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L455, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L455, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L456, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L456, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L456, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L456, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L456, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L456, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$17, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L460
	jmp	L458
L460:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccond2
	addq	$16, %rsp
	jmp	L459
L458:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cbinexpr
	addq	$8, %rsp
L459:
	movq	%rax, -40(%rbp)
L462:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L463
	jmp	L461
L463:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jz	L465
	jmp	L464
L465:
	call	Clabel
	movq	%rax, -32(%rbp)
L464:
	movq	-56(%rbp), %rax
	orq	%rax, %rax
	jnz	L467
	jmp	L466
L467:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cnotvoid
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -56(%rbp)
L466:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -40(%rbp)
	call	Cscan
	movq	%rax, CToken
	movq	$17, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L470
	jmp	L468
L470:
	movq	$16, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Ccond2
	addq	$16, %rsp
	jmp	L469
L468:
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cbinexpr
	addq	$8, %rsp
L469:
	movq	%rax, -48(%rbp)
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -48(%rbp)
	movq	$17, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L472
	jmp	L471
L472:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	pushq	%rax
	call	Cmkbinop1
	addq	$32, %rsp
	movq	%rax, -40(%rbp)
	jmp	L473
L471:
	movq	-48(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	call	Cmkbinop1
	addq	$32, %rsp
	movq	%rax, -40(%rbp)
L473:
	jmp	L462
L461:
	movq	-32(%rbp), %rax
	orq	%rax, %rax
	jnz	L475
	jmp	L474
L475:
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
	pushq	%rax
	call	Cmkunop1
	addq	$24, %rsp
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	pushq	%rax
	call	Cmkunop
	addq	$16, %rsp
	movq	%rax, -40(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L474:
	movq	-40(%rbp), %rax
	jmp	L457
L457:
	addq	$56, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L476,8
	.lcomm	L477,8
	.text
Ccond3:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-72, %rsp
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	$1, -72(%rbp)
	movq	$L476, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L476, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L476, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L476, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L476, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$51, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L476, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L477, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L477, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L477, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L477, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L477, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$51, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L477, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$17, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Ccond2
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	$0, %rax
	movq	%rax, -48(%rbp)
L480:
	movq	CToken, %rax
	pushq	%rax
	movq	$55, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L481
	jmp	L479
L481:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	-72(%rbp), %rax
	orq	%rax, %rax
	jnz	L483
	jmp	L482
L483:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cnotvoid
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -72(%rbp)
L482:
	call	Clabel
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	orq	%rax, %rax
	jz	L485
	jmp	L484
L485:
	call	Clabel
	movq	%rax, -64(%rbp)
L484:
	call	Cscan
	movq	%rax, CToken
	movq	$0, %rax
	pushq	%rax
	leaq	-40(%rbp), %rax
	pushq	%rax
	call	Cexprlist
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	call	Cmkbinop1
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rax
	orq	%rax, %rax
	jz	L487
	jmp	L486
L487:
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
L486:
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Ctypematch
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L489
	jmp	L488
L489:
	.data
L490:
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	's'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	63
	.byte	58
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
	movq	$L490, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L488:
	call	Ccolon
	movq	$17, %rax
	pushq	%rax
	leaq	-40(%rbp), %rax
	pushq	%rax
	call	Ccond2
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$55, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L492
	jmp	L491
L492:
	leaq	-40(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Ctypematch
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L494
	jmp	L493
L494:
	.data
L495:
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	's'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	63
	.byte	58
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
	movq	$L495, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L493:
L491:
	jmp	L480
L479:
	movq	-64(%rbp), %rax
	orq	%rax, %rax
	jnz	L497
	jmp	L496
L497:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$19, %rax
	pushq	%rax
	call	Cmkunop1
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L496:
	movq	-8(%rbp), %rax
	jmp	L478
L478:
	addq	$72, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L498,8
	.lcomm	L499,8
	.text
	.globl	Carithop
Carithop:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L498, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L498, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L499, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	jmp	L502
L503:
	movq	$3, %rax
	jmp	L500
L504:
	movq	$4, %rax
	jmp	L500
L505:
	movq	$13, %rax
	jmp	L500
L506:
	movq	$15, %rax
	jmp	L500
L507:
	movq	$14, %rax
	jmp	L500
L508:
	movq	$1, %rax
	jmp	L500
L509:
	movq	$2, %rax
	jmp	L500
L510:
	movq	$0, %rax
	jmp	L500
L511:
	movq	$5, %rax
	jmp	L500
L512:
	movq	$6, %rax
	jmp	L500
L513:
	.data
L514:
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	58
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'k'
	.byte	'n'
	.byte	'o'
	.byte	'w'
	.byte	'n'
	.byte	32
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'm'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L514, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L500
	jmp	L501
L502:
	movq	$L515, %rdx
	jmp	switch
L515:
	.quad	10
	.quad	25, L503
	.quad	22, L504
	.quad	19, L505
	.quad	24, L506
	.quad	20, L507
	.quad	28, L508
	.quad	23, L509
	.quad	27, L510
	.quad	21, L511
	.quad	26, L512
	.quad	L513
L501:
L500:
	popq	%rbp
	ret
	.data
	.lcomm	L516,8
	.lcomm	L517,8
	.text
Casgmnt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-80, %rsp
	movq	$L516, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L516, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L516, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L516, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L516, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L516, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L516, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L517, %rax
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
	call	Ccond3
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$29, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L520
	incq	%rdx
L520:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L521
	jmp	L519
L521:
	movq	CToken, %rax
	pushq	%rax
	movq	$27, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L522
	incq	%rdx
L522:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L523
	jmp	L519
L523:
	movq	CToken, %rax
	pushq	%rax
	movq	$28, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L524
	incq	%rdx
L524:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L525
	jmp	L519
L525:
	movq	CToken, %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L526
	incq	%rdx
L526:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L527
	jmp	L519
L527:
	movq	CToken, %rax
	pushq	%rax
	movq	$25, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L528
	incq	%rdx
L528:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L529
	jmp	L519
L529:
	movq	CToken, %rax
	pushq	%rax
	movq	$22, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L530
	incq	%rdx
L530:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L531
	jmp	L519
L531:
	movq	CToken, %rax
	pushq	%rax
	movq	$21, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L532
	incq	%rdx
L532:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L533
	jmp	L519
L533:
	movq	CToken, %rax
	pushq	%rax
	movq	$26, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L534
	incq	%rdx
L534:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L535
	jmp	L519
L535:
	movq	CToken, %rax
	pushq	%rax
	movq	$19, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L536
	incq	%rdx
L536:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L537
	jmp	L519
L537:
	movq	CToken, %rax
	pushq	%rax
	movq	$20, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L538
	incq	%rdx
L538:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L539
	jmp	L519
L539:
	movq	CToken, %rax
	pushq	%rax
	movq	$24, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L540
	incq	%rdx
L540:
	movq	%rdx, %rax
L519:
	orq	%rax, %rax
	jnz	L542
	jmp	L541
L542:
	movq	CToken, %rax
	movq	%rax, -80(%rbp)
	call	Cscan
	movq	%rax, CToken
	leaq	-48(%rbp), %rax
	pushq	%rax
	call	Casgmnt
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	pushq	%rax
	movq	$29, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L544
	jmp	L543
L544:
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
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
	call	Ctypematch
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L546
	jmp	L545
L546:
	.data
L547:
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'm'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	'f'
	.byte	'r'
	.byte	'o'
	.byte	'm'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
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
	movq	$L547, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L545:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$3, %rax
	pushq	%rax
	call	Cmkbinop2
	addq	$40, %rsp
	movq	%rax, -8(%rbp)
	jmp	L548
L543:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	leaq	-72(%rbp), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	leaq	-72(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-48(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
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
	movq	-80(%rbp), %rax
	pushq	%rax
	call	Carithop
	addq	$8, %rsp
	pushq	%rax
	call	Cmkop
	addq	$40, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$3, %rax
	pushq	%rax
	call	Cmkbinop2
	addq	$40, %rsp
	movq	%rax, -8(%rbp)
L548:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jz	L550
	jmp	L549
L550:
	.data
L551:
	.byte	'l'
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
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
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'm'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CText, %rax
	pushq	%rax
	movq	$L551, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L549:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L541:
	movq	-8(%rbp), %rax
	jmp	L518
L518:
	addq	$80, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L552,16
	.lcomm	L553,16
	.text
Cexprlist:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$0, -16(%rbp)
	movq	$L552, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L552, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L553, %rax
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
	call	Casgmnt
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L556
	jmp	L555
L556:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
L555:
L558:
	movq	CToken, %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L559
	jmp	L557
L559:
	call	Cscan
	movq	%rax, CToken
	movq	16(%rbp), %rax
	pushq	%rax
	call	Casgmnt
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$12, %rax
	pushq	%rax
	call	Cmkbinop
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	jmp	L558
L557:
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L561
	jmp	L560
L561:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cnotvoid
	addq	$8, %rsp
L560:
	movq	-8(%rbp), %rax
	jmp	L554
L554:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L562,8
	.lcomm	L563,8
	.text
	.globl	Cexpr
Cexpr:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L562, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L562, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L562, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L562, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L562, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L563, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L563, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L563, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L563, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L563, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$1, %rax
	movq	%rax, CNdtop
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cexprlist
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crvalue
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cemittree
	addq	$8, %rsp
L564:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L565,8
	.lcomm	L566,8
	.text
	.globl	Crexpr
Crexpr:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L565, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L565, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L565, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L565, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L565, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L565, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L566, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L566, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L566, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L566, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L566, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L566, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$1, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cexpr
	addq	$16, %rsp
L567:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L568,16
	.lcomm	L569,16
	.text
	.globl	Cconstexpr
Cconstexpr:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L568, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L568, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L569, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$1, %rax
	movq	%rax, CNdtop
	leaq	-32(%rbp), %rax
	pushq	%rax
	call	Cbinexpr
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	leaq	-32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cnotvoid
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfold_reduce
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L572
	incq	%rdx
L572:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L573
	jmp	L571
L573:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$23, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L574
	incq	%rdx
L574:
	movq	%rdx, %rax
L571:
	orq	%rax, %rax
	jnz	L576
	jmp	L575
L576:
	.data
L577:
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	'n'
	.byte	't'
	.byte	32
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
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L577, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$0, %rax
	jmp	L570
L575:
	movq	$24, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	jmp	L570
L570:
	addq	$32, %rsp
	popq	%rbp
	ret

