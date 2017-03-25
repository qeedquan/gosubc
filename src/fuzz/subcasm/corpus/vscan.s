	.text
	.data
	.lcomm	Cinf,8
Cinp:	.quad	0
Cnchar:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
Cnext:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1, %rax
	pushq	%rax
	movq	$110, %rax
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
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	$110, %rax
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
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
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
	movq	Cnchar, %rax
	incq	Cnchar
	movq	Cinf, %rax
	orq	%rax, %rax
	jnz	L5
	jmp	L4
L5:
	movq	Cinf, %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	jmp	L3
L4:
	movq	Cinp, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jz	L7
	jmp	L6
L7:
	movq	$-1, %rax
	jmp	L3
L6:
	movq	Cinp, %rax
	incq	Cinp
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L3
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L8,8
	.lcomm	L9,8
	.text
Cback:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L8, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L8, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L9, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	Cnchar, %rax
	decq	Cnchar
	movq	Cinf, %rax
	orq	%rax, %rax
	jnz	L12
	jmp	L11
L12:
	movq	Cinf, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cungetc
	addq	$16, %rsp
	jmp	L13
L11:
	movq	Cinp, %rax
	decq	Cinp
L13:
L10:
	popq	%rbp
	ret
	.data
	.lcomm	L14,8
	.lcomm	L15,8
	.text
Cskip:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L14, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L15, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
L18:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L19
	jmp	L17
L19:
	jmp	L18
L17:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cback
	addq	$8, %rsp
L16:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L20,16
	.lcomm	L21,16
	.text
Cscanchar:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L20, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
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
	movq	$114, %rax
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
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L21, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
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
	movq	$114, %rax
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
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L24
	jmp	L23
L24:
	movq	$1, %rax
	movq	%rax, 24(%rbp)
L23:
L26:
	movq	24(%rbp), %rax
	decq	24(%rbp)
	orq	%rax, %rax
	jnz	L27
	jmp	L25
L27:
	call	Cnext
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L29
	jmp	L28
L29:
	movq	$0, %rax
	jmp	L22
L28:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L31
	jmp	L30
L31:
	movq	16(%rbp), %rax
	incq	16(%rbp)
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
L30:
	jmp	L26
L25:
	movq	$1, %rax
	jmp	L22
L22:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L32,8
	.lcomm	L33,8
	.text
Cscanstr:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L32, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L32, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$L33, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L33, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	24(%rbp), %rax
	movq	%rax, -8(%rbp)
L36:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L38
	incq	%rdx
L38:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L39
	jmp	L37
L39:
	movq	-8(%rbp), %rax
	decq	-8(%rbp)
L37:
	orq	%rax, %rax
	jnz	L40
	jmp	L35
L40:
	call	Cnext
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L42
	jmp	L41
L42:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$-1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L43
	incq	%rdx
L43:
	movq	%rdx, %rax
L41:
	orq	%rax, %rax
	jnz	L45
	jmp	L44
L45:
	movq	$1, %rax
	jmp	L34
L44:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L47
	jmp	L46
L47:
	movq	16(%rbp), %rax
	incq	16(%rbp)
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
L46:
	jmp	L36
L35:
	movq	$1, %rax
	jmp	L34
L34:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L48,8
	.lcomm	L49,8
	.lcomm	L50,128
	.text
Cmkclass:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$0, -8(%rbp)
	movq	$L48, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L48, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L49, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
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
	movq	$L50, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$94, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L53
	jmp	L52
L53:
	movq	16(%rbp), %rax
	incq	16(%rbp)
	movq	$L50, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rdx
	movb	%al, (%rdx)
L52:
	movq	$1, %rax
	movq	%rax, -8(%rbp)
L55:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L57
	jmp	L56
L57:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$93, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L58
	incq	%rdx
L58:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L59
	jmp	L56
L59:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$127, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L60
	incq	%rdx
L60:
	movq	%rdx, %rax
L56:
	orq	%rax, %rax
	jnz	L61
	jmp	L54
L61:
	movq	$L50, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	incq	16(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$127, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L63
	jmp	L62
L63:
	movq	-8(%rbp), %rax
	decq	-8(%rbp)
L62:
	movq	16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$45, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L65
	incq	%rdx
L65:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L66
	jmp	L64
L66:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L67
	jmp	L64
L67:
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$93, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L68
	incq	%rdx
L68:
	movq	%rdx, %rax
L64:
	orq	%rax, %rax
	jnz	L70
	jmp	L69
L70:
	movq	$-1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	movq	%rax, -16(%rbp)
L71:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L75
	jmp	L73
L75:
	jmp	L72
L74:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L71
L72:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$127, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L77
	jmp	L76
L77:
	movq	$L50, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
L76:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L74
L73:
L69:
	jmp	L55
L54:
	movq	$L50, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L50, %rax
	jmp	L51
L51:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L78,8
	.lcomm	L79,8
	.text
Cnstrchr:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L78, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L78, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L79, %rax
	pushq	%rax
	movq	$8, %rax
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
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	jmp	L80
L80:
	popq	%rbp
	ret
	.data
	.lcomm	L81,16
	.lcomm	L82,16
	.text
Cscanclass:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-32, %rsp
	movq	$L81, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L81, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L82, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	incq	24(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L86
	jmp	L84
L86:
	movq	$Cnstrchr, %rax
	jmp	L85
L84:
	movq	$Cstrchr, %rax
L85:
	movq	%rax, -32(%rbp)
L88:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L91
	incq	%rdx
L91:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L92
	jmp	L89
L92:
	movq	-16(%rbp), %rax
	decq	-16(%rbp)
L89:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L93
	jmp	L90
L93:
	call	Cnext
	movq	%rax, -24(%rbp)
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	call	*%rax
	addq	$16, %rsp
L90:
	orq	%rax, %rax
	jnz	L94
	jmp	L87
L94:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L96
	jmp	L95
L96:
	movq	16(%rbp), %rax
	incq	16(%rbp)
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
L95:
	jmp	L88
L87:
	movq	$1, %rax
	jmp	L83
L83:
	addq	$32, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L97,8
	.lcomm	L98,8
	.text
Cscannum:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-64, %rsp
	movq	$1, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -56(%rbp)
	movq	$L97, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L97, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
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
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L98, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	movq	%rax, -24(%rbp)
	call	Cskip
	call	Cnext
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	decq	-24(%rbp)
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$45, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L101
	jmp	L100
L101:
	movq	$-1, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	decq	-24(%rbp)
	call	Cnext
	movq	%rax, -64(%rbp)
	jmp	L102
L100:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$43, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L104
	jmp	L103
L104:
	call	Cnext
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	decq	-24(%rbp)
L103:
L102:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L107
	incq	%rdx
L107:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L108
	jmp	L105
L108:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L109
	incq	%rdx
L109:
	movq	%rdx, %rax
L105:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L110
	jmp	L106
L110:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L111
	incq	%rdx
L111:
	movq	%rdx, %rax
L106:
	orq	%rax, %rax
	jnz	L113
	jmp	L112
L113:
	call	Cnext
	movq	%rax, -64(%rbp)
	pushq	%rax
	movq	$120, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L115
	incq	%rdx
L115:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L116
	jmp	L114
L116:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$88, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L117
	incq	%rdx
L117:
	movq	%rdx, %rax
L114:
	orq	%rax, %rax
	jnz	L119
	jmp	L118
L119:
	movq	$16, %rax
	movq	%rax, 24(%rbp)
	call	Cnext
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	decq	-24(%rbp)
	jmp	L120
L118:
	movq	-64(%rbp), %rax
	pushq	%rax
	call	Cback
	addq	$8, %rsp
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L122
	jmp	L121
L122:
	movq	$8, %rax
	movq	%rax, 24(%rbp)
L121:
	movq	$48, %rax
	movq	%rax, -64(%rbp)
L120:
	jmp	L123
L112:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L126
	incq	%rdx
L126:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L127
	jmp	L124
L127:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L128
	incq	%rdx
L128:
	movq	%rdx, %rax
L124:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
	orq	%rax, %rax
	jnz	L129
	jmp	L125
L129:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$48, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L130
	incq	%rdx
L130:
	movq	%rdx, %rax
L125:
	orq	%rax, %rax
	jnz	L132
	jmp	L131
L132:
	movq	$8, %rax
	movq	%rax, 24(%rbp)
	call	Cnext
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	decq	-24(%rbp)
L131:
L123:
	movq	32(%rbp), %rax
	orq	%rax, %rax
	jnz	L134
	jmp	L133
L134:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L135
	incq	%rdx
L135:
	movq	%rdx, %rax
L133:
	orq	%rax, %rax
	jnz	L137
	jmp	L136
L137:
	movq	$0, %rax
	jmp	L99
L136:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L139
	jmp	L138
L139:
	movq	$10, %rax
	movq	%rax, 24(%rbp)
L138:
	.data
L140:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	'6'
	.byte	'7'
	.byte	'8'
	.byte	'9'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L140, %rax
	movq	%rax, -40(%rbp)
L142:
	movq	32(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L144
	incq	%rdx
L144:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L145
	jmp	L143
L145:
	movq	-24(%rbp), %rax
	decq	-24(%rbp)
L143:
	orq	%rax, %rax
	jnz	L146
	jmp	L141
L146:
	movq	-64(%rbp), %rax
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L148
	jmp	L147
L148:
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L149
	incq	%rdx
L149:
	movq	%rdx, %rax
L147:
	orq	%rax, %rax
	jnz	L151
	jmp	L150
L151:
	jmp	L141
L150:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -56(%rbp)
	call	Cnext
	movq	%rax, -64(%rbp)
	movq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	L142
L141:
	movq	-64(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L153
	jmp	L152
L153:
	movq	-64(%rbp), %rax
	pushq	%rax
	call	Cback
	addq	$8, %rsp
L152:
	movq	-16(%rbp), %rax
	orq	%rax, %rax
	jz	L155
	jmp	L154
L155:
	movq	$0, %rax
	jmp	L99
L154:
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L157
	jmp	L156
L157:
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
L156:
	movq	$1, %rax
	jmp	L99
L99:
	addq	$64, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L158,8
	.lcomm	L159,8
	.text
	.globl	C_vscan
C_vscan:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-56, %rsp
	movq	$0, -24(%rbp)
	movq	$L158, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L158, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L159, %rax
	pushq	%rax
	movq	$7, %rax
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
	je	L162
	jmp	L161
L162:
	movq	24(%rbp), %rax
	movq	%rax, Cinp
	movq	$0, %rax
	movq	%rax, Cinf
	jmp	L163
L161:
	movq	24(%rbp), %rax
	movq	%rax, Cinf
L163:
	movq	$0, %rax
	movq	%rax, Cnchar
L165:
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L166
	jmp	L164
L166:
	movq	$0, %rax
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$37, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L168
	incq	%rdx
L168:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L169
	jmp	L167
L169:
	movq	$1, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$37, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L170
	incq	%rdx
L170:
	movq	%rdx, %rax
L167:
	orq	%rax, %rax
	jnz	L172
	jmp	L171
L172:
	movq	$0, %rax
	movq	%rax, -16(%rbp)
	movq	32(%rbp), %rax
	incq	32(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$42, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L174
	jmp	L173
L174:
	movq	32(%rbp), %rax
	incq	32(%rbp)
	movq	$1, %rax
	movq	%rax, -8(%rbp)
L173:
L176:
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L177
	jmp	L175
L177:
	movq	$10, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	imulq	%rcx, %rax
	pushq	%rax
	movq	32(%rbp), %rax
	incq	32(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$48, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	movq	%rax, -16(%rbp)
	jmp	L176
L175:
	movq	$0, %rax
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	32(%rbp), %rax
	incq	32(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L179
L180:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L182
	jmp	L181
L182:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L181:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscanchar
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L184
	jmp	L183
L184:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L183:
	jmp	L178
L185:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L187
	jmp	L186
L187:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L186:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscannum
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L189
	jmp	L188
L189:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L188:
	jmp	L178
L190:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L192
	jmp	L191
L192:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L191:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscannum
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L194
	jmp	L193
L194:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L193:
	jmp	L178
L195:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L197
	jmp	L196
L197:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L196:
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	Cnchar, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L178
L198:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L200
	jmp	L199
L200:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L199:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscannum
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L202
	jmp	L201
L202:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L201:
	jmp	L178
L203:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L205
	jmp	L204
L205:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L204:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscanstr
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L207
	jmp	L206
L207:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L206:
	jmp	L178
L208:
L209:
L210:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L212
	jmp	L211
L212:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L211:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscannum
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L214
	jmp	L213
L214:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L213:
	jmp	L178
L215:
	movq	-8(%rbp), %rax
	orq	%rax, %rax
	jz	L217
	jmp	L216
L217:
	movq	40(%rbp), %rax
	subq	$8, 40(%rbp)
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
L216:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	call	Cmkclass
	addq	$8, %rsp
	pushq	%rax
	movq	-56(%rbp), %rax
	pushq	%rax
	call	Cscanclass
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L219
	jmp	L218
L219:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
L218:
	jmp	L178
	jmp	L178
L179:
	movq	$L220, %rdx
	jmp	switch
L220:
	.quad	10
	.quad	99, L180
	.quad	100, L185
	.quad	105, L190
	.quad	110, L195
	.quad	111, L198
	.quad	115, L203
	.quad	112, L208
	.quad	120, L209
	.quad	88, L210
	.quad	91, L215
	.quad	L178
L178:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L222
	jmp	L221
L222:
	jmp	L164
L221:
	jmp	L223
L171:
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$37, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L225
	jmp	L224
L225:
	movq	32(%rbp), %rax
	incq	32(%rbp)
L224:
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L227
	jmp	L226
L227:
L229:
	call	Cnext
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	movq	%rax, -32(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L230
	jmp	L228
L230:
	jmp	L229
L228:
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cback
	addq	$8, %rsp
	jmp	L231
L226:
	movq	32(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	call	Cnext
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L233
	jmp	L232
L233:
	jmp	L164
L232:
L231:
	movq	32(%rbp), %rax
	incq	32(%rbp)
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
L223:
	jmp	L165
L164:
	movq	-24(%rbp), %rax
	jmp	L160
L160:
	addq	$56, %rsp
	popq	%rbp
	ret

