#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define NODES	1024

char	*P;

int	Type[NODES],
	Value[NODES],
	Left[NODES],
	Right[NODES];
int	Next = 1;

int node(int t, int v, int l, int r) {
	if (Next >= NODES) {
		fprintf(stderr, "out of nodes\n");
		exit(EXIT_FAILURE);
	}
	Type[Next] = t;
	Value[Next] = v;
	Left[Next] = l;
	Right[Next] = r;
	return Next++;
}

void skip(void) {
	while (isspace(*P)) P++;
}

int sum(void);

int factor(void) {
	int	n = 0, v;

	skip();
	if ('(' == *P) {
		P++;
		n = sum();
		P++;
	}
	else if ('-' == *P) {
		P++;
		n = node('-', 0, factor(), 0);
	}
	else if (isdigit(*P)) {
		for (v=0; isdigit(*P); P++)
			v = v*10 + *P-'0';
		n = node('c', v, 0, 0);
	}
	else if (isalpha(*P)) {
		n = node('v', *P++, 0, 0);
	}
	return n;
}

int term(void) {
	int	n, n2;

	skip();
	n = factor();
	for (;;) {
		skip();
		switch (*P) {
		case '*': P++;
			  n2 = factor();
			  n = node('*', 0, n, n2);
			  break;
		case '/': P++;
			  n2 = factor();
			  n = node('/', 0, n, n2);
			  break;
		default:  return n;
		}
	}
}

int sum(void) {
	int	n, n2;

	skip();
	n = term();
	for (;;) {
		skip();
		switch (*P) {
		case '+': P++;
			  n2 = term();
			  n = node('+', 0, n, n2);
			  break;
		case '-': P++;
			  n2 = term();
			  n = node('-', 0, n, n2);
			  break;
		default:  return n;
		}
	}
}

int expr(char *s) {
	P = s;
	return sum();
}

void dump(int n, int k) {
	int	i;

	if (!n) return;
	for (i=0; i<k; i++)
		printf("  ");
	putchar(Type[n]);
	if ('c' == Type[n])
		printf("(%d)", Value[n]);
	else if ('v' == Type[n])
		printf("(%c)", Value[n]);
	putchar('\n');
	dump(Left[n], k+1);
	dump(Right[n], k+1);
}

void draw2(int n, int w, int d) {
	if (!n) return;
	if ('c' == Type[n])
		printf("N%d: box width 0.3i height 0.3i \"%d\"\n",
			n, Value[n]);
	else if ('v' == Type[n])
		printf("N%d: box width 0.3i height 0.3i \"%c\"\n",
			n, Value[n]);
	else
		printf("N%d: circle radius 0.15i \"%c\"\n", n, Type[n]);
	if (Left[n]) {
		printf("move to N%d\n", n);
		if (Right[n]) {
			printf("move down 0.5i left %d.%di\n", w/1000, w%1000);
			draw2(Left[n], w/d, d+1);
			printf("arrow from left of N%d to top of N%d\n",
				n, Left[n]);
		}
		else {
			printf("move down 0.5i\n");
			draw2(Left[n], w/d, d+1);
			printf("arrow from bottom of N%d to top of N%d\n",
				n, Left[n]);
		}
	}
	if (Right[n]) {
		printf("move to N%d\n", n);
		if (Left[n]) {
			printf("move down 0.5i right %d.%di\n", w/1000, w%1000);
			draw2(Right[n], w/d, d+1);
			printf("arrow from right of N%d to top of N%d\n",
				n, Right[n]);
		}
		else {
			printf("move down 0.5i\n");
			draw2(Right[n], w/d, d+1);
			printf("arrow from bottom of N%d to top of N%d\n",
				n, Right[n]);
		}
	}
}

void draw(int n) {
	printf(".ft C\n.ps 12\n.PS\n");
	draw2(n, 1800, 24);
	printf(".PE\n");
}

int fold(int n) {
	int	cl, cr, vl, vr;

	if (!n) return 0;
	Left[n] = fold(Left[n]);
	Right[n] = fold(Right[n]);
	cl = Left[n] && 'c' == Type[Left[n]];
	cr = Right[n] && 'c' == Type[Right[n]];
	if (cl && 0 == Right[n]) {
		if ('-' == Type[n])
			return node('c', -Value[Left[n]], 0, 0);
	}
	vl = Left[n]? Value[Left[n]]: 0;
	vr = Right[n]? Value[Right[n]]: 0;
	if (cl && cr) {
		switch (Type[n]) {
		case '+': return node('c', vl+vr, 0, 0);
		case '-': return node('c', vl-vr, 0, 0);
		case '*': return node('c', vl*vr, 0, 0);
		case '/': if (vr) return node('c', vl/vr, 0, 0);
		}
	}
	if (cl && 0 == vl && '+' == Type[n]) {
		return Right[n];
	}
	if (cl && 1 == vl && '*' == Type[n]) {
		return Right[n];
	}
	if (cr && 0 == vr && ('+' == Type[n] || '-' == Type[n])) {
		return Left[n];
	}
	if (cr && 1 == vr && ('*' == Type[n] || '/' == Type[n])) {
		return Left[n];
	}
	if ((cr && 0 == vr || cl && 0 == vl) && '*' == Type[n]) {
		return node('c', 0, 0, 0);
	}
	return n;
}

int leaf(int n) {
	return n && ('c' == Type[n] || 'v' == Type[n]);
}

int rewrite(int n) {
	int	t;

	if (!n) return 0;
	Left[n] = rewrite(Left[n]);
	Right[n] = rewrite(Right[n]);
	if ('+' == Type[n] || '*' == Type[n]) {
		if (leaf(Left[n]) && !leaf(Right[n])) {
			t = Left[n];
			Left[n] = Right[n];
			Right[n] = t;
		}
	}
	if (	'+' == Type[n] &&
		Right[n] &&
		'-' == Type[Right[n]] &&
		!Right[Right[n]]
	) {
		return node('-', 0, Left[n], Left[Right[n]]);
	}
	if (	'-' == Type[n] &&
		Left[n] &&
		Right[n] &&
		'c' == Type[Left[n]] &&
		0 == Value[Left[n]]
	) {
		return node('-', 0, Right[n], 0);
	}
	if (	'*' == Type[n] &&
		leaf(Left[n]) &&
		Right[n] &&
		Type[Right[n]] == 'c' &&
		Value[Right[n]] == 2
	) {
		return node('+', 0, Left[n], Left[n]);
	}
	return n;
}

int equal(int n1, int n2) {
	if (!n1) return 0 == n2;
	if (!n2) return 0 == n1;
	if (Type[n1] != Type[n2]) return 0;
	if (Value[n1] != Value[n2]) return 0;
	return equal(Left[n1], Left[n2]) &&
		equal(Right[n1], Right[n2]);
}

int find(int x, int n) {
	if (!n) return 0;
	if (x != n && equal(x, n)) return 1;
	return find(x, Left[n]) || find(x, Right[n]);
}

int size(int n) {
	if (!n) return 0;
	return 1 + size(Left[n]) + size(Right[n]);
}

int	Sub, K;

void trav2(int t, int n) {
	int	k;

	if (!n) return;
	if (t != n && (k = size(n)) > 2 && find(n, t) && k > K) {
		K = k;
		Sub = n;
	}
	trav2(t, Left[n]);
	trav2(t, Right[n]);
}

int maxduptree(int n) {
	Sub = 0;
	K = 0;
	trav2(n, n);
	return Sub;
}

int replace(int x, int n) {
	if (!n) return 0;
	if (equal(x, n)) return node('v', '@', 0, 0);
	return node(Type[n], Value[n],
			replace(x, Left[n]),
			replace(x, Right[n]));
}

int cse(int n) {
	int	csub, t;

	csub = maxduptree(n);
	if (csub) {
		n = replace(csub, n);
		t = node('v', '@', 0, 0);
		csub = node('=', 0, t, csub);
		n = node(',', 0, csub, n);
	}
	return n;
}

void comp(char *s, int d) {
	int	n;

	n = expr(s);
	n = fold(n);
	n = rewrite(n);
	n = cse(n);
	d? draw(n): dump(n, 0);
}

int main(int argc, char **argv) {
	int	d = 0;

	if (argc > 1 && !strcmp(argv[1], "-d")) {
		d = 1;
		argc--;
		argv++;
	}
	comp(argc>1? argv[1]: "", d);
	return EXIT_SUCCESS;
}
