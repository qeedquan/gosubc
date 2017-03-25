	.text
	.data
	.globl	C_arena
C_arena:	.quad	0
	.globl	C_asize
C_asize:	.quad	0
Cfreep:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
Cdefrag:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L1, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$114, %rax
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
	movq	$103, %rax
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
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$114, %rax
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
	movq	$103, %rax
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
	movq	C_asize, %rax
	pushq	%rax
	movq	C_arena, %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
	movq	C_arena, %rax
	movq	%rax, -8(%rbp)
L4:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jb	L8
	jmp	L6
L8:
	jmp	L5
L7:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	jmp	L4
L5:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L10
	jmp	L9
L10:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
L11:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jae	L16
	incq	%rdx
L16:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L17
	jmp	L15
L17:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L18
	incq	%rdx
L18:
	movq	%rdx, %rax
L15:
	orq	%rax, %rax
	jnz	L19
	jmp	L13
L19:
	jmp	L12
L14:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	jmp	L11
L12:
	jmp	L14
L13:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shrq	$3, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L9:
	jmp	L7
L6:
L3:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L20,8
	.lcomm	L21,8
	.text
	.globl	Cmalloc
Cmalloc:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-40, %rsp
	movq	$L20, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$7, %rax
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
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	sarq	%cl, %rax
	movq	%rax, 16(%rbp)
	movq	C_arena, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L24
	jmp	L23
L24:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L26
	jmp	L25
L26:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, C_asize
	jmp	L27
L25:
	movq	$10, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	movq	%rax, C_asize
L27:
	movq	C_asize, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	call	C_sbrk
	addq	$8, %rsp
	movq	%rax, C_arena
	movq	C_arena, %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L29
	jmp	L28
L29:
	movq	$6, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L22
L28:
	movq	C_arena, %rax
	pushq	%rax
	movq	C_asize, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	C_arena, %rax
	movq	%rax, Cfreep
L23:
	movq	$0, %rax
	movq	%rax, -40(%rbp)
L30:
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L34
	jmp	L32
L34:
	jmp	L31
L33:
	movq	-40(%rbp), %rax
	incq	-40(%rbp)
	jmp	L30
L31:
	movq	C_asize, %rax
	pushq	%rax
	movq	C_arena, %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	Cfreep, %rax
	movq	%rax, -8(%rbp)
L35:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L39
	jmp	L38
L39:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L41
	jmp	L40
L41:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	negq	%rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L42
L40:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	negq	%rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	shlq	$3, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L42:
	movq	-8(%rbp), %rax
	movq	%rax, Cfreep
	movq	$1, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	jmp	L22
L38:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	shlq	$3, %rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L44
	jmp	L43
L44:
	movq	C_arena, %rax
	movq	%rax, -8(%rbp)
L43:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	C_arena, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jae	L46
	incq	%rdx
L46:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L47
	jmp	L45
L47:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jb	L48
	incq	%rdx
L48:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L49
	jmp	L45
L49:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L50
	incq	%rdx
L50:
	movq	%rdx, %rax
L45:
	orq	%rax, %rax
	jnz	L52
	jmp	L51
L52:
	.data
L53:
	.byte	'm'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	40
	.byte	41
	.byte	58
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'r'
	.byte	'r'
	.byte	'u'
	.byte	'p'
	.byte	't'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
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
	movq	$24, %rax
	pushq	%rax
	movq	$L53, %rax
	pushq	%rax
	movq	$2, %rax
	pushq	%rax
	call	C_write
	addq	$24, %rsp
	call	Cabort
L51:
L37:
	movq	Cfreep, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L54
	jmp	L35
L54:
L36:
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L56
	jmp	L55
L56:
	call	Cdefrag
	jmp	L57
L55:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L59
	jmp	L58
L59:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
	jmp	L60
L58:
	movq	$10, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	movq	%rax, -32(%rbp)
L60:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	pushq	%rax
	call	C_sbrk
	addq	$8, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L62
	jmp	L61
L62:
	movq	$6, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L22
L61:
	movq	C_asize, %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	C_asize, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, C_asize
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	C_asize, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L57:
	jmp	L33
L32:
	movq	$6, %rax
	movq	%rax, Cerrno
	movq	$0, %rax
	jmp	L22
L22:
	addq	$40, %rsp
	popq	%rbp
	ret

