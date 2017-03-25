	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cfreopen
Cfreopen:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$112, %rax
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
	movq	$110, %rax
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
	movq	$102, %rax
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
	movq	$101, %rax
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
	movq	$112, %rax
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
	movq	$110, %rax
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
	movq	24(%rbp), %rax
	pushq	%rax
	call	C_openmode
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L5
	jmp	L4
L5:
	movq	$5, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L3
L4:
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	andq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L6
	incq	%rdx
L6:
	movq	%rdx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	orq	%rcx, %rax
	orq	%rax, %rax
	jnz	L8
	jmp	L7
L8:
	jmp	L9
L7:
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L11
	jmp	L10
L11:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$114, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L12
	incq	%rdx
L12:
	movq	%rdx, %rax
L10:
	orq	%rax, %rax
	jnz	L14
	jmp	L13
L14:
	movq	32(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L3
	jmp	L15
L13:
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L17
	jmp	L16
L17:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$119, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L18
	incq	%rdx
L18:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L19
	jmp	L16
L19:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$97, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L20
	incq	%rdx
L20:
	movq	%rdx, %rax
L16:
	orq	%rax, %rax
	jnz	L22
	jmp	L21
L22:
	movq	32(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L3
L21:
L15:
L9:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L24
	jmp	L23
L24:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_openfd
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L26
	jmp	L25
L26:
	movq	32(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	movq	$0, %rax
	jmp	L3
L25:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	movq	32(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L23:
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$32, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$40, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$56, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	32(%rbp), %rax
	jmp	L3
L3:
	addq	$16, %rsp
	popq	%rbp
	ret

