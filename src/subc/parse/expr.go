package parse

import (
	"subc/ast"
	"subc/scan"
)

// constExpr returns a binary expression that must be a constant.
func (p *parser) constExpr() ast.Expr {
	return p.binaryExpr()
}

/*
 * expr :=
 *	  asgmnt
 *	| asgmnt , expr
 */

func (p *parser) expr() ast.Expr {
	n := p.asgmnt()
	for {
		tok := p.peek()
		if tok.Type != scan.Comma {
			break
		}
		p.next()

		m := p.asgmnt()
		n = &ast.BinaryExpr{
			Op: tok,
			X:  n,
			Y:  m,
		}
	}
	return n
}

/*
 * term :=
 *	  cast
 *	| term * cast
 *	| term / cast
 *	| term % cast
 *
 * sum :=
 *	  term
 *	| sum + term
 *	| sum - term
 *
 * shift :=
 *	  sum
 *	| shift << sum
 *	| shift >> sum
 *
 * relation :=
 *	  shift
 *	| relation < shift
 *	| relation > shift
 *	| relation <= shift
 *	| relation >= shift
 *
 * equation :=
 *	  relation
 *	| equation == relation
 *	| equation != relation
 *
 * binand :=
 *	  equation
 *	| binand & equation
 *
 * binxor :=
 *	  binand
 *	| binxor ^ binand
 *
 * binor :=
 *	  binxor
 *	| binor '|' binxor
 *
 * binexpr :=
 *	  binor
 */

func (p *parser) binaryExpr() ast.Expr {
	var ops []scan.Token

	t := []ast.Expr{p.cast()}
	sp := 0
	for {
		tok := p.peek()
		if !isBinaryOp(tok.Type) {
			break
		}

		for sp > 0 && tok.Precedence() <= ops[sp-1].Precedence() {
			t[sp-1] = &ast.BinaryExpr{
				Op: ops[sp-1],
				X:  t[sp-1],
				Y:  t[sp],
			}
			sp--
		}

		if len(ops) <= sp {
			ops = append(ops, tok)
		} else {
			ops[sp] = tok
		}
		sp++
		p.next()

		if len(t) <= sp {
			t = append(t, p.cast())
		} else {
			t[sp] = p.cast()
		}
	}

	for sp > 0 {
		t[sp-1] = &ast.BinaryExpr{
			Op: ops[sp-1],
			X:  t[sp-1],
			Y:  t[sp],
		}
		sp--
	}
	return t[0]
}

func isBinaryOp(typ scan.Type) bool {
	switch typ {
	case scan.Div, scan.Mul, scan.Mod, scan.Plus, scan.Minus,
		scan.Lsh, scan.Rsh, scan.Gt, scan.Geq, scan.Lt, scan.Leq,
		scan.Eq, scan.Neq, scan.And, scan.Xor, scan.Or:
		return true
	}
	return false
}

/*
 * cast :=
 *	  prefix
 *	| ( type ) prefix
 *	| ( type * ) prefix
 *	| ( type * * ) prefix
 *	| ( INT ( * ) ( ) ) prefix
 */

func (p *parser) cast() ast.Expr {
	switch tok := p.peek(); tok.Type {
	case scan.Lparen:
		var prim ast.Expr

		c := &ast.CastExpr{}
		c.Lparen = tok
		p.next()
		if tok = p.peek(); isType(tok.Type) {
			prim = p.primType(tok)
			c.Type = prim
		} else {
			p.putBack(c.Lparen)
			return p.prefix()
		}

		xtok := p.peek()
		if tok.Type == scan.Int && xtok.Type == scan.Lparen {
			p.next()
			p.expect(scan.Mul)
			p.expect(scan.Rparen)
			p.expect(scan.Lparen)
			p.expect(scan.Rparen)
			c.Type = &ast.FuncType{Result: prim}
		} else if xtok.Type == scan.Mul {
			star := &ast.StarExpr{Star: xtok}
			setType(c.Type, star)
			p.next()
			if tok := p.peek(); tok.Type == scan.Mul {
				star.X = &ast.StarExpr{Star: tok}
				p.next()
			}
		}
		c.Rparen = p.expect(scan.Rparen)
		c.X = p.prefix()

		return c

	default:
		return p.prefix()
	}
}

/*
 * prefix :=
 *	  postfix
 *	| ++ prefix
 *	| -- prefix
 *	| & cast
 *	| * cast
 *	| + cast
 *	| - cast
 *	| ~ cast
 *	| ! cast
 *	| SIZEOF ( type )
 *	| SIZEOF ( type * )
 *	| SIZEOF ( type * * )
 *	| SIZEOF ( IDENT )
 *
 * type :=
 *	  INT
 *	| CHAR
 *	| VOID
 *	| STRUCT IDENT
 *	| UNION IDENT
 */

func (p *parser) prefix() ast.Expr {
	switch tok := p.peek(); tok.Type {
	case scan.Inc, scan.Dec:
		p.next()
		n := p.prefix()
		return &ast.UnaryExpr{
			Op:    tok,
			Affix: ast.Prefix,
			X:     n,
		}

	case scan.Mul, scan.Plus, scan.Minus, scan.Negate, scan.Not, scan.And:
		p.next()
		n := p.cast()
		if tok.Type == scan.Mul {
			return &ast.StarExpr{
				Star: tok,
				X:    n,
			}
		}
		return &ast.UnaryExpr{
			Op:    tok,
			Affix: ast.Prefix,
			X:     n,
		}

	case scan.Sizeof:
		n := &ast.SizeofExpr{}
		n.Sizeof = p.next()
		n.Lparen = p.expect(scan.Lparen)
		n.X = p.sizeof()
		n.Rparen = p.expect(scan.Rparen)
		return n

	default:
		return p.postfix()
	}
}

func (p *parser) sizeof() ast.Expr {
	switch tok := p.peek(); tok.Type {
	case scan.Char, scan.Int, scan.Void, scan.Struct, scan.Union:
		n := p.primType(tok)
		if tok := p.peek(); tok.Type == scan.Mul {
			star := &ast.StarExpr{Star: tok}
			p.next()
			if tok := p.peek(); tok.Type == scan.Mul {
				star2 := &ast.StarExpr{Star: tok}
				star.X = star2
				p.next()
			}
			setType(n, star)
		}
		return n

	default:
		return p.prefix()
	}
}

/*
 * postfix :=
 *	  primary
 *	| postfix [ expr ]
 *	| postfix ( )
 *	| postfix ( fnargs )
 *	| postfix ++
 *	| postfix --
 *	| postfix . identifier
 *	| postfix -> identifier
 */

func (p *parser) postfix() ast.Expr {
	n := p.primary()
	for {
		switch tok := p.peek(); tok.Type {
		case scan.Lbrack:
			for {
				tok := p.peek()
				if tok.Type != scan.Lbrack {
					break
				}

				i := &ast.IndexExpr{}
				i.X = n
				i.Lbrack = p.next()
				i.Index = p.expr()
				i.Rbrack = p.expect(scan.Rbrack)
				n = i
			}

		case scan.Lparen:
			c := &ast.CallExpr{}
			c.Fun = n
			c.Lparen = tok
			p.next()
			p.fnArgs(c)
			n = c

		case scan.Inc, scan.Dec:
			p.next()
			u := &ast.UnaryExpr{
				Op:    tok,
				Affix: ast.Postfix,
				X:     n,
			}
			n = u

		case scan.Dot, scan.Arrow:
			p.next()
			name := p.expect(scan.Ident)
			s := &ast.SelectorExpr{
				X:   n,
				Op:  tok,
				Sel: &ast.Ident{name.Pos, name.Text},
			}
			n = s

		default:
			return n
		}
	}
}

/*
 * fnargs :=
 *	  asgmnt
 *	| asgmnt , fnargs
 */

func (p *parser) fnArgs(c *ast.CallExpr) {
	for {
		if tok := p.peek(); tok.Type == scan.Rparen {
			break
		}

		c.Args = append(c.Args, p.asgmnt())

		if tok := p.peek(); tok.Type == scan.Comma {
			p.next()
			if tok := p.peek(); tok.Type == scan.Rparen {
				p.errorf(tok.Span().Start, "trailing ',' in function call")
			}
		} else {
			break
		}
	}
	c.Rparen = p.expect(scan.Rparen)
}

/*
 * primary :=
 *	  IDENT
 *	| INTLIT
 *	| string
 *	| ( expr )
 *
 * string :=
 *	  STRLIT
 *	| STRLIT string
 */

func (p *parser) primary() ast.Expr {
	switch tok := p.next(); tok.Type {
	case scan.Ident:
		n := &ast.Ident{Pos: tok.Pos, Name: tok.Text}
		return n

	case scan.Number, scan.Rune:
		return &ast.BasicLit{tok}

	case scan.String:
		n := &ast.StringLit{}
		n.Lits = append(n.Lits, &ast.BasicLit{tok})
		for {
			tok := p.peek()
			if tok.Type != scan.String {
				break
			}
			n.Lits = append(n.Lits, &ast.BasicLit{tok})
			p.next()
		}
		return n

	case scan.Lparen:
		n := &ast.ParenExpr{}
		n.Lparen = tok
		n.X = p.expr()
		n.Rparen = p.expect(scan.Rparen)
		return n

	default:
		p.errorf(tok.Pos, "invalid primary expression: %q", tok.Text)
		span := p.synch(tok.Pos, scan.Semi)
		return &ast.BadExpr{span.Start, span.End}
	}
}

/*
 * asgmnt :=
 *	  condexpr
 *	| condexpr = asgmnt
 *	| condexpr *= asgmnt
 *	| condexpr /= asgmnt
 *	| condexpr %= asgmnt
 *	| condexpr += asgmnt
 *	| condexpr -= asgmnt
 *	| condexpr <<= asgmnt
 *	| condexpr >>= asgmnt
 *	| condexpr &= asgmnt
 *	| condexpr ^= asgmnt
 *	| condexpr |= asgmnt
 */

func (p *parser) asgmnt() ast.Expr {
	x := p.cond3()
	n := ast.Expr(x)
	if tok := p.peek(); isAssignOp(tok.Type) {
		p.next()
		y := p.asgmnt()
		op := &ast.BinaryExpr{
			Op: tok,
			X:  x,
			Y:  y,
		}
		n = op
	}
	return n
}

/*
 * condexpr :=
 *	  logor
 *	| logor ? expr : condexpr
 */

func (p *parser) cond3() ast.Expr {
	n := p.cond2(scan.Lor)
	for {
		tok := p.peek()
		if tok.Type != scan.Qmark {
			break
		}
		p.next()
		x := p.expr()
		p.expect(scan.Colon)
		y := p.cond2(scan.Lor)

		n = &ast.CondExpr{
			Cond: n,
			X:    x,
			Y:    y,
		}
	}
	return n
}

/*
 * logand :=
 *	  binexpr
 *	| logand && binexpr
 *
 * logor :=
 *	  logand
 *	| logor '||' logand
 */

func (p *parser) cond2(op scan.Type) ast.Expr {
	var n ast.Expr

	if op == scan.Lor {
		n = p.cond2(scan.Land)
	} else {
		n = p.binaryExpr()
	}

	for {
		tok := p.peek()
		if tok.Type != op {
			break
		}
		p.next()

		var m ast.Expr
		if op == scan.Lor {
			m = p.cond2(scan.Land)
		} else {
			m = p.binaryExpr()
		}
		n = &ast.BinaryExpr{
			Op: tok,
			X:  n,
			Y:  m,
		}
	}
	return n
}
