%{
/* SubC grammar transliterated from the subc source code, added labels/gotos to the grammar,
   this one is known to have grammar conflicts */
%}


%token LAUTO LELLIPSIS LREGISTER LVOLATILE LANDAS LARROW LCHAR LDEC LDIVAS LEQ 
%token LENUM LEXTERN LGEQ LLAND LLEQ LLOR LMODAS LNEQ LORAS LPLUSAS LRSH LRSHAS 
%token LLSH LLSHAS LIDENT LINC LINT LINTLIT LMULAS LSTATIC LSTRUCT LUNION LVOID 
%token LSIZEOF LSTRLIT LSUBAS LXORAS LGOTO LRETURN LSWITCH LWHILE LDEFAULT LCASE 
%token LBREAK LCONTINUE LDO LELSE LFOR LIF

%start prog

%%
prog:
|
	top prog

top:
	LENUM enumdecl
|
	decl
|
	primtype decl
|
	storclass decl
|
	storclass primtype decl

storclass:
	LEXTERN
|
	LSTATIC

primtype:
	LCHAR
|
	LINT
|
	LVOID
|
	LSTRUCT LIDENT
|
	LUNION LIDENT
|

enumdecl:
	'{' enumlist '}' ';'

enumlist:
	enumerator
|
	enumerator ',' enumlist

enumerator:
	LIDENT
|
	LIDENT '=' constexpr

decl:
	declarator '{' localdecls stmtlist '}'
|
	decllist ';'

decllist:
	declarator
|
	declarator ',' decllist

declarator:
	LIDENT
|
	'*' LIDENT
|
	'*' '*' LIDENT
|
	'*' LIDENT '[' constexpr ']'
|
	LIDENT '=' constexpr
|
	LIDENT '[' ']' '=' initlist
|
	LIDENT pmtrdecls
|
	LIDENT '[' ']'
|
	'*' LIDENT '[' ']'
|
	'(' '*' LIDENT ')' '(' ')'

lclass:
|
	LAUTO
|
	LEXTERN
|
	LREGISTER
|
	LSTATIC
|
	LVOLATILE

localdecls:
	ldecl
|
	ldecl localdecls

ldecl:
	primtype ldecllist ';'
|
	lclass primtype ldecllist ';'
|
	lclass ldecllist ';'
|
	enumdecl
|
	structdecl

ldecllist:
	declarator
|
	declarator ',' ldecllist

initlist:
	'{' constlist '}'
|
	LSTRLIT

constlist:
	constexpr
|
	constexpr ',' constlist

pmtrdecls:
	'(' ')'
|
	'(' pmtrlist ')'
|
	'(' pmtrlist ',' LELLIPSIS ')'

pmtrlist:
	primtype declarator
|
	primtype declarator ',' pmtrlist

structdecl:
	LSTRUCT LIDENT '{' memberlist '}' ';'

memberlist:
	primtype mdecllist ';'
|
	primtype mdecllist ';' memberlist

mdecllist:
	declarator
|
	declarator ',' mdecllist

compound:
	'{' stmtlist '}'
|
	'{' '}'

stmtlist:
	stmt
|
	stmt stmtlist

breakstmt:
	LBREAK ';'

continuestmt:
	LCONTINUE ';'

dostmt:
	LDO stmt LWHILE '(' expr ')' ';'

forstmt:
	LFOR '(' optexpr ';' optexpr ';' optexpr ')' stmt

optexpr:
|
	expr

gotostmt:
	LGOTO LIDENT ';'

ifstmt:
	LIF '(' expr ')' stmt
|
	LIF '(' expr ')' stmt LELSE stmt

labelstmt:
	LIDENT ':' stmt

returnstmt:
	LRETURN ';'
|
	LRETURN expr ';'

switchstmt:
	LSWITCH '(' expr ')' '{' switchblock '}'

switchblock:
	switchblockstmt
|
	switchblockstmt switchblock

switchblockstmt:
	LCASE constexpr ':'
|
	LDEFAULT ':'
|
	stmt

whilestmt:
	LWHILE '(' expr ')' stmt

stmt:
	breakstmt
|
	continuestmt
|
	dostmt
|
	forstmt
|
	gotostmt
|
	ifstmt
|
	labelstmt
|
	returnstmt
|
	switchstmt
|
	whilestmt
|
	compound
|
	';'
|
	expr ';'

expr:
	asgmnt
|
	asgmnt ',' expr

constexpr:
	binexpr

asgmnt:
	condexpr
|
	condexpr '=' asgmnt
|
	condexpr LMULAS asgmnt
|
	condexpr LDIVAS asgmnt
|
	condexpr LMODAS asgmnt
|
	condexpr LPLUSAS asgmnt
|
	condexpr LSUBAS asgmnt
|
	condexpr LLSHAS asgmnt
|
	condexpr LRSHAS asgmnt
|
	condexpr LANDAS asgmnt
|
	condexpr LXORAS asgmnt
|
	condexpr LORAS asgmnt

condexpr:
	logor
|
	logor '?' expr ':' condexpr

logor:
	logand
|
	logor LLOR logand

logand:
	binexpr
|
	logand LLAND binexpr

binexpr:
	binor

binor:
	binxor
|
	binor '|' binxor

binxor:
	binand
|
	binxor '^' binand

binand:
	equation
|
	binand '&' equation

equation:
	relation
|
	equation LEQ relation
|
	equation LNEQ relation

relation:
	shift
|
	relation '<' shift
|
	relation '>' shift
|
	relation LLEQ relation
|
	relation LGEQ relation

shift:
	sum
|
	shift LLSH sum
|
	shift LRSH sum

sum:
	term
|
	sum '+' term
|
	sum '-' term

term:
	cast
|
	term '*' cast
|
	term '/' cast
|
	term '%' cast

cast:
	prefix
|
	'(' type ')' prefix
|
	'(' type '*' ')' prefix
|
	'(' type '*' '*' ')' prefix
|
	'(' LINT '(' '*' ')' '(' ')' ')' prefix

prefix:
	postfix
|
	LINC prefix
|
	LDEC prefix
|
	'&' cast
|
	'*' cast
|
	'+' cast
|
	'-' cast
|
	'~' cast
|
	'!' cast
|
	LSIZEOF '(' type ')'
|
	LSIZEOF '(' type '*' ')'
|
	LSIZEOF '(' type '*' '*' ')'
|
	LSIZEOF '(' LIDENT ')'

type:
	primtype

postfix:
	primary
|
	postfix '[' expr ']'
|
	postfix '(' ')'
|
	postfix '(' fnargs ')'
|
	postfix LINC
|
	postfix LDEC
|
	postfix '.' LIDENT
|
	postfix LARROW LIDENT

fnargs:
	asgmnt
|
	asgmnt ',' fnargs

primary:
	LIDENT
|
	LINTLIT
|
	string
|
	'(' expr ')'

string:
	LSTRLIT
|
	LSTRLIT string
