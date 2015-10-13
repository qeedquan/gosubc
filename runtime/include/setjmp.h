/*
 *	NMH's Simple C Compiler, 2012
 *	setjmp.h
 */

struct _jmp_buf {
	void	*sp, *fp, *ip;
};

#define jmp_buf	struct _jmp_buf

void	longjmp(jmp_buf *env, int v);
int	setjmp(jmp_buf *env);
