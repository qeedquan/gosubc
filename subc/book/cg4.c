#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

char	*P;
int	R = 0;
int	S = 0;
int	N = 4;
int	Qi = 0, Qx;

void gen(char *s) {
	printf(s, R);
	putchar('\n');
}

void gen2(char *s, int a) {
	printf(s, a, R);
	putchar('\n');
}

void genr(char *s) {
	int	d;

	d = R < 2? N: R-1;
	printf(s, R, d);
	putchar('\n');
}

void push(void) {
	if (R >= N) {
		R = 1;
		gen("push R%d");
		S++;
	}
	else if (S) {
		R++;
		gen("push R%d");
		S++;
	}
	else {
		R++;
	}
}

void pop(void) {
	if (R <= 1) {
		gen("pop  R%d");
		R = N;
		S--;
	}
	else if (S) {
		gen("pop  R%d");
		S--;
		R--;
	}
	else {
		R--;
	}
}

void synth(int i) {
	int	g;

	g = isupper(Qx);
	switch (i) {
	case '+': if (!Qi)
			genr("addr R%d,R%d");
		  else if (g)
			gen2("addg _%c,R%d", Qx);
		  else
			gen2("addl _%c,R%d", Qx);
		  break;
	case '*': if (!Qi)
			genr("mulr R%d,R%d");
		  else if (g)
			gen2("mulg _%c,R%d", Qx);
		  else
			gen2("mull _%c,R%d", Qx);
		  break;
	case '-': if (!Qi) {
			genr("swap R%d,R%d");
			genr("subr R%d,R%d");
		  }
		  else if (g)
			gen2("subg _%c,R%d", Qx);
		  else
			gen2("subl _%c,R%d", Qx);
		  break;
	case '/': if (!Qi) {
			genr("swap R%d,R%d");
			genr("divr R%d,R%d");
		  }
		  else if (g)
			gen2("divg _%c,R%d", Qx);
		  else
			gen2("divl _%c,R%d", Qx);
		  break;
	}
	if (!Qi) pop();
	Qi = 0;
}

void load(void) {
	push();
	switch (Qi) {
	case 'l': gen2("ll   _%c,R%d", Qx);
		  break;
	case 'g': gen2("lg   _%c,R%d", Qx);
		  break;
	}
	Qi = 0;
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
		  gen("neg  R%d");
		  break;
	default:  synth(i);
		  break;
	}
}

void skip(void) {
	while (isspace(*P)) P++;
}

void sum(void);

void factor(void) {
	skip();
	if ('-' == *P) {
		P++;
		factor();
		emit('_', 0);
	}
	else if ('(' == *P) {
		P++;
		sum();
		P++;
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
