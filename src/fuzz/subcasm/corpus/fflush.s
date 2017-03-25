	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
C_fflush:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
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
	movq	$102, %rax
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
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
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
	movq	$102, %rax
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
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
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
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
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
	jnz	L5
	jmp	L4
L5:
	movq	$0, %rax
	jmp	L3
L4:
	movq	$56, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L7
	jmp	L6
L7:
	movq	$32, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$40, %rax
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
	movq	$0, %rax
	jmp	L3
L6:
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
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L9
	jmp	L8
L9:
	movq	$0, %rax
	jmp	L3
L8:
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
	movq	$32, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$40, %rax
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
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L11
	incq	%rdx
L11:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L12
	jmp	L10
L12:
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
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L13
	incq	%rdx
L13:
	movq	%rdx, %rax
L10:
	orq	%rax, %rax
	jnz	L15
	jmp	L14
L15:
	movq	$0, %rax
	jmp	L3
L14:
	movq	$3, %rax
	movq	%rax, Cerrno
	movq	$-1, %rax
	jmp	L3
L3:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L16,8
	.lcomm	L17,8
	.text
	.globl	Cfflush
Cfflush:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$0, -16(%rbp)
	movq	$L16, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L16, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L20
	jmp	L19
L20:
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_fflush
	addq	$8, %rsp
	jmp	L18
L19:
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L21:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
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
	movq	$C_files, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_fflush
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L27
	jmp	L26
L27:
	movq	$-1, %rax
	movq	%rax, -16(%rbp)
L26:
	jmp	L24
L23:
	movq	-16(%rbp), %rax
	jmp	L18
L18:
	addq	$16, %rsp
	popq	%rbp
	ret

