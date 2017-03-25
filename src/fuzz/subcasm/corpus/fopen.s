	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	C_openfd
C_openfd:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$-1, -24(%rbp)
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$43, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L6
	jmp	L4
L6:
	movq	$1, %rax
	jmp	L5
L4:
	movq	$0, %rax
L5:
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$119, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L8
	jmp	L7
L8:
	movq	$438, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_creat
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L10
	jmp	L9
L10:
	movq	$2, %rax
	movq	%rax, Cerrno
L9:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L12
	incq	%rdx
L12:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L13
	jmp	L11
L13:
	movq	-16(%rbp), %rax
L11:
	orq	%rax, %rax
	jnz	L15
	jmp	L14
L15:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
L14:
	jmp	L16
L7:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$114, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L18
	jmp	L17
L18:
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jnz	L21
	jmp	L19
L21:
	movq	$2, %rax
	jmp	L20
L19:
	movq	$0, %rax
L20:
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L23
	jmp	L22
L23:
	movq	$1, %rax
	movq	%rax, Cerrno
L22:
	jmp	L24
L17:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$97, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L26
	jmp	L25
L26:
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jnz	L29
	jmp	L27
L29:
	movq	$2, %rax
	jmp	L28
L27:
	movq	$1, %rax
L28:
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L31
	jmp	L30
L31:
	movq	$420, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_creat
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L33
	jmp	L32
L33:
	movq	$2, %rax
	movq	%rax, Cerrno
L32:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jnz	L36
	jmp	L34
L36:
	movq	$2, %rax
	jmp	L35
L34:
	movq	$1, %rax
L35:
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
L30:
	movq	$2, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	jmp	L37
L25:
	movq	$5, %rax
	movq	%rax, Cerrno
L37:
L24:
L16:
	movq	-24(%rbp), %rax
	jmp	L3
L3:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L38,8
	.lcomm	L39,8
	.text
	.globl	Cfopen
Cfopen:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
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
	movq	$111, %rax
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L38, %rax
	pushq	%rax
	movq	$6, %rax
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
	movq	$111, %rax
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
	movq	$110, %rax
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
	jl	L42
	jmp	L41
L42:
	movq	$0, %rax
	jmp	L40
L41:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfdopen
	addq	$16, %rsp
	jmp	L40
L40:
	addq	$16, %rsp
	popq	%rbp
	ret

