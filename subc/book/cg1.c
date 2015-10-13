#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char	*P;
int	A = 0;

void emit(int i, int x) {
	if ('l' == i || 'g' == i) {
		if (A) emit('p', 0);
		A = 1;
	}
	switch (i) {
	case '_': printf("neg  A\n");
		  break;
	case '+': printf("pop  X\n");
		  printf("addr X,A\n");
		  break;
	case '*': printf("pop  X\n");
		  printf("mulr X,A\n");
		  break;
	case '-': printf("pop  X\n");
		  printf("swap A,X\n");
		  printf("subr X,A\n");
		  break;
	case '/': printf("pop  X\n");
		  printf("swap A,X\n");
		  printf("divr X,A\n");
		  break;
	case 'g': printf("lg   _%c,A\n", x);
		  break;
	case 'l': printf("ll   _%c,A\n", x);
		  break;
	case 'p': printf("push A\n");
		  break;
	}
}

void skip(void) {
	while (isspace(*P)) P++;
}

void factor(void) {
	skip();
	if ('-' == *P) {
		P++;
		factor();
		emit('_', 0);
	}
	else if (isupper(*P))
		emit('g', *P++);
	else
		emit('l', *P++);
}

void term(void) {
	skip();
	factor();
	for (;;) {
		skip();
		switch (*P) {
		case '*': P++;
			  factor();
			  emit('*', 0);
			  break;
		case '/': P++;
			  factor();
			  emit('/', 0);
			  break;
		default:  return;
		}
	}
}

void sum(void) {
	skip();
	term();
	for (;;) {
		skip();
		switch (*P) {
		case '+': P++;
			  term();
			  emit('+', 0);
			  break;
		case '-': P++;
			  term();
			  emit('-', 0);
			  break;
		default:  return;
		}
	}
}

void expr(char *s) {
	P = s;
	sum();
}

main(int argc, char **argv) {
	expr(argc>1? argv[1]: "");
	return EXIT_SUCCESS;
}
