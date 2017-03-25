	.text
	.data
	.globl	CInfile
	.comm	CInfile,8
	.globl	COutfile
	.comm	COutfile,8
	.globl	CToken
CToken:	.quad	0
	.globl	CText
	.comm	CText,520
	.globl	CValue
CValue:	.quad	0
	.globl	CLine
CLine:	.quad	0
	.globl	CErrors
CErrors:	.quad	0
	.globl	CSyntoken
CSyntoken:	.quad	0
	.globl	CPutback
CPutback:	.quad	0
	.globl	CRejected
CRejected:	.quad	0
	.globl	CRejval
CRejval:	.quad	0
	.globl	CRejtext
	.comm	CRejtext,520
	.globl	CFile
CFile:	.quad	0
	.globl	CBasefile
CBasefile:	.quad	0
	.globl	CMacp
	.comm	CMacp,256
	.globl	CMacc
	.comm	CMacc,256
	.globl	CMp
CMp:	.quad	0
	.globl	CExpandmac
CExpandmac:	.quad	0
	.globl	CIfdefstk
	.comm	CIfdefstk,128
	.globl	CIsp
CIsp:	.quad	0
	.globl	CInclev
CInclev:	.quad	0
	.globl	CTextseg
CTextseg:	.quad	0
	.globl	CNodes
	.comm	CNodes,32768
	.globl	CNdtop
CNdtop:	.quad	0
	.globl	CNdmax
CNdmax:	.quad	0
	.globl	CNames
	.comm	CNames,8192
	.globl	CPrims
	.comm	CPrims,8192
	.globl	CTypes
	.comm	CTypes,1024
	.globl	CStcls
	.comm	CStcls,1024
	.globl	CSizes
	.comm	CSizes,8192
	.globl	CVals
	.comm	CVals,8192
	.globl	CMtext
	.comm	CMtext,8192
	.globl	CGlobs
CGlobs:	.quad	0
	.globl	CLocs
CLocs:	.quad	0
	.globl	CThisfn
CThisfn:	.quad	0
	.globl	CNlist
	.comm	CNlist,16384
	.globl	CNbot
CNbot:	.quad	0
	.globl	CNtop
CNtop:	.quad	0
	.globl	CBreakstk
	.comm	CBreakstk,128
	.globl	CBsp
CBsp:	.quad	0
	.globl	CContstk
	.comm	CContstk,128
	.globl	CCsp
CCsp:	.quad	0
	.globl	CRetlab
CRetlab:	.quad	0
	.globl	CLIaddr
	.comm	CLIaddr,256
	.globl	CLIval
	.comm	CLIval,256
	.globl	CNli
CNli:	.quad	0
	.globl	CQ_type
CQ_type:	.quad	0
	.globl	CQ_val
CQ_val:	.quad	0
	.globl	CQ_name
	.comm	CQ_name,24
	.globl	CQ_cmp
CQ_cmp:	.quad	0
	.globl	CQ_bool
CQ_bool:	.quad	0
	.globl	CFiles
	.comm	CFiles,256
	.globl	CTemp
	.comm	CTemp,32
	.globl	CNf
CNf:	.quad	0
	.globl	CO_verbose
CO_verbose:	.quad	0
	.globl	CO_componly
CO_componly:	.quad	0
	.globl	CO_asmonly
CO_asmonly:	.quad	0
	.globl	CO_testonly
CO_testonly:	.quad	0
	.globl	CO_stdio
CO_stdio:	.quad	0
	.globl	CO_outfile
CO_outfile:	.quad	0
	.globl	CO_debug
CO_debug:	.quad	0
	.lcomm	L1,16
	.lcomm	L2,16
	.text
Ccmderror:	pushq	%rbp
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L1, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$100, %rax
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
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L2, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
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
	.data
L4:
	.byte	's'
	.byte	'c'
	.byte	'c'
	.byte	58
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L4, %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$16, %rsp
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	Cstderr, %rax
	pushq	%rax
	call	Cfprintf
	addq	$24, %rsp
	movq	Cstderr, %rax
	pushq	%rax
	movq	$10, %rax
	pushq	%rax
	call	Cfputc
	addq	$16, %rsp
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
	.globl	Ccleanup
Ccleanup:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L5, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L5, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L6, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CO_testonly, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L9
	jmp	L8
L9:
	movq	CBasefile, %rax
	pushq	%rax
	movq	$0, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	je	L10
	incq	%rdx
L10:
	movq	%rdx, %rax
L8:
	orq	%rax, %rax
	jnz	L12
	jmp	L11
L12:
	movq	$115, %rax
	pushq	%rax
	movq	CBasefile, %rax
	pushq	%rax
	call	Cnewfilename
	addq	$16, %rsp
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
	movq	$111, %rax
	pushq	%rax
	movq	CBasefile, %rax
	pushq	%rax
	call	Cnewfilename
	addq	$16, %rsp
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
L11:
L7:
	popq	%rbp
	ret
	.data
	.lcomm	L13,16
	.lcomm	L14,16
	.text
	.globl	Cnewfilename
Cnewfilename:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L13, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L13, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$119, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L14, %rax
	pushq	%rax
	movq	$12, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrdup
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L17
	jmp	L16
L17:
	.data
L18:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	'a'
	.byte	'm'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L18, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L16:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L15
L15:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L19,16
	.lcomm	L20,16
	.text
Cfiletype:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L19, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L19, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$102, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
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
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$121, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L20, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$46, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L23
	jmp	L22
L23:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L21
L22:
	movq	$0, %rax
	jmp	L21
L21:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L24,8
	.lcomm	L25,8
	.text
Cexists:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L24, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L24, %rax
	pushq	%rax
	movq	$5, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L25, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L27:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L27, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L29
	jmp	L28
L29:
	movq	$0, %rax
	jmp	L26
L28:
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	movq	$1, %rax
	jmp	L26
L26:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L30,8
	.lcomm	L31,8
	.text
Ccompile:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
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
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L30, %rax
	pushq	%rax
	movq	$6, %rax
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
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L31, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
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
	movq	Cstdin, %rax
	movq	%rax, -16(%rbp)
	movq	Cstdout, %rax
	movq	%rax, -24(%rbp)
	movq	$0, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L34
	jmp	L33
L34:
	movq	$115, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cnewfilename
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	.data
L35:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L35, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -16(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L37
	jmp	L36
L37:
	.data
L38:
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
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
	movq	$L38, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L36:
	movq	CO_testonly, %rax
	orq	%rax, %rax
	jz	L40
	jmp	L39
L40:
	.data
L41:
	.byte	'r'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L41, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L43
	jmp	L42
L43:
	.data
L44:
	.byte	'w'
	.byte	'i'
	.byte	'l'
	.byte	'l'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'v'
	.byte	'e'
	.byte	'r'
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L44, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L42:
	.data
L45:
	.byte	'w'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L45, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cfopen
	addq	$16, %rsp
	movq	%rax, -24(%rbp)
	pushq	%rax
	movq	$0, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L47
	jmp	L46
L47:
	.data
L48:
	.byte	'c'
	.byte	'a'
	.byte	'n'
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'c'
	.byte	'r'
	.byte	'e'
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.text
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L48, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L46:
L39:
L33:
	movq	CO_testonly, %rax
	orq	%rax, %rax
	jnz	L50
	jmp	L49
L50:
	movq	$0, %rax
	movq	%rax, -24(%rbp)
L49:
	movq	CO_verbose, %rax
	orq	%rax, %rax
	jnz	L52
	jmp	L51
L52:
	movq	CO_testonly, %rax
	orq	%rax, %rax
	jnz	L54
	jmp	L53
L54:
	.data
L55:
	.byte	'c'
	.byte	'c'
	.byte	32
	.byte	45
	.byte	't'
	.byte	32
	.byte	37
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
	movq	$L55, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
	jmp	L56
L53:
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L58
	jmp	L57
L58:
	.data
L59:
	.byte	'c'
	.byte	'c'
	.byte	32
	.byte	45
	.byte	'S'
	.byte	32
	.byte	45
	.byte	'o'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L59, %rax
	pushq	%rax
	call	Cprintf
	addq	$24, %rsp
	jmp	L60
L57:
	.data
L61:
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'i'
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'g'
	.byte	32
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L61, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L60:
L56:
L51:
	movq	24(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cprogram
	addq	$32, %rsp
	movq	16(%rbp), %rax
	orq	%rax, %rax
	jnz	L63
	jmp	L62
L63:
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
	movq	-24(%rbp), %rax
	orq	%rax, %rax
	jnz	L65
	jmp	L64
L65:
	movq	-24(%rbp), %rax
	pushq	%rax
	call	Cfclose
	addq	$8, %rsp
L64:
L62:
L32:
	addq	$24, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L66,8
	.lcomm	L67,8
	.text
Ccollect:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L66, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L66, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L67, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	CO_componly, %rax
	orq	%rax, %rax
	jz	L70
	jmp	L69
L70:
	movq	CO_asmonly, %rax
L69:
	orq	%rax, %rax
	jnz	L72
	jmp	L71
L72:
	jmp	L68
L71:
	movq	CNf, %rax
	pushq	%rax
	movq	$32, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L74
	jmp	L73
L74:
	.data
L75:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L75, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L73:
	movq	$CTemp, %rax
	pushq	%rax
	movq	CNf, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$CFiles, %rax
	pushq	%rax
	movq	CNf, %rax
	incq	CNf
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rdx
	movq	%rax, (%rdx)
L68:
	popq	%rbp
	ret
	.data
	.lcomm	L76,16
	.lcomm	L77,16
	.text
Cassemble:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-528, %rsp
	movq	$L76, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L76, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L77, %rax
	pushq	%rax
	movq	$9, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$115, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cnewfilename
	addq	$16, %rsp
	movq	%rax, 16(%rbp)
	movq	CO_componly, %rax
	orq	%rax, %rax
	jnz	L80
	jmp	L79
L80:
	movq	CO_outfile, %rax
L79:
	orq	%rax, %rax
	jnz	L82
	jmp	L81
L82:
	movq	CO_outfile, %rax
	movq	%rax, -8(%rbp)
	jmp	L83
L81:
	movq	$1, %rax
	pushq	%rax
	movq	$111, %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cnewfilename
	addq	$16, %rsp
	movq	%rax, -8(%rbp)
	pushq	%rax
	call	Ccollect
	addq	$16, %rsp
L83:
	.data
L84:
	.byte	'a'
	.byte	's'
	.byte	32
	.byte	45
	.byte	'o'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L84, %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$512, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L86
	jmp	L85
L86:
	.data
L87:
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'e'
	.byte	'm'
	.byte	'b'
	.byte	'l'
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
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L87, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L85:
	.data
L88:
	.byte	'a'
	.byte	's'
	.byte	32
	.byte	45
	.byte	'o'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	$L88, %rax
	pushq	%rax
	leaq	-528(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$32, %rsp
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L90
	jmp	L89
L90:
	.data
L91:
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-528(%rbp), %rax
	pushq	%rax
	movq	$L91, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L89:
	leaq	-528(%rbp), %rax
	pushq	%rax
	call	Csystem
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L93
	jmp	L92
L93:
	.data
L94:
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'e'
	.byte	'm'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'v'
	.byte	'o'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
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
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L94, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L92:
	movq	24(%rbp), %rax
	orq	%rax, %rax
	jnz	L96
	jmp	L95
L96:
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L98
	jmp	L97
L98:
	.data
L99:
	.byte	'r'
	.byte	'm'
	.byte	32
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.text
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$L99, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L97:
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
L95:
L78:
	addq	$528, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L100,8
	.lcomm	L101,8
	.text
Cconcat:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L100, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L100, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L100, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L100, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L100, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L100, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L100, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$99, %rax
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
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$99, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L101, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$512, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L104
	jmp	L103
L104:
	.data
L105:
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
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
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	0
	.text
	movq	24(%rbp), %rax
	pushq	%rax
	movq	$L105, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L103:
	.data
L106:
	.byte	32
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
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	call	Cstrcat
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	jmp	L102
L102:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L107,8
	.lcomm	L108,8
	.text
Clink:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-1064, %rsp
	movq	$L107, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L107, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$107, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L108, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L112:
	.byte	'a'
	.byte	46
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	CO_outfile, %rax
	orq	%rax, %rax
	jnz	L113
	jmp	L110
L113:
	movq	CO_outfile, %rax
	jmp	L111
L110:
	movq	$L112, %rax
L111:
	movq	%rax, -1064(%rbp)
	.data
L114:
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	45
	.byte	'o'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	's'
	.byte	47
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	47
	.byte	37
	.byte	's'
	.byte	'c'
	.byte	'r'
	.byte	't'
	.byte	'0'
	.byte	46
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L115:
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	-1064(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$L114, %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$L115, %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	shlq	%cl, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$512, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L117
	jmp	L116
L117:
	.data
L118:
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
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
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'n'
	.byte	'g'
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L118, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L116:
	.data
L119:
	.byte	'l'
	.byte	'd'
	.byte	32
	.byte	45
	.byte	'o'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	37
	.byte	's'
	.byte	47
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	47
	.byte	37
	.byte	's'
	.byte	'c'
	.byte	'r'
	.byte	't'
	.byte	'0'
	.byte	46
	.byte	'o'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L120:
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L123:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L124:
	.byte	'n'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	CO_stdio, %rax
	orq	%rax, %rax
	jnz	L125
	jmp	L121
L125:
	movq	$L123, %rax
	jmp	L122
L121:
	movq	$L124, %rax
L122:
	pushq	%rax
	movq	$L120, %rax
	pushq	%rax
	movq	-1064(%rbp), %rax
	pushq	%rax
	movq	$L119, %rax
	pushq	%rax
	leaq	-536(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$40, %rsp
	leaq	-536(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	movq	%rax, -16(%rbp)
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L126:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	CNf, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L130
	jmp	L128
L130:
	jmp	L127
L129:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L126
L127:
	movq	$CFiles, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	leaq	-536(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cconcat
	addq	$24, %rsp
	movq	%rax, -16(%rbp)
	jmp	L129
L128:
	.data
L131:
	.byte	37
	.byte	's'
	.byte	47
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	47
	.byte	'l'
	.byte	'i'
	.byte	'b'
	.byte	's'
	.byte	'c'
	.byte	'c'
	.byte	46
	.byte	'a'
	.byte	0
	.text
	movq	$L131, %rax
	pushq	%rax
	leaq	-536(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cconcat
	addq	$24, %rsp
	movq	%rax, -16(%rbp)
	.data
L132:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L132, %rax
	pushq	%rax
	leaq	-536(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	call	Cconcat
	addq	$24, %rsp
	.data
L133:
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L133, %rax
	pushq	%rax
	leaq	-536(%rbp), %rax
	pushq	%rax
	leaq	-1056(%rbp), %rax
	pushq	%rax
	call	Csprintf
	addq	$24, %rsp
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L135
	jmp	L134
L135:
	.data
L136:
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	leaq	-1056(%rbp), %rax
	pushq	%rax
	movq	$L136, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L134:
	leaq	-1056(%rbp), %rax
	pushq	%rax
	call	Csystem
	addq	$8, %rsp
	orq	%rax, %rax
	jnz	L138
	jmp	L137
L138:
	.data
L139:
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'i'
	.byte	'n'
	.byte	'v'
	.byte	'o'
	.byte	'c'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L139, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L137:
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L141
	jmp	L140
L141:
	.data
L142:
	.byte	'r'
	.byte	'm'
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L142, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L140:
	movq	$0, %rax
	movq	%rax, -8(%rbp)
L143:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	CNf, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L147
	jmp	L145
L147:
	jmp	L144
L146:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L143
L144:
	movq	$CTemp, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L149
	jmp	L148
L149:
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L151
	jmp	L150
L151:
	.data
L152:
	.byte	32
	.byte	37
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$CFiles, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L152, %rax
	pushq	%rax
	call	Cprintf
	addq	$16, %rsp
L150:
	movq	$CFiles, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cremove
	addq	$8, %rsp
L148:
	jmp	L146
L145:
	movq	CO_verbose, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jg	L154
	jmp	L153
L154:
	.data
L155:
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L155, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L153:
L109:
	addq	$1064, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L156,8
	.lcomm	L157,8
	.text
Cusage:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L156, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L156, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L156, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L156, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L156, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L156, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L157, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L157, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L157, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L157, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L157, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L157, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L159:
	.byte	'U'
	.byte	's'
	.byte	'a'
	.byte	'g'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	's'
	.byte	'c'
	.byte	'c'
	.byte	32
	.byte	91
	.byte	45
	.byte	'h'
	.byte	93
	.byte	32
	.byte	91
	.byte	45
	.byte	'c'
	.byte	't'
	.byte	'v'
	.byte	'N'
	.byte	'S'
	.byte	'V'
	.byte	93
	.byte	32
	.byte	91
	.byte	45
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	't'
	.byte	93
	.byte	32
	.byte	91
	.byte	45
	.byte	'o'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	93
	.byte	32
	.byte	91
	.byte	45
	.byte	'D'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'c'
	.byte	'r'
	.byte	'o'
	.byte	91
	.byte	61
	.byte	't'
	.byte	'e'
	.byte	'x'
	.byte	't'
	.byte	93
	.byte	93
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	91
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
	.byte	0
	.text
	movq	$L159, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L158:
	popq	%rbp
	ret
	.data
	.lcomm	L160,16
	.lcomm	L161,16
	.text
Clongusage:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L160, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L160, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$108, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$117, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L161, %rax
	pushq	%rax
	movq	$10, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L163:
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L163, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	call	Cusage
	.data
L164:
	.byte	10
	.byte	45
	.byte	'c'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	44
	.byte	32
	.byte	'd'
	.byte	'o'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	10
	.byte	45
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	't'
	.byte	32
	.byte	32
	.byte	32
	.byte	'a'
	.byte	'c'
	.byte	't'
	.byte	'i'
	.byte	'v'
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'd'
	.byte	'e'
	.byte	'b'
	.byte	'u'
	.byte	'g'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'O'
	.byte	'P'
	.byte	'T'
	.byte	44
	.byte	32
	.byte	63
	.byte	32
	.byte	61
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	10
	.byte	45
	.byte	'o'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	32
	.byte	'w'
	.byte	'r'
	.byte	'i'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'l'
	.byte	'i'
	.byte	'n'
	.byte	'k'
	.byte	'e'
	.byte	'r'
	.byte	32
	.byte	'o'
	.byte	'u'
	.byte	't'
	.byte	'p'
	.byte	'u'
	.byte	't'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'F'
	.byte	'I'
	.byte	'L'
	.byte	'E'
	.byte	10
	.byte	45
	.byte	't'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	't'
	.byte	'e'
	.byte	's'
	.byte	't'
	.byte	32
	.byte	'o'
	.byte	'n'
	.byte	'l'
	.byte	'y'
	.byte	44
	.byte	32
	.byte	'g'
	.byte	'e'
	.byte	'n'
	.byte	'e'
	.byte	'r'
	.byte	'a'
	.byte	't'
	.byte	'e'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'd'
	.byte	'e'
	.byte	10
	.byte	45
	.byte	'v'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'v'
	.byte	'e'
	.byte	'r'
	.byte	'b'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	44
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'v'
	.byte	39
	.byte	's'
	.byte	32
	.byte	61
	.byte	32
	.byte	'm'
	.byte	'o'
	.byte	'r'
	.byte	'e'
	.byte	32
	.byte	'v'
	.byte	'e'
	.byte	'r'
	.byte	'b'
	.byte	'o'
	.byte	's'
	.byte	'e'
	.byte	10
	.byte	45
	.byte	'D'
	.byte	32
	.byte	'm'
	.byte	61
	.byte	'v'
	.byte	32
	.byte	32
	.byte	32
	.byte	'd'
	.byte	'e'
	.byte	'f'
	.byte	'i'
	.byte	'n'
	.byte	'e'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'c'
	.byte	'r'
	.byte	'o'
	.byte	32
	.byte	'M'
	.byte	32
	.byte	'w'
	.byte	'i'
	.byte	't'
	.byte	'h'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'u'
	.byte	'e'
	.byte	32
	.byte	'V'
	.byte	10
	.byte	45
	.byte	'N'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'd'
	.byte	'o'
	.byte	32
	.byte	'n'
	.byte	'o'
	.byte	't'
	.byte	32
	.byte	'u'
	.byte	's'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'd'
	.byte	'i'
	.byte	'o'
	.byte	32
	.byte	40
	.byte	'c'
	.byte	'a'
	.byte	'n'
	.byte	39
	.byte	't'
	.byte	32
	.byte	'u'
	.byte	's'
	.byte	'e'
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	'f'
	.byte	44
	.byte	32
	.byte	'e'
	.byte	't'
	.byte	'c'
	.byte	41
	.byte	10
	.byte	45
	.byte	'S'
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	32
	.byte	't'
	.byte	'o'
	.byte	32
	.byte	'a'
	.byte	's'
	.byte	's'
	.byte	'e'
	.byte	'm'
	.byte	'b'
	.byte	'l'
	.byte	'y'
	.byte	32
	.byte	'l'
	.byte	'a'
	.byte	'n'
	.byte	'g'
	.byte	'u'
	.byte	'a'
	.byte	'g'
	.byte	'e'
	.byte	10
	.byte	45
	.byte	'V'
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
	.byte	'v'
	.byte	'e'
	.byte	'r'
	.byte	's'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	'a'
	.byte	'n'
	.byte	'd'
	.byte	32
	.byte	'e'
	.byte	'x'
	.byte	'i'
	.byte	't'
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L164, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
L162:
	popq	%rbp
	ret
	.data
	.lcomm	L165,8
	.lcomm	L166,8
	.text
Cversion:	pushq	%rbp
	movq	%rsp, %rbp
	movq	$L165, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L165, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$118, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$115, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L166, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	.data
L168:
	.byte	'S'
	.byte	'u'
	.byte	'b'
	.byte	'C'
	.byte	32
	.byte	'v'
	.byte	'e'
	.byte	'r'
	.byte	's'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	37
	.byte	's'
	.byte	32
	.byte	'f'
	.byte	'o'
	.byte	'r'
	.byte	32
	.byte	37
	.byte	's'
	.byte	47
	.byte	37
	.byte	's'
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L169:
	.byte	'2'
	.byte	'0'
	.byte	'1'
	.byte	'6'
	.byte	45
	.byte	'1'
	.byte	'2'
	.byte	45
	.byte	'0'
	.byte	'1'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
L170:
	.byte	'L'
	.byte	'i'
	.byte	'n'
	.byte	'u'
	.byte	'x'
	.byte	0
	.byte	0
	.byte	0
L171:
	.byte	'x'
	.byte	'8'
	.byte	'6'
	.byte	45
	.byte	'6'
	.byte	'4'
	.byte	0
	.byte	0
	.text
	movq	$L171, %rax
	pushq	%rax
	movq	$L170, %rax
	pushq	%rax
	movq	$L169, %rax
	pushq	%rax
	movq	$L168, %rax
	pushq	%rax
	call	Cprintf
	addq	$32, %rsp
L167:
	popq	%rbp
	ret
	.data
	.lcomm	L172,8
	.lcomm	L173,8
	.text
Cnextarg:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L172, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L172, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$101, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$120, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$114, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$6, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L173, %rax
	pushq	%rax
	movq	$8, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jz	L176
	jmp	L175
L176:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	xorq	%rdx, %rdx
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L177
	incq	%rdx
L177:
	movq	%rdx, %rax
L175:
	orq	%rax, %rax
	jnz	L179
	jmp	L178
L179:
	call	Cusage
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L178:
	movq	32(%rbp), %rax
	incq	(%rax)
	movq	(%rax), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	40(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrlen
	addq	$8, %rsp
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	xchgq	%rax, %rcx
	subq	%rcx, %rax
	popq	%rdx
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	jmp	L174
L174:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L180,8
	.lcomm	L181,8
	.text
Cdbgopt:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-8, %rsp
	movq	$L180, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L180, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L180, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L180, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L180, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L180, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L180, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$100, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$98, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$103, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$111, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$4, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$112, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$116, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L181, %rax
	pushq	%rax
	movq	$7, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	40(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cnextarg
	addq	$32, %rsp
	movq	%rax, -8(%rbp)
	.data
L183:
	.byte	'l'
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L183, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L185
	jmp	L184
L185:
	movq	$1, %rax
	jmp	L182
L184:
	.data
L186:
	.byte	'g'
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L186, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L188
	jmp	L187
L188:
	movq	$2, %rax
	jmp	L182
L187:
	.data
L189:
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L189, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L191
	jmp	L190
L191:
	movq	$4, %rax
	jmp	L182
L190:
	.data
L192:
	.byte	10
	.byte	's'
	.byte	'c'
	.byte	'c'
	.byte	58
	.byte	32
	.byte	'v'
	.byte	'a'
	.byte	'l'
	.byte	'i'
	.byte	'd'
	.byte	32
	.byte	45
	.byte	'd'
	.byte	32
	.byte	'o'
	.byte	'p'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	's'
	.byte	32
	.byte	'a'
	.byte	'r'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	10
	.byte	10
	.byte	'l'
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	32
	.byte	45
	.byte	32
	.byte	'd'
	.byte	'u'
	.byte	'm'
	.byte	'p'
	.byte	32
	.byte	'l'
	.byte	'o'
	.byte	'c'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	't'
	.byte	'a'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	's'
	.byte	10
	.byte	'g'
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	32
	.byte	45
	.byte	32
	.byte	'd'
	.byte	'u'
	.byte	'm'
	.byte	'p'
	.byte	32
	.byte	'g'
	.byte	'l'
	.byte	'o'
	.byte	'b'
	.byte	'a'
	.byte	'l'
	.byte	32
	.byte	's'
	.byte	'y'
	.byte	'm'
	.byte	'b'
	.byte	'o'
	.byte	'l'
	.byte	32
	.byte	't'
	.byte	'a'
	.byte	'b'
	.byte	'l'
	.byte	'e'
	.byte	10
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	32
	.byte	45
	.byte	32
	.byte	'p'
	.byte	'r'
	.byte	'i'
	.byte	'n'
	.byte	't'
	.byte	32
	.byte	'u'
	.byte	's'
	.byte	'a'
	.byte	'g'
	.byte	'e'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	's'
	.byte	't'
	.byte	'i'
	.byte	'c'
	.byte	's'
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$L192, %rax
	pushq	%rax
	call	Cprintf
	addq	$8, %rsp
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L182:
	addq	$8, %rsp
	popq	%rbp
	ret
	.data
	.lcomm	L193,8
	.lcomm	L194,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-24, %rsp
	movq	$L193, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L193, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L193, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L193, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L193, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L194, %rax
	pushq	%rax
	movq	$109, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L194, %rax
	pushq	%rax
	movq	$1, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$97, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L194, %rax
	pushq	%rax
	movq	$2, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$105, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L194, %rax
	pushq	%rax
	movq	$3, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$110, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$L194, %rax
	pushq	%rax
	movq	$5, %rax
	popq	%rcx
	addq	%rcx, %rax
	pushq	%rax
	movq	$0, %rax
	popq	%rdx
	movb	%al, (%rdx)
	movq	$0, %rax
	movq	%rax, -24(%rbp)
	movq	$0, %rax
	movq	%rax, CO_debug
	movq	$0, %rax
	movq	%rax, CO_verbose
	movq	$0, %rax
	movq	%rax, CO_componly
	movq	$0, %rax
	movq	%rax, CO_asmonly
	movq	$0, %rax
	movq	%rax, CO_testonly
	movq	$1, %rax
	movq	%rax, CO_stdio
	movq	$0, %rax
	movq	%rax, CO_outfile
	movq	$1, %rax
	movq	%rax, -8(%rbp)
L196:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L200
	jmp	L198
L200:
	jmp	L197
L199:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L196
L197:
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	pushq	%rax
	movq	$45, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jne	L202
	jmp	L201
L202:
	jmp	L198
L201:
	.data
L203:
	.byte	45
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
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cstrcmp
	addq	$16, %rsp
	orq	%rax, %rax
	jz	L205
	jmp	L204
L205:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	$0, %rax
	pushq	%rax
	call	Ccompile
	addq	$16, %rsp
	movq	CErrors, %rax
	orq	%rax, %rax
	jnz	L208
	jmp	L206
L208:
	movq	$1, %rax
	jmp	L207
L206:
	movq	$0, %rax
L207:
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L204:
	movq	$1, %rax
	movq	%rax, -16(%rbp)
L209:
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	orq	%rax, %rax
	jnz	L213
	jmp	L211
L213:
	jmp	L210
L212:
	movq	-16(%rbp), %rax
	incq	-16(%rbp)
	jmp	L209
L210:
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	%rax, %rdx
	xorq	%rax, %rax
	movb	(%rdx), %al
	jmp	L215
L216:
	movq	$1, %rax
	movq	%rax, CO_componly
	jmp	L214
L217:
	leaq	-16(%rbp), %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cdbgopt
	addq	$32, %rsp
	pushq	%rax
	movq	CO_debug, %rax
	popq	%rcx
	orq	%rcx, %rax
	movq	%rax, CO_debug
	movq	$1, %rax
	movq	%rax, CO_testonly
	jmp	L214
L218:
	call	Clongusage
	movq	$0, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L219:
	leaq	-16(%rbp), %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cnextarg
	addq	$32, %rsp
	movq	%rax, CO_outfile
	jmp	L214
L220:
	movq	$1, %rax
	movq	%rax, CO_testonly
	jmp	L214
L221:
	movq	CO_verbose, %rax
	incq	CO_verbose
	jmp	L214
L222:
	movq	-24(%rbp), %rax
	orq	%rax, %rax
	jnz	L224
	jmp	L223
L224:
	.data
L225:
	.byte	't'
	.byte	'o'
	.byte	'o'
	.byte	32
	.byte	'm'
	.byte	'a'
	.byte	'n'
	.byte	'y'
	.byte	32
	.byte	45
	.byte	'D'
	.byte	39
	.byte	's'
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L225, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L223:
	leaq	-16(%rbp), %rax
	pushq	%rax
	leaq	-8(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	call	Cnextarg
	addq	$32, %rsp
	movq	%rax, -24(%rbp)
	jmp	L214
L226:
	movq	$0, %rax
	movq	%rax, CO_stdio
	jmp	L214
L227:
	movq	$1, %rax
	movq	%rax, CO_asmonly
	movq	%rax, CO_componly
	jmp	L214
L228:
	call	Cversion
	movq	$0, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L229:
	call	Cusage
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
	jmp	L214
L215:
	movq	$L230, %rdx
	jmp	switch
L230:
	.quad	10
	.quad	99, L216
	.quad	100, L217
	.quad	104, L218
	.quad	111, L219
	.quad	116, L220
	.quad	118, L221
	.quad	68, L222
	.quad	78, L226
	.quad	83, L227
	.quad	86, L228
	.quad	L229
L214:
	jmp	L212
L211:
	jmp	L199
L198:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jge	L232
	jmp	L231
L232:
	call	Cusage
	movq	$1, %rax
	pushq	%rax
	call	Cexit
	addq	$8, %rsp
L231:
	movq	$0, %rax
	movq	%rax, CNf
L234:
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	popq	%rcx
	cmpq	%rax, %rcx
	jl	L235
	jmp	L233
L235:
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfiletype
	addq	$8, %rsp
	pushq	%rax
	movq	$99, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L237
	jmp	L236
L237:
	movq	-24(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ccompile
	addq	$16, %rsp
	movq	CErrors, %rax
	orq	%rax, %rax
	jnz	L239
	jmp	L238
L239:
	movq	CO_testonly, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L238:
	orq	%rax, %rax
	jnz	L241
	jmp	L240
L241:
	.data
L242:
	.byte	'c'
	.byte	'o'
	.byte	'm'
	.byte	'p'
	.byte	'i'
	.byte	'l'
	.byte	'a'
	.byte	't'
	.byte	'i'
	.byte	'o'
	.byte	'n'
	.byte	32
	.byte	's'
	.byte	't'
	.byte	'o'
	.byte	'p'
	.byte	'p'
	.byte	'e'
	.byte	'd'
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.text
	movq	$0, %rax
	pushq	%rax
	movq	$L242, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L240:
	movq	CO_asmonly, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L244
	jmp	L243
L244:
	movq	CO_testonly, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L243:
	orq	%rax, %rax
	jnz	L246
	jmp	L245
L246:
	movq	$1, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cassemble
	addq	$16, %rsp
L245:
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	jmp	L247
L236:
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cfiletype
	addq	$8, %rsp
	pushq	%rax
	movq	$115, %rax
	popq	%rcx
	cmpq	%rax, %rcx
	je	L249
	jmp	L248
L249:
	movq	CO_testonly, %rax
	orq	%rax, %rax
	jz	L251
	jmp	L250
L251:
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cassemble
	addq	$16, %rsp
L250:
	jmp	L252
L248:
	movq	-8(%rbp), %rax
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Cexists
	addq	$8, %rsp
	orq	%rax, %rax
	jz	L254
	jmp	L253
L254:
	.data
L255:
	.byte	'n'
	.byte	'o'
	.byte	32
	.byte	's'
	.byte	'u'
	.byte	'c'
	.byte	'h'
	.byte	32
	.byte	'f'
	.byte	'i'
	.byte	'l'
	.byte	'e'
	.byte	58
	.byte	32
	.byte	37
	.byte	's'
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
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	movq	$L255, %rax
	pushq	%rax
	call	Ccmderror
	addq	$16, %rsp
L253:
	movq	$0, %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	incq	-8(%rbp)
	shlq	$3, %rax
	pushq	%rax
	movq	24(%rbp), %rax
	popq	%rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	pushq	%rax
	call	Ccollect
	addq	$16, %rsp
L252:
L247:
	jmp	L234
L233:
	movq	CO_componly, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
	orq	%rax, %rax
	jnz	L257
	jmp	L256
L257:
	movq	CO_testonly, %rax
	negq	%rax
	sbbq	%rax, %rax
	incq	%rax
L256:
	orq	%rax, %rax
	jnz	L259
	jmp	L258
L259:
	call	Clink
L258:
	movq	$0, %rax
	jmp	L195
L195:
	addq	$24, %rsp
	popq	%rbp
	ret

