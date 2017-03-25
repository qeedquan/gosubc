	.text
	.data
	.lcomm	L1,16
	.lcomm	L2,16
	.text
	.globl	Cfindglob
Cfindglob:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
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
	movq	$105, %rax
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
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
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
	movq	$98, %rax
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
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
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
	movq	$98, %rax
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
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L4:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	CGlobs, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L8
	jmp	L6
L8:
	jmp	L5
L7:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L4
L5:
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
	je	L10
	incq	%rdx
L10:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L11
	jmp	L9
L11:
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$7, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L12
	incq	%rdx
L12:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L13
	jmp	L9
L13:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L14
	incq	%rdx
L14:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L15
	jmp	L9
L15:
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L9:
	orq	%rax, %rax
	jnz	L17
	jmp	L16
L17:
	movq	-8(%rbp), %rax
	jmp	L3
L16:
	jmp	L7
L6:
	movq	$0, %rax
	jmp	L3
L3:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L18,8
	.lcomm	L19,8
	.text
	.globl	Cfindloc
Cfindloc:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L18, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	CLocs, %rax
	movq	%rax, -8(%rbp)
L21:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
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
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$7, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L27
	incq	%rdx
L27:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L28
	jmp	L26
L28:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L29
	incq	%rdx
L29:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L30
	jmp	L26
L30:
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L26:
	orq	%rax, %rax
	jnz	L32
	jmp	L31
L32:
	movq	-8(%rbp), %rax
	jmp	L20
L31:
	jmp	L24
L23:
	movq	$0, %rax
	jmp	L20
L20:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L33,8
	.lcomm	L34,8
	.text
	.globl	Cfindsym
Cfindsym:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L33, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L34, %rax
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
	call	Cfindloc
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L37
	jmp	L36
L37:
	movq	-8(%rbp), %rax
	jmp	L35
L36:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfindglob
	addq	$8, %rsp
	jmp	L35
L35:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L38,8
	.lcomm	L39,8
	.text
	.globl	Cfindmac
Cfindmac:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L38, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
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
L41:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	CGlobs, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L45
	jmp	L43
L45:
	jmp	L42
L44:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L41
L42:
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
	jne	L47
	incq	%rdx
L47:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L48
	jmp	L46
L48:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L49
	incq	%rdx
L49:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L50
	jmp	L46
L50:
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L46:
	orq	%rax, %rax
	jnz	L52
	jmp	L51
L52:
	movq	-8(%rbp), %rax
	jmp	L40
L51:
	jmp	L44
L43:
	movq	$0, %rax
	jmp	L40
L40:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L53,16
	.lcomm	L54,16
	.text
	.globl	Cfindstruct
Cfindstruct:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L53, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CLocs, %rax
	movq	%rax, -8(%rbp)
L56:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L60
	jmp	L58
L60:
	jmp	L57
L59:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L56
L57:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$6, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L62
	incq	%rdx
L62:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L63
	jmp	L61
L63:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L64
	incq	%rdx
L64:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L65
	jmp	L61
L65:
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L61:
	orq	%rax, %rax
	jnz	L67
	jmp	L66
L67:
	movq	-8(%rbp), %rax
	jmp	L55
L66:
	jmp	L59
L58:
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L68:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	CGlobs, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L72
	jmp	L70
L72:
	jmp	L69
L71:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L68
L69:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$6, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L74
	incq	%rdx
L74:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L75
	jmp	L73
L75:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L76
	incq	%rdx
L76:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L77
	jmp	L73
L77:
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L73:
	orq	%rax, %rax
	jnz	L79
	jmp	L78
L79:
	movq	-8(%rbp), %rax
	jmp	L55
L78:
	jmp	L71
L70:
	movq	$0, %rax
	jmp	L55
L55:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L80,8
	.lcomm	L81,8
	.text
	.globl	Cfindmem
Cfindmem:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L80, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	incq	16(%rbp)
L84:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	CGlobs, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L88
	incq	%rdx
L88:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L89
	jmp	L85
L89:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	CLocs, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L90
	incq	%rdx
L90:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L91
	jmp	L86
L91:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L92
	incq	%rdx
L92:
	movq	%rdx, %rax
L86:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L85:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L93
	jmp	L87
L93:
	movq	$CStcls, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$7, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L94
	incq	%rdx
L94:
	movq	%rdx, %rax
L87:
	orq	%rax, %rax
	jnz	L95
	jmp	L83
L95:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L97
	incq	%rdx
L97:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L98
	jmp	L96
L98:
	movq	$CNames, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L96:
	orq	%rax, %rax
	jnz	L100
	jmp	L99
L100:
	movq	16(%rbp), %rax
	jmp	L82
L99:
	movq	16(%rbp), %rax
	incq	16(%rbp)
	jmp	L84
L83:
	movq	$0, %rax
	jmp	L82
L82:
	popq	%rbp
	ret
	.data
	.lcomm	L101,8
	.lcomm	L102,8
	.text
	.globl	Cnewglob
Cnewglob:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L101, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CGlobs, %rax
	incq	CGlobs
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	CLocs, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L105
	jmp	L104
L105:
	.data
L106:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'g'
	.byte	'l'
	.byte	'o'
	.byte	'b'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	's'
	.byte	0
	.text
	movq	$L106, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L104:
	movq	-8(%rbp), %rax
	jmp	L103
L103:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L107,8
	.lcomm	L108,8
	.text
	.globl	Cnewloc
Cnewloc:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L107, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	decq	CLocs
	movq	CLocs, %rax
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	CGlobs, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L111
	jmp	L110
L111:
	.data
L112:
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
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$L112, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L110:
	movq	-8(%rbp), %rax
	jmp	L109
L109:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L113,8
	.lcomm	L114,8
	.text
	.globl	Cgalloc
Cgalloc:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L113, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
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
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	CNbot, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	CNtop, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L117
	jmp	L116
L117:
	.data
L118:
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	's'
	.byte	'p'
	.byte	'a'
	.byte	'c'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L118, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L116:
	movq	CNbot, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	CNbot, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, CNbot
	movq	$7, %rax
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L120
	jmp	L119
L120:
L122:
	movq	$CNlist, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L123
	jmp	L121
L123:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L122
L121:
L119:
	movq	$CNlist, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	jmp	L115
L115:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L124,16
	.lcomm	L125,16
	.text
	.globl	Cglobname
Cglobname:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L124, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L124, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L125, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cgalloc
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	jmp	L126
L126:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L127,8
	.lcomm	L128,8
	.text
	.globl	Clocname
Clocname:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L127, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L127, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L128, %rax
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
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	CNbot, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	CNtop, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L131
	jmp	L130
L131:
	.data
L132:
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	's'
	.byte	'p'
	.byte	'a'
	.byte	'c'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L132, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L130:
	movq	CNtop, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, CNtop
	movq	CNtop, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$CNlist, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	$CNlist, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	jmp	L129
L129:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L133,8
	.lcomm	L134,8
	.text
Cdefglob:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L133, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
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
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L137
	incq	%rdx
L137:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L138
	jmp	L136
L138:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L139
	incq	%rdx
L139:
	movq	%rdx, %rax
L136:
	orq	%rax, %rax
	jnz	L141
	jmp	L140
L141:
	jmp	L135
L140:
	call	Cgendata
	movq	$3, %rax
	pushq	%rax
	movq	56(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L142
	incq	%rdx
L142:
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	56(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L144
	jmp	L143
L144:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgenpublic
	addq	$8, %rsp
L143:
	movq	64(%rbp), %rax
	orq	%rax, %rax
	jnz	L146
	jmp	L145
L146:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L147
	incq	%rdx
L147:
	movq	%rdx, %rax
L145:
	orq	%rax, %rax
	jnz	L149
	jmp	L148
L149:
	jmp	L135
L148:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L151
	incq	%rdx
L151:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L152
	jmp	L150
L152:
	movq	$57344, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L150:
	orq	%rax, %rax
	jnz	L154
	jmp	L153
L154:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgenname
	addq	$8, %rsp
L153:
	movq	$57344, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L156
	jmp	L155
L156:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L158
	jmp	L157
L158:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgsym
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L159
L157:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgsym
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
L159:
	jmp	L160
L155:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L162
	jmp	L161
L162:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L164
	jmp	L163
L164:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgsym
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L165
L163:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cgendefb
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cgenalign
	addq	$8, %rsp
L165:
	jmp	L166
L161:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L168
	jmp	L167
L168:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L170
	jmp	L169
L170:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgsym
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L171
L169:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cgendefw
	addq	$8, %rsp
L171:
	jmp	L172
L167:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L174
	jmp	L173
L174:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cgsym
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L175
L173:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cgendefp
	addq	$8, %rsp
L175:
L172:
L166:
L160:
L135:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L176,16
	.lcomm	L177,16
	.text
	.globl	Credeclare
Credeclare:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L176, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L176, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L177, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	jmp	L180
L181:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L183
	incq	%rdx
L183:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L184
	jmp	L182
L184:
	movq	$2, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L185
	incq	%rdx
L185:
	movq	%rdx, %rax
L182:
	orq	%rax, %rax
	jnz	L187
	jmp	L186
L187:
	.data
L188:
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	'e'
	.byte	'c'
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'c'
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
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L188, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L186:
	movq	32(%rbp), %rax
	jmp	L178
L189:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L191
	jmp	L190
L191:
	movq	$1, %rax
	jmp	L178
L190:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L193
	jmp	L192
L193:
	.data
L194:
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	'e'
	.byte	'c'
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'c'
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
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L194, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$1, %rax
	jmp	L178
L192:
	jmp	L179
L195:
	movq	$3, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L197
	incq	%rdx
L197:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L198
	jmp	L196
L198:
	movq	$6, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L199
	incq	%rdx
L199:
	movq	%rdx, %rax
L196:
	orq	%rax, %rax
	jnz	L201
	jmp	L200
L201:
	.data
L202:
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'c'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	'e'
	.byte	'c'
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	'e'
	.byte	'r'
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
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L202, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L200:
	movq	32(%rbp), %rax
	jmp	L178
L203:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L205
	jmp	L204
L205:
	movq	$3, %rax
	jmp	L178
L204:
	movq	$3, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L207
	jmp	L206
L207:
	.data
L208:
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'c'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	'e'
	.byte	'c'
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	'e'
	.byte	'r'
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
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L208, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$3, %rax
	jmp	L178
L206:
	jmp	L179
	jmp	L179
L180:
	movq	$L209, %rdx
	jmp	switch
L209:
	.quad	4
	.quad	2, L181
	.quad	1, L189
	.quad	6, L195
	.quad	3, L203
	.quad	L179
L179:
	.data
L210:
	.byte	'r'
	.byte	'e'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'i'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
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
	movq	$L210, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	32(%rbp), %rax
	jmp	L178
L178:
	popq	%rbp
	ret
	.data
	.lcomm	L211,8
	.lcomm	L212,8
	.text
	.globl	Caddglob
Caddglob:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L211, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L211, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L212, %rax
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
	call	Cfindglob
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L215
	jmp	L214
L215:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Credeclare
	addq	$24, %rsp
	movq	%rax, 40(%rbp)
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L217
	jmp	L216
L217:
	movq	$CMtext, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, 64(%rbp)
L216:
L214:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L219
	jmp	L218
L219:
	call	Cnewglob
	movq	%rax, -8(%rbp)
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cglobname
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L220
L218:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
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
	jne	L222
	incq	%rdx
L222:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L223
	jmp	L221
L223:
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
	jne	L224
	incq	%rdx
L224:
	movq	%rdx, %rax
L221:
	orq	%rax, %rax
	jnz	L226
	jmp	L225
L226:
	movq	$CPrims, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L228
	incq	%rdx
L228:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L229
	jmp	L227
L229:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	32(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L230
	incq	%rdx
L230:
	movq	%rdx, %rax
L227:
	orq	%rax, %rax
	jnz	L232
	jmp	L231
L232:
	.data
L233:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L233, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L231:
L225:
L220:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L235
	incq	%rdx
L235:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L236
	jmp	L234
L236:
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L237
	incq	%rdx
L237:
	movq	%rdx, %rax
L234:
	orq	%rax, %rax
	jnz	L239
	jmp	L238
L239:
	movq	72(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	movq	56(%rbp), %rax
	pushq	%rax
	movq	48(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdefglob
	addq	$56, %rsp
L238:
	movq	$CPrims, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$CSizes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	48(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CVals, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	56(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CMtext, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	64(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L213
L213:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L240,8
	.lcomm	L241,8
	.text
Cdefloc:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L240, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L240, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L240, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L240, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L240, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L240, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L240, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L241, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cgendata
	movq	$2, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L244
	incq	%rdx
L244:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L245
	jmp	L243
L245:
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L243:
	orq	%rax, %rax
	jnz	L247
	jmp	L246
L247:
	movq	40(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
L246:
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L249
	jmp	L248
L249:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L251
	jmp	L250
L251:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	call	Clabname
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L252
L250:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cobjsize
	addq	$24, %rsp
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	call	Clabname
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
L252:
	jmp	L253
L248:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L255
	jmp	L254
L255:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L257
	jmp	L256
L257:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	call	Clabname
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L258
L256:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cgendefb
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cgenalign
	addq	$8, %rsp
L258:
	jmp	L259
L254:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L261
	jmp	L260
L261:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L263
	jmp	L262
L263:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	call	Clabname
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L264
L262:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cgendefw
	addq	$8, %rsp
L264:
	jmp	L265
L260:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L267
	jmp	L266
L267:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	pushq	%rax
	call	Clabname
	addq	$8, %rsp
	pushq	%rax
	call	Cgenbss
	addq	$24, %rsp
	jmp	L268
L266:
	movq	48(%rbp), %rax
	pushq	%rax
	call	Cgendefp
	addq	$8, %rsp
L268:
L265:
L259:
L253:
L242:
	popq	%rbp
	ret
	.data
	.lcomm	L269,8
	.lcomm	L270,8
	.text
	.globl	Caddloc
Caddloc:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L269, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L270, %rax
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
	call	Cfindloc
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L273
	jmp	L272
L273:
	.data
L274:
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
	.byte	32
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
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L274, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L272:
	call	Cnewloc
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L276
	jmp	L275
L276:
	movq	64(%rbp), %rax
	pushq	%rax
	movq	56(%rbp), %rax
	pushq	%rax
	movq	48(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cdefloc
	addq	$40, %rsp
L275:
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Clocname
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CPrims, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$CSizes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	48(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$CVals, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	56(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L271
L271:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L277,8
	.lcomm	L278,8
	.text
	.globl	Cclrlocs
Cclrlocs:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L277, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L277, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$16384, %rax
	movq	%rax, CNtop
	movq	$1024, %rax
	movq	%rax, CLocs
L279:
	popq	%rbp
	ret
	.data
	.lcomm	L280,8
	.lcomm	L281,8
	.text
	.globl	Cobjsize
Cobjsize:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$0, -8(%rbp)
	movq	$L280, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L280, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$122, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L281, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L284
	jmp	L283
L284:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	L285
L283:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L287
	jmp	L286
L287:
	movq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	L288
L286:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L290
	incq	%rdx
L290:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L291
	jmp	L289
L291:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L292
	incq	%rdx
L292:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L293
	jmp	L289
L293:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L294
	incq	%rdx
L294:
	movq	%rdx, %rax
L289:
	orq	%rax, %rax
	jnz	L296
	jmp	L295
L296:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	L297
L295:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$6, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L299
	incq	%rdx
L299:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L300
	jmp	L298
L300:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L301
	incq	%rdx
L301:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L302
	jmp	L298
L302:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L303
	incq	%rdx
L303:
	movq	%rdx, %rax
L298:
	orq	%rax, %rax
	jnz	L305
	jmp	L304
L305:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	L306
L304:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$24576, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L308
	incq	%rdx
L308:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L309
	jmp	L307
L309:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$32768, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L310
	incq	%rdx
L310:
	movq	%rdx, %rax
L307:
	orq	%rax, %rax
	jnz	L312
	jmp	L311
L312:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	L313
L311:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$40960, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L315
	incq	%rdx
L315:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L316
	jmp	L314
L316:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$49152, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L317
	incq	%rdx
L317:
	movq	%rdx, %rax
L314:
	orq	%rax, %rax
	jnz	L319
	jmp	L318
L319:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	L320
L318:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$8192, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L322
	incq	%rdx
L322:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L323
	jmp	L321
L323:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$16384, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L324
	incq	%rdx
L324:
	movq	%rdx, %rax
L321:
	orq	%rax, %rax
	jnz	L326
	jmp	L325
L326:
	movq	$CSizes, %rax
	pushq	%rax
	movq	$-57345, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	L327
L325:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L329
	jmp	L328
L329:
	movq	$8, %rax
	movq	%rax, -8(%rbp)
L328:
L327:
L320:
L313:
L306:
L297:
L288:
L285:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L331
	incq	%rdx
L331:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L332
	jmp	L330
L332:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L333
	incq	%rdx
L333:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L334
	jmp	L330
L334:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L335
	incq	%rdx
L335:
	movq	%rdx, %rax
L330:
	orq	%rax, %rax
	jnz	L337
	jmp	L336
L337:
	movq	$-1, %rax
	jmp	L282
L336:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L339
	jmp	L338
L339:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	movq	%rax, -8(%rbp)
L338:
	movq	-8(%rbp), %rax
	jmp	L282
L282:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L340,16
	.lcomm	L341,16
	.text
Ctypename:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L340, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L340, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L341, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$57344, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	andq	%rcx, %rax
	jmp	L344
L345:
	.data
L346:
	.byte	'S'
	.byte	'T'
	.byte	'R'
	.byte	'U'
	.byte	'C'
	.byte	'T'
	.byte	0
	.byte	0
	.text
	movq	$L346, %rax
	jmp	L342
L347:
	.data
L348:
	.byte	'S'
	.byte	'T'
	.byte	'C'
	.byte	'T'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L348, %rax
	jmp	L342
L349:
	.data
L350:
	.byte	'S'
	.byte	'T'
	.byte	'C'
	.byte	'T'
	.byte	42
	.byte	42
	.byte	0
	.byte	0
	.text
	movq	$L350, %rax
	jmp	L342
L351:
	.data
L352:
	.byte	'U'
	.byte	'N'
	.byte	'I'
	.byte	'O'
	.byte	'N'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L352, %rax
	jmp	L342
L353:
	.data
L354:
	.byte	'U'
	.byte	'N'
	.byte	'I'
	.byte	'O'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L354, %rax
	jmp	L342
L355:
	.data
L356:
	.byte	'U'
	.byte	'N'
	.byte	'I'
	.byte	'O'
	.byte	42
	.byte	42
	.byte	0
	.byte	0
	.text
	movq	$L356, %rax
	jmp	L342
	jmp	L343
L344:
	movq	$L357, %rdx
	jmp	switch
L357:
	.quad	6
	.quad	8192, L345
	.quad	24576, L347
	.quad	32768, L349
	.quad	16384, L351
	.quad	40960, L353
	.quad	49152, L355
	.quad	L343
L343:
	.data
L360:
	.byte	'I'
	.byte	'N'
	.byte	'T'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L362:
	.byte	'C'
	.byte	'H'
	.byte	'A'
	.byte	'R'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L364:
	.byte	'I'
	.byte	'N'
	.byte	'T'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L366:
	.byte	'C'
	.byte	'H'
	.byte	'A'
	.byte	'R'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
L368:
	.byte	'V'
	.byte	'O'
	.byte	'I'
	.byte	'D'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
L370:
	.byte	'F'
	.byte	'U'
	.byte	'N'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L372:
	.byte	'I'
	.byte	'N'
	.byte	'T'
	.byte	42
	.byte	42
	.byte	0
	.byte	0
	.byte	0
L374:
	.byte	'C'
	.byte	'H'
	.byte	'A'
	.byte	'R'
	.byte	42
	.byte	42
	.byte	0
	.byte	0
L376:
	.byte	'V'
	.byte	'O'
	.byte	'I'
	.byte	'D'
	.byte	42
	.byte	42
	.byte	0
	.byte	0
L378:
	.byte	'V'
	.byte	'O'
	.byte	'I'
	.byte	'D'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L379:
	.byte	'n'
	.byte	47
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L380
	jmp	L358
L380:
	movq	$L360, %rax
	jmp	L359
L358:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L381
	jmp	L361
L381:
	movq	$L362, %rax
	jmp	L359
L361:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L382
	jmp	L363
L382:
	movq	$L364, %rax
	jmp	L359
L363:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L383
	jmp	L365
L383:
	movq	$L366, %rax
	jmp	L359
L365:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L384
	jmp	L367
L384:
	movq	$L368, %rax
	jmp	L359
L367:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L385
	jmp	L369
L385:
	movq	$L370, %rax
	jmp	L359
L369:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L386
	jmp	L371
L386:
	movq	$L372, %rax
	jmp	L359
L371:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L387
	jmp	L373
L387:
	movq	$L374, %rax
	jmp	L359
L373:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L388
	jmp	L375
L388:
	movq	$L376, %rax
	jmp	L359
L375:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L389
	jmp	L377
L389:
	movq	$L378, %rax
	jmp	L359
L377:
	movq	$L379, %rax
L359:
	jmp	L342
L342:
	popq	%rbp
	ret
	.data
	.lcomm	L390,16
	.lcomm	L391,16
	.text
	.globl	Cdumpsyms
Cdumpsyms:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L390, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L390, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L391, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L393:
	.byte	10
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	61
	.byte	32
	.byte	37
	.byte	's'
	.byte	37
	.byte	's'
	.byte	32
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
	.byte	0
	.text
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L393, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	.data
L394:
	.byte	'P'
	.byte	'R'
	.byte	'I'
	.byte	'M'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'T'
	.byte	'Y'
	.byte	'P'
	.byte	'E'
	.byte	32
	.byte	32
	.byte	'S'
	.byte	'T'
	.byte	'C'
	.byte	'L'
	.byte	'S'
	.byte	32
	.byte	32
	.byte	32
	.byte	'S'
	.byte	'I'
	.byte	'Z'
	.byte	'E'
	.byte	32
	.byte	32
	.byte	'V'
	.byte	'A'
	.byte	'L'
	.byte	'U'
	.byte	'E'
	.byte	32
	.byte	32
	.byte	'N'
	.byte	'A'
	.byte	'M'
	.byte	'E'
	.byte	32
	.byte	91
	.byte	'M'
	.byte	'V'
	.byte	'A'
	.byte	'L'
	.byte	93
	.byte	47
	.byte	40
	.byte	'S'
	.byte	'I'
	.byte	'G'
	.byte	41
	.byte	10
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	32
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	32
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	32
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	32
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	32
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L394, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	32(%rbp), %rax
	movq	%rax, -8(%rbp)
L395:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L399
	jmp	L397
L399:
	jmp	L396
L398:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L395
L396:
	.data
L400:
	.byte	37
	.byte	45
	.byte	'6'
	.byte	's'
	.byte	32
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	32
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	32
	.byte	32
	.byte	37
	.byte	'5'
	.byte	'd'
	.byte	32
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L403:
	.byte	'V'
	.byte	'A'
	.byte	'R'
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L405:
	.byte	'A'
	.byte	'R'
	.byte	'R'
	.byte	'Y'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L407:
	.byte	'F'
	.byte	'U'
	.byte	'N'
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L409:
	.byte	'C'
	.byte	'N'
	.byte	'S'
	.byte	'T'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L411:
	.byte	'M'
	.byte	'A'
	.byte	'C'
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L413:
	.byte	'S'
	.byte	'T'
	.byte	'C'
	.byte	'T'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L414:
	.byte	'n'
	.byte	47
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L417:
	.byte	'P'
	.byte	'U'
	.byte	'B'
	.byte	'L'
	.byte	'C'
	.byte	0
	.byte	0
	.byte	0
L419:
	.byte	'E'
	.byte	'X'
	.byte	'T'
	.byte	'R'
	.byte	'N'
	.byte	0
	.byte	0
	.byte	0
L421:
	.byte	'S'
	.byte	'T'
	.byte	'A'
	.byte	'T'
	.byte	'C'
	.byte	0
	.byte	0
	.byte	0
L423:
	.byte	'S'
	.byte	'T'
	.byte	'A'
	.byte	'T'
	.byte	'P'
	.byte	0
	.byte	0
	.byte	0
L425:
	.byte	'L'
	.byte	'S'
	.byte	'T'
	.byte	'A'
	.byte	'T'
	.byte	0
	.byte	0
	.byte	0
L427:
	.byte	'A'
	.byte	'U'
	.byte	'T'
	.byte	'O'
	.byte	32
	.byte	0
	.byte	0
	.byte	0
L429:
	.byte	'M'
	.byte	'E'
	.byte	'M'
	.byte	'B'
	.byte	'R'
	.byte	0
	.byte	0
	.byte	0
L430:
	.byte	'n'
	.byte	47
	.byte	'a'
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CNames, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$CVals, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$CSizes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L431
	jmp	L415
L431:
	movq	$L417, %rax
	jmp	L416
L415:
	movq	$CStcls, %rax
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
	je	L432
	jmp	L418
L432:
	movq	$L419, %rax
	jmp	L416
L418:
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L433
	jmp	L420
L433:
	movq	$L421, %rax
	jmp	L416
L420:
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L434
	jmp	L422
L434:
	movq	$L423, %rax
	jmp	L416
L422:
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L435
	jmp	L424
L435:
	movq	$L425, %rax
	jmp	L416
L424:
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L436
	jmp	L426
L436:
	movq	$L427, %rax
	jmp	L416
L426:
	movq	$CStcls, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L437
	jmp	L428
L437:
	movq	$L429, %rax
	jmp	L416
L428:
	movq	$L430, %rax
L416:
	pushq	%rax
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L438
	jmp	L401
L438:
	movq	$L403, %rax
	jmp	L402
L401:
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
	je	L439
	jmp	L404
L439:
	movq	$L405, %rax
	jmp	L402
L404:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L440
	jmp	L406
L440:
	movq	$L407, %rax
	jmp	L402
L406:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L441
	jmp	L408
L441:
	movq	$L409, %rax
	jmp	L402
L408:
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
	popq	%rcx
	cmpq	%rax, %rcx
	je	L442
	jmp	L410
L442:
	movq	$L411, %rax
	jmp	L402
L410:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L443
	jmp	L412
L443:
	movq	$L413, %rax
	jmp	L402
L412:
	movq	$L414, %rax
L402:
	pushq	%rax
	movq	$CPrims, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ctypename
	addq	$8, %rsp
	pushq	%rax
	movq	$L400, %rax
	pushq	%rax
	call	Cprintf
	addq	$56, %rsp
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
	popq	%rcx
	cmpq	%rax, %rcx
	je	L445
	jmp	L444
L445:
	.data
L446:
	.byte	32
	.byte	91
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	93
	.byte	0
	.text
	movq	$CMtext, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L446, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L444:
	movq	$CTypes, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L448
	jmp	L447
L448:
	.data
L449:
	.byte	32
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L449, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	$CMtext, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
L450:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L454
	jmp	L452
L454:
	jmp	L451
L453:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L450
L451:
	.data
L455:
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Ctypename
	addq	$8, %rsp
	pushq	%rax
	movq	$L455, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L457
	jmp	L456
L457:
	.data
L458:
	.byte	44
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L458, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L456:
	jmp	L453
L452:
	movq	$41, %rax
	pushq	%rax
	call	Cputchar
	addq	$8, %rsp
L447:
	movq	$10, %rax
	pushq	%rax
	call	Cputchar
	addq	$8, %rsp
	jmp	L398
L397:
L392:
	addq	$16, %rsp
	popq	%rbp
	ret

