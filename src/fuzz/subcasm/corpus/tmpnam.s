	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
L3:
	.quad	0
	.lcomm	L4,8
	.text
	.globl	Ctmpnam
Ctmpnam:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
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
	movq	$109, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
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
	movq	$109, %rax
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
L6:
	jmp	L7
L9:
	jmp	L6
L7:
	.data
L10:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	37
	.byte	'0'
	.byte	'4'
	.byte	'x'
	.byte	0
	.text
	movq	L3, %rax
	pushq	%rax
	movq	$L10, %rax
	pushq	%rax
	movq	$L4, %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
	incq	L3
	movq	L3, %rax
	pushq	%rax
	movq	$32766, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L12
	jmp	L11
L12:
	movq	$0, %rax
	jmp	L5
L11:
	.data
L13:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L13, %rax
	pushq	%rax
	movq	$L4, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L15
	jmp	L14
L15:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L17
	jmp	L16
L17:
	movq	$L4, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	16(%rbp), %rax
	jmp	L5
L16:
	movq	$L4, %rax
	jmp	L5
L14:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	jmp	L9
L8:
L5:
	addq	$8, %rsp
	popq	%rbp
	ret

