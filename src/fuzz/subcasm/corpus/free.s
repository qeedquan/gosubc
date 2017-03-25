	.text
	.data
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cfree
Cfree:	pushq	%rbp
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
	movq	$101, %rax
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
	movq	$101, %rax
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
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L5
	jmp	L4
L5:
	jmp	L3
L4:
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	C_arena, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jae	L7
	incq	%rdx
L7:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L8
	jmp	L6
L8:
	movq	C_asize, %rax
	pushq	%rax
	movq	C_arena, %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jae	L9
	incq	%rdx
L9:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L10
	jmp	L6
L10:
	movq	$-8, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L11
	incq	%rdx
L11:
	movq	%rdx, %rax
L6:
	orq	%rax, %rax
	jnz	L13
	jmp	L12
L13:
	.data
L14:
	.byte	'b'
	.byte	'a'
	.byte	'd'
	.byte	32
	.byte	'p'
	.byte	'o'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'e'
	.byte	40
	.byte	41
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$22, %rax
	pushq	%rax
	movq	$L14, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	call	Cabort
L12:
	subq	$8, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	negq	%rax
	popq	%rdx
	movq	%rax, (%rdx)
L3:
	addq	$8, %rsp
	popq	%rbp
	ret

