	.text
	.data
	.globl	CVerbose
CVerbose:	.quad	0
	.globl	CErrors
CErrors:	.quad	0
	.lcomm	L1,8
	.lcomm	L2,8
	.text
	.globl	Cfail
Cfail:	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L4:
	.byte	37
	.byte	's'
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	10
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
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$24, %rsp
	movq	CErrors, %rax
	incq	CErrors
L3:
	popq	%rbp
	ret
	.data
	.lcomm	L5,8
	.lcomm	L6,8
	.text
	.globl	Cpr
Cpr:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L5, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CVerbose, %rax
	orq	%rax, %rax
	jnz	L9
	jmp	L8
L9:
	.data
L10:
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L10, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	call	Ckprintf
	addq	$24, %rsp
L8:
L7:
	popq	%rbp
	ret
	.data
	.lcomm	L11,16
	.lcomm	L12,16
	.text
	.globl	Ctest_memfn
Ctest_memfn:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-160, %rsp
	movq	$L11, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L11, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L12, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L14:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.text
	movq	$L14, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L15:
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'0'
	.byte	'1'
	.byte	0
	.byte	0
	.text
	movq	$L15, %rax
	movq	%rax, -8(%rbp)
	.data
L16:
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	'0'
	.byte	'3'
	.byte	0
	.byte	0
	.text
	movq	$L16, %rax
	movq	%rax, -16(%rbp)
	movq	$5, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L18
	jmp	L17
L18:
	.data
L19:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L19, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L17:
	movq	$6, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jz	L21
	jmp	L20
L21:
	.data
L22:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L22, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L20:
	movq	$6, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	pushq	%rax
	movq	$-2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L24
	jmp	L23
L24:
	.data
L25:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L25, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L23:
	movq	$6, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L27
	jmp	L26
L27:
	.data
L28:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L28, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L26:
	.data
L29:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	0
	.byte	0
	.text
	movq	$L29, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L30:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	'h'
	.byte	'i'
	.byte	'j'
	.byte	'k'
	.byte	'l'
	.byte	'm'
	.byte	'n'
	.byte	'o'
	.byte	'p'
	.byte	'q'
	.byte	'r'
	.byte	's'
	.byte	't'
	.byte	'u'
	.byte	'v'
	.byte	'w'
	.byte	'x'
	.byte	'y'
	.byte	'z'
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L30, %rax
	movq	%rax, -8(%rbp)
	movq	$36, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	$36, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L32
	jmp	L31
L32:
	.data
L33:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L33, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L31:
	movq	$36, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$18, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	$18, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$18, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L35
	jmp	L34
L35:
	.data
L36:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L36, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L34:
	movq	$36, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$18, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	$18, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L38
	jmp	L37
L38:
	.data
L39:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L39, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L37:
	.data
L40:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	0
	.text
	movq	$L40, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$36, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	$35, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemmove
	addq	$24, %rsp
	movq	$35, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jz	L42
	jmp	L41
L42:
	leaq	-152(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$97, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L43
	incq	%rdx
L43:
	movq	%rdx, %rax
L41:
	orq	%rax, %rax
	jnz	L45
	jmp	L44
L45:
	.data
L46:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L46, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L44:
	movq	$36, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemcpy
	addq	$24, %rsp
	movq	$35, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemmove
	addq	$24, %rsp
	movq	$35, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jz	L48
	jmp	L47
L48:
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$35, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$57, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L49
	incq	%rdx
L49:
	movq	%rdx, %rax
L47:
	orq	%rax, %rax
	jnz	L51
	jmp	L50
L51:
	.data
L52:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L52, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L50:
	.data
L53:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$L53, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -160(%rbp)
L54:
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L58
	jmp	L56
L58:
	jmp	L55
L57:
	movq	-160(%rbp), %rax
	incq	-160(%rbp)
	jmp	L54
L55:
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L57
L56:
	movq	$64, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemset
	addq	$24, %rsp
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$63, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L60
	jmp	L59
L60:
	.data
L61:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L61, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L59:
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$64, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jz	L63
	jmp	L62
L63:
	.data
L64:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L64, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L62:
	movq	$0, %rax
	movq	%rax, -160(%rbp)
L65:
	movq	-160(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L69
	jmp	L67
L69:
	jmp	L66
L68:
	movq	-160(%rbp), %rax
	incq	-160(%rbp)
	jmp	L65
L66:
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	-160(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$-1, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L68
L67:
	movq	$64, %rax
	pushq	%rax
	movq	$123, %rax
	pushq	%rax
	leaq	-152(%rbp), %rax
	pushq	%rax
	call	Cmemset
	addq	$24, %rsp
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$63, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$123, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L71
	jmp	L70
L71:
	.data
L72:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L72, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L70:
	leaq	-152(%rbp), %rax
	pushq	%rax
	movq	$64, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$123, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L74
	jmp	L73
L74:
	.data
L75:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L75, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L73:
	.data
L76:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	0
	.byte	0
	.text
	movq	$L76, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L77:
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	'X'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L77, %rax
	movq	%rax, -8(%rbp)
	movq	$16, %rax
	pushq	%rax
	movq	$88, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemchr
	addq	$24, %rsp
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L79
	jmp	L78
L79:
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$88, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L80
	incq	%rdx
L80:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L81
	jmp	L78
L81:
	movq	$1, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L82
	incq	%rdx
L82:
	movq	%rdx, %rax
L78:
	orq	%rax, %rax
	jnz	L84
	jmp	L83
L84:
	.data
L85:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L85, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L83:
	movq	$15, %rax
	pushq	%rax
	movq	$88, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cmemchr
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L87
	jmp	L86
L87:
	.data
L88:
	.byte	'm'
	.byte	'e'
	.byte	'm'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L88, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L86:
L13:
	addq	$160, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L89,8
	.lcomm	L90,8
	.text
	.globl	Cxstrchr
Cxstrchr:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L89, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L89, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L90, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L93
	jmp	L92
L93:
	movq	$0, %rax
	jmp	L91
L92:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	jmp	L91
L91:
	popq	%rbp
	ret
	.data
	.lcomm	L94,16
	.lcomm	L95,16
	.text
	.globl	Ctest_chrfn
Ctest_chrfn:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-456, %rsp
	movq	$L94, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L94, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L95, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L97:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	0
	.byte	0
	.text
	movq	$L97, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L98:
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	'X'
	.byte	'1'
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	46
	.byte	'X'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L98, %rax
	movq	%rax, -8(%rbp)
	movq	$88, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L100
	jmp	L99
L100:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$88, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L101
	incq	%rdx
L101:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L102
	jmp	L99
L102:
	movq	$1, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$49, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L103
	incq	%rdx
L103:
	movq	%rdx, %rax
L99:
	orq	%rax, %rax
	jnz	L105
	jmp	L104
L105:
	.data
L106:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L106, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L104:
	movq	$90, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L108
	jmp	L107
L108:
	.data
L109:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L109, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L107:
	.data
L110:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	0
	.text
	movq	$L110, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$88, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrrchr
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L112
	jmp	L111
L112:
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$88, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L113
	incq	%rdx
L113:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L114
	jmp	L111
L114:
	movq	$1, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$50, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L115
	incq	%rdx
L115:
	movq	%rdx, %rax
L111:
	orq	%rax, %rax
	jnz	L117
	jmp	L116
L117:
	.data
L118:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L118, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L116:
	movq	$90, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrrchr
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L120
	jmp	L119
L120:
	.data
L121:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L121, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L119:
	.data
L122:
	.byte	'i'
	.byte	's'
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L122, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L123:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L123, %rax
	movq	%rax, -32(%rbp)
	.data
L124:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	'h'
	.byte	'i'
	.byte	'j'
	.byte	'k'
	.byte	'l'
	.byte	'm'
	.byte	'n'
	.byte	'o'
	.byte	'p'
	.byte	'q'
	.byte	'r'
	.byte	's'
	.byte	't'
	.byte	'u'
	.byte	'v'
	.byte	'w'
	.byte	'x'
	.byte	'y'
	.byte	'z'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L124, %rax
	movq	%rax, -40(%rbp)
	.data
L125:
	.byte	'A'
	.byte	'B'
	.byte	'C'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	'G'
	.byte	'H'
	.byte	'I'
	.byte	'J'
	.byte	'K'
	.byte	'L'
	.byte	'M'
	.byte	'N'
	.byte	'O'
	.byte	'P'
	.byte	'Q'
	.byte	'R'
	.byte	'S'
	.byte	'T'
	.byte	'U'
	.byte	'V'
	.byte	'W'
	.byte	'X'
	.byte	'Y'
	.byte	'Z'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L125, %rax
	movq	%rax, -48(%rbp)
	.data
L126:
	.byte	9
	.byte	11
	.byte	12
	.byte	10
	.byte	13
	.byte	32
	.byte	0
	.byte	0
	.text
	movq	$L126, %rax
	movq	%rax, -64(%rbp)
	.data
L127:
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	58
	.byte	59
	.byte	60
	.byte	61
	.byte	62
	.byte	63
	.byte	64
	.byte	91
	.byte	92
	.byte	93
	.byte	94
	.byte	95
	.byte	96
	.byte	123
	.byte	124
	.byte	125
	.byte	126
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L127, %rax
	movq	%rax, -72(%rbp)
	movq	-40(%rbp), %rax
	pushq	%rax
	leaq	-200(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	-48(%rbp), %rax
	pushq	%rax
	leaq	-200(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	leaq	-200(%rbp), %rax
	pushq	%rax
	leaq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	-32(%rbp), %rax
	pushq	%rax
	leaq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	movq	-32(%rbp), %rax
	pushq	%rax
	leaq	-456(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L128:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'A'
	.byte	'B'
	.byte	'C'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L128, %rax
	pushq	%rax
	leaq	-456(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	movq	$0, %rax
	movq	%rax, -24(%rbp)
L129:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L133
	jmp	L131
L133:
	jmp	L130
L132:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
	jmp	L129
L130:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisalnum
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L135
	jmp	L134
L135:
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-328(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L134:
	orq	%rax, %rax
	jnz	L137
	jmp	L136
L137:
	.data
L138:
	.byte	'i'
	.byte	's'
	.byte	'a'
	.byte	'l'
	.byte	'n'
	.byte	'u'
	.byte	'm'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L138, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L136:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisalpha
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L140
	jmp	L139
L140:
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-200(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L139:
	orq	%rax, %rax
	jnz	L142
	jmp	L141
L142:
	.data
L143:
	.byte	'i'
	.byte	's'
	.byte	'a'
	.byte	'l'
	.byte	'p'
	.byte	'h'
	.byte	'a'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L143, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L141:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Ciscntrl
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L145
	jmp	L144
L145:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$31, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L146
	incq	%rdx
L146:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L147
	jmp	L144
L147:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$127, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L148
	incq	%rdx
L148:
	movq	%rdx, %rax
L144:
	orq	%rax, %rax
	jnz	L150
	jmp	L149
L150:
	.data
L151:
	.byte	'i'
	.byte	's'
	.byte	'c'
	.byte	'r'
	.byte	'n'
	.byte	't'
	.byte	'l'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L151, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L149:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L153
	jmp	L152
L153:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L152:
	orq	%rax, %rax
	jnz	L155
	jmp	L154
L155:
	.data
L156:
	.byte	'i'
	.byte	's'
	.byte	'd'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L156, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L154:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisgraph
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L158
	jmp	L157
L158:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$33, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L159
	incq	%rdx
L159:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L160
	jmp	L157
L160:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$126, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L161
	incq	%rdx
L161:
	movq	%rdx, %rax
L157:
	orq	%rax, %rax
	jnz	L163
	jmp	L162
L163:
	.data
L164:
	.byte	'i'
	.byte	's'
	.byte	'g'
	.byte	'r'
	.byte	'a'
	.byte	'p'
	.byte	'h'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L164, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L162:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cislower
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L166
	jmp	L165
L166:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L165:
	orq	%rax, %rax
	jnz	L168
	jmp	L167
L168:
	.data
L169:
	.byte	'i'
	.byte	's'
	.byte	'l'
	.byte	'o'
	.byte	'w'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L169, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L167:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisprint
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L172
	jmp	L170
L172:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L173
	incq	%rdx
L173:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L174
	jmp	L171
L174:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$126, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L175
	incq	%rdx
L175:
	movq	%rdx, %rax
L171:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L170:
	orq	%rax, %rax
	jnz	L177
	jmp	L176
L177:
	.data
L178:
	.byte	'i'
	.byte	's'
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L178, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L176:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cispunct
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L180
	jmp	L179
L180:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-72(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L179:
	orq	%rax, %rax
	jnz	L182
	jmp	L181
L182:
	.data
L183:
	.byte	'i'
	.byte	's'
	.byte	'p'
	.byte	'u'
	.byte	'n'
	.byte	'c'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L183, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L181:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L185
	jmp	L184
L185:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L184:
	orq	%rax, %rax
	jnz	L187
	jmp	L186
L187:
	.data
L188:
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'p'
	.byte	'a'
	.byte	'c'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L188, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L186:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisupper
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L190
	jmp	L189
L190:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L189:
	orq	%rax, %rax
	jnz	L192
	jmp	L191
L192:
	.data
L193:
	.byte	'i'
	.byte	's'
	.byte	'u'
	.byte	'p'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L193, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L191:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisxdigit
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L195
	jmp	L194
L195:
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-456(%rbp), %rax
	pushq	%rax
	call	Cstrchr
	addq	$16, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L194:
	orq	%rax, %rax
	jnz	L197
	jmp	L196
L197:
	.data
L198:
	.byte	'i'
	.byte	's'
	.byte	'x'
	.byte	'd'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L198, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L196:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisalnum
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L200
	jmp	L199
L200:
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-328(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L199:
	orq	%rax, %rax
	jnz	L202
	jmp	L201
L202:
	.data
L203:
	.byte	'i'
	.byte	's'
	.byte	'a'
	.byte	'l'
	.byte	'n'
	.byte	'u'
	.byte	'm'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L203, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L201:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisalpha
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L205
	jmp	L204
L205:
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-200(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L204:
	orq	%rax, %rax
	jnz	L207
	jmp	L206
L207:
	.data
L208:
	.byte	'i'
	.byte	's'
	.byte	'a'
	.byte	'l'
	.byte	'p'
	.byte	'h'
	.byte	'a'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L208, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L206:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Ciscntrl
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L211
	jmp	L209
L211:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L212
	incq	%rdx
L212:
	movq	%rdx, %rax
	orq	%rax, %rax
	jz	L213
	jmp	L210
L213:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$126, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L214
	incq	%rdx
L214:
	movq	%rdx, %rax
L210:
	negq	%rax
	sbbq	%rax, %rax
	negq	%rax
L209:
	orq	%rax, %rax
	jnz	L216
	jmp	L215
L216:
	.data
L217:
	.byte	'i'
	.byte	's'
	.byte	'c'
	.byte	'r'
	.byte	'n'
	.byte	't'
	.byte	'l'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L217, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L215:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisdigit
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L219
	jmp	L218
L219:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-32(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L218:
	orq	%rax, %rax
	jnz	L221
	jmp	L220
L221:
	.data
L222:
	.byte	'i'
	.byte	's'
	.byte	'd'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L222, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L220:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisgraph
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L224
	jmp	L223
L224:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$32, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L225
	incq	%rdx
L225:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L226
	jmp	L223
L226:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$127, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L227
	incq	%rdx
L227:
	movq	%rdx, %rax
L223:
	orq	%rax, %rax
	jnz	L229
	jmp	L228
L229:
	.data
L230:
	.byte	'i'
	.byte	's'
	.byte	'g'
	.byte	'r'
	.byte	'a'
	.byte	'p'
	.byte	'h'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L230, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L228:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cislower
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L232
	jmp	L231
L232:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L231:
	orq	%rax, %rax
	jnz	L234
	jmp	L233
L234:
	.data
L235:
	.byte	'i'
	.byte	's'
	.byte	'l'
	.byte	'o'
	.byte	'w'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L235, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L233:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisprint
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L237
	jmp	L236
L237:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$31, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L238
	incq	%rdx
L238:
	movq	%rdx, %rax
	orq	%rax, %rax
	jnz	L239
	jmp	L236
L239:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$127, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L240
	incq	%rdx
L240:
	movq	%rdx, %rax
L236:
	orq	%rax, %rax
	jnz	L242
	jmp	L241
L242:
	.data
L243:
	.byte	'i'
	.byte	's'
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L243, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L241:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cispunct
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L245
	jmp	L244
L245:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-72(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L244:
	orq	%rax, %rax
	jnz	L247
	jmp	L246
L247:
	.data
L248:
	.byte	'i'
	.byte	's'
	.byte	'p'
	.byte	'u'
	.byte	'n'
	.byte	'c'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L248, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L246:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisspace
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L250
	jmp	L249
L250:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L249:
	orq	%rax, %rax
	jnz	L252
	jmp	L251
L252:
	.data
L253:
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'p'
	.byte	'a'
	.byte	'c'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L253, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L251:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisupper
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L255
	jmp	L254
L255:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L254:
	orq	%rax, %rax
	jnz	L257
	jmp	L256
L257:
	.data
L258:
	.byte	'i'
	.byte	's'
	.byte	'u'
	.byte	'p'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L258, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L256:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisxdigit
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L260
	jmp	L259
L260:
	movq	-24(%rbp), %rax
	pushq	%rax
	leaq	-456(%rbp), %rax
	pushq	%rax
	call	Cxstrchr
	addq	$16, %rsp
L259:
	orq	%rax, %rax
	jnz	L262
	jmp	L261
L262:
	.data
L263:
	.byte	'i'
	.byte	's'
	.byte	'x'
	.byte	'd'
	.byte	'i'
	.byte	'g'
	.byte	'i'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L263, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L261:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisupper
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L265
	jmp	L264
L265:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	call	Cislower
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L264:
	orq	%rax, %rax
	jnz	L267
	jmp	L266
L267:
	.data
L268:
	.byte	't'
	.byte	'o'
	.byte	'l'
	.byte	'o'
	.byte	'w'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L268, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L266:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cislower
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L270
	jmp	L269
L270:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Ctoupper
	addq	$8, %rsp
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L271
	incq	%rdx
L271:
	movq	%rdx, %rax
L269:
	orq	%rax, %rax
	jnz	L273
	jmp	L272
L273:
	.data
L274:
	.byte	't'
	.byte	'o'
	.byte	'l'
	.byte	'o'
	.byte	'w'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L274, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L272:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cislower
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L276
	jmp	L275
L276:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Ctoupper
	addq	$8, %rsp
	pushq	%rax
	call	Cisupper
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L275:
	orq	%rax, %rax
	jnz	L278
	jmp	L277
L278:
	.data
L279:
	.byte	't'
	.byte	'o'
	.byte	'u'
	.byte	'p'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L279, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L277:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cisupper
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L281
	jmp	L280
L281:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Ctolower
	addq	$8, %rsp
	pushq	%rax
	call	Ctoupper
	addq	$8, %rsp
	pushq	%rax
	movq	-24(%rbp), %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L282
	incq	%rdx
L282:
	movq	%rdx, %rax
L280:
	orq	%rax, %rax
	jnz	L284
	jmp	L283
L284:
	.data
L285:
	.byte	't'
	.byte	'o'
	.byte	'u'
	.byte	'p'
	.byte	'p'
	.byte	'e'
	.byte	'r'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L285, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L283:
	jmp	L132
L131:
L96:
	addq	$456, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L286,16
	.lcomm	L287,16
	.text
	.globl	Ctest_dmem
Ctest_dmem:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-536, %rsp
	movq	$L286, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L286, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L287, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L289:
	.byte	'm'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	0
	.byte	0
	.text
	movq	$L289, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -528(%rbp)
L290:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L294
	jmp	L292
L294:
	jmp	L291
L293:
	movq	-528(%rbp), %rax
	incq	-528(%rbp)
	jmp	L290
L291:
	leaq	-512(%rbp), %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1024, %rax
	pushq	%rax
	call	Cmalloc
	addq	$8, %rsp
	popq	%rdx
	movq	%rax, (%rdx)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L296
	jmp	L295
L296:
	jmp	L292
L295:
	movq	$0, %rax
	movq	%rax, -536(%rbp)
L297:
	movq	-536(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L301
	jmp	L299
L301:
	jmp	L298
L300:
	movq	-536(%rbp), %rax
	incq	-536(%rbp)
	jmp	L297
L298:
	leaq	-512(%rbp), %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-536(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L300
L299:
	jmp	L293
L292:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L303
	jmp	L302
L303:
	.data
L304:
	.byte	'm'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L304, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L302:
	movq	$0, %rax
	movq	%rax, -528(%rbp)
L305:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L309
	jmp	L307
L309:
	jmp	L306
L308:
	movq	-528(%rbp), %rax
	incq	-528(%rbp)
	jmp	L305
L306:
	movq	$0, %rax
	movq	%rax, -536(%rbp)
L310:
	movq	-536(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L314
	jmp	L312
L314:
	jmp	L311
L313:
	movq	-536(%rbp), %rax
	incq	-536(%rbp)
	jmp	L310
L311:
	leaq	-512(%rbp), %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-536(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-528(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L316
	jmp	L315
L316:
	jmp	L312
L315:
	jmp	L313
L312:
	movq	$1024, %rax
	pushq	%rax
	movq	-536(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L318
	jmp	L317
L318:
	jmp	L307
L317:
	jmp	L308
L307:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$20, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L320
	jmp	L319
L320:
	.data
L321:
	.byte	'm'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L321, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L319:
	.data
L322:
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'e'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L322, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -536(%rbp)
L323:
	movq	-536(%rbp), %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L327
	jmp	L325
L327:
	jmp	L324
L326:
	movq	-536(%rbp), %rax
	incq	-536(%rbp)
	jmp	L323
L324:
	leaq	-512(%rbp), %rax
	pushq	%rax
	movq	-536(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfree
	addq	$8, %rsp
	jmp	L326
L325:
	.data
L328:
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	0
	.byte	0
	.text
	movq	$L328, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$1024, %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	pushq	%rax
	call	Ccalloc
	addq	$16, %rsp
	movq	%rax, -520(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L330
	jmp	L329
L330:
	.data
L331:
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L331, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L329:
	movq	$0, %rax
	movq	%rax, -528(%rbp)
L332:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L336
	jmp	L334
L336:
	jmp	L333
L335:
	movq	-528(%rbp), %rax
	incq	-528(%rbp)
	jmp	L332
L333:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	-520(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L338
	jmp	L337
L338:
	jmp	L334
L337:
	jmp	L335
L334:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L340
	jmp	L339
L340:
	.data
L341:
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L341, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L339:
	movq	-520(%rbp), %rax
	pushq	%rax
	call	Cfree
	addq	$8, %rsp
	.data
L342:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	0
	.text
	movq	$L342, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$123, %rax
	pushq	%rax
	call	Cmalloc
	addq	$8, %rsp
	movq	%rax, -520(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L344
	jmp	L343
L344:
	.data
L345:
	.byte	'm'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L345, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L343:
	movq	$0, %rax
	movq	%rax, -528(%rbp)
L346:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$123, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L350
	jmp	L348
L350:
	jmp	L347
L349:
	movq	-528(%rbp), %rax
	incq	-528(%rbp)
	jmp	L346
L347:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	-520(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-528(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L349
L348:
	movq	$257, %rax
	pushq	%rax
	movq	-520(%rbp), %rax
	pushq	%rax
	call	Crealloc
	addq	$16, %rsp
	movq	%rax, -520(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L352
	jmp	L351
L352:
	.data
L353:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L353, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L351:
	movq	$0, %rax
	movq	%rax, -528(%rbp)
L354:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$123, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L358
	jmp	L356
L358:
	jmp	L355
L357:
	movq	-528(%rbp), %rax
	incq	-528(%rbp)
	jmp	L354
L355:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	-520(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-528(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L360
	jmp	L359
L360:
	jmp	L356
L359:
	jmp	L357
L356:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$123, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L362
	jmp	L361
L362:
	.data
L363:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L363, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L361:
	movq	$97, %rax
	pushq	%rax
	movq	-520(%rbp), %rax
	pushq	%rax
	call	Crealloc
	addq	$16, %rsp
	movq	%rax, -520(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L365
	jmp	L364
L365:
	.data
L366:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L366, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L364:
	movq	$0, %rax
	movq	%rax, -528(%rbp)
L367:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L371
	jmp	L369
L371:
	jmp	L368
L370:
	movq	-528(%rbp), %rax
	incq	-528(%rbp)
	jmp	L367
L368:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	-520(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-528(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L373
	jmp	L372
L373:
	jmp	L369
L372:
	jmp	L370
L369:
	movq	-528(%rbp), %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L375
	jmp	L374
L375:
	.data
L376:
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'l'
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L376, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L374:
	movq	-520(%rbp), %rax
	pushq	%rax
	call	Cfree
	addq	$8, %rsp
L288:
	addq	$536, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L377,8
	.lcomm	L378,8
	.text
	.globl	Cqcmp
Cqcmp:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L377, %rax
	pushq	%rax
	movq	$113, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L377, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L377, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L377, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L377, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L378, %rax
	pushq	%rax
	movq	$113, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L378, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L378, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L378, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L378, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L383
	jmp	L380
L383:
	movq	$-1, %rax
	jmp	L381
L380:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L384
	jmp	L382
L384:
	movq	$1, %rax
	jmp	L381
L382:
	movq	$0, %rax
L381:
	jmp	L379
L379:
	popq	%rbp
	ret
	.data
	.lcomm	L385,16
	.lcomm	L386,16
	.text
	.globl	Ctest_sort
Ctest_sort:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-1040, %rsp
	movq	$L385, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L385, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L386, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L388:
	.byte	'q'
	.byte	's'
	.byte	'o'
	.byte	'r'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L388, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -1032(%rbp)
L389:
	movq	-1032(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L393
	jmp	L391
L393:
	jmp	L390
L392:
	movq	-1032(%rbp), %rax
	incq	-1032(%rbp)
	jmp	L389
L390:
	leaq	-1024(%rbp), %rax
	pushq	%rax
	movq	-1032(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$128, %rax
	pushq	%rax
	movq	-1032(%rbp), %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	jmp	L392
L391:
	movq	$Cqcmp, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	$128, %rax
	pushq	%rax
	leaq	-1024(%rbp), %rax
	pushq	%rax
	call	Cqsort
	addq	$32, %rsp
	movq	$0, %rax
	movq	%rax, -1032(%rbp)
	movq	%rax, -1040(%rbp)
L394:
	movq	-1032(%rbp), %rax
	pushq	%rax
	movq	$128, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L398
	jmp	L396
L398:
	jmp	L395
L397:
	movq	-1032(%rbp), %rax
	incq	-1032(%rbp)
	jmp	L394
L395:
	leaq	-1024(%rbp), %rax
	pushq	%rax
	movq	-1032(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-1040(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L400
	jmp	L399
L400:
	.data
L401:
	.byte	'q'
	.byte	's'
	.byte	'o'
	.byte	'r'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L401, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L396
L399:
	leaq	-1024(%rbp), %rax
	pushq	%rax
	movq	-1032(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -1040(%rbp)
	jmp	L397
L396:
L387:
	addq	$1040, %rsp
	popq	%rbp
	ret
	.data
Ctest_array:	.quad	2
	.quad	3
	.quad	5
	.quad	7
	.quad	11
	.quad	13
	.quad	17
	.quad	19
	.quad	23
	.quad	27
	.globl	Ctest_array
	.lcomm	L402,16
	.lcomm	L403,16
	.text
	.globl	Ctest_search
Ctest_search:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L402, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L402, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L403, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L405:
	.byte	'b'
	.byte	's'
	.byte	'e'
	.byte	'a'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	0
	.text
	movq	$L405, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$13, %rax
	movq	%rax, -8(%rbp)
	movq	$Cqcmp, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	movq	$Ctest_array, %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	call	Cbsearch
	addq	$40, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L407
	jmp	L406
L407:
	.data
L408:
	.byte	'b'
	.byte	's'
	.byte	'e'
	.byte	'a'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L408, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L406:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$13, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L410
	jmp	L409
L410:
	.data
L411:
	.byte	'b'
	.byte	's'
	.byte	'e'
	.byte	'a'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L411, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L409:
	movq	$15, %rax
	movq	%rax, -8(%rbp)
	movq	$Cqcmp, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	movq	$Ctest_array, %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	call	Cbsearch
	addq	$40, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L413
	jmp	L412
L413:
	.data
L414:
	.byte	'b'
	.byte	's'
	.byte	'e'
	.byte	'a'
	.byte	'r'
	.byte	'c'
	.byte	'h'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L414, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L412:
L404:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L415,16
	.lcomm	L416,16
	.text
	.globl	Ctest_mem
Ctest_mem:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L415, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L415, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L416, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Ctest_memfn
	call	Ctest_chrfn
	call	Ctest_dmem
	call	Ctest_sort
	call	Ctest_search
L417:
	popq	%rbp
	ret
	.data
	.lcomm	L418,16
	.lcomm	L419,16
	.text
	.globl	Ctest_str
Ctest_str:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-136, %rsp
	movq	$L418, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L418, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L419, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L421:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	0
	.byte	0
	.text
	movq	$L421, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L422:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L422, %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L424
	jmp	L423
L424:
	.data
L425:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L425, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L423:
	.data
L426:
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
	movq	$L426, %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L428
	jmp	L427
L428:
	.data
L429:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L429, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L427:
	.data
L430:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.text
	movq	$L430, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L431:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L432:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L432, %rax
	pushq	%rax
	movq	$L431, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L434
	jmp	L433
L434:
	.data
L435:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L435, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L433:
	.data
L436:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L437:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L437, %rax
	pushq	%rax
	movq	$L436, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L439
	jmp	L438
L439:
	.data
L440:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L440, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L438:
	.data
L441:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L442:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
	.text
	movq	$L442, %rax
	pushq	%rax
	movq	$L441, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	pushq	%rax
	movq	$-103, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L444
	jmp	L443
L444:
	.data
L445:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L445, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L443:
	.data
L446:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L447:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L447, %rax
	pushq	%rax
	movq	$L446, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	pushq	%rax
	movq	$103, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L449
	jmp	L448
L449:
	.data
L450:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L450, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L448:
	.data
L451:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'0'
	.byte	0
L452:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'3'
	.byte	0
	.text
	movq	$L452, %rax
	pushq	%rax
	movq	$L451, %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	pushq	%rax
	movq	$-3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L454
	jmp	L453
L454:
	.data
L455:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L455, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L453:
	.data
L456:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	0
	.byte	0
	.text
	movq	$L456, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L457:
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
	.byte	'A'
	.byte	'B'
	.byte	'C'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L457, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L458:
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
	.byte	'A'
	.byte	'B'
	.byte	'C'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L458, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L460
	jmp	L459
L460:
	.data
L461:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L461, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L459:
	.data
L462:
	.byte	'A'
	.byte	'B'
	.byte	'C'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.text
	movq	$L462, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L463:
	.byte	'A'
	.byte	'B'
	.byte	'C'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.text
	movq	$L463, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L465
	jmp	L464
L465:
	.data
L466:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L466, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L464:
	leaq	-128(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$55, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L468
	jmp	L467
L468:
	.data
L469:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L469, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L467:
	.data
L470:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$L470, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L471:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'X'
	.byte	'X'
	.byte	'X'
	.byte	'X'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L471, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	leaq	-128(%rbp), %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L472:
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L472, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	.data
L473:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.text
	movq	$L473, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L475
	jmp	L474
L475:
	.data
L476:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L476, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L474:
	leaq	-128(%rbp), %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$88, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L478
	jmp	L477
L478:
	.data
L479:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L479, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L477:
	.data
L480:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	0
	.text
	movq	$L480, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L481:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L482:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$6, %rax
	pushq	%rax
	movq	$L482, %rax
	pushq	%rax
	movq	$L481, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L484
	jmp	L483
L484:
	.data
L485:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L485, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L483:
	.data
L486:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'x'
	.byte	'x'
	.byte	0
	.byte	0
L487:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'y'
	.byte	'y'
	.byte	0
	.byte	0
	.text
	movq	$4, %rax
	pushq	%rax
	movq	$L487, %rax
	pushq	%rax
	movq	$L486, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L489
	jmp	L488
L489:
	.data
L490:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L490, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L488:
	.data
L491:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'x'
	.byte	'0'
	.byte	0
	.byte	0
L492:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'y'
	.byte	'9'
	.byte	0
	.byte	0
	.text
	movq	$5, %rax
	pushq	%rax
	movq	$L492, %rax
	pushq	%rax
	movq	$L491, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L494
	jmp	L493
L494:
	.data
L495:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L495, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L493:
	.data
L496:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'y'
	.byte	'0'
	.byte	0
	.byte	0
L497:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'x'
	.byte	'9'
	.byte	0
	.byte	0
	.text
	movq	$5, %rax
	pushq	%rax
	movq	$L497, %rax
	pushq	%rax
	movq	$L496, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L499
	jmp	L498
L499:
	.data
L500:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L500, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L498:
	.data
L501:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L502:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L502, %rax
	pushq	%rax
	movq	$L501, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L504
	jmp	L503
L504:
	.data
L505:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L505, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L503:
	.data
L506:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L507:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$7, %rax
	pushq	%rax
	movq	$L507, %rax
	pushq	%rax
	movq	$L506, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	pushq	%rax
	movq	$103, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L509
	jmp	L508
L509:
	.data
L510:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L510, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L508:
	.data
L511:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L512:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
	.text
	movq	$7, %rax
	pushq	%rax
	movq	$L512, %rax
	pushq	%rax
	movq	$L511, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	pushq	%rax
	movq	$-103, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L514
	jmp	L513
L514:
	.data
L515:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L515, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L513:
	.data
L516:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L517:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L517, %rax
	pushq	%rax
	movq	$L516, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	pushq	%rax
	movq	$103, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L519
	jmp	L518
L519:
	.data
L520:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L520, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L518:
	.data
L521:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L522:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L522, %rax
	pushq	%rax
	movq	$L521, %rax
	pushq	%rax
	call	Cstrncmp
	addq	$24, %rsp
	pushq	%rax
	movq	$-103, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L524
	jmp	L523
L524:
	.data
L525:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L525, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L523:
	.data
L526:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	0
	.text
	movq	$L526, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L527:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L527, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L528:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$6, %rax
	pushq	%rax
	movq	$L528, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrncpy
	addq	$24, %rsp
	.data
L529:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'6'
	.byte	'7'
	.byte	'8'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L529, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L531
	jmp	L530
L531:
	.data
L532:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L532, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L530:
	.data
L533:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L533, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L534:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$5, %rax
	pushq	%rax
	movq	$L534, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrncpy
	addq	$24, %rsp
	.data
L535:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	0
	.byte	'5'
	.byte	'6'
	.byte	'7'
	.byte	'8'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L535, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L537
	jmp	L536
L537:
	.data
L538:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L538, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L536:
	.data
L539:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L539, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrncpy
	addq	$24, %rsp
	.data
L540:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$10, %rax
	pushq	%rax
	movq	$L540, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L542
	jmp	L541
L542:
	.data
L543:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'p'
	.byte	'y'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L543, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L541:
	.data
L544:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	0
	.text
	movq	$L544, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L545:
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.text
	movq	$L545, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L546:
	.byte	'6'
	.byte	'7'
	.byte	'8'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$5, %rax
	pushq	%rax
	movq	$L546, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrncat
	addq	$24, %rsp
	.data
L547:
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L547, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L549
	jmp	L548
L549:
	.data
L550:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L550, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L548:
	.data
L551:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$6, %rax
	pushq	%rax
	movq	$L551, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrncat
	addq	$24, %rsp
	.data
L552:
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
	movq	$L552, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L554
	jmp	L553
L554:
	.data
L555:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'n'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L555, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L553:
	.data
L556:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	0
	.byte	0
	.text
	movq	$L556, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L557:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L558:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L558, %rax
	pushq	%rax
	movq	$L557, %rax
	pushq	%rax
	call	Cstrspn
	addq	$16, %rsp
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L560
	jmp	L559
L560:
	.data
L561:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L561, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L559:
	.data
L562:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
	.byte	0
	.byte	0
L563:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L563, %rax
	pushq	%rax
	movq	$L562, %rax
	pushq	%rax
	call	Cstrspn
	addq	$16, %rsp
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L565
	jmp	L564
L565:
	.data
L566:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L566, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L564:
	.data
L567:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L568:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L568, %rax
	pushq	%rax
	movq	$L567, %rax
	pushq	%rax
	call	Cstrspn
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L570
	jmp	L569
L570:
	.data
L571:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L571, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L569:
	.data
L572:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	0
	.text
	movq	$L572, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L573:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L574:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L574, %rax
	pushq	%rax
	movq	$L573, %rax
	pushq	%rax
	call	Cstrcspn
	addq	$16, %rsp
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L576
	jmp	L575
L576:
	.data
L577:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L577, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L575:
	.data
L578:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
	.byte	0
	.byte	0
L579:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L579, %rax
	pushq	%rax
	movq	$L578, %rax
	pushq	%rax
	call	Cstrcspn
	addq	$16, %rsp
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L581
	jmp	L580
L581:
	.data
L582:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L582, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L580:
	.data
L583:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L584:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L584, %rax
	pushq	%rax
	movq	$L583, %rax
	pushq	%rax
	call	Cstrcspn
	addq	$16, %rsp
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L586
	jmp	L585
L586:
	.data
L587:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L587, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L585:
	.data
L588:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'g'
	.byte	0
L589:
	.byte	'x'
	.byte	'y'
	.byte	'z'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L589, %rax
	pushq	%rax
	movq	$L588, %rax
	pushq	%rax
	call	Cstrcspn
	addq	$16, %rsp
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L591
	jmp	L590
L591:
	.data
L592:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'c'
	.byte	's'
	.byte	'p'
	.byte	'n'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L592, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L590:
	.data
L593:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'p'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	0
	.text
	movq	$L593, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L594:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L595:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L596:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L596, %rax
	pushq	%rax
	movq	$L595, %rax
	pushq	%rax
	movq	$L594, %rax
	pushq	%rax
	call	Cstrpbrk
	addq	$16, %rsp
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L598
	jmp	L597
L598:
	.data
L599:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'p'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L599, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L597:
	.data
L600:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'a'
	.byte	'b'
	.byte	'c'
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
L601:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L602:
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L602, %rax
	pushq	%rax
	movq	$L601, %rax
	pushq	%rax
	movq	$L600, %rax
	pushq	%rax
	call	Cstrpbrk
	addq	$16, %rsp
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L604
	jmp	L603
L604:
	.data
L605:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'p'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L605, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L603:
	.data
L606:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L607:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L607, %rax
	pushq	%rax
	movq	$L606, %rax
	pushq	%rax
	call	Cstrpbrk
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L609
	jmp	L608
L609:
	.data
L610:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'p'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L610, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L608:
	.data
L611:
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
L612:
	.byte	'x'
	.byte	'y'
	.byte	'z'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L612, %rax
	pushq	%rax
	movq	$L611, %rax
	pushq	%rax
	call	Cstrpbrk
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L614
	jmp	L613
L614:
	.data
L615:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	'p'
	.byte	'b'
	.byte	'r'
	.byte	'k'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L615, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L613:
	.data
L616:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	0
	.byte	0
	.text
	movq	$L616, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L617:
	.byte	43
	.byte	45
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L617, %rax
	movq	%rax, -136(%rbp)
	.data
L618:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	43
	.byte	43
	.byte	'b'
	.byte	'a'
	.byte	'r'
	.byte	45
	.byte	45
	.byte	45
	.byte	'b'
	.byte	'a'
	.byte	'z'
	.byte	42
	.byte	'g'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L618, %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	.data
L619:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L619, %rax
	pushq	%rax
	movq	-136(%rbp), %rax
	pushq	%rax
	leaq	-128(%rbp), %rax
	pushq	%rax
	call	Cstrtok
	addq	$16, %rsp
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L621
	jmp	L620
L621:
	.data
L622:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L622, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L620:
	.data
L623:
	.byte	'b'
	.byte	'a'
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L623, %rax
	pushq	%rax
	movq	-136(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cstrtok
	addq	$16, %rsp
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L625
	jmp	L624
L625:
	.data
L626:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L626, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L624:
	.data
L627:
	.byte	'b'
	.byte	'a'
	.byte	'z'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L627, %rax
	pushq	%rax
	movq	-136(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cstrtok
	addq	$16, %rsp
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L629
	jmp	L628
L629:
	.data
L630:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L630, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L628:
	.data
L631:
	.byte	'g'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L631, %rax
	pushq	%rax
	movq	-136(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cstrtok
	addq	$16, %rsp
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L633
	jmp	L632
L633:
	.data
L634:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L634, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L632:
	movq	-136(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cstrtok
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L636
	jmp	L635
L636:
	.data
L637:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L637, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L635:
	movq	-136(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Cstrtok
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L639
	jmp	L638
L639:
	.data
L640:
	.byte	's'
	.byte	't'
	.byte	'r'
	.byte	't'
	.byte	'o'
	.byte	'k'
	.byte	45
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L640, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L638:
L420:
	addq	$136, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L641,16
	.lcomm	L642,16
	.text
	.globl	Cspfn_test
Cspfn_test:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-256, %rsp
	movq	$L641, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L641, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L642, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
	movq	40(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L645
	jmp	L644
L645:
	.data
L646:
	.byte	's'
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'f'
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L646, %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	.data
L647:
	.byte	41
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L647, %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	movq	16(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L644:
L643:
	addq	$256, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L648,16
	.lcomm	L649,16
	.text
	.globl	Cspfs_test
Cspfs_test:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-256, %rsp
	movq	$L648, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L648, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L649, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
	movq	40(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jnz	L652
	jmp	L651
L652:
	.data
L653:
	.byte	's'
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'f'
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L653, %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcpy
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	.data
L654:
	.byte	41
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L654, %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	movq	16(%rbp), %rax
	pushq	%rax
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	leaq	-256(%rbp), %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L651:
L650:
	addq	$256, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L655,16
	.lcomm	L656,16
	.text
	.globl	Ctest_sprintf
Ctest_sprintf:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L655, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L655, %rax
	pushq	%rax
	movq	$13, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L656, %rax
	pushq	%rax
	movq	$13, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L658:
	.byte	's'
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'f'
	.byte	0
	.text
	movq	$L658, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L659:
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L660:
	.byte	37
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L661:
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L661, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L660, %rax
	pushq	%rax
	movq	$L659, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L662:
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L663:
	.byte	37
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L664:
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.text
	movq	$L664, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L663, %rax
	pushq	%rax
	movq	$L662, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L665:
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L666:
	.byte	37
	.byte	43
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L667:
	.byte	43
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.text
	movq	$L667, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L666, %rax
	pushq	%rax
	movq	$L665, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L668:
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L669:
	.byte	37
	.byte	43
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L670:
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.text
	movq	$L670, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L669, %rax
	pushq	%rax
	movq	$L668, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L671:
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L672:
	.byte	37
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L673:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L673, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L672, %rax
	pushq	%rax
	movq	$L671, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L674:
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L675:
	.byte	37
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L676:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L676, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L675, %rax
	pushq	%rax
	movq	$L674, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L677:
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L678:
	.byte	37
	.byte	43
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L679:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	43
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L679, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L678, %rax
	pushq	%rax
	movq	$L677, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L680:
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L681:
	.byte	37
	.byte	43
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L682:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L682, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L681, %rax
	pushq	%rax
	movq	$L680, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L683:
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L684:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L685:
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L685, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L684, %rax
	pushq	%rax
	movq	$L683, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L686:
	.byte	'1'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L687:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L688:
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L688, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L687, %rax
	pushq	%rax
	movq	$L686, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L689:
	.byte	'1'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L690:
	.byte	37
	.byte	45
	.byte	43
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
L691:
	.byte	43
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L691, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L690, %rax
	pushq	%rax
	movq	$L689, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L692:
	.byte	'1'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L693:
	.byte	37
	.byte	45
	.byte	43
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
L694:
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L694, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L693, %rax
	pushq	%rax
	movq	$L692, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L695:
	.byte	'1'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L696:
	.byte	37
	.byte	43
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
L697:
	.byte	43
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L697, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L696, %rax
	pushq	%rax
	movq	$L695, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L698:
	.byte	'1'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L699:
	.byte	37
	.byte	43
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
L700:
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L700, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L699, %rax
	pushq	%rax
	movq	$L698, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L701:
	.byte	'1'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L702:
	.byte	37
	.byte	32
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L703:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L703, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L702, %rax
	pushq	%rax
	movq	$L701, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L704:
	.byte	'1'
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L705:
	.byte	37
	.byte	32
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L706:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L706, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L705, %rax
	pushq	%rax
	movq	$L704, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L707:
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L708:
	.byte	37
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L709:
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L709, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L708, %rax
	pushq	%rax
	movq	$L707, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L710:
	.byte	'1'
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L711:
	.byte	37
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
L712:
	.byte	45
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L712, %rax
	pushq	%rax
	movq	$-12345, %rax
	pushq	%rax
	movq	$L711, %rax
	pushq	%rax
	movq	$L710, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L713:
	.byte	'1'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L714:
	.byte	37
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L715:
	.byte	'2'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L715, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L714, %rax
	pushq	%rax
	movq	$L713, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L716:
	.byte	'2'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L717:
	.byte	37
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L718:
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L718, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L717, %rax
	pushq	%rax
	movq	$L716, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L719:
	.byte	'2'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L720:
	.byte	37
	.byte	35
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L721:
	.byte	'0'
	.byte	'x'
	.byte	'2'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.text
	movq	$L721, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L720, %rax
	pushq	%rax
	movq	$L719, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L722:
	.byte	'2'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L723:
	.byte	37
	.byte	35
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L724:
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.text
	movq	$L724, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L723, %rax
	pushq	%rax
	movq	$L722, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L725:
	.byte	'2'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L726:
	.byte	37
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L727:
	.byte	45
	.byte	'2'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L727, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L726, %rax
	pushq	%rax
	movq	$L725, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L728:
	.byte	'2'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L729:
	.byte	37
	.byte	35
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L730:
	.byte	45
	.byte	'0'
	.byte	'x'
	.byte	'2'
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	0
	.text
	movq	$L730, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L729, %rax
	pushq	%rax
	movq	$L728, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L731:
	.byte	'2'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L732:
	.byte	37
	.byte	43
	.byte	35
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L733:
	.byte	43
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.text
	movq	$L733, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L732, %rax
	pushq	%rax
	movq	$L731, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L734:
	.byte	'2'
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L735:
	.byte	37
	.byte	35
	.byte	43
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L736:
	.byte	43
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.text
	movq	$L736, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L735, %rax
	pushq	%rax
	movq	$L734, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L737:
	.byte	'2'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L738:
	.byte	37
	.byte	35
	.byte	43
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L739:
	.byte	43
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.text
	movq	$L739, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L738, %rax
	pushq	%rax
	movq	$L737, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L740:
	.byte	'2'
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L741:
	.byte	37
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L742:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L742, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L741, %rax
	pushq	%rax
	movq	$L740, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L743:
	.byte	'2'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L744:
	.byte	37
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
L745:
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L745, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L744, %rax
	pushq	%rax
	movq	$L743, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L746:
	.byte	'3'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L747:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
L748:
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L748, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L747, %rax
	pushq	%rax
	movq	$L746, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L749:
	.byte	'3'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L750:
	.byte	37
	.byte	35
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
L751:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L751, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L750, %rax
	pushq	%rax
	movq	$L749, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L752:
	.byte	'3'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L753:
	.byte	37
	.byte	35
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
L754:
	.byte	'0'
	.byte	'X'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L754, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L753, %rax
	pushq	%rax
	movq	$L752, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L755:
	.byte	'3'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L756:
	.byte	37
	.byte	35
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
L757:
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L757, %rax
	pushq	%rax
	movq	$11759, %rax
	pushq	%rax
	movq	$L756, %rax
	pushq	%rax
	movq	$L755, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L758:
	.byte	'3'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L759:
	.byte	37
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L760:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	45
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L760, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L759, %rax
	pushq	%rax
	movq	$L758, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L761:
	.byte	'3'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L762:
	.byte	37
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
L763:
	.byte	45
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L763, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L762, %rax
	pushq	%rax
	movq	$L761, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L764:
	.byte	'3'
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L765:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
L766:
	.byte	45
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L766, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L765, %rax
	pushq	%rax
	movq	$L764, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L767:
	.byte	'3'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L768:
	.byte	37
	.byte	35
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
	.byte	0
L769:
	.byte	32
	.byte	32
	.byte	32
	.byte	45
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L769, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L768, %rax
	pushq	%rax
	movq	$L767, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L770:
	.byte	'3'
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L771:
	.byte	37
	.byte	35
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
L772:
	.byte	45
	.byte	'0'
	.byte	'X'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L772, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L771, %rax
	pushq	%rax
	movq	$L770, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L773:
	.byte	'3'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L774:
	.byte	37
	.byte	35
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'X'
	.byte	0
	.byte	0
L775:
	.byte	45
	.byte	'0'
	.byte	'X'
	.byte	'2'
	.byte	'D'
	.byte	'E'
	.byte	'F'
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L775, %rax
	pushq	%rax
	movq	$-11759, %rax
	pushq	%rax
	movq	$L774, %rax
	pushq	%rax
	movq	$L773, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L776:
	.byte	'4'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L777:
	.byte	37
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L778:
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L778, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L777, %rax
	pushq	%rax
	movq	$L776, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L779:
	.byte	'4'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L780:
	.byte	37
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L781:
	.byte	45
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L781, %rax
	pushq	%rax
	movq	$-271, %rax
	pushq	%rax
	movq	$L780, %rax
	pushq	%rax
	movq	$L779, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L782:
	.byte	'4'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L783:
	.byte	37
	.byte	35
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L784:
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L784, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L783, %rax
	pushq	%rax
	movq	$L782, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L785:
	.byte	'4'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L786:
	.byte	37
	.byte	35
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L787:
	.byte	45
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L787, %rax
	pushq	%rax
	movq	$-271, %rax
	pushq	%rax
	movq	$L786, %rax
	pushq	%rax
	movq	$L785, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L788:
	.byte	'4'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L789:
	.byte	37
	.byte	35
	.byte	43
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L790:
	.byte	43
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L790, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L789, %rax
	pushq	%rax
	movq	$L788, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L791:
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L792:
	.byte	37
	.byte	43
	.byte	35
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L793:
	.byte	43
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L793, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L792, %rax
	pushq	%rax
	movq	$L791, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L794:
	.byte	'4'
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L795:
	.byte	37
	.byte	35
	.byte	'1'
	.byte	'0'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
L796:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L796, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L795, %rax
	pushq	%rax
	movq	$L794, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L797:
	.byte	'4'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L798:
	.byte	37
	.byte	35
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'o'
	.byte	0
	.byte	0
L799:
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L799, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L798, %rax
	pushq	%rax
	movq	$L797, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L800:
	.byte	'4'
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L801:
	.byte	37
	.byte	35
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'o'
	.byte	0
	.byte	0
L802:
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L802, %rax
	pushq	%rax
	movq	$271, %rax
	pushq	%rax
	movq	$L801, %rax
	pushq	%rax
	movq	$L800, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L803:
	.byte	'4'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L804:
	.byte	37
	.byte	35
	.byte	'1'
	.byte	'0'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
L805:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	45
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L805, %rax
	pushq	%rax
	movq	$-271, %rax
	pushq	%rax
	movq	$L804, %rax
	pushq	%rax
	movq	$L803, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L806:
	.byte	'5'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L807:
	.byte	37
	.byte	35
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'o'
	.byte	0
	.byte	0
L808:
	.byte	45
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L808, %rax
	pushq	%rax
	movq	$-271, %rax
	pushq	%rax
	movq	$L807, %rax
	pushq	%rax
	movq	$L806, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L809:
	.byte	'5'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L810:
	.byte	37
	.byte	35
	.byte	'0'
	.byte	'1'
	.byte	'0'
	.byte	'o'
	.byte	0
	.byte	0
L811:
	.byte	45
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'0'
	.byte	'4'
	.byte	'1'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L811, %rax
	pushq	%rax
	movq	$-271, %rax
	pushq	%rax
	movq	$L810, %rax
	pushq	%rax
	movq	$L809, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L812:
	.byte	'5'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L813:
	.byte	37
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L814:
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L814, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$L813, %rax
	pushq	%rax
	movq	$L812, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L815:
	.byte	'5'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L816:
	.byte	37
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L817:
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L817, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$L816, %rax
	pushq	%rax
	movq	$L815, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L818:
	.byte	'5'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L819:
	.byte	37
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L820:
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L820, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	$L819, %rax
	pushq	%rax
	movq	$L818, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L821:
	.byte	'5'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L822:
	.byte	37
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L823:
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L823, %rax
	pushq	%rax
	movq	$97, %rax
	pushq	%rax
	movq	$L822, %rax
	pushq	%rax
	movq	$L821, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L824:
	.byte	'5'
	.byte	'6'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L825:
	.byte	37
	.byte	'1'
	.byte	'0'
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L826:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'a'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L826, %rax
	pushq	%rax
	movq	$97, %rax
	pushq	%rax
	movq	$L825, %rax
	pushq	%rax
	movq	$L824, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L827:
	.byte	'5'
	.byte	'7'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L828:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
L829:
	.byte	'a'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L829, %rax
	pushq	%rax
	movq	$97, %rax
	pushq	%rax
	movq	$L828, %rax
	pushq	%rax
	movq	$L827, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L830:
	.byte	'5'
	.byte	'8'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L831:
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L832:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L833:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L833, %rax
	pushq	%rax
	movq	$L832, %rax
	pushq	%rax
	movq	$L831, %rax
	pushq	%rax
	movq	$L830, %rax
	pushq	%rax
	call	Cspfs_test
	addq	$32, %rsp
	.data
L834:
	.byte	'5'
	.byte	'9'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L835:
	.byte	37
	.byte	'1'
	.byte	'0'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L836:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L837:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L837, %rax
	pushq	%rax
	movq	$L836, %rax
	pushq	%rax
	movq	$L835, %rax
	pushq	%rax
	movq	$L834, %rax
	pushq	%rax
	call	Cspfs_test
	addq	$32, %rsp
	.data
L838:
	.byte	'6'
	.byte	'0'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L839:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'0'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
L840:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L841:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L841, %rax
	pushq	%rax
	movq	$L840, %rax
	pushq	%rax
	movq	$L839, %rax
	pushq	%rax
	movq	$L838, %rax
	pushq	%rax
	call	Cspfs_test
	addq	$32, %rsp
	.data
L842:
	.byte	'6'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L843:
	.byte	37
	.byte	'1'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L844:
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L844, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L843, %rax
	pushq	%rax
	movq	$L842, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L845:
	.byte	'6'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L846:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L847:
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L847, %rax
	pushq	%rax
	movq	$12345, %rax
	pushq	%rax
	movq	$L846, %rax
	pushq	%rax
	movq	$L845, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L848:
	.byte	'6'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L849:
	.byte	37
	.byte	35
	.byte	'1'
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L850:
	.byte	'0'
	.byte	'x'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L850, %rax
	pushq	%rax
	movq	$2748, %rax
	pushq	%rax
	movq	$L849, %rax
	pushq	%rax
	movq	$L848, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L851:
	.byte	'6'
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L852:
	.byte	37
	.byte	35
	.byte	45
	.byte	'1'
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
L853:
	.byte	45
	.byte	'0'
	.byte	'x'
	.byte	'a'
	.byte	'b'
	.byte	'c'
	.byte	0
	.byte	0
	.text
	movq	$L853, %rax
	pushq	%rax
	movq	$-2748, %rax
	pushq	%rax
	movq	$L852, %rax
	pushq	%rax
	movq	$L851, %rax
	pushq	%rax
	call	Cspfn_test
	addq	$32, %rsp
	.data
L854:
	.byte	'6'
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L855:
	.byte	37
	.byte	'1'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L856:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L857:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L857, %rax
	pushq	%rax
	movq	$L856, %rax
	pushq	%rax
	movq	$L855, %rax
	pushq	%rax
	movq	$L854, %rax
	pushq	%rax
	call	Cspfs_test
	addq	$32, %rsp
	.data
L858:
	.byte	'6'
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L859:
	.byte	37
	.byte	45
	.byte	'1'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L860:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L861:
	.byte	'f'
	.byte	'o'
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L861, %rax
	pushq	%rax
	movq	$L860, %rax
	pushq	%rax
	movq	$L859, %rax
	pushq	%rax
	movq	$L858, %rax
	pushq	%rax
	call	Cspfs_test
	addq	$32, %rsp
L657:
	popq	%rbp
	ret
	.data
	.lcomm	L862,16
	.lcomm	L863,16
	.text
	.globl	Ctest_math
Ctest_math:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-824, %rsp
	movq	$L862, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L862, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$104, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L863, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L865:
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'i'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L865, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$12345, %rax
	movq	%rax, -8(%rbp)
	.data
L866:
	.byte	32
	.byte	32
	.byte	32
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L866, %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L868
	jmp	L867
L868:
	.data
L869:
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'i'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.text
	movq	$L869, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L867:
	.data
L870:
	.byte	9
	.byte	43
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.text
	movq	$L870, %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L872
	jmp	L871
L872:
	.data
L873:
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'i'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.text
	movq	$L873, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L871:
	movq	-8(%rbp), %rax
	negq	%rax
	movq	%rax, -8(%rbp)
	.data
L874:
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.text
	movq	$L874, %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L876
	jmp	L875
L876:
	.data
L877:
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'i'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.text
	movq	$L877, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L875:
	.data
L878:
	.byte	32
	.byte	32
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L878, %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L880
	jmp	L879
L880:
	.data
L881:
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'i'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.text
	movq	$L881, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L879:
	.data
L882:
	.byte	9
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	'3'
	.byte	'4'
	.byte	'5'
	.byte	0
	.text
	movq	$L882, %rax
	pushq	%rax
	call	Catoi
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L884
	jmp	L883
L884:
	.data
L885:
	.byte	'a'
	.byte	't'
	.byte	'o'
	.byte	'i'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.text
	movq	$L885, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L883:
	.data
L886:
	.byte	'a'
	.byte	'b'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L886, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L888
	jmp	L887
L888:
	.data
L889:
	.byte	'a'
	.byte	'b'
	.byte	's'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L889, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L887:
	movq	$123, %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	$123, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L891
	jmp	L890
L891:
	.data
L892:
	.byte	'a'
	.byte	'b'
	.byte	's'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L892, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L890:
	movq	$-456, %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	$456, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L894
	jmp	L893
L894:
	.data
L895:
	.byte	'a'
	.byte	'b'
	.byte	's'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L895, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L893:
	movq	$-9223372036854775808, %rax
	pushq	%rax
	call	Cabs
	addq	$8, %rsp
	pushq	%rax
	movq	$-9223372036854775808, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L897
	jmp	L896
L897:
	.data
L898:
	.byte	'a'
	.byte	'b'
	.byte	's'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L898, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L896:
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L899:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L903
	jmp	L901
L903:
	jmp	L900
L902:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L899
L900:
	call	Crand
	movq	%rax, -24(%rbp)
	movq	$0, %rax
	movq	%rax, -16(%rbp)
L904:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L908
	jmp	L906
L908:
	jmp	L905
L907:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L904
L905:
	leaq	-824(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L910
	jmp	L909
L910:
	.data
L911:
	.byte	'r'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.text
	movq	$L911, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L906
L909:
	jmp	L907
L906:
	leaq	-824(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$65535, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	ja	L913
	jmp	L912
L913:
	.data
L914:
	.byte	'r'
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.text
	movq	$L914, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L912:
	jmp	L902
L901:
L864:
	addq	$824, %rsp
	popq	%rbp
	ret
	.data
	.globl	Chere
	.comm	Chere,24
	.globl	Ccount
Ccount:	.quad	0
	.lcomm	L915,8
	.lcomm	L916,8
	.text
	.globl	Cjump
Cjump:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L915, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L915, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L915, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L915, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L915, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L916, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L916, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L916, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L916, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L916, %rax
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
	movq	$Chere, %rax
	pushq	%rax
	call	Clongjmp
	addq	$16, %rsp
	.data
L918:
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	'j'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L918, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L917:
	popq	%rbp
	ret
	.data
	.lcomm	L919,16
	.lcomm	L920,16
	.text
	.globl	Ctest_ljmp
Ctest_ljmp:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L919, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L919, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$106, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L920, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L922:
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	'j'
	.byte	'm'
	.byte	'p'
	.byte	47
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	'j'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.text
	movq	$L922, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, Ccount
	movq	$Chere, %rax
	pushq	%rax
	call	Csetjmp
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L924
	jmp	L923
L924:
	movq	$1, %rax
	pushq	%rax
	movq	Ccount, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L926
	jmp	L925
L926:
	.data
L927:
	.byte	's'
	.byte	'e'
	.byte	't'
	.byte	'j'
	.byte	'm'
	.byte	'p'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L927, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L925:
	jmp	L921
L923:
	movq	Ccount, %rax
	incq	Ccount
	movq	$0, %rax
	pushq	%rax
	call	Cjump
	addq	$8, %rsp
	movq	Ccount, %rax
	incq	Ccount
	movq	$1, %rax
	pushq	%rax
	call	Cjump
	addq	$8, %rsp
L921:
	popq	%rbp
	ret
	.data
	.lcomm	L928,16
	.lcomm	L929,16
	.text
	.globl	Ctest_proc
Ctest_proc:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L928, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L928, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L929, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Ctest_ljmp
L930:
	popq	%rbp
	ret
	.data
	.lcomm	L931,16
	.lcomm	L932,16
	.text
	.globl	Ctest_sio1
Ctest_sio1:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-112, %rsp
	movq	$L931, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L931, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$49, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L932, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L934:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L934, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L935:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L936:
	.byte	'w'
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L936, %rax
	pushq	%rax
	movq	$L935, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L938
	jmp	L937
L938:
	.data
L939:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L939, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L940
L937:
	.data
L941:
	.byte	'f'
	.byte	'e'
	.byte	'o'
	.byte	'f'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L941, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L943
	jmp	L942
L943:
	.data
L944:
	.byte	'f'
	.byte	'e'
	.byte	'o'
	.byte	'f'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.text
	movq	$L944, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L942:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
L940:
	.data
L945:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L946:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L946, %rax
	pushq	%rax
	movq	$L945, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L948
	jmp	L947
L948:
	.data
L949:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'2'
	.byte	0
	.text
	movq	$L949, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L950
L947:
	.data
L951:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L951, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L952:
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	'1'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L952, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L954
	jmp	L953
L954:
	.data
L955:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	's'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L955, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L953:
	.data
L956:
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	'2'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L956, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L958
	jmp	L957
L958:
	.data
L959:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	's'
	.byte	45
	.byte	'2'
	.byte	0
	.text
	movq	$L959, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L957:
	.data
L960:
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	'3'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L960, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L962
	jmp	L961
L962:
	.data
L963:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	's'
	.byte	45
	.byte	'3'
	.byte	0
	.text
	movq	$L963, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L961:
	.data
L964:
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	'4'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L964, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L966
	jmp	L965
L966:
	.data
L967:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	's'
	.byte	45
	.byte	'4'
	.byte	0
	.text
	movq	$L967, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L965:
	.data
L968:
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	'5'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L968, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L970
	jmp	L969
L970:
	.data
L971:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	's'
	.byte	45
	.byte	'5'
	.byte	0
	.text
	movq	$L971, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L969:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	movq	%rax, -112(%rbp)
	.data
L972:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L972, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L974
	jmp	L973
L974:
	.data
L975:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L975, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L973:
	movq	-112(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L977
	jmp	L976
L977:
	.data
L978:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L978, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L976:
	.data
L979:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L980:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L980, %rax
	pushq	%rax
	movq	$L979, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L982
	jmp	L981
L982:
	.data
L983:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'3'
	.byte	0
	.text
	movq	$L983, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L984
L981:
	.data
L985:
	.byte	'f'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L985, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$80, %rax
	pushq	%rax
	leaq	-88(%rbp), %rax
	pushq	%rax
	call	Cfgets
	addq	$24, %rsp
	movq	$49, %rax
	movq	%rax, -96(%rbp)
L987:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L988
	jmp	L986
L988:
	movq	$0, %rax
	movq	%rax, -104(%rbp)
L989:
	movq	-104(%rbp), %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L993
	jmp	L991
L993:
	jmp	L990
L992:
	movq	-104(%rbp), %rax
	incq	-104(%rbp)
	jmp	L989
L990:
	leaq	-88(%rbp), %rax
	pushq	%rax
	movq	-104(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-96(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L995
	jmp	L994
L995:
	.data
L996:
	.byte	'f'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	's'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L996, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L991
L994:
	jmp	L992
L991:
	movq	-96(%rbp), %rax
	incq	-96(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$80, %rax
	pushq	%rax
	leaq	-88(%rbp), %rax
	pushq	%rax
	call	Cfgets
	addq	$24, %rsp
	jmp	L987
L986:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	movq	%rax, -112(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L998
	jmp	L997
L998:
	.data
L999:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L999, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L997:
	movq	-112(%rbp), %rax
	pushq	%rax
	call	C_close
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1001
	jmp	L1000
L1001:
	.data
L1002:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1002, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1000:
L984:
L950:
	.data
L1003:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1003, %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
L933:
	addq	$112, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L1004,16
	.lcomm	L1005,16
	.text
	.globl	Ctest_sio2
Ctest_sio2:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-16, %rsp
	movq	$L1004, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1004, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1005, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1007:
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	'o'
	.byte	0
	.byte	0
	.text
	movq	$L1007, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	Cstdin, %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1009
	jmp	L1008
L1009:
	.data
L1010:
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	'o'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1010, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1008:
	movq	Cstdout, %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1012
	jmp	L1011
L1012:
	.data
L1013:
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	'o'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1013, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1011:
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1015
	jmp	L1014
L1015:
	.data
L1016:
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'n'
	.byte	'o'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1016, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1014:
	.data
L1017:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1018:
	.byte	'w'
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1018, %rax
	pushq	%rax
	movq	$L1017, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1020
	jmp	L1019
L1020:
	.data
L1021:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'4'
	.byte	0
	.text
	movq	$L1021, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1006
L1019:
	.data
L1022:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1022, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$65, %rax
	movq	%rax, -16(%rbp)
L1023:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$90, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L1027
	jmp	L1025
L1027:
	jmp	L1024
L1026:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L1023
L1024:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cfputc
	addq	$16, %rsp
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1029
	jmp	L1028
L1029:
	.data
L1030:
	.byte	'f'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L1030, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1028:
	jmp	L1026
L1025:
	.data
L1031:
	.byte	'f'
	.byte	'f'
	.byte	'l'
	.byte	'u'
	.byte	's'
	.byte	'h'
	.byte	0
	.byte	0
	.text
	movq	$L1031, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfflush
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1033
	jmp	L1032
L1033:
	.data
L1034:
	.byte	'f'
	.byte	'f'
	.byte	'l'
	.byte	'u'
	.byte	's'
	.byte	'h'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1034, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1032:
	movq	$2, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	pushq	%rax
	movq	$26, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1036
	jmp	L1035
L1036:
	.data
L1037:
	.byte	'f'
	.byte	'f'
	.byte	'l'
	.byte	'u'
	.byte	's'
	.byte	'h'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1037, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1035:
	.data
L1038:
	.byte	'r'
	.byte	'e'
	.byte	'w'
	.byte	'i'
	.byte	'n'
	.byte	'd'
	.byte	0
	.byte	0
	.text
	movq	$L1038, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crewind
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfileno
	addq	$8, %rsp
	pushq	%rax
	call	C_lseek
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1040
	jmp	L1039
L1040:
	.data
L1041:
	.byte	'r'
	.byte	'e'
	.byte	'w'
	.byte	'i'
	.byte	'n'
	.byte	'd'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1041, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1039:
	.data
L1042:
	.byte	'f'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1042, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$65, %rax
	movq	%rax, -16(%rbp)
L1043:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$90, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L1047
	jmp	L1045
L1047:
	jmp	L1044
L1046:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L1043
L1044:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1049
	jmp	L1048
L1049:
	.data
L1050:
	.byte	'f'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L1050, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1045
L1048:
	jmp	L1046
L1045:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1052
	jmp	L1051
L1052:
	.data
L1053:
	.byte	'f'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'2'
	.byte	0
	.text
	movq	$L1053, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1051:
	.data
L1054:
	.byte	'u'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	0
	.byte	0
	.text
	movq	$L1054, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cclearerr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$88, %rax
	pushq	%rax
	call	Cungetc
	addq	$16, %rsp
	pushq	%rax
	movq	$88, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1056
	jmp	L1055
L1056:
	.data
L1057:
	.byte	'u'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1057, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1055:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	pushq	%rax
	movq	$88, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1059
	jmp	L1058
L1059:
	.data
L1060:
	.byte	'u'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1060, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1058:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$88, %rax
	pushq	%rax
	call	Cungetc
	addq	$16, %rsp
	pushq	%rax
	movq	$88, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1062
	jmp	L1061
L1062:
	.data
L1063:
	.byte	'u'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1063, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1061:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$88, %rax
	pushq	%rax
	call	Cungetc
	addq	$16, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1065
	jmp	L1064
L1065:
	.data
L1066:
	.byte	'u'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'4'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1066, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1064:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	pushq	%rax
	movq	$88, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1068
	jmp	L1067
L1068:
	.data
L1069:
	.byte	'u'
	.byte	'n'
	.byte	'g'
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1069, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1067:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L1071
	jmp	L1070
L1071:
	.data
L1072:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1072, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1070:
	.data
L1073:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1073, %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
L1006:
	addq	$16, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L1074,16
	.lcomm	L1075,16
	.lcomm	L1076,1024
	.text
	.globl	Ctest_sio3
Ctest_sio3:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L1074, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$51, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1074, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$51, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1075, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1078:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1079:
	.byte	'w'
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1079, %rax
	pushq	%rax
	movq	$L1078, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1081
	jmp	L1080
L1081:
	.data
L1082:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'5'
	.byte	0
	.text
	movq	$L1082, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1077
L1080:
	.data
L1083:
	.byte	'f'
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L1083, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$31, %rax
	movq	%rax, -16(%rbp)
L1084:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$527, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L1088
	jmp	L1086
L1088:
	jmp	L1085
L1087:
	movq	$31, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	jmp	L1084
L1085:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$L1076, %rax
	pushq	%rax
	call	Cmemset
	addq	$24, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$L1076, %rax
	pushq	%rax
	call	Cfwrite
	addq	$32, %rsp
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1090
	jmp	L1089
L1090:
	.data
L1091:
	.byte	'f'
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1091, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1089:
	jmp	L1087
L1086:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crewind
	addq	$8, %rsp
	.data
L1092:
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1092, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$31, %rax
	movq	%rax, -16(%rbp)
L1093:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$527, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jle	L1097
	jmp	L1095
L1097:
	jmp	L1094
L1096:
	movq	$31, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	jmp	L1093
L1094:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$L1076, %rax
	pushq	%rax
	call	Cmemset
	addq	$24, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$L1076, %rax
	pushq	%rax
	call	Cfread
	addq	$32, %rsp
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1099
	jmp	L1098
L1099:
	.data
L1100:
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L1100, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1098:
	movq	$0, %rax
	movq	%rax, -24(%rbp)
L1101:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1105
	jmp	L1103
L1105:
	jmp	L1102
L1104:
	movq	-24(%rbp), %rax
	incq	-24(%rbp)
	jmp	L1101
L1102:
	movq	$L1076, %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$256, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	cqo
	idivq	%rcx
	movq	%rdx, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1107
	jmp	L1106
L1107:
	jmp	L1103
L1106:
	jmp	L1104
L1103:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1109
	jmp	L1108
L1109:
	.data
L1110:
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'2'
	.byte	0
	.text
	movq	$L1110, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1095
L1108:
	jmp	L1096
L1095:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L1112
	jmp	L1111
L1112:
	.data
L1113:
	.byte	'f'
	.byte	'c'
	.byte	'l'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1113, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1111:
	.data
L1114:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1115:
	.byte	'w'
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1115, %rax
	pushq	%rax
	movq	$L1114, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1117
	jmp	L1116
L1117:
	.data
L1118:
	.byte	'f'
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	45
	.byte	'5'
	.byte	0
	.text
	movq	$L1118, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1077
L1116:
	movq	$0, %rax
	movq	%rax, -16(%rbp)
L1119:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1123
	jmp	L1121
L1123:
	jmp	L1120
L1122:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L1119
L1120:
	movq	$L1076, %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$53, %rax
	popq	%rdx
	movb	%al, (%rdx)
	jmp	L1122
L1121:
	movq	$0, %rax
	movq	%rax, -16(%rbp)
L1124:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1128
	jmp	L1126
L1128:
	jmp	L1125
L1127:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L1124
L1125:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$L1076, %rax
	pushq	%rax
	call	Cfwrite
	addq	$32, %rsp
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1130
	jmp	L1129
L1130:
	.data
L1131:
	.byte	'f'
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1131, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1126
L1129:
	jmp	L1127
L1126:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crewind
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -16(%rbp)
L1132:
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$16, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1136
	jmp	L1134
L1136:
	jmp	L1133
L1135:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L1132
L1133:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	movq	$L1076, %rax
	pushq	%rax
	call	Cfread
	addq	$32, %rsp
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1138
	jmp	L1137
L1138:
	.data
L1139:
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'3'
	.byte	0
	.text
	movq	$L1139, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
	jmp	L1134
L1137:
	jmp	L1135
L1134:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfgetc
	addq	$8, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1141
	jmp	L1140
L1141:
	.data
L1142:
	.byte	'f'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	'd'
	.byte	45
	.byte	'4'
	.byte	0
	.text
	movq	$L1142, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1140:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cclearerr
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crewind
	addq	$8, %rsp
	.data
L1143:
	.byte	'f'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	47
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'l'
	.byte	'l'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1143, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$2, %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfseek
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1145
	jmp	L1144
L1145:
	.data
L1146:
	.byte	'f'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L1146, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1144:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cftell
	addq	$8, %rsp
	pushq	%rax
	movq	$16384, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1148
	jmp	L1147
L1148:
	.data
L1149:
	.byte	'f'
	.byte	't'
	.byte	'e'
	.byte	'l'
	.byte	'l'
	.byte	45
	.byte	'1'
	.byte	0
	.text
	movq	$L1149, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1147:
	movq	$0, %rax
	pushq	%rax
	movq	$8100, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfseek
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1151
	jmp	L1150
L1151:
	.data
L1152:
	.byte	'f'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	45
	.byte	'2'
	.byte	0
	.text
	movq	$L1152, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1150:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cftell
	addq	$8, %rsp
	pushq	%rax
	movq	$8100, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1154
	jmp	L1153
L1154:
	.data
L1155:
	.byte	'f'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	45
	.byte	'3'
	.byte	0
	.text
	movq	$L1155, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1153:
	movq	$1, %rax
	pushq	%rax
	movq	$1900, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfseek
	addq	$24, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1157
	jmp	L1156
L1157:
	.data
L1158:
	.byte	'f'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	45
	.byte	'4'
	.byte	0
	.text
	movq	$L1158, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1156:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cftell
	addq	$8, %rsp
	pushq	%rax
	movq	$10000, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1160
	jmp	L1159
L1160:
	.data
L1161:
	.byte	'f'
	.byte	's'
	.byte	'e'
	.byte	'e'
	.byte	'k'
	.byte	45
	.byte	'5'
	.byte	0
	.text
	movq	$L1161, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1159:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	.data
L1162:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1162, %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
L1077:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L1163,16
	.lcomm	L1164,16
	.text
	.globl	Ctest_stdout
Ctest_stdout:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L1163, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1163, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1164, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1166:
	.byte	'0'
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'1'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'2'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'3'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'4'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1166, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L1167:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1171
	jmp	L1169
L1171:
	jmp	L1168
L1170:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L1167
L1168:
	movq	Cstdout, %rax
	pushq	%rax
	movq	$65, %rax
	pushq	%rax
	call	Cfputc
	addq	$16, %rsp
	jmp	L1170
L1169:
	.data
L1172:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1172, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L1173:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$50, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1177
	jmp	L1175
L1177:
	jmp	L1174
L1176:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L1173
L1174:
	movq	$66, %rax
	pushq	%rax
	call	Cputchar
	addq	$8, %rsp
	jmp	L1176
L1175:
	.data
L1178:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1178, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	.data
L1179:
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	'C'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1179, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	.data
L1180:
	.byte	124
	.byte	37
	.byte	'4'
	.byte	'8'
	.byte	's'
	.byte	124
	.byte	10
	.byte	0
L1181:
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	'D'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1181, %rax
	pushq	%rax
	movq	$L1180, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	.data
L1182:
	.byte	124
	.byte	37
	.byte	45
	.byte	'4'
	.byte	'8'
	.byte	's'
	.byte	124
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1183:
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	'E'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1183, %rax
	pushq	%rax
	movq	$L1182, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L1184:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1188
	jmp	L1186
L1188:
	jmp	L1185
L1187:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L1184
L1185:
	.data
L1189:
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	37
	.byte	'c'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$48, %rax
	pushq	%rax
	movq	$57, %rax
	pushq	%rax
	movq	$56, %rax
	pushq	%rax
	movq	$55, %rax
	pushq	%rax
	movq	$54, %rax
	pushq	%rax
	movq	$53, %rax
	pushq	%rax
	movq	$52, %rax
	pushq	%rax
	movq	$51, %rax
	pushq	%rax
	movq	$50, %rax
	pushq	%rax
	movq	$49, %rax
	pushq	%rax
	movq	$L1189, %rax
	pushq	%rax
	call	Cprintf
	addq	$88, %rsp
	jmp	L1187
L1186:
	.data
L1190:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1190, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	.data
L1191:
	.byte	37
	.byte	'5'
	.byte	'0'
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$-12345, %rax
	pushq	%rax
	movq	$L1191, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	.data
L1192:
	.byte	37
	.byte	45
	.byte	'4'
	.byte	'9'
	.byte	'd'
	.byte	124
	.byte	10
	.byte	0
	.text
	movq	$-12345, %rax
	pushq	%rax
	movq	$L1192, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	.data
L1193:
	.byte	37
	.byte	'0'
	.byte	'5'
	.byte	'0'
	.byte	'd'
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	$12345, %rax
	pushq	%rax
	movq	$L1193, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	.data
L1194:
	.byte	'0'
	.byte	'x'
	.byte	37
	.byte	'x'
	.byte	32
	.byte	37
	.byte	'1'
	.byte	'5'
	.byte	's'
	.byte	37
	.byte	'd'
	.byte	37
	.byte	'1'
	.byte	'6'
	.byte	's'
	.byte	32
	.byte	'0'
	.byte	37
	.byte	'o'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1195:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1196:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$31693, %rax
	pushq	%rax
	movq	$L1196, %rax
	pushq	%rax
	movq	$31693, %rax
	pushq	%rax
	movq	$L1195, %rax
	pushq	%rax
	movq	$31693, %rax
	pushq	%rax
	movq	$L1194, %rax
	pushq	%rax
	call	Cprintf
	addq	$48, %rsp
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L1197:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1201
	jmp	L1199
L1201:
	jmp	L1198
L1200:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L1197
L1198:
	.data
L1202:
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1202, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	jmp	L1200
L1199:
	.data
L1203:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1203, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	.data
L1204:
	.byte	'0'
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'1'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'2'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'3'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'4'
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	124
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.byte	'5'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1204, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
L1165:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L1205,16
	.lcomm	L1206,16
	.text
	.globl	Ctest_sio4
Ctest_sio4:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-192, %rsp
	movq	$L1205, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$52, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1205, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$52, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1206, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	movq	%rax, -192(%rbp)
	movq	%rax, -184(%rbp)
	.data
L1208:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$L1208, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L1209:
	.byte	46
	.byte	47
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	32
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	45
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	62
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1209, %rax
	pushq	%rax
	call	Csystem
	addq	$8, %rsp
	.data
L1210:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	'o'
	.byte	'k'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1211:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1211, %rax
	pushq	%rax
	movq	$L1210, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1213
	jmp	L1212
L1213:
	.data
L1214:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	's'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	'o'
	.byte	'k'
	.byte	10
	.byte	0
	.text
	movq	Cstdout, %rax
	pushq	%rax
	movq	$L1214, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	movq	CErrors, %rax
	incq	CErrors
	jmp	L1215
L1212:
	.data
L1216:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1217:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1217, %rax
	pushq	%rax
	movq	$L1216, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1219
	jmp	L1218
L1219:
	.data
L1220:
	.byte	'c'
	.byte	'o'
	.byte	'u'
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	'e'
	.byte	'n'
	.byte	32
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	Cstdout, %rax
	pushq	%rax
	movq	$L1220, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	.data
L1221:
	.byte	's'
	.byte	'y'
	.byte	's'
	.byte	't'
	.byte	'e'
	.byte	'm'
	.byte	40
	.byte	41
	.byte	32
	.byte	'f'
	.byte	'a'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	'd'
	.byte	63
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	Cstdout, %rax
	pushq	%rax
	movq	$L1221, %rax
	pushq	%rax
	call	Cfputs
	addq	$16, %rsp
	jmp	L1222
L1218:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$80, %rax
	pushq	%rax
	leaq	-96(%rbp), %rax
	pushq	%rax
	call	Cfgets
	addq	$24, %rsp
L1223:
	jmp	L1224
L1226:
	jmp	L1223
L1224:
	incq	-192(%rbp)
	movq	-192(%rbp), %rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	$80, %rax
	pushq	%rax
	leaq	-176(%rbp), %rax
	pushq	%rax
	call	Cfgets
	addq	$24, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L1228
	jmp	L1227
L1228:
	jmp	L1225
L1227:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L1230
	jmp	L1229
L1230:
	jmp	L1225
L1229:
	movq	$52, %rax
	pushq	%rax
	leaq	-176(%rbp), %rax
	pushq	%rax
	leaq	-96(%rbp), %rax
	pushq	%rax
	call	Cmemcmp
	addq	$24, %rsp
	orq	%rax, %rax
	jnz	L1232
	jmp	L1231
L1232:
	incq	-184(%rbp)
	movq	-184(%rbp), %rax
L1231:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$80, %rax
	pushq	%rax
	leaq	-96(%rbp), %rax
	pushq	%rax
	call	Cfgets
	addq	$24, %rsp
	jmp	L1226
L1225:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jz	L1234
	jmp	L1233
L1234:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfeof
	addq	$8, %rsp
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L1233:
	orq	%rax, %rax
	jnz	L1236
	jmp	L1235
L1236:
	.data
L1237:
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	's'
	.byte	32
	.byte	'h'
	.byte	'a'
	.byte	'v'
	.byte	'e'
	.byte	32
	.byte	'd'
	.byte	'i'
	.byte	'f'
	.byte	'f'
	.byte	'e'
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	's'
	.byte	'i'
	.byte	'z'
	.byte	'e'
	.byte	's'
	.byte	0
	.text
	movq	$L1237, %rax
	pushq	%rax
	call	Cputs
	addq	$8, %rsp
	incq	-184(%rbp)
	movq	-184(%rbp), %rax
L1235:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
L1222:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
L1215:
	movq	-184(%rbp), %rax
	orq	%rax, %rax
	jz	L1239
	jmp	L1238
L1239:
	.data
L1240:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1240, %rax
	pushq	%rax
	call	C_unlink
	addq	$8, %rsp
L1238:
	movq	-184(%rbp), %rax
	orq	%rax, %rax
	jnz	L1242
	jmp	L1241
L1242:
	.data
L1243:
	.byte	'm'
	.byte	'i'
	.byte	's'
	.byte	'c'
	.byte	45
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1243, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1241:
L1207:
	addq	$192, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L1244,16
	.lcomm	L1245,16
	.text
	.globl	Ctest_stdio
Ctest_stdio:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1244, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1244, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1245, %rax
	pushq	%rax
	movq	$11, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	call	Ctest_sio1
	call	Ctest_sio2
	call	Ctest_sio3
	call	Ctest_sio4
L1246:
	popq	%rbp
	ret
	.data
	.lcomm	L1247,16
	.lcomm	L1248,16
	.text
	.globl	Ctest_file
Ctest_file:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-1048, %rsp
	movq	$L1247, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1247, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1248, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1250:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1251:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1251, %rax
	pushq	%rax
	movq	$L1250, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	.data
L1252:
	.byte	'r'
	.byte	'e'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L1252, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L1253:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1253, %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1255
	jmp	L1254
L1255:
	.data
L1256:
	.byte	'r'
	.byte	'e'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1256, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1254:
	.data
L1257:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1257, %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L1259
	jmp	L1258
L1259:
	.data
L1260:
	.byte	'r'
	.byte	'e'
	.byte	'm'
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1260, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1258:
	.data
L1261:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	0
	.byte	0
	.text
	movq	$L1261, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L1262:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1263:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	'2'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1263, %rax
	pushq	%rax
	movq	$L1262, %rax
	pushq	%rax
	call	Crename
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L1265
	jmp	L1264
L1265:
	.data
L1266:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1266, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1264:
	.data
L1267:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1268:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1268, %rax
	pushq	%rax
	movq	$L1267, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	.data
L1269:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1270:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	'2'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1270, %rax
	pushq	%rax
	movq	$L1269, %rax
	pushq	%rax
	call	Crename
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L1272
	jmp	L1271
L1272:
	.data
L1273:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1273, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1271:
	.data
L1274:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1275:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	'2'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1275, %rax
	pushq	%rax
	movq	$L1274, %rax
	pushq	%rax
	call	Crename
	addq	$16, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L1277
	jmp	L1276
L1277:
	.data
L1278:
	.byte	'r'
	.byte	'e'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1278, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1276:
	.data
L1279:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	'2'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1279, %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
	.data
L1280:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	0
	.text
	movq	$L1280, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	call	Ctmpfile
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1282
	jmp	L1281
L1282:
	.data
L1283:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1283, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1281:
	movq	$1024, %rax
	pushq	%rax
	movq	$165, %rax
	pushq	%rax
	leaq	-1032(%rbp), %rax
	pushq	%rax
	call	Cmemset
	addq	$24, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	leaq	-1032(%rbp), %rax
	pushq	%rax
	call	Cfwrite
	addq	$32, %rsp
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1285
	jmp	L1284
L1285:
	.data
L1286:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1286, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1284:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Crewind
	addq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1024, %rax
	pushq	%rax
	movq	$1, %rax
	pushq	%rax
	leaq	-1032(%rbp), %rax
	pushq	%rax
	call	Cfread
	addq	$32, %rsp
	pushq	%rax
	movq	$1024, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L1288
	jmp	L1287
L1288:
	.data
L1289:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1289, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1287:
	.data
L1290:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	0
	.byte	0
	.text
	movq	$L1290, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Ctmpnam
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1292
	jmp	L1291
L1292:
	.data
L1293:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1293, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1291:
	.data
L1294:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1294, %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	leaq	-1048(%rbp), %rax
	pushq	%rax
	call	Ctmpnam
	addq	$8, %rsp
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1296
	jmp	L1295
L1296:
	.data
L1297:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	45
	.byte	'2'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1297, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1295:
	leaq	-1048(%rbp), %rax
	pushq	%rax
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L1299
	jmp	L1298
L1299:
	.data
L1300:
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	45
	.byte	'3'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1300, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1298:
	leaq	-1040(%rbp), %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
L1249:
	addq	$1048, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L1301,8
	.lcomm	L1302,8
	.text
	.globl	Cdoexit
Cdoexit:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1301, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1301, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1301, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1301, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1301, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1301, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1301, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1302, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1304:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1305:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1305, %rax
	pushq	%rax
	movq	$L1304, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
L1303:
	popq	%rbp
	ret
	.data
	.lcomm	L1306,16
	.lcomm	L1307,16
	.text
	.globl	Ctest_atexit
Ctest_atexit:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1306, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1306, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1307, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1309:
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.text
	movq	$L1309, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	movq	$Cdoexit, %rax
	pushq	%rax
	call	Catexit
	addq	$8, %rsp
	movq	$0, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L1308:
	popq	%rbp
	ret
	.data
	.lcomm	L1310,16
	.lcomm	L1311,16
	.text
	.globl	Ctest_exit
Ctest_exit:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1310, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1310, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$95, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1311, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L1313:
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1313, %rax
	pushq	%rax
	call	Cpr
	addq	$8, %rsp
	.data
L1314:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1314, %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
	.data
L1315:
	.byte	46
	.byte	47
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	32
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	45
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1315, %rax
	pushq	%rax
	call	Csystem
	addq	$8, %rsp
	.data
L1316:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L1317:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1317, %rax
	pushq	%rax
	movq	$L1316, %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	pushq	%rax
	movq	$-1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L1319
	jmp	L1318
L1319:
	.data
L1320:
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1320, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1318:
	.data
L1321:
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	46
	.byte	't'
	.byte	'm'
	.byte	'p'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1321, %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
	movq	CErrors, %rax
	orq	%rax, %rax
	jnz	L1324
	jmp	L1322
L1324:
	movq	$1, %rax
	jmp	L1323
L1322:
	movq	$0, %rax
L1323:
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
	.data
L1325:
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	45
	.byte	'1'
	.byte	0
	.byte	0
	.text
	movq	$L1325, %rax
	pushq	%rax
	call	Cfail
	addq	$8, %rsp
L1312:
	popq	%rbp
	ret
	.data
	.lcomm	L1326,8
	.lcomm	L1327,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L1326, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1326, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1326, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1326, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1326, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1327, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1327, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1327, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1327, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1327, %rax
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
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L1330
	jmp	L1329
L1330:
	.data
L1331:
	.byte	'v'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1331, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L1333
	jmp	L1332
L1333:
	movq	$1, %rax
	movq	%rax, CVerbose
	jmp	L1334
L1332:
	.data
L1335:
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	45
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1335, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L1337
	jmp	L1336
L1337:
	call	Ctest_stdout
	movq	$0, %rax
	jmp	L1328
L1336:
L1334:
	.data
L1338:
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	45
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L1338, %rax
	pushq	%rax
	movq	$8, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L1340
	jmp	L1339
L1340:
	call	Ctest_atexit
	movq	$0, %rax
	jmp	L1328
L1339:
L1329:
	call	Ctest_mem
	call	Ctest_str
	call	Ctest_sprintf
	call	Ctest_math
	call	Ctest_proc
	call	Ctest_stdio
	call	Ctest_file
	call	Ctest_exit
	movq	$1, %rax
	jmp	L1328
L1328:
	popq	%rbp
	ret

