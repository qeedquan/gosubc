	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	C_fsync
C_fsync:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-48, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$40, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$48, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L5
	jmp	L4
L5:
	movq	$32, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$40, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$40, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$32, %rax
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
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$64, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L7
	jmp	L6
L7:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	orq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$3, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L3
L6:
	jmp	L8
L4:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
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
	popq	%rcx
	cmpq	%rax, %rcx
	je	L10
	jmp	L9
L10:
	movq	$32, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$40, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$64, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	$-1, %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
L11:
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L15
	jmp	L13
L15:
	jmp	L12
L14:
	movq	-40(%rbp), %rax
	incq	-40(%rbp)
	jmp	L11
L12:
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L17
	jmp	L16
L17:
	movq	$1, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
L16:
	jmp	L14
L13:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L19
	jmp	L18
L19:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$64, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	movq	%rax, -24(%rbp)
	movq	$32, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L21
	jmp	L20
L21:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	orq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$3, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L3
L20:
L18:
L9:
L8:
	movq	$1, %rax
	jmp	L3
L3:
	addq	$48, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L22,8
	.lcomm	L23,8
	.text
	.globl	C_fwrite
C_fwrite:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L22, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L22, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
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
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L26
	jmp	L25
L26:
	movq	$0, %rax
	jmp	L24
L25:
	movq	$8, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	andq	%rcx, %rax
	orq	%rax, %rax
	jnz	L28
	jmp	L27
L28:
	movq	$0, %rax
	jmp	L24
L27:
	movq	$16, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$24, %rax
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
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L30
	jmp	L29
L30:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L32
	jmp	L31
L32:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	orq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$3, %rax
	movq	%rax, Cerrno
L31:
	movq	-8(%rbp), %rax
	jmp	L24
L29:
	movq	24(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$48, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$40, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L34
	jmp	L33
L34:
	movq	24(%rbp), %rax
	movq	%rax, -8(%rbp)
L33:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$64, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$40, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$40, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$40, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 24(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	32(%rbp), %rax
	pushq	%rax
	call	C_fsync
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L36
	jmp	L35
L36:
	movq	$0, %rax
	jmp	L24
L35:
L38:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L39
	jmp	L37
L39:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L41
	jmp	L40
L41:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	orq	%rcx, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$3, %rax
	movq	%rax, Cerrno
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	jmp	L24
L40:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, 16(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, 24(%rbp)
	jmp	L38
L37:
	movq	$0, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L43
	jmp	L42
L43:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$64, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	$40, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L42:
	movq	$24, %rax
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
	jne	L45
	incq	%rdx
L45:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L46
	jmp	L44
L46:
	movq	32(%rbp), %rax
	pushq	%rax
	call	C_fsync
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L44:
	orq	%rax, %rax
	jnz	L48
	jmp	L47
L48:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	jmp	L24
L47:
	movq	-24(%rbp), %rax
	jmp	L24
L24:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L49,8
	.lcomm	L50,8
	.text
	.globl	Cfwrite
Cfwrite:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L49, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	40(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_fwrite
	addq	$24, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L53
	jmp	L52
L53:
	movq	$-1, %rax
	jmp	L51
L52:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	jmp	L51
L51:
	addq	$8, %rsp
	popq	%rbp
	ret

