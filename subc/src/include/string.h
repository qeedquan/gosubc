/*
 *	NMH's Simple C Compiler, 2011,2012
 *	string.h
 */

extern char	*sys_errlist[];
extern int	sys_nerr;

void	*memchr(void *p, int c, int len);
int	 memcmp(void *p1, void *p2, int len);
void	*memcpy(void *dest, void *src, int len);
void	*memmove(void *dest, void *src, int len);
void	*memset(void *p, int c, int len);
char	*strcat(char *s, char *a);
char	*strchr(char *s, int c);
int	 strcmp(char *s1, char *s2);
char	*strcpy(char *dest, char *src);
int	 strcspn(char *s, char *set);
char	*strdup(char *s);
char	*strerror(int err);
int	 strlen(char *s);
char	*strncat(char *s, char *a, int len);
int	 strncmp(char *s1, char *s2, int len);
char	*strncpy(char *dest, char *src, int len);
char	*strpbrk(char *s, char *set);
char	*strrchr(char *s, int c);
int	 strspn(char *s, char *set);
char	*strtok(char *s, char *sep);
