	.text
	.data
	.globl	Cerrno
Cerrno:	.quad	0
	.globl	C_files
	.comm	C_files,160
	.globl	Cstdin
	.comm	Cstdin,8
	.globl	Cstdout
	.comm	Cstdout,8
	.globl	Cstderr
	.comm	Cstderr,8
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	C_init
C_init:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
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
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$95, %rax
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
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L4:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
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
	movq	$C_files, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L7
L6:
	.data
L9:
	.byte	'r'
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
	movq	$0, %rax
	pushq	%rax
	call	Cfdopen
	addq	$16, %rsp
	movq	%rax, Cstdin
	.data
L10:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L10, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Cfdopen
	addq	$16, %rsp
	movq	%rax, Cstdout
	.data
L11:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L11, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	Cfdopen
	addq	$16, %rsp
	movq	%rax, Cstderr
	movq	$24, %rax
	pushq	%rax
	movq	Cstdin, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$24, %rax
	pushq	%rax
	movq	Cstdout, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$24, %rax
	pushq	%rax
	movq	Cstderr, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movb	%al, (%rdx)
L3:
	addq	$8, %rsp
	popq	%rbp
	ret

