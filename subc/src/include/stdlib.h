/*
 *	NMH's Simple C Compiler, 2011,2012
 *	stdlib.h
 */

#define EXIT_FAILURE	1
#define EXIT_SUCCESS	0

#define RAND_MAX	65535

extern char	**environ;

void	 abort(void);
int	 abs(int n);
int	 atexit(int (*fn)());
int	 atoi(char *s);
void	*bsearch(void *key, void *array, int count, int size, int (*cmp)());
void	*calloc(int count, int size);
void	 exit(int rc);
void	 free(void *p);
char	*getenv(char *name);
void	*malloc(int size);
void	 qsort(void *array, int count, int size, int (*cmp)());
int	 rand(void);
void	*realloc(void *p, int size);
void	 srand(int seed);
int	 strtol(char *s, char *endp[], int base);
int	 system(char *s);
