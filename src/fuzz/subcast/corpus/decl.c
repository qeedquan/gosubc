/*
 *	NMH's Simple C Compiler, 2011--2014
 *	Declaration parser
 */

#include "defs.h"
#include "data.h"
#include "decl.h"

static int declarator(int arg, int scls, char *name, int *pprim, int *psize,
			int *pval, int *pinit);

/*
 * enumdecl := { enumlist } ;
 *
 * enumlist :=
 *	  enumerator
 *	| enumerator , enumlist
 *
 * enumerator :=
 *	  IDENT
 *	| IDENT = constexpr
 */

static void enumdecl(int glob) {
	int	v = 0;
	char	name[NAMELEN+1];

	Token = scan();
	if (IDENT == Token)
		Token = scan();
	lbrace();
	while (RBRACE != Token) {
		copyname(name, Text);
		ident();
		if (ASSIGN == Token) {
			Token = scan();
			v = constexpr();
		}
		if (glob)
			addglob(name, PINT, TCONSTANT, 0, 0, v++, NULL, 0);
		else
			addloc(name, PINT, TCONSTANT, 0, 0, v++, 0);
		if (Token != COMMA)
			break;
		Token = scan();
		if (eofcheck()) return;
	}
	rbrace();
	semi();
}

/*
 * initlist :=
 *	  { const_list }
 *	| STRLIT
 *
 * const_list :=
 *	  constexpr
 *	| constexpr , const_list
 */

static int initlist(char *name, int prim) {
	int	n = 0, v;
	char	buf[30];

	gendata();
	genname(name);
	if (STRLIT == Token) {
		if (PCHAR != prim)
			error("initializer type mismatch: %s", name);
		gendefs(Text, Value);
		gendefb(0);
		genalign(Value-1);
		Token = scan();
		return Value-1;
	}
	lbrace();
	while (Token != RBRACE) {
		v = constexpr();
		if (PCHAR == prim) {
			if (v < 0 || v > 255) {
				sprintf(buf, "%d", v);
				error("initializer out of range: %s", buf);
			}
			gendefb(v);
		}
		else {
			gendefw(v);
		}
		n++;
		if (COMMA == Token)
			Token = scan();
		else
			break;
		if (eofcheck()) return 0;
	}
	if (PCHAR == prim) genalign(n);
	Token = scan();
	if (!n) error("too few initializers", NULL);
	return n;
}

int primtype(int t, char *s) {
	int	p, y;
	char	sname[NAMELEN+1];

	p = t == CHAR? PCHAR:
		t == INT? PINT:
		t == STRUCT? PSTRUCT:
		t == UNION? PUNION:
		PVOID;
	if (PUNION == p || PSTRUCT == p) {
		if (!s) {
			Token = scan();
			copyname(sname, Text);
			s = sname;
			if (IDENT != Token) {
				error("struct/union name expected: %s", Text);
				return p;
			}
		}
		if ((y = findstruct(s)) == 0 || Prims[y] != p)
			error("no such struct/union: %s", s);
		p |= y;
	}
	return p;
}

/*
 * pmtrdecl :=
 *	  ( )
 *	| ( pmtrlist )
 *	| ( pmtrlist , ... )
 *
 * pmtrlist :=
 *	  primtype declarator
 *	| primtype declarator , pmtrlist
 */

static int pmtrdecls(void) {
	char	name[NAMELEN+1];
	int	prim, type, size, na, addr;
	int	dummy;

	if (RPAREN == Token)
		return 0;
	na = 0;
	addr = 2*BPW;
	for (;;) {
		if (na > 0 && ELLIPSIS == Token) {
			Token = scan();
			na = -(na + 1);
			break;
		}
		else if (IDENT == Token) {
			prim = PINT;
		}
		else {
			if (	Token != CHAR && Token != INT &&
				Token != VOID &&
				Token != STRUCT && Token != UNION
			) {
				error("type specifier expected at: %s", Text);
				Token = synch(RPAREN);
				return na;
			}
			name[0] = 0;
			prim = primtype(Token, NULL);
			Token = scan();
			if (RPAREN == Token && prim == PVOID && !na)
				return 0;
		}
		size = 1;
		type = declarator(1, CAUTO, name, &prim, &size, &dummy,
				&dummy);
		addloc(name, prim, type, CAUTO, size, addr, 0);
		addr += BPW;
		na++;
		if (COMMA == Token)
			Token = scan();
		else
			break;
	}
	return na;
}

int pointerto(int prim) {
	int	y;

	if (CHARPP == prim || INTPP == prim || VOIDPP == prim ||
	    FUNPTR == prim ||
	    (prim & STCMASK) == STCPP || (prim & STCMASK) == UNIPP
	)
		error("too many levels of indirection", NULL);
	y = prim & ~STCMASK;
	switch (prim & STCMASK) {
	case PSTRUCT:	return STCPTR | y;
	case STCPTR:	return STCPP | y;
	case PUNION:	return UNIPTR | y;
	case UNIPTR:	return UNIPP | y;
	}
	return PINT == prim? INTPTR:
		PCHAR == prim? CHARPTR:
		PVOID == prim? VOIDPTR:
		INTPTR == prim? INTPP:
		CHARPTR == prim? CHARPP: VOIDPP;
}

/*
 * declarator :=
 *	  IDENT
 *	| * IDENT
 *	| * * IDENT
 *	| * IDENT [ constexpr ]
 *	| IDENT [ constexpr ]
 *	| IDENT = constexpr
 *	| IDENT [ ] = initlist
 *	| IDENT pmtrdecl
 *	| IDENT [ ]
 *	| * IDENT [ ]
 *	| ( * IDENT ) ( )
 */

static int declarator(int pmtr, int scls, char *name, int *pprim, int *psize,
			int *pval, int *pinit)
{
	int	type = TVARIABLE;
	int	ptrptr = 0;

	if (STAR == Token) {
		Token = scan();
		*pprim = pointerto(*pprim);
		if (STAR == Token) {
			Token = scan();
			*pprim = pointerto(*pprim);
			ptrptr = 1;
		}
	}
	else if (LPAREN == Token) {
		if (*pprim != PINT)
			error("function pointers are limited to type 'int'",
				NULL);
		Token = scan();
		*pprim = FUNPTR;
		match(STAR, "(*name)()");
	}
	if (IDENT != Token) {
		error("missing identifier at: %s", Text);
		name[0] = 0;
	}
	else {
		copyname(name, Text);
		Token = scan();
	}
	if (FUNPTR == *pprim) {
		rparen();
		lparen();
		rparen();
	}
	if (!pmtr && ASSIGN == Token) {
		Token = scan();
		*pval = constexpr();
		if (PCHAR == *pprim)
			*pval &= 0xff;
		if (*pval && !inttype(*pprim))
			error("non-zero pointer initialization", NULL);
		*pinit = 1;
	}
	else if (!pmtr && LPAREN == Token) {
		Token = scan();
		*psize = pmtrdecls();
		rparen();
		return TFUNCTION;
	}
	else if (LBRACK == Token) {
		if (ptrptr)
			error("too many levels of indirection: %s", name);
		Token = scan();
		if (RBRACK == Token) {
			Token = scan();
			if (pmtr) {
				*pprim = pointerto(*pprim);
			}
			else {
				type = TARRAY;
				*psize = 1;
				if (ASSIGN == Token) {
					Token = scan();
					if (!inttype(*pprim))
						error("initialization of"
							" pointer array not"
							" supported",
							NULL);
					*psize = initlist(name, *pprim);
					if (CAUTO == scls)
						error("initialization of"
							" local arrays"
							" not supported: %s",
							name);
					*pinit = 1;
				}
				else if (CEXTERN != scls) {
					error("automatically-sized array"
						" lacking initialization: %s",
						name);
				}
			}
		}
		else {
			*psize = constexpr();
			if (*psize < 0) {
				error("invalid array size", NULL);
				*psize = 0;
			}
			type = TARRAY;
			rbrack();
		}
	}
	if (PVOID == *pprim)
		error("'void' is not a valid type: %s", name);
	return type;
}

/*
 * localdecls :=
 *        ldecl
 *      | ldecl localdecls
 *
 * ldecl :=
 *	  primtype ldecl_list ;
 *	| lclass primtype ldecl_list ;
 *	| lclass ldecl_list ;
 *	| enum_decl
 *	| struct_decl
 *
 * lclass :=
 *	| AUTO
 *	| EXTERN
 *	| REGISTER
 *	| STATIC
 *	| VOLATILE
 *
 * ldecl_list :=
 *	  declarator
 *	| declarator , ldecl_list
 */

static int localdecls(void) {
	char	name[NAMELEN+1];
	int	prim, type, size, addr = 0, val, ini;
	int	stat, extn;
	int	pbase, rsize;

	Nli = 0;
	while ( AUTO == Token || EXTERN == Token || REGISTER == Token ||
		STATIC == Token || VOLATILE == Token ||
		INT == Token || CHAR == Token || VOID == Token ||
		ENUM == Token ||
		STRUCT == Token || UNION == Token
	) {
		if (ENUM == Token) {
			enumdecl(0);
			continue;
		}
		extn = stat = 0;
		if (AUTO == Token || REGISTER == Token || STATIC == Token ||
			VOLATILE == Token || EXTERN == Token
		) {
			stat = STATIC == Token;
			extn = EXTERN == Token;
			Token = scan();
			if (	INT == Token || CHAR == Token ||
				VOID == Token ||
				STRUCT == Token || UNION == Token
			) {
				prim = primtype(Token, NULL);
				Token = scan();
			}
			else
				prim = PINT;
		}
		else {
			prim = primtype(Token, NULL);
			Token = scan();
		}
		pbase = prim;
		for (;;) {
			prim = pbase;
			if (eofcheck()) return 0;
			size = 1;
			ini = val = 0;
			type = declarator(0, CAUTO, name, &prim, &size,
					&val, &ini);
			rsize = objsize(prim, type, size);
			rsize = (rsize + INTSIZE-1) / INTSIZE * INTSIZE;
			if (stat) {
				addloc(name, prim, type, CLSTATC, size,
					label(), val);
			}
			else if (extn) {
				addloc(name, prim, type, CEXTERN, size,
					0, val);
			}
			else {
				addr -= rsize;
				addloc(name, prim, type, CAUTO, size, addr, 0);
			}
			if (ini && !stat) {
				if (Nli >= MAXLOCINIT) {
					error("too many local initializers",
						NULL);
					Nli = 0;
				}
				LIaddr[Nli] = addr;
				LIval[Nli++] = val;
			}
			if (COMMA == Token)
				Token = scan();
			else
				break;
		}
		semi();
	}
	return addr;
}

static int intcmp(int *x1, int *x2) {
	while (*x1 && *x1 == *x2)
		x1++, x2++;
	return *x1 - *x2;
}

static void signature(int fn, int from, int to) {
	int	types[MAXFNARGS+1], i;

	if (to - from > MAXFNARGS)
		error("too many function parameters", Names[fn]);
	for (i=0; i<MAXFNARGS && from < to; i++)
		types[i] = Prims[--to];
	types[i] = 0;
	if (NULL == Mtext[fn]) {
		Mtext[fn] = galloc((i+1) * sizeof(int), 1);
		memcpy(Mtext[fn], types, (i+1) * sizeof(int));
	}
	else if (intcmp((int *) Mtext[fn], types))
		error("declaration does not match prior prototype: %s",
			Names[fn]);
}

/*
 * decl :=
 *	  declarator { localdecls stmt_list }
 *	| decl_list ;
 *
 * decl_list :=
 *	  declarator
 *	| declarator , decl_list
 */

void decl(int clss, int prim) {
	char	name[NAMELEN+1];
	int	pbase, type, size = 0, val, init;
	int	lsize;

	pbase = prim;
	for (;;) {
		prim = pbase;
		val = 0;
		init = 0;
		type = declarator(0, clss, name, &prim, &size, &val, &init);
		if (TFUNCTION == type) {
			clss = clss == CSTATIC? CSPROTO: CEXTERN;
			Thisfn = addglob(name, prim, type, clss, size, 0,
					NULL, 0);
			signature(Thisfn, Locs, NSYMBOLS);
			if (LBRACE == Token) {
				clss = clss == CSPROTO? CSTATIC:
					clss == CEXTERN? CPUBLIC: clss;
				Thisfn = addglob(name, prim, type, clss, size,
					0, NULL, 0);
				Token = scan();
				lsize = localdecls();
				gentext();
				if (CPUBLIC == clss) genpublic(name);
				genaligntext();
				genname(name);
				genentry();
				genstack(lsize);
				genlocinit();
				Retlab = label();
				compound(0);
				genlab(Retlab);
				genstack(-lsize);
				genexit();
				if (O_debug & D_LSYM)
					dumpsyms("LOCALS: ", name, Locs,
						NSYMBOLS);
			}
			else {
				semi();
			}
			clrlocs();
			return;
		}
		if (CEXTERN == clss && init) {
			error("initialization of 'extern': %s", name);
		}
		addglob(name, prim, type, clss, size, val, NULL, init);
		if (COMMA == Token)
			Token = scan();
		else
			break;
	}
	semi();
}

/*
 * structdecl :=
 *	  STRUCT identifier { member_list } ;
 *
 * member_list :=
 *	  primtype mdecl_list ;
 *	| primtype mdecl_list ; member_list
 *
 * mdecl_list :=
 *	  declarator
 *	| declatator , mdecl_list
 */

void structdecl(int clss, int uniondecl) {
	int	base, prim, size, dummy, type, addr = 0;
	char	name[NAMELEN+1], sname[NAMELEN+1];
	int	y, usize = 0;

	Token = scan();
	copyname(sname, Text);
	ident();
	if (Token != LBRACE) {
		prim = primtype(uniondecl? UNION: STRUCT, sname);
		decl(clss, prim);
		return;
	}
	y = addglob(sname, uniondecl? PUNION: PSTRUCT, TSTRUCT,
			CMEMBER, 0, 0, NULL, 0);
	Token = scan();
	while (	INT == Token || CHAR == Token || VOID == Token ||
		STRUCT == Token || UNION == Token
	) {
		base = primtype(Token, NULL);
		size = 0;
		Token = scan();
		for (;;) {
			if (eofcheck()) return;
			prim = base;
			type = declarator(1, clss, name, &prim, &size,
						&dummy, &dummy);
			addglob(name, prim, type, CMEMBER, size, addr,
				NULL, 0);
			size = objsize(prim, type, size);
			if (size < 0)
				error("size of struct/union member"
					" is unknown: %s",
					name);
			if (uniondecl) {
				usize = size > usize? size: usize;
			}
			else {
				addr += size;
				addr = (addr + INTSIZE-1) / INTSIZE * INTSIZE;
			}
			if (Token != COMMA) break;
			Token = scan();
		}
		semi();
	}
	rbrace();
	semi();
	Sizes[y] = uniondecl? usize: addr;
}

/*
 * top :=
 *	  ENUM enumdecl
 *	| decl
 *	| primtype decl
 *	| storclass decl
 *	| storclass primtype decl
 *
 * storclass :=
 *	  EXTERN
 *	| STATIC
 */

void top(void) {
	int	prim, clss = CPUBLIC;

	switch (Token) {
	case EXTERN:	clss = CEXTERN; Token = scan(); break;
	case STATIC:	clss = CSTATIC; Token = scan(); break;
	case VOLATILE:	Token = scan(); break;
	}
	switch (Token) {
	case ENUM:
		enumdecl(1);
		break;
	case STRUCT:
	case UNION:
		structdecl(clss, UNION == Token);
		break;
	case CHAR:
	case INT:
	case VOID:
		prim = primtype(Token, NULL);
		Token = scan();
		decl(clss, prim);
		break;
	case IDENT:
		decl(clss, PINT);
		break;
	default:
		error("type specifier expected at: %s", Text);
		Token = synch(SEMI);
		break;
	}
}

static void stats(void) {
	printf(	"Memory usage: "
		"Symbols: %5d/%5d, "
		"Names: %5d/%5d, "
		"Nodes: %5d/%5d\n",
		Globs, NSYMBOLS,
		Nbot, POOLSIZE,
		Ndmax, NODEPOOLSZ);
}

void defarg(char *s) {
	char	*p;

	if (NULL == s) return;
	if ((p = strchr(s, '=')) != NULL)
		*p++ = 0;
	else
		p = "";
	addglob(s, 0, TMACRO, 0, 0, 0, globname(p), 0);
	if (*p) *--p = '=';
}

void program(char *name, FILE *in, FILE *out, char *def) {
	init();
	defarg(def);
	Infile = in;
	Outfile = out;
	File = Basefile = name;
	genprelude();
	Token = scan();
	while (XEOF != Token)
		top();
	genpostlude();
	if (O_debug & D_GSYM) dumpsyms("GLOBALS", "", 1, Globs);
	if (O_debug & D_STAT) stats();
}
