#
#	NMH's Simple C Compiler, 2011--2014
#	C runtime module for Windows/386 via MinGW
#

# Calling conventions: stack, return in %eax

	.text

# internal switch(expr) routine
# %esi = switch table, %eax = expr

	.globl	switch
switch:	pushl	%esi
	movl	%edx,%esi
	movl	%eax,%ebx
	cld
	lodsl
	movl	%eax,%ecx
next:	lodsl
	movl	%eax,%edx
	lodsl
	cmpl	%edx,%ebx
	jnz	no
	popl	%esi
	jmp	*%eax
no:	loop	next
	lodsl
	popl	%esi
	jmp	*%eax

# int setjmp(jmp_buf env);

	.globl	Csetjmp
Csetjmp:
	movl	4(%esp),%edx	# env
	movl	%esp,(%edx)
	addl	$4,(%edx)
	movl	%ebp,4(%edx)
	movl	(%esp),%eax
	movl	%eax,8(%edx)
	xorl	%eax,%eax
	ret

# void longjmp(jmp_buf env, int v);

	.globl	Clongjmp
Clongjmp:
	movl	8(%esp),%eax	# v
	orl	%eax,%eax
	jne	vok
	incl	%eax
vok:	movl	4(%esp),%edx	# env
	movl	(%edx),%esp
	movl	4(%edx),%ebp
	movl	8(%edx),%edx
	jmp	*%edx

	.text
	.globl	CGetEnvironmentA
CGetEnvironmentA:
	call	_GetEnvironmentStringsA@0
	ret

	.globl	CCreateProcessA
CCreateProcessA:
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	pushl	40(%esp)
	call	_CreateProcessA@40	
	ret

	.globl	CGetStdHandle
CGetStdHandle:
	pushl	4(%esp)
	call	_GetStdHandle@4
	ret

	.globl	CGetCommandLineA
CGetCommandLineA:
	call	_GetCommandLineA@0
	ret

	.globl	CGetSystemTime
CGetSystemTime:
	pushl	4(%esp)
	call	_GetSystemTime@4	
	ret

	.globl	CSystemTimeToFile
CSystemTimeToFile:
	pushl	8(%esp)
	pushl	8(%esp)
	call	_SystemTimeToFileTime@8	
	ret

	.globl	CHeapReAlloc
CHeapReAlloc:
	pushl	16(%esp)
	pushl	16(%esp)
	pushl	16(%esp)
	pushl	16(%esp)
	call	_HeapReAlloc@16	
	ret

	.globl	CHeapAlloc
CHeapAlloc:
	pushl	12(%esp)
	pushl	12(%esp)
	pushl	12(%esp)
	call	_HeapAlloc@12	
	ret

	.globl	CGetProcessHeap
CGetProcessHeap:
	call	_GetProcessHeap@0	
	ret

	.globl	CHeapCreate
CHeapCreate:
	pushl	12(%esp)
	pushl	12(%esp)
	pushl	12(%esp)
	call	_HeapCreate@12
	ret

	.globl	CMoveFileA
CMoveFileA:
	pushl	8(%esp)
	pushl	8(%esp)
	call	_MoveFileA@8	
	ret

	.globl	CExitProcess
CExitProcess:
	pushl	4(%esp)
	call	_ExitProcess@4	
	ret

	.globl	CWriteFile
CWriteFile:
	pushl	20(%esp)
	pushl	20(%esp)
	pushl	20(%esp)
	pushl	20(%esp)
	pushl	20(%esp)
	call	_WriteFile@20	
	ret

	.globl	CReadFile
CReadFile:
	pushl	20(%esp)
	pushl	20(%esp)
	pushl	20(%esp)
	pushl	20(%esp)
	pushl	20(%esp)
	call	_ReadFile@20	
	ret

	.globl	CSetFilePointer
CSetFilePointer:
	pushl	16(%esp)
	pushl	16(%esp)
	pushl	16(%esp)
	pushl	16(%esp)
	call	_SetFilePointer@16	
	ret

	.globl  CSetEndOfFile
CSetEndOfFile:
	pushl   4(%esp)
	call    _SetEndOfFile@4
	ret

	.globl	CCreateFileA
CCreateFileA:
	pushl	28(%esp)
	pushl	28(%esp)
	pushl	28(%esp)
	pushl	28(%esp)
	pushl	28(%esp)
	pushl	28(%esp)
	pushl	28(%esp)
	call	_CreateFileA@28	
	ret

	.globl	CDeleteFileA
CDeleteFileA:
	pushl	4(%esp)
	call	_DeleteFileA@4	
	ret

	.globl	CCloseHandle
CCloseHandle:
	pushl	4(%esp)
	call	_CloseHandle@4	
	ret

	.globl	CGetExitCodeProce
CGetExitCodeProce:
	pushl	8(%esp)
	pushl	8(%esp)
	call	_GetExitCodeProcess@8	
	ret

	.globl	CWaitForSingleObj
CWaitForSingleObj:
	pushl	8(%esp)
	pushl	8(%esp)
	call	_WaitForSingleObject@8	
	ret

	.globl	_mainCRTStartup
_mainCRTStartup:
	.globl	_WinMainCRTStartup
_WinMainCRTStartup:
	call	CmainCRTStartup
	ret

