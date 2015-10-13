;
;	NMH's Simple C Compiler, 2013,2014
;	C runtime module for DOS
;

; Calling conventions: stack, return in AX
; System call: AH=call#, arguments in call-specific registers,
;              carry indicates error,
;              return/error value in AX

DOS	equ	21h
CMDLEN	equ	128
PMTRS	equ	64
PSPCL	equ	81h
ENVPTR	equ	2ch
STKTOP	equ	0fffeh
STKLEN	equ	1000h

	.model	small

	.stack	STKLEN		; dummy stack

	.data

	public	Cenviron, C_faddcr

Cenviron	dw	0
C_faddcr	dw	1

argc		dw	0	; internal
argv		dw	0

	.code

	extrn	Cmain,	Cexit

; Initial entry point is here

	public	_start
_start:
	mov	bx,8192		; set program memory to 128K ; XXX
	mov	ah,4ah		; setblock
	int	DOS
	jnc	setupheap

error:
	mov	dx,offset memerror
	push	cs
	pop	ds
	mov	ah,9		; write $-terminated
	int	DOS
	mov	ax,4c7fh	; exit(127)
	int	DOS

; At this point:
; CS = code, DS = ES = PSP, SS = end of static data
; DGROUP = beginning of static data

setupheap:
	mov	dx,ss		; dx = length of static data
	mov	ax,DGROUP
	sub	dx,ax
	mov	cl,4
	shl	dx,cl
	mov	cs:minmem,dx	; beginning of malloc() arena (heap)
	mov	cs:break,dx	; current break
	xor	ax,ax
	sub	ax,dx
	sub	ax,STKLEN
	add	ax,cs:break
	mov	cs:maxmem,ax	; size of arena
	mov	ax,DGROUP	; set DS = SS = DGROUP
	mov	ds,ax
	mov	ss,ax
	mov	sp,STKTOP

; At this point:
; CS = code, DS = SS = DGROUP, ES = PSP

; copy the command line from the PSP

	sub	sp,CMDLEN	; reserve space for argc,argv
	sub	sp,PMTRS
	mov	di,sp
	add	di,2		; point to reserved area
	mov	si,PSPCL	; command line in PSP
	mov	bx,di		; bx = start of command line
	mov	cx,CMDLEN	; copy CMDLEN bytes

	call	swapsegs
	cld
	rep
	movsb
	call	swapsegs

; parse the command line and build argv

	mov	si,di		; save &argv[0]
	mov	word ptr [si],0	; clear argv[0]
	inc	si
	inc	si
	mov	cx,1		; preset argc

nextch:	mov	al,[bx]		; get char from cmd line
	inc	bx
	cmp	al,0dh		; end of line ?
	jz	argsdone

	cmp	al,20h		; skip white spaces
	jz	nextch
	cmp	al,9
	jz	nextch

	dec	bx
	mov	[si],bx		; save argv[n]
	inc	bx
	inc	si
	inc	si
	inc	cx		; increment argc

getend:	mov	al,[bx]		; search end of current arg
	cmp	al,20h
	jz	endarg
	cmp	al,9
	jz	endarg
	cmp	al,0dh		; CR: end of line reached, stop parsing
	jz	argsdone
	inc	bx
	jmp	short getend

endarg:	mov	byte ptr [bx],0
	inc	bx
	jmp	nextch

argsdone:
	mov	byte ptr [bx],0	; terminate last arg
	mov	word ptr [si],0	; terminate argv[] with NULL
	mov	argc,cx		; save for later use
	mov	argv,di

; copy environment

setupenv:
	mov	si,ENVPTR	; get environ ptr from PSP
	mov	ax,es:[si]
	mov	es,ax

	xor	bx,bx		; get length of env
	xor	dx,dx		; and number of entries
nxtenv:	mov	al,es:[bx]
	inc	bx
	or	al,al
	jnz	nxtenv
	inc	dx
	mov	al,es:[bx]
	inc	bx
	or	al,al
	jnz	nxtenv

	cmp	bx,cs:maxmem
	jbe	copyenv
	jmp	error		; not enough space

copyenv:
	sub	sp,bx		; space for environ[]
	sub	sp,dx
	sub	sp,dx
	sub	sp,2

	mov	di,sp		; copy environment
	xor	si,si
	mov	cx,bx

	call	swapsegs
	rep
	movsb
	push	es
	pop	ds

	mov	Cenviron,di

	mov	si,sp		; build environ[]
	inc	si
store:	dec	si
	mov	ax,si
	stosw
scan:	lodsb
	or	al,al
	jnz	scan
	lodsb
	or	al,al
	jnz	store
	xor	ax,ax
	stosw

; initialize run time library

	call	near ptr C_init	;INIT

; call main() and exit

	mov	ax,argv
	push	ax
	mov	ax,argc
	push	ax
	call	near ptr Cmain
	add	sp,4
	push	ax
x:	call	near ptr Cexit	;EXIT
	xor	bx,bx
	div	bx
	jmp	x

; swap es,dx

swapsegs:
	mov	dx,es		; swap es,ds
	mov	ax,ds
	mov	ds,dx
	mov	es,ax
	ret

; evaluate 'switch' statement

	public	switch
switch:	mov	cx,cs:[si]	; count
	inc	si
	inc	si	
nxcase: mov	dx,cs:[si]	; fetch value from table
	inc	si
	inc	si	
	mov	bx,cs:[si]	; fetch address from table
	inc	si
	inc	si	
	cmp	ax,dx		; right case?
	jz	docase		; no, go on
	dec	cx
	jnz	nxcase
	mov	bx,cs:[si]
docase:	jmp	bx

; int setjmp(jmp_buf env);

	public	Csetjmp
Csetjmp:
	mov	bx,sp
	mov	bx,[bx+2]	; env
	mov	ax,sp
	add	ax,2
	mov	[bx],ax
	mov	[bx+2],bp
	mov	si,sp
	mov	ax,[si]
	mov	[bx+4],ax
	xor	ax,ax
	ret

; void longjmp(jmp_buf env, int v);

	public	Clongjmp
Clongjmp:
	mov	bx,sp
	mov	ax,[bx+4]	; v
	or	ax,ax
	jnz	vok
	inc	ax
vok:	mov	bx,[bx+2]	; env
	mov	sp,[bx]
	mov	bp,[bx+2]
	mov	si,[bx+4]
	jmp	si

; void *_sbrk(int n);

	public	C_sbrk
C_sbrk:	mov	bx,sp
	mov	ax,[bx+2]	; size
	add	ax,cs:break
	cmp	ax,cs:maxmem
	ja	sbfail
	cmp	ax,cs:minmem
	jb	sbfail
	mov	ax,cs:break
	mov	dx,ax
	add	dx,[bx+2]	; size
	mov	cs:break,dx
	ret
sbfail:	xor	ax,ax
	dec	ax
	ret

; void _exit(int rc);

	public	C_exit
C_exit:	mov	bx,sp
	mov	ax,[bx+2]	; rc
	mov	ah,4ch		; terminate program
	int	DOS

; int _creat(char *name, int perms);

	public	C_creat
C_creat:mov	bx,sp
	mov	cx,0
	mov	dx,[bx+2]	; name
	mov	ah,3ch
	int	DOS
	jnc	crok
	xor	ax,ax
	dec	ax
crok:	ret

; int _open(char *name, int mode);

	public	C_open
C_open:	mov	bx,sp
	mov	ax,[bx+4]	; mode
	mov	ah,3dh
	mov	dx,[bx+2]	; name
	int	DOS
	jnc	opok
	xor	ax,ax
	dec	ax
opok:	ret

; int _close(int fd);

	public	C_close
C_close:
	mov	bx,sp
	mov	bx,[bx+2]	; fd
	mov	ah,3eh
	int	DOS
	jnc	clok
	xor	ax,ax
	dec	ax
	ret
clok:	xor	ax,ax
	ret

; int _read(int fd, void *buf, int len);

	public	C_read
C_read:
	mov	bx,sp
	mov	cx,[bx+6]	; len
	mov	dx,[bx+4]	; buf
	mov	bx,[bx+2]	; fd
	mov	ah,3fh
	int	DOS
	jnc	rdok
	xor	ax,ax
	dec	ax
rdok:	ret

; int _write(int fd, void *buf, int len);

	public	C_write
C_write:
	mov	bx,sp
	mov	cx,[bx+6]	; len
	mov	dx,[bx+4]	; buf
	mov	bx,[bx+2]	; fd
	mov	ah,40h
	int	DOS
	jnc	wrok
	xor	ax,ax
	dec	ax
wrok:	ret

	.data

abort	db	"crt0: aborted.", 13, 10, '$'

	.code

; int raise(int sig);

	public	Craise
Craise:	mov	dx,offset abort
	mov	ah,9
	int	DOS
	mov	ax,4c7fh
	int	DOS
	ret

; int signal(int sig, int (*handler)())

	public	Csignal
Csignal:
	mov	ax,-2		; dummy, return SIG_ERR
	ret

; int _lseek(int fd, int where, int how);

	public	C_lseek
C_lseek:
	mov	bx,sp
	mov	ax,[bx+4]	; where
	cwd
	mov	cx,dx
	mov	dx,ax
	mov	ax,[bx+6]	; how
	mov	bx,[bx+2]	; fd
	mov	ah,42h
	int	DOS
	jnc	lsok
	xor	ax,ax
	dec	ax
lsok:	ret

; int _unlink(char *name);

	public	C_unlink
C_unlink:
	mov	bx,sp
	mov	dx,[bx+2]	; name
	mov	ah,41h
	int	DOS
	jnc	ulok
	xor	ax,ax
	dec	ax
	ret
ulok:	xor	ax,ax
	ret

; int _rename(char *old, char *new);

	public	C_rename
C_rename:
	mov	bx,sp
	mov	dx,[bx+2]	; old
	mov	di,[bx+4]	; new
	mov	ah,56h
	int	DOS
	jnc	rnok
	xor	ax,ax
	dec	ax
	ret
rnok:	xor	ax,ax
	ret

; int _fork(void);

	public	C_fork
C_fork:	xor	ax,ax		; dummy, return -1
	dec	ax
	ret

; int wait(int *rc)

	public	C_wait
C_wait:	xor	ax,ax		; dummy, return -1
	dec	ax
	ret

; int _execve(char *prog, char **argv, char **env);

	public	C_execve
C_execve:
	xor	ax,ax		; dummy, return -1
	dec	ax
	ret

; int _system(char *shell, void *parmb);

	public	C_system
C_system:
	mov	bx,sp
	mov	dx,[bx+2]	; shell
	mov	bx,[bx+4]	; parmb
	mov	di,ds
	mov	[bx+4],di
	mov	[bx+8],di
	mov	[bx+12],di
	mov	ax,4b00h
	int	DOS
	jnc	syok
	xor	ax,ax
	dec	ax
	ret
syok:	xor	ax,ax
	ret

; int _time(void);

	public	C_time
C_time:
	xor	ax,ax		; dummy, return 0
	ret

; internal data (in code segment)

break:		dw	0
minmem:		dw	0
maxmem:		dw	0

memerror:	db	"crt0: out of memory.", 13, 10, '$'

	end

