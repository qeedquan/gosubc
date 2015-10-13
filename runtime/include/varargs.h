/*
 *	NMH's Simple C Compiler, 2014
 *	varargs.h
 */

/*
 * These are (slightly incompatible) functions,
 * because we don't have parameterized macros.
 */

void	**_va_start(void *last);
void	 *_va_arg(void **ap);
void	  _va_end(void **ap);
