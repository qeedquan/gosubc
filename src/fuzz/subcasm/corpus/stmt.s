	.text
	.data
	.lcomm	L1,16
	.lcomm	L2,16
	.text
	.globl	Ccompound
Ccompound:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
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
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
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
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L5
	jmp	L4
L5:
	call	Cscan
	movq	%rax, CToken
L4:
L7:
	movq	CToken, %rax
	pushq	%rax
	movq	$56, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L8
	jmp	L6
L8:
	call	Ceofcheck
	orq	%rax, %rax
	jnz	L10
	jmp	L9
L10:
	jmp	L3
L9:
	call	Cstmt
	jmp	L7
L6:
	call	Cscan
	movq	%rax, CToken
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L11,8
	.lcomm	L12,8
	.text
Cpushbrk:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L11, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
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
	movq	CBsp, %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L15
	jmp	L14
L15:
	.data
L16:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'o'
	.byte	'p'
	.byte	's'
	.byte	47
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$L16, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L14:
	movq	$CBreakstk, %rax
	pushq	%rax
	movq	CBsp, %rax
	incq	CBsp
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L13:
	popq	%rbp
	ret
	.data
	.lcomm	L17,16
	.lcomm	L18,16
	.text
Cpushcont:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L17, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L17, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L18, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	CCsp, %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L21
	jmp	L20
L21:
	.data
L22:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'n'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'o'
	.byte	'p'
	.byte	's'
	.byte	47
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	$L22, %rax
	pushq	%rax
	call	Cfatal
	addq	$8, %rsp
L20:
	movq	$CContstk, %rax
	pushq	%rax
	movq	CCsp, %rax
	incq	CCsp
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L19:
	popq	%rbp
	ret
	.data
	.lcomm	L23,16
	.lcomm	L24,16
	.text
Cbreak_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L23, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L23, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	movq	CBsp, %rax
	orq	%rax, %rax
	jz	L27
	jmp	L26
L27:
	.data
L28:
	.byte	39
	.byte	'b'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'k'
	.byte	39
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'o'
	.byte	'p'
	.byte	47
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L28, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L26:
	movq	$CBreakstk, %rax
	pushq	%rax
	movq	CBsp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	call	Csemi
L25:
	popq	%rbp
	ret
	.data
	.lcomm	L29,16
	.lcomm	L30,16
	.text
Ccontinue_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L29, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L29, %rax
	pushq	%rax
	movq	$14, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$14, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	movq	CCsp, %rax
	orq	%rax, %rax
	jz	L33
	jmp	L32
L33:
	.data
L34:
	.byte	39
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	't'
	.byte	'i'
	.byte	'n'
	.byte	'u'
	.byte	'e'
	.byte	39
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'o'
	.byte	'p'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L34, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L32:
	movq	$CContstk, %rax
	pushq	%rax
	movq	CCsp, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	call	Csemi
L31:
	popq	%rbp
	ret
	.data
	.lcomm	L35,8
	.lcomm	L36,8
	.text
Cdo_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L35, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L35, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L36, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	call	Clabel
	movq	%rax, -8(%rbp)
	call	Clabel
	movq	%rax, -16(%rbp)
	pushq	%rax
	call	Cpushbrk
	addq	$8, %rsp
	call	Clabel
	movq	%rax, -24(%rbp)
	pushq	%rax
	call	Cpushcont
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Cstmt
	.data
L38:
	.byte	39
	.byte	'w'
	.byte	'h'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	39
	.byte	0
	.text
	movq	$L38, %rax
	pushq	%rax
	movq	$71, %rax
	pushq	%rax
	call	Cmatch
	addq	$16, %rsp
	call	Clparen
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Crexpr
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenbrtrue
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Crparen
	call	Csemi
	movq	CBsp, %rax
	decq	CBsp
	movq	CCsp, %rax
	decq	CCsp
L37:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L39,16
	.lcomm	L40,16
	.text
Cfor_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L39, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L40, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	call	Clabel
	movq	%rax, -8(%rbp)
	call	Clabel
	movq	%rax, -16(%rbp)
	call	Clabel
	movq	%rax, -24(%rbp)
	pushq	%rax
	call	Cpushbrk
	addq	$8, %rsp
	call	Clabel
	movq	%rax, -32(%rbp)
	pushq	%rax
	call	Cpushcont
	addq	$8, %rsp
	call	Clparen
	movq	$61, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L43
	jmp	L42
L43:
	call	Crexpr
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
L42:
	call	Csemi
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	$61, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L45
	jmp	L44
L45:
	call	Crexpr
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenbrfalse
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
L44:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	call	Csemi
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	$60, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L47
	jmp	L46
L47:
	call	Crexpr
L46:
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	call	Crparen
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Cstmt
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	CBsp, %rax
	decq	CBsp
	movq	CCsp, %rax
	decq	CCsp
L41:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L48,8
	.lcomm	L49,8
	.text
Cif_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L48, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	call	Clparen
	call	Crexpr
	call	Clabel
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenbrfalse
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	call	Crparen
	call	Cstmt
	movq	CToken, %rax
	pushq	%rax
	movq	$42, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L52
	jmp	L51
L52:
	call	Clabel
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	call	Cscan
	movq	%rax, CToken
	call	Cstmt
L51:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
L50:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L53,16
	.lcomm	L54,16
	.text
Creturn_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L53, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L53, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L54, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	movq	$61, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L57
	jmp	L56
L57:
	movq	$1, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cexpr
	addq	$16, %rsp
	movq	$CPrims, %rax
	pushq	%rax
	movq	CThisfn, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ctypematch
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L59
	jmp	L58
L59:
	.data
L60:
	.byte	'i'
	.byte	'n'
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	't'
	.byte	'y'
	.byte	'p'
	.byte	'e'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L60, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L58:
	jmp	L61
L56:
	movq	$CPrims, %rax
	pushq	%rax
	movq	CThisfn, %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L63
	jmp	L62
L63:
	.data
L64:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	'r'
	.byte	'e'
	.byte	't'
	.byte	'u'
	.byte	'r'
	.byte	'n'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L64, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L62:
L61:
	movq	CRetlab, %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	call	Csemi
L55:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L65,16
	.lcomm	L66,16
	.text
Cswitch_block:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-4128, %rsp
	movq	$0, -24(%rbp)
	movq	$0, -4128(%rbp)
	movq	$L65, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L65, %rax
	pushq	%rax
	movq	$13, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$13, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	call	Clabel
	movq	%rax, -8(%rbp)
	pushq	%rax
	call	Cpushbrk
	addq	$8, %rsp
	call	Clabel
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
L69:
	movq	CToken, %rax
	pushq	%rax
	movq	$56, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L70
	jmp	L68
L70:
	call	Ceofcheck
	orq	%rax, %rax
	jnz	L72
	jmp	L71
L72:
	jmp	L67
L71:
	movq	CToken, %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L75
	incq	%rdx
L75:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L76
	jmp	L73
L76:
	movq	CToken, %rax
	pushq	%rax
	movq	$38, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L77
	incq	%rdx
L77:
	movq	%rdx, %rax
L73:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L78
	jmp	L74
L78:
	movq	-4128(%rbp), %rax
	pushq	%rax
	movq	$256, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L79
	incq	%rdx
L79:
	movq	%rdx, %rax
L74:
	orq	%rax, %rax
	jnz	L81
	jmp	L80
L81:
	.data
L82:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	39
	.byte	'c'
	.byte	'a'
	.byte	's'
	.byte	'e'
	.byte	39
	.byte	's'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L82, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	movq	$0, %rax
	movq	%rax, -4128(%rbp)
L80:
	movq	CToken, %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L84
	jmp	L83
L84:
	call	Cscan
	movq	%rax, CToken
	leaq	-2072(%rbp), %rax
	pushq	%rax
	movq	-4128(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cconstexpr
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-4120(%rbp), %rax
	pushq	%rax
	movq	-4128(%rbp), %rax
	incq	-4128(%rbp)
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Clabel
	popq	%rdx
	movq	%rax, (%rdx)
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Ccolon
	jmp	L85
L83:
	movq	CToken, %rax
	pushq	%rax
	movq	$38, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L87
	jmp	L86
L87:
	call	Cscan
	movq	%rax, CToken
	call	Clabel
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Ccolon
	jmp	L88
L86:
	call	Cstmt
L88:
L85:
	jmp	L69
L68:
	movq	-4128(%rbp), %rax
	orq	%rax, %rax
	jz	L90
	jmp	L89
L90:
	movq	-24(%rbp), %rax
	orq	%rax, %rax
	jnz	L92
	jmp	L91
L92:
	leaq	-2072(%rbp), %rax
	pushq	%rax
	movq	-4128(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	leaq	-4120(%rbp), %rax
	pushq	%rax
	movq	-4128(%rbp), %rax
	incq	-4128(%rbp)
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L93
L91:
	.data
L94:
	.byte	'e'
	.byte	'm'
	.byte	'p'
	.byte	't'
	.byte	'y'
	.byte	32
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L94, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L93:
L89:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	-24(%rbp), %rax
	orq	%rax, %rax
	jnz	L97
	jmp	L95
L97:
	movq	-24(%rbp), %rax
	jmp	L96
L95:
	movq	-8(%rbp), %rax
L96:
	pushq	%rax
	movq	-4128(%rbp), %rax
	pushq	%rax
	leaq	-4120(%rbp), %rax
	pushq	%rax
	leaq	-2072(%rbp), %rax
	pushq	%rax
	call	Cgenswitch
	addq	$32, %rsp
	call	Cgentext
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Cscan
	movq	%rax, CToken
	movq	CBsp, %rax
	decq	CBsp
L67:
	addq	$4128, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L98,16
	.lcomm	L99,16
	.text
Cswitch_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L98, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L99, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	call	Clparen
	call	Crexpr
	call	Ccommit
	movq	$0, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	call	Crparen
	movq	$51, %rax
	pushq	%rax
	movq	CToken, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L102
	jmp	L101
L102:
	.data
L103:
	.byte	39
	.byte	123
	.byte	39
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'p'
	.byte	'e'
	.byte	'c'
	.byte	't'
	.byte	'e'
	.byte	'd'
	.byte	32
	.byte	'a'
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	39
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L103, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
L101:
	call	Cswitch_block
L100:
	popq	%rbp
	ret
	.data
	.lcomm	L104,16
	.lcomm	L105,16
	.text
Cwhile_stmt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L104, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L104, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L105, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Cscan
	movq	%rax, CToken
	call	Clabel
	movq	%rax, -8(%rbp)
	pushq	%rax
	call	Cpushbrk
	addq	$8, %rsp
	call	Clabel
	movq	%rax, -16(%rbp)
	pushq	%rax
	call	Cpushcont
	addq	$8, %rsp
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	call	Clparen
	call	Crexpr
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenbrfalse
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
	call	Crparen
	call	Cstmt
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cgenjump
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cgenlab
	addq	$8, %rsp
	movq	CBsp, %rax
	decq	CBsp
	movq	CCsp, %rax
	decq	CCsp
L106:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L107,16
	.lcomm	L108,16
	.text
Cwrong_ctx:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L107, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$38, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L111
	jmp	L110
L111:
	.data
L112:
	.byte	39
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'a'
	.byte	'u'
	.byte	'l'
	.byte	't'
	.byte	39
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	39
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
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
	movq	$L112, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	call	Cscan
	movq	%rax, CToken
	call	Ccolon
	jmp	L113
L110:
	.data
L114:
	.byte	39
	.byte	'c'
	.byte	'a'
	.byte	's'
	.byte	'e'
	.byte	39
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	32
	.byte	39
	.byte	's'
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'c'
	.byte	'h'
	.byte	39
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'n'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L114, %rax
	pushq	%rax
	call	Cerror
	addq	$16, %rsp
	call	Cscan
	movq	%rax, CToken
	call	Cconstexpr
	call	Ccolon
L113:
L109:
	popq	%rbp
	ret
	.data
	.lcomm	L115,8
	.lcomm	L116,8
	.text
Cstmt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L115, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L115, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L116, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CToken, %rax
	jmp	L119
L120:
	call	Cbreak_stmt
	jmp	L118
L121:
	call	Ccontinue_stmt
	jmp	L118
L122:
	call	Cdo_stmt
	jmp	L118
L123:
	call	Cfor_stmt
	jmp	L118
L124:
	call	Cif_stmt
	jmp	L118
L125:
	call	Creturn_stmt
	jmp	L118
L126:
	call	Cswitch_stmt
	jmp	L118
L127:
	call	Cwhile_stmt
	jmp	L118
L128:
	movq	$1, %rax
	pushq	%rax
	call	Ccompound
	addq	$8, %rsp
	jmp	L118
L129:
	call	Cscan
	movq	%rax, CToken
	jmp	L118
L130:
	movq	$38, %rax
	pushq	%rax
	call	Cwrong_ctx
	addq	$8, %rsp
	jmp	L118
L131:
	movq	$32, %rax
	pushq	%rax
	call	Cwrong_ctx
	addq	$8, %rsp
	jmp	L118
L132:
	movq	$0, %rax
	pushq	%rax
	leaq	-24(%rbp), %rax
	pushq	%rax
	call	Cexpr
	addq	$16, %rsp
	call	Csemi
	call	Ccommit
	jmp	L118
	jmp	L118
L119:
	movq	$L133, %rdx
	jmp	switch
L133:
	.quad	12
	.quad	31, L120
	.quad	36, L121
	.quad	39, L122
	.quad	45, L123
	.quad	47, L124
	.quad	59, L125
	.quad	66, L126
	.quad	71, L127
	.quad	51, L128
	.quad	61, L129
	.quad	38, L130
	.quad	32, L131
	.quad	L132
L118:
	movq	$1, %rax
	pushq	%rax
	call	Cclear
	addq	$8, %rsp
L117:
	addq	$24, %rsp
	popq	%rbp
	ret

