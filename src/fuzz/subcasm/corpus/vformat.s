	.text
	.data
Cofd:	.quad	0
	.lcomm	Coutf,8
Colen:	.quad	0
Climit:	.quad	0
Cvbuf:	.quad	0
Cerr:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
Citoa:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$0, -8(%rbp)
	movq	$97, -16(%rbp)
	movq	$L1, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
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
	movq	$105, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
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
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L5
	jmp	L4
L5:
	movq	32(%rbp), %rax
	negq	%rax
	movq	%rax, 32(%rbp)
	movq	$65, %rax
	movq	%rax, -16(%rbp)
L4:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L7
	jmp	L6
L7:
	movq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	negq	%rax
	movq	%rax, 24(%rbp)
L6:
	decq	16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L9:
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jz	L11
	jmp	L10
L11:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L12
	incq	%rdx
L12:
	movq	%rdx, %rax
L10:
	orq	%rax, %rax
	jnz	L13
	jmp	L8
L13:
	decq	16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rdx, %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rdx, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L15
	jmp	L14
L15:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
L14:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	movq	%rax, 24(%rbp)
	jmp	L9
L8:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jnz	L17
	jmp	L16
L17:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$45, %rax
	popq	%rdx
	movb	%al, (%rdx)
L16:
	movq	16(%rbp), %rax
	jmp	L3
L3:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L18,8
	.lcomm	L19,8
	.text
Cptoa:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L18, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$3, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	decq	16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L21:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L25
	jmp	L23
L25:
	jmp	L22
L24:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L21
L22:
	movq	$15, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -16(%rbp)
	decq	16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L27
	jmp	L26
L27:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$39, %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
L26:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, 24(%rbp)
	jmp	L24
L23:
	movq	16(%rbp), %rax
	jmp	L20
L20:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L28,8
	.lcomm	L29,8
	.text
Cappend:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L28, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L28, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L32
	jmp	L31
L32:
	jmp	L30
	jmp	L33
L31:
	movq	Cofd, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L35
	jmp	L34
L35:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	Cofd, %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L37
	jmp	L36
L37:
	movq	$1, %rax
	movq	%rax, Cerr
L36:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	Colen, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, Colen
	jmp	L38
L34:
	movq	Coutf, %rax
	orq	%rax, %rax
	jnz	L40
	jmp	L39
L40:
	movq	Coutf, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_fwrite
	addq	$24, %rsp
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L42
	jmp	L41
L42:
	movq	$1, %rax
	movq	%rax, Cerr
L41:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	Colen, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, Colen
	jmp	L43
L39:
	movq	Climit, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L45
	jmp	L44
L45:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	Colen, %rax
	pushq	%rax
	movq	Cvbuf, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	Colen, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, Colen
	movq	Colen, %rax
	pushq	%rax
	movq	Cvbuf, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L46
L44:
	movq	Climit, %rax
	pushq	%rax
	movq	Colen, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L49
	jmp	L47
L49:
	movq	24(%rbp), %rax
	jmp	L48
L47:
	movq	-8(%rbp), %rax
L48:
	movq	%rax, 24(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	Colen, %rax
	pushq	%rax
	movq	Cvbuf, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	Colen, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, Colen
	movq	Colen, %rax
	pushq	%rax
	movq	Cvbuf, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L46:
L43:
L38:
L33:
L30:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L50,16
	.lcomm	L51,16
	.text
	.globl	C_vformat
C_vformat:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-336, %rsp
	movq	$0, -336(%rbp)
	movq	$L50, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L51, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	$256, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -272(%rbp)
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
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
	je	L54
	jmp	L53
L54:
	movq	$0, %rax
	movq	%rax, Coutf
	movq	$-1, %rax
	movq	%rax, Cofd
	movq	32(%rbp), %rax
	movq	%rax, Cvbuf
	movq	Cvbuf, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L55
L53:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L57
	jmp	L56
L57:
	movq	$0, %rax
	movq	%rax, Coutf
	movq	32(%rbp), %rax
	movq	%rax, Cofd
	movq	$0, %rax
	movq	%rax, Cerr
	jmp	L58
L56:
	movq	32(%rbp), %rax
	movq	%rax, Coutf
	movq	$-1, %rax
	movq	%rax, Cofd
	movq	$0, %rax
	movq	%rax, Cerr
L58:
L55:
	movq	$0, %rax
	movq	%rax, Colen
	movq	24(%rbp), %rax
	movq	%rax, Climit
L60:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L61
	jmp	L59
L61:
	movq	$0, %rax
	movq	%rax, -288(%rbp)
	movq	%rax, -280(%rbp)
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L62:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L62, %rax
	movq	%rax, -328(%rbp)
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$37, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L64
	jmp	L63
L64:
	movq	40(%rbp), %rax
	incq	40(%rbp)
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	movq	%rax, -296(%rbp)
L66:
	.data
L68:
	.byte	45
	.byte	43
	.byte	'0'
	.byte	32
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L69
	jmp	L67
L69:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$L68, %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
L67:
	orq	%rax, %rax
	jnz	L70
	jmp	L65
L70:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$45, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L72
	jmp	L71
L72:
	movq	$1, %rax
	movq	%rax, -280(%rbp)
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	40(%rbp), %rax
	incq	40(%rbp)
	jmp	L73
L71:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L75
	jmp	L74
L75:
	movq	-280(%rbp), %rax
	orq	%rax, %rax
	jz	L77
	jmp	L76
L77:
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rdx
	movb	%al, (%rdx)
L76:
	movq	40(%rbp), %rax
	incq	40(%rbp)
	jmp	L78
L74:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L80
	jmp	L79
L80:
	movq	$1, %rax
	movq	%rax, -296(%rbp)
	movq	40(%rbp), %rax
	incq	40(%rbp)
	jmp	L81
L79:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$43, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L83
	jmp	L82
L83:
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$43, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	40(%rbp), %rax
	incq	40(%rbp)
	jmp	L84
L82:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L86
	jmp	L85
L86:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jz	L88
	jmp	L87
L88:
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rdx
	movb	%al, (%rdx)
L87:
	movq	40(%rbp), %rax
	incq	40(%rbp)
L85:
L84:
L81:
L78:
L73:
	jmp	L66
L65:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$42, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L90
	jmp	L89
L90:
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	(%rax), %rax
	movq	%rax, -288(%rbp)
	movq	40(%rbp), %rax
	incq	40(%rbp)
	jmp	L91
L89:
L93:
	movq	40(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L94
	jmp	L92
L94:
	movq	$10, %rax
	pushq	%rax
	movq	-288(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	incq	40(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -288(%rbp)
	jmp	L93
L92:
L91:
	movq	40(%rbp), %rax
	incq	40(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L96
L97:
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	movq	%rax, -264(%rbp)
	movq	-336(%rbp), %rax
	incq	-336(%rbp)
	jmp	L95
L98:
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	(%rax), %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	pushq	%rax
	call	Citoa
	addq	$32, %rsp
	movq	%rax, -264(%rbp)
	movq	-336(%rbp), %rax
	incq	-336(%rbp)
	jmp	L95
L99:
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	movq	Colen, %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	pushq	%rax
	call	Citoa
	addq	$32, %rsp
	movq	%rax, -264(%rbp)
	jmp	L95
L100:
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	(%rax), %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	pushq	%rax
	call	Citoa
	addq	$32, %rsp
	movq	%rax, -264(%rbp)
	movq	-296(%rbp), %rax
	orq	%rax, %rax
	jnz	L102
	jmp	L101
L102:
	.data
L103:
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L103, %rax
	movq	%rax, -328(%rbp)
L101:
	movq	-336(%rbp), %rax
	incq	-336(%rbp)
	jmp	L95
L104:
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	(%rax), %rax
	movq	%rax, -264(%rbp)
	movq	-264(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L106
	jmp	L105
L106:
	.data
L107:
	.byte	40
	.byte	'N'
	.byte	'U'
	.byte	'L'
	.byte	'L'
	.byte	41
	.byte	0
	.byte	0
	.text
	movq	$L107, %rax
	movq	%rax, -264(%rbp)
L105:
	movq	-336(%rbp), %rax
	incq	-336(%rbp)
	jmp	L95
L108:
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	(%rax), %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	pushq	%rax
	call	Cptoa
	addq	$16, %rsp
	movq	%rax, -264(%rbp)
	.data
L109:
	.byte	'0'
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L109, %rax
	movq	%rax, -328(%rbp)
	movq	$18, %rax
	movq	%rax, -288(%rbp)
	leaq	-312(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-336(%rbp), %rax
	incq	-336(%rbp)
	jmp	L95
L110:
L111:
	movq	$-1, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$88, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L114
	jmp	L112
L114:
	movq	$-16, %rax
	jmp	L113
L112:
	movq	$16, %rax
L113:
	movq	%rax, -304(%rbp)
	leaq	-320(%rbp), %rax
	pushq	%rax
	movq	-304(%rbp), %rax
	pushq	%rax
	movq	48(%rbp), %rax
	addq	$8, 48(%rbp)
	movq	(%rax), %rax
	pushq	%rax
	movq	-272(%rbp), %rax
	pushq	%rax
	call	Citoa
	addq	$32, %rsp
	movq	%rax, -264(%rbp)
	movq	-296(%rbp), %rax
	orq	%rax, %rax
	jnz	L116
	jmp	L115
L116:
	.data
L119:
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L120:
	.byte	'0'
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-304(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L121
	jmp	L117
L121:
	movq	$L119, %rax
	jmp	L118
L117:
	movq	$L120, %rax
L118:
	movq	%rax, -328(%rbp)
L115:
	movq	-336(%rbp), %rax
	incq	-336(%rbp)
	jmp	L95
L122:
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	$-1, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	movq	%rax, -264(%rbp)
	jmp	L95
	jmp	L95
L96:
	movq	$L123, %rdx
	jmp	switch
L123:
	.quad	8
	.quad	99, L97
	.quad	100, L98
	.quad	110, L99
	.quad	111, L100
	.quad	115, L104
	.quad	112, L108
	.quad	120, L110
	.quad	88, L111
	.quad	L122
L95:
	jmp	L124
L63:
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	incq	40(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	leaq	-256(%rbp), %rax
	movq	%rax, -264(%rbp)
L124:
	movq	-264(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-320(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -304(%rbp)
	leaq	-312(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L126
	jmp	L125
L126:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L128
	jmp	L127
L128:
	movq	$1, %rax
	pushq	%rax
	leaq	-320(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
L127:
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
	.data
L129:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L129, %rax
	movq	%rax, -328(%rbp)
L125:
L131:
	movq	-280(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L133
	jmp	L132
L133:
	movq	-288(%rbp), %rax
	decq	-288(%rbp)
	pushq	%rax
	movq	-304(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L134
	incq	%rdx
L134:
	movq	%rdx, %rax
L132:
	orq	%rax, %rax
	jnz	L135
	jmp	L130
L135:
	movq	$1, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
	jmp	L131
L130:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L137
	jmp	L136
L137:
	leaq	-312(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$48, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L138
	incq	%rdx
L138:
	movq	%rdx, %rax
L136:
	orq	%rax, %rax
	jnz	L140
	jmp	L139
L140:
	movq	$1, %rax
	pushq	%rax
	leaq	-320(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
L139:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jz	L142
	jmp	L141
L142:
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-328(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
L141:
	movq	-264(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-264(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
L144:
	movq	-280(%rbp), %rax
	orq	%rax, %rax
	jnz	L146
	jmp	L145
L146:
	movq	-288(%rbp), %rax
	decq	-288(%rbp)
	pushq	%rax
	movq	-304(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L147
	incq	%rdx
L147:
	movq	%rdx, %rax
L145:
	orq	%rax, %rax
	jnz	L148
	jmp	L143
L148:
	movq	$1, %rax
	pushq	%rax
	leaq	-312(%rbp), %rax
	pushq	%rax
	call	Cappend
	addq	$16, %rsp
	jmp	L144
L143:
	movq	Coutf, %rax
	orq	%rax, %rax
	jnz	L150
	jmp	L149
L150:
	movq	Cerr, %rax
L149:
	orq	%rax, %rax
	jnz	L152
	jmp	L151
L152:
	jmp	L59
L151:
	jmp	L60
L59:
	movq	-336(%rbp), %rax
	jmp	L52
L52:
	addq	$336, %rsp
	popq	%rbp
	ret

