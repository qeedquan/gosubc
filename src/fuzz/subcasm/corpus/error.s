	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cerror
Cerror:	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$6, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CSyntoken, %rax
	orq	%rax, %rax
	jnz	L5
	jmp	L4
L5:
	jmp	L3
L4:
	movq	CErrors, %rax
	orq	%rax, %rax
	jz	L7
	jmp	L6
L7:
	call	Ccleanup
L6:
	.data
L8:
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	'd'
	.byte	58
	.byte	32
	.byte	0
	.text
	movq	CLine, %rax
	pushq	%rax
	movq	CFile, %rax
	pushq	%rax
	movq	$L8, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$32, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$24, %rsp
	.data
L9:
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L9, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$16, %rsp
	incq	CErrors
	movq	CErrors, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L11
	jmp	L10
L11:
	movq	$0, %rax
	movq	%rax, CErrors
	.data
L12:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	's'
	.byte	0
	.text
	movq	$L12, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L10:
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L13,8
	.lcomm	L14,8
	.text
	.globl	Cfatal
Cfatal:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L13, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$6, %rax
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
	call	Cerror
	addq	$16, %rsp
	.data
L16:
	.byte	'f'
	.byte	'a'
	.byte	't'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	44
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'o'
	.byte	'p'
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
	movq	$L16, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L15:
	popq	%rbp
	ret
	.data
	.lcomm	L17,16
	.lcomm	L18,16
	.text
	.globl	Cscnerror
Cscnerror:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L17, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cisprint
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L21
	jmp	L20
L21:
	.data
L22:
	.byte	39
	.byte	37
	.byte	'c'
	.byte	39
	.byte	32
	.byte	40
	.byte	92
	.byte	'x'
	.byte	37
	.byte	'x'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	24(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$L22, %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$32, %rsp
	jmp	L23
L20:
	.data
L24:
	.byte	92
	.byte	'x'
	.byte	37
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$L24, %rax
	pushq	%rax
	leaq	-32(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
L23:
	leaq	-32(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L19:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L25,8
	.lcomm	L26,8
	.text
	.globl	Csynch
Csynch:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L25, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L26, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L26, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L26, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L26, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L26, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L26, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, -8(%rbp)
L29:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L30
	jmp	L28
L30:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L32
	jmp	L31
L32:
	.data
L33:
	.byte	'e'
	.byte	'r'
	.byte	'r'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'c'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	'r'
	.byte	'y'
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L33, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L31:
	call	Cnext
	movq	%rax, -8(%rbp)
	jmp	L29
L28:
	movq	16(%rbp), %rax
	movq	%rax, CSyntoken
	movq	-8(%rbp), %rax
	jmp	L27
L27:
	addq	$8, %rsp
	popq	%rbp
	ret

