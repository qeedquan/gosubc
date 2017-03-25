	.text
	.data
	.globl	CArgv
CArgv:	.quad	0
	.globl	CArgc
CArgc:	.quad	0
	.globl	CFd
CFd:	.quad	0
	.globl	CBuffer
	.comm	CBuffer,512
	.globl	CLen
CLen:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cwrong
Cwrong:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$119, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$119, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
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
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L4:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	58
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	'g'
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
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L4, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$24, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L5,8
	.lcomm	L6,8
	.text
	.globl	Cfdatoi
Cfdatoi:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L5, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L8:
	.byte	'f'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L10
	jmp	L9
L10:
	movq	CFd, %rax
	jmp	L7
	jmp	L11
L9:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	jmp	L7
L11:
L7:
	popq	%rbp
	ret
	.data
	.lcomm	L12,8
	.lcomm	L13,8
	.text
	.globl	Cdo_sbrk
Cdo_sbrk:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L12, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L16
	jmp	L15
L16:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	.data
L17:
	.byte	95
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	37
	.byte	'd'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L17, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	C_sbrk
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L14
	jmp	L18
L15:
	.data
L19:
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L19, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L18:
L14:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L20,16
	.lcomm	L21,16
	.text
	.globl	Cdo_creat
Cdo_creat:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$9, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L24
	jmp	L23
L24:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L23:
	orq	%rax, %rax
	jnz	L26
	jmp	L25
L26:
	.data
L27:
	.byte	37
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	$L27, %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Csscanf
	addq	$24, %rsp
	.data
L28:
	.byte	95
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	40
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	44
	.byte	'0'
	.byte	37
	.byte	'o'
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
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L28, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_creat
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	%rax, CFd
	movq	$3, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L22
	jmp	L29
L25:
	.data
L30:
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L30, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L29:
L22:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L31,8
	.lcomm	L32,8
	.text
	.globl	Cdo_open
Cdo_open:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L31, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L35
	jmp	L34
L35:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L34:
	orq	%rax, %rax
	jnz	L37
	jmp	L36
L37:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	.data
L38:
	.byte	95
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	40
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	44
	.byte	37
	.byte	'd'
	.byte	41
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L38, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_open
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	%rax, CFd
	movq	$3, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L33
	jmp	L39
L36:
	.data
L40:
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L40, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L39:
L33:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L41,16
	.lcomm	L42,16
	.text
	.globl	Cdo_write
Cdo_write:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L41, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L41, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L42, %rax
	pushq	%rax
	movq	$9, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L45
	jmp	L44
L45:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L46
	jmp	L44
L46:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L44:
	orq	%rax, %rax
	jnz	L48
	jmp	L47
L48:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfdatoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	.data
L49:
	.byte	95
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	37
	.byte	'd'
	.byte	44
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	44
	.byte	37
	.byte	'd'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L49, %rax
	pushq	%rax
	call	Cprintf
	addq	$32, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$4, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L43
	jmp	L50
L47:
	.data
L51:
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L51, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L50:
L43:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L52,8
	.lcomm	L53,8
	.text
	.globl	Cdo_read
Cdo_read:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L52, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L52, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L56
	jmp	L55
L56:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L55:
	orq	%rax, %rax
	jnz	L58
	jmp	L57
L58:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfdatoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$512, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L60
	jmp	L59
L60:
	.data
L61:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	58
	.byte	32
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'l'
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'e'
	.byte	32
	.byte	40
	.byte	'm'
	.byte	'a'
	.byte	'x'
	.byte	61
	.byte	37
	.byte	'd'
	.byte	41
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$512, %rax
	pushq	%rax
	movq	$L61, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$24, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L59:
	.data
L62:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	37
	.byte	'd'
	.byte	44
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	44
	.byte	37
	.byte	'd'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L62, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$CBuffer, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	C_read
	addq	$24, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	%rax, CLen
	movq	$3, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L54
	jmp	L63
L57:
	.data
L64:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L64, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L63:
L54:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L65,16
	.lcomm	L66,16
	.text
	.globl	Cdo_buffer
Cdo_buffer:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L65, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L68:
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	58
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L68, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	Cstdout, %rax
	pushq	%rax
	call	Cfflush
	addq	$8, %rsp
	movq	CLen, %rax
	pushq	%rax
	movq	$CBuffer, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	movq	CLen, %rax
	orq	%rax, %rax
	jnz	L70
	jmp	L69
L70:
	movq	$10, %rax
	pushq	%rax
	call	Cputchar
	addq	$8, %rsp
L69:
	.data
L71:
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
	.byte	32
	.byte	0
	.byte	0
	.text
	movq	$L71, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	CLen, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L67
L67:
	popq	%rbp
	ret
	.data
	.lcomm	L72,16
	.lcomm	L73,16
	.text
	.globl	Cdo_close
Cdo_close:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L72, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L72, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L73, %rax
	pushq	%rax
	movq	$9, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L76
	jmp	L75
L76:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfdatoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	.data
L77:
	.byte	95
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	40
	.byte	37
	.byte	'd'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L77, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L74
	jmp	L78
L75:
	.data
L79:
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L79, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L78:
L74:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L80,16
	.lcomm	L81,16
	.text
	.globl	Cdo_lseek
Cdo_lseek:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L80, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L80, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$9, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L84
	jmp	L83
L84:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L85
	jmp	L83
L85:
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L83:
	orq	%rax, %rax
	jnz	L87
	jmp	L86
L87:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfdatoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	$24, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -24(%rbp)
	.data
L88:
	.byte	95
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	37
	.byte	'd'
	.byte	44
	.byte	37
	.byte	'd'
	.byte	44
	.byte	37
	.byte	'd'
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
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L88, %rax
	pushq	%rax
	call	Cprintf
	addq	$32, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$4, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L82
	jmp	L89
L86:
	.data
L90:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L90, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L89:
L82:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L91,16
	.lcomm	L92,16
	.text
	.globl	Cdo_rename
Cdo_rename:	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L91, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L92, %rax
	pushq	%rax
	movq	$10, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L95
	jmp	L94
L95:
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
L94:
	orq	%rax, %rax
	jnz	L97
	jmp	L96
L97:
	.data
L98:
	.byte	95
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	44
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
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
	movq	$L98, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	16(%rbp), %rax
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
	call	C_rename
	addq	$16, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$3, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L93
	jmp	L99
L96:
	.data
L100:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L100, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L99:
L93:
	popq	%rbp
	ret
	.data
	.lcomm	L101,16
	.lcomm	L102,16
	.text
	.globl	Cdo_unlink
Cdo_unlink:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L101, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L102, %rax
	pushq	%rax
	movq	$10, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L105
	jmp	L104
L105:
	.data
L106:
	.byte	95
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	40
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L106, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L103
	jmp	L107
L104:
	.data
L108:
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	0
	.byte	0
	.text
	movq	$L108, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L107:
L103:
	popq	%rbp
	ret
	.data
	.lcomm	L109,8
	.lcomm	L110,8
	.text
	.globl	Cdo_time
Cdo_time:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L109, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L109, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L110, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L112:
	.byte	95
	.byte	't'
	.byte	'i'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	0
	.text
	movq	$L112, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	call	C_time
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L111
L111:
	popq	%rbp
	ret
	.data
	.lcomm	L113,8
	.lcomm	L114,8
	.text
	.globl	Cdo_fork
Cdo_fork:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L113, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L113, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L114, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L116:
	.byte	95
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	0
	.text
	movq	$L116, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	call	C_fork
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L115
L115:
	popq	%rbp
	ret
	.data
	.lcomm	L117,8
	.lcomm	L118,8
	.text
	.globl	Cdo_wait
Cdo_wait:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L117, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L117, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L118, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L121
	jmp	L120
L121:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	call	C_fork
	jmp	L123
L124:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
L125:
	.data
L126:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	33
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L126, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L127:
	.data
L128:
	.byte	95
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	38
	.byte	'r'
	.byte	'c'
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L128, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	call	C_wait
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L122
L123:
	movq	$L129, %rdx
	jmp	switch
L129:
	.quad	2
	.quad	0, L124
	.quad	-1, L125
	.quad	L127
L122:
	.data
L130:
	.byte	32
	.byte	91
	.byte	'r'
	.byte	'c'
	.byte	58
	.byte	32
	.byte	37
	.byte	'd'
	.byte	32
	.byte	40
	.byte	37
	.byte	'x'
	.byte	41
	.byte	93
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L130, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L119
	jmp	L131
L120:
	.data
L132:
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L132, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L131:
L119:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L133,8
	.lcomm	L134,8
	.text
	.globl	Cdo_exit
Cdo_exit:	pushq	%rbp
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L133, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L134, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L137
	jmp	L136
L137:
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	.data
L138:
	.byte	95
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	37
	.byte	'd'
	.byte	41
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L138, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	C_exit
	addq	$8, %rsp
	.data
L139:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	33
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L139, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$16, %rsp
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L135
	jmp	L140
L136:
	.data
L141:
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	0
	.byte	0
	.text
	movq	$L141, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L140:
L135:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L142,16
	.lcomm	L143,16
	.text
	.globl	Cdo_execve
Cdo_execve:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-104, %rsp
	movq	$L142, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L142, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L143, %rax
	pushq	%rax
	movq	$10, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L146
	jmp	L145
L146:
	addq	$8, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -104(%rbp)
	.data
L147:
	.byte	95
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	44
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	's'
	.byte	44
	.byte	32
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	'i'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	41
	.byte	32
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
	.text
	movq	-104(%rbp), %rax
	pushq	%rax
	movq	$L147, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L149:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L150
	jmp	L148
L150:
	.data
L151:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'v'
	.byte	91
	.byte	37
	.byte	'd'
	.byte	93
	.byte	58
	.byte	32
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	10
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L151, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L153
	jmp	L152
L153:
	.data
L154:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	58
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
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
	.byte	32
	.byte	40
	.byte	'm'
	.byte	'a'
	.byte	'x'
	.byte	58
	.byte	32
	.byte	'1'
	.byte	'0'
	.byte	41
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L154, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L152:
	leaq	-96(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	addq	$8, 16(%rbp)
	movq	(%rax), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L149
L148:
	leaq	-96(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L155:
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L155, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	Cenviron, %rax
	pushq	%rax
	leaq	-96(%rbp), %rax
	pushq	%rax
	movq	-104(%rbp), %rax
	pushq	%rax
	call	C_execve
	addq	$24, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	jmp	L144
	jmp	L156
L145:
	.data
L157:
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L157, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L156:
L144:
	addq	$104, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L158,8
	.lcomm	L159,8
	.text
	.globl	Cdo_args
Cdo_args:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$8, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L161:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	's'
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	10
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'c'
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	CArgc, %rax
	pushq	%rax
	movq	$L161, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L162:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	CArgc, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L166
	jmp	L164
L166:
	jmp	L163
L165:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L162
L163:
	.data
L167:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'v'
	.byte	91
	.byte	37
	.byte	'd'
	.byte	93
	.byte	32
	.byte	61
	.byte	32
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	CArgv, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L167, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	jmp	L165
L164:
	.data
L168:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'v'
	.byte	91
	.byte	37
	.byte	'd'
	.byte	93
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	'p'
	.byte	10
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
	.text
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	CArgv, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L168, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L160:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L169,8
	.lcomm	L170,8
	.text
	.globl	Cdo_env
Cdo_env:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L169, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L169, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L169, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L169, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L169, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L169, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L169, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L170, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L172:
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	'i'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$L172, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L174:
	movq	Cenviron, %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L175
	jmp	L173
L175:
	.data
L176:
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	Cenviron, %rax
	addq	$8, Cenviron
	movq	(%rax), %rax
	pushq	%rax
	movq	$L176, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	jmp	L174
L173:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	.data
L177:
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L177, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L171
L171:
	popq	%rbp
	ret
	.data
	.lcomm	L178,16
	.lcomm	L179,16
	.text
	.globl	Cdo_getenv
Cdo_getenv:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L178, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L178, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L179, %rax
	pushq	%rax
	movq	$10, %rax
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
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L182
	jmp	L181
L182:
	.data
L183:
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	40
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L183, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgetenv
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L185
	jmp	L184
L185:
	.data
L186:
	.byte	32
	.byte	91
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	34
	.byte	37
	.byte	's'
	.byte	34
	.byte	93
	.byte	0
	.byte	0
	.text
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L186, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	jmp	L187
L184:
	.data
L188:
	.byte	32
	.byte	91
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	93
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L188, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L187:
	movq	$2, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L180
	jmp	L189
L181:
	.data
L190:
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	0
	.byte	0
	.text
	movq	$L190, %rax
	pushq	%rax
	call	Cwrong
	addq	$8, %rsp
L189:
L180:
	popq	%rbp
	ret
	.data
	.lcomm	L191,8
	.lcomm	L192,8
	.text
	.globl	Ccall
Ccall:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L191, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L191, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L191, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L191, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L191, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L192, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L192, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L192, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L192, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L192, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L194:
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L194, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L196
	jmp	L195
L196:
	call	Cdo_args
	movq	%rax, 16(%rbp)
	jmp	L197
L195:
	.data
L198:
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L198, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L200
	jmp	L199
L200:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_buffer
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L201
L199:
	.data
L202:
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L202, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L204
	jmp	L203
L204:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_close
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L205
L203:
	.data
L206:
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L206, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L208
	jmp	L207
L208:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_creat
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L209
L207:
	.data
L210:
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L210, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L212
	jmp	L211
L212:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_env
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L213
L211:
	.data
L214:
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L214, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L216
	jmp	L215
L216:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_execve
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L217
L215:
	.data
L218:
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L218, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L220
	jmp	L219
L220:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_exit
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L221
L219:
	.data
L222:
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L222, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L224
	jmp	L223
L224:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_fork
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L225
L223:
	.data
L226:
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L226, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L228
	jmp	L227
L228:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_getenv
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L229
L227:
	.data
L230:
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L230, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L232
	jmp	L231
L232:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_lseek
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L233
L231:
	.data
L234:
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L234, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L236
	jmp	L235
L236:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_open
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L237
L235:
	.data
L238:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L238, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L240
	jmp	L239
L240:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_read
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L241
L239:
	.data
L242:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L242, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L244
	jmp	L243
L244:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_rename
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L245
L243:
	.data
L246:
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L246, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L248
	jmp	L247
L248:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_sbrk
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L249
L247:
	.data
L250:
	.byte	't'
	.byte	'i'
	.byte	'm'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L250, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L252
	jmp	L251
L252:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_time
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L253
L251:
	.data
L254:
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L254, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L256
	jmp	L255
L256:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_unlink
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L257
L255:
	.data
L258:
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L258, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L260
	jmp	L259
L260:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_wait
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L261
L259:
	.data
L262:
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L262, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L264
	jmp	L263
L264:
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdo_write
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	jmp	L265
L263:
	.data
L266:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
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
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L266, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$24, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L265:
L261:
L257:
L253:
L249:
L245:
L241:
L237:
L233:
L229:
L225:
L221:
L217:
L213:
L209:
L205:
L201:
L197:
	.data
L267:
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	37
	.byte	'd'
	.byte	32
	.byte	40
	.byte	37
	.byte	'p'
	.byte	41
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L267, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	movq	16(%rbp), %rax
	jmp	L193
L193:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L268,8
	.lcomm	L269,8
	.text
	.globl	Cusage
Cusage:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L268, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L268, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L268, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L268, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L268, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L268, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L269, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L271:
	.byte	'U'
	.byte	's'
	.byte	'a'
	.byte	'g'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	91
	.byte	58
	.byte	32
	.byte	46
	.byte	46
	.byte	46
	.byte	93
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L271, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L273
	jmp	L272
L273:
	movq	$0, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L272:
L270:
	popq	%rbp
	ret
	.data
	.lcomm	L274,16
	.lcomm	L275,16
	.text
	.globl	Clongusage
Clongusage:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L274, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L274, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L275, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$10, %rax
	pushq	%rax
	call	Cputchar
	addq	$8, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cusage
	addq	$8, %rsp
	.data
L277:
	.byte	10
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'm'
	.byte	'm'
	.byte	'a'
	.byte	'r'
	.byte	'y'
	.byte	58
	.byte	10
	.byte	10
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	's'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'c'
	.byte	47
	.byte	'a'
	.byte	'r'
	.byte	'g'
	.byte	'v'
	.byte	44
	.byte	32
	.byte	'i'
	.byte	'g'
	.byte	'n'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'o'
	.byte	't'
	.byte	'h'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	's'
	.byte	10
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'd'
	.byte	'i'
	.byte	's'
	.byte	'p'
	.byte	'l'
	.byte	'a'
	.byte	'y'
	.byte	32
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'b'
	.byte	'y'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	41
	.byte	10
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	40
	.byte	'n'
	.byte	41
	.byte	10
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	32
	.byte	32
	.byte	32
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	40
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	44
	.byte	'm'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	41
	.byte	44
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	32
	.byte	'i'
	.byte	's'
	.byte	32
	.byte	'o'
	.byte	'c'
	.byte	't'
	.byte	'a'
	.byte	'l'
	.byte	10
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	'i'
	.byte	'r'
	.byte	'o'
	.byte	'n'
	.byte	10
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	46
	.byte	46
	.byte	46
	.byte	32
	.byte	32
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'e'
	.byte	'c'
	.byte	'v'
	.byte	'e'
	.byte	40
	.byte	'n'
	.byte	41
	.byte	44
	.byte	32
	.byte	's'
	.byte	'h'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	10
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	'n'
	.byte	41
	.byte	44
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	'l'
	.byte	'l'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	32
	.byte	40
	.byte	'o'
	.byte	'b'
	.byte	'v'
	.byte	'i'
	.byte	'o'
	.byte	'u'
	.byte	's'
	.byte	'l'
	.byte	'y'
	.byte	41
	.byte	10
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	41
	.byte	44
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	'l'
	.byte	'l'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'p'
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	'c'
	.byte	'h'
	.byte	'i'
	.byte	'l'
	.byte	'd'
	.byte	33
	.byte	10
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'e'
	.byte	'n'
	.byte	'v'
	.byte	40
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	41
	.byte	10
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	'p'
	.byte	'o'
	.byte	's'
	.byte	32
	.byte	'h'
	.byte	'o'
	.byte	'w'
	.byte	32
	.byte	32
	.byte	32
	.byte	'l'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	40
	.byte	'n'
	.byte	44
	.byte	'p'
	.byte	'o'
	.byte	's'
	.byte	44
	.byte	'h'
	.byte	'o'
	.byte	'w'
	.byte	41
	.byte	44
	.byte	32
	.byte	'h'
	.byte	'o'
	.byte	'w'
	.byte	58
	.byte	32
	.byte	'0'
	.byte	61
	.byte	'a'
	.byte	'b'
	.byte	's'
	.byte	44
	.byte	'1'
	.byte	61
	.byte	'e'
	.byte	'n'
	.byte	'd'
	.byte	44
	.byte	'2'
	.byte	61
	.byte	'c'
	.byte	'u'
	.byte	'r'
	.byte	10
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'l'
	.byte	'a'
	.byte	'g'
	.byte	's'
	.byte	32
	.byte	32
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	40
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	44
	.byte	'f'
	.byte	'l'
	.byte	'a'
	.byte	'g'
	.byte	's'
	.byte	41
	.byte	44
	.byte	32
	.byte	'f'
	.byte	'l'
	.byte	'a'
	.byte	'g'
	.byte	's'
	.byte	58
	.byte	32
	.byte	'0'
	.byte	61
	.byte	'r'
	.byte	'o'
	.byte	44
	.byte	'1'
	.byte	61
	.byte	'w'
	.byte	'o'
	.byte	44
	.byte	'2'
	.byte	61
	.byte	'r'
	.byte	'w'
	.byte	10
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	40
	.byte	'n'
	.byte	44
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	44
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	41
	.byte	44
	.byte	32
	.byte	'b'
	.byte	'u'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	's'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	10
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	'o'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	'w'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	'o'
	.byte	'l'
	.byte	'd'
	.byte	44
	.byte	'n'
	.byte	'e'
	.byte	'w'
	.byte	41
	.byte	10
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	's'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	40
	.byte	'n'
	.byte	41
	.byte	10
	.byte	't'
	.byte	'i'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	't'
	.byte	'i'
	.byte	'm'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	10
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'u'
	.byte	'n'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	40
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	41
	.byte	10
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'w'
	.byte	'a'
	.byte	'i'
	.byte	't'
	.byte	40
	.byte	41
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	60
	.byte	60
	.byte	'8'
	.byte	10
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	32
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	32
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	40
	.byte	'n'
	.byte	44
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	44
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	41
	.byte	10
	.byte	10
	.byte	39
	.byte	'f'
	.byte	'd'
	.byte	39
	.byte	32
	.byte	'c'
	.byte	'a'
	.byte	'n'
	.byte	32
	.byte	'b'
	.byte	'e'
	.byte	32
	.byte	'u'
	.byte	's'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	't'
	.byte	'h'
	.byte	'e'
	.byte	32
	.byte	'p'
	.byte	'l'
	.byte	'a'
	.byte	'c'
	.byte	'e'
	.byte	32
	.byte	'o'
	.byte	'f'
	.byte	32
	.byte	'a'
	.byte	32
	.byte	'n'
	.byte	'u'
	.byte	'm'
	.byte	'e'
	.byte	'r'
	.byte	'i'
	.byte	'c'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'd'
	.byte	'e'
	.byte	's'
	.byte	'c'
	.byte	'r'
	.byte	'i'
	.byte	'p'
	.byte	't'
	.byte	'o'
	.byte	'r'
	.byte	10
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'r'
	.byte	'e'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'a'
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'e'
	.byte	'v'
	.byte	'i'
	.byte	'o'
	.byte	'u'
	.byte	's'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	40
	.byte	41
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	40
	.byte	41
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	46
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L277, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L276:
	popq	%rbp
	ret
	.data
	.lcomm	L278,8
	.lcomm	L279,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L278, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L278, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L279, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L279, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L279, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L279, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L279, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, CArgc
	movq	24(%rbp), %rax
	movq	%rax, CArgv
	addq	$8, 24(%rbp)
	movq	24(%rbp), %rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jz	L282
	jmp	L281
L282:
	movq	$1, %rax
	pushq	%rax
	call	Cusage
	addq	$8, %rsp
L281:
	.data
L284:
	.byte	45
	.byte	'h'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L286:
	.byte	45
	.byte	63
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L287
	jmp	L283
L287:
	movq	$L284, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L288
	jmp	L285
L288:
	movq	$L286, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L285:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L283:
	orq	%rax, %rax
	jnz	L290
	jmp	L289
L290:
	call	Clongusage
L289:
L292:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L293
	jmp	L291
L293:
	movq	24(%rbp), %rax
	pushq	%rax
	call	Ccall
	addq	$8, %rsp
	movq	%rax, 24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	orq	%rax, %rax
	jnz	L295
	jmp	L294
L295:
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$58, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L297
	jmp	L296
L297:
	.data
L298:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	58
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
	.byte	32
	.byte	'l'
	.byte	'e'
	.byte	'f'
	.byte	't'
	.byte	32
	.byte	40
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	39
	.byte	58
	.byte	39
	.byte	63
	.byte	41
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L298, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$16, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L296:
	movq	24(%rbp), %rax
	addq	$8, 24(%rbp)
L294:
	jmp	L292
L291:
L280:
	popq	%rbp
	ret

