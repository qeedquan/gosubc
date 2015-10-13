#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char	*P;
int	A = 0;
int	Qi = 0, Qx;

void gen(char *s) {
	puts(s);
}

void gen2(char *s, int a) {
	printf(s, a);
	putchar('\n');
}

void synth(int i) {
	int	g;

	g = isupper(Qx);
	if (!Qi) gen("pop  X");
	switch (i) {
	case '+': if (!Qi)
			gen("addr X,A");
		  else if (g)
			gen2("addg _%c,A", Qx);
		  else
			gen2("addl _%c,A", Qx);
		  break;
	case '*': if (!Qi)
			gen("mulr X,A");
		  else if (g)
			gen2("mulg _%c,A", Qx);
		  else
			gen2("mull _%c,A", Qx);
		  break;
	case '-': if (!Qi) {
			gen("swap A,X");
			gen("subr X,A");
		  }
		  else if (g)
			gen2("subg _%c,A", Qx);
		  else
			gen2("subl _%c,A", Qx);
		  break;
	case '/': if (!Qi) {
			gen("swap A,X");
			gen("divr X,A");
		  }
		  else if (g)
			gen2("divg _%c,A", Qx);
		  else
			gen2("divl _%c,A", Qx);
		  break;
	}
	Qi = 0;
}

void load(void) {
	if (A) gen("push A");
	switch (Qi) {
	case 'l': gen2("ll   _%c,A", Qx);
		  break;
	case 'g': gen2("lg   _%c,A", Qx);
		  break;
	}
	Qi = 0;
	A = 1;
}

void queue(int i, int x) {
	if (Qi) load();
	Qi = i;
	Qx = x;
}

void emit(int i, int x) {
	switch (i) {
	case 'l':
	case 'g': queue(i, x);
		  break;
	case '_': load();
		  gen("neg  A");
		  break;
	default:  synth(i);
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
