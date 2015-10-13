package parse

import (
	"subc/ast"
	"subc/scan"
)

/*
 * compound :=
 *	  { stmt_list }
 *	| { }
 *
 * stmt_list:
 *	  stmt
 *	| stmt stmt_list
 */

func (p *parser) compound(lbrace *scan.Token) *ast.BlockStmt {
	n := &ast.BlockStmt{}

	if lbrace == nil {
		tok := p.next()
		lbrace = &tok
	}
	n.Lbrace = lbrace
	for {
		tok := p.peek()
		if tok.Type == scan.Rbrace {
			break
		}
		if p.eofCheck() {
			return n
		}
		n.Stmt = append(n.Stmt, p.stmt())
	}
	tok := p.next()
	n.Rbrace = &tok
	return n
}

func (p *parser) stmt() ast.Stmt {
	switch tok := p.peek(); tok.Type {
	case scan.Break:
		return p.breakStmt()
	case scan.Continue:
		return p.continueStmt()
	case scan.Do:
		return p.doStmt()
	case scan.For:
		return p.forStmt()
	case scan.Goto:
		return p.gotoStmt()
	case scan.If:
		return p.ifStmt()
	case scan.Return:
		return p.returnStmt()
	case scan.Switch:
		return p.switchStmt()
	case scan.While:
		return p.whileStmt()
	case scan.Lbrace:
		return p.compound(nil)
	case scan.Semi:
		return p.emptyStmt()
	case scan.Default:
		p.errorf(tok.Pos, "default not in switch context")
		p.next()
		p.expect(scan.Colon)
	case scan.Case:
		p.errorf(tok.Pos, "case not in switch context")
		p.next()
		p.constExpr()
		p.expect(scan.Colon)
	case scan.Ident:
		tok := p.next()
		xtok := p.peek()
		p.putBack(tok)
		if xtok.Type == scan.Colon {
			return p.labelStmt()
		}
		fallthrough
	default:
		n := p.expr()
		p.expect(scan.Semi)
		return &ast.ExprStmt{n}
	}
	return nil
}

/*
 * break_stmt := BREAK ;
 */

func (p *parser) breakStmt() *ast.BranchStmt {
	s := &ast.BranchStmt{}
	s.Token = p.next()
	p.expect(scan.Semi)
	return s
}

/*
 * continue_stmt := CONTINUE ;
 */

func (p *parser) continueStmt() *ast.BranchStmt {
	s := &ast.BranchStmt{}
	s.Token = p.next()
	p.expect(scan.Semi)
	return s
}

/*
 * do_stmt := DO stmt WHILE ( expr ) ;
 */

func (p *parser) doStmt() *ast.DoStmt {
	s := &ast.DoStmt{}
	s.Do = p.next()
	s.Body = p.stmt()
	s.While = p.expect(scan.While)
	s.Lparen = p.expect(scan.Lparen)
	s.Cond = p.expr()
	s.Rparen = p.expect(scan.Rparen)
	p.expect(scan.Semi)
	return s
}

/*
 * for_stmt :=
 *	FOR ( opt_expr ; opt_expr ; opt_expr ) stmt
 *
 * opt_expr :=
 *	| expr
 */

func (p *parser) forStmt() *ast.ForStmt {
	s := &ast.ForStmt{}
	s.For = p.next()
	s.Lparen = p.expect(scan.Lparen)

	var expr [2]ast.Expr
	for i := range expr {
		if tok := p.peek(); tok.Type != scan.Semi {
			expr[i] = p.expr()
		}
		p.expect(scan.Semi)
	}
	s.Init = expr[0]
	s.Cond = expr[1]

	if tok := p.peek(); tok.Type != scan.Rparen {
		s.Post = p.expr()
	}

	s.Rparen = p.expect(scan.Rparen)
	s.Body = p.stmt()
	return s
}

/*
 * goto_stmt := GOTO ident ;
 */

func (p *parser) gotoStmt() *ast.GotoStmt {
	s := &ast.GotoStmt{}
	s.Goto = p.next()
	s.Label = p.expectIdent()
	p.expect(scan.Semi)
	return s
}

/*
 * label_stmt :=
 *	  IDENT : stmt
 */

func (p *parser) labelStmt() *ast.LabeledStmt {
	s := &ast.LabeledStmt{}
	s.Label = p.expectIdent()
	s.Colon = p.expect(scan.Colon)
	s.Stmt = p.stmt()
	if s.Stmt == nil {
		p.errorf(s.Colon.Pos, "expected a statement after label")
	}
	if p.curFn != nil {
		p.curFn.Labels = append(p.curFn.Labels, s)
	}
	return s
}

/*
 * if_stmt :=
 *	  IF ( expr ) stmt
 *	| IF ( expr ) stmt ELSE stmt
 */

func (p *parser) ifStmt() *ast.IfStmt {
	s := &ast.IfStmt{}
	s.If = p.next()
	s.Lparen = p.expect(scan.Lparen)
	s.Cond = p.expr()
	s.Rparen = p.expect(scan.Rparen)
	s.Body = p.stmt()
	if tok := p.peek(); tok.Type == scan.Else {
		p.next()
		s.Else = p.stmt()
	}
	return s
}

/*
 * return_stmt :=
 *	  RETURN ;
 *	| RETURN expr ;
 */

func (p *parser) returnStmt() *ast.ReturnStmt {
	s := &ast.ReturnStmt{}
	s.Return = p.next()
	if tok := p.peek(); tok.Type != scan.Semi {
		s.X = p.expr()
	}
	p.expect(scan.Semi)
	return s
}

/*
 * switch_stmt :=
 *	  SWITCH ( expr ) { switch_block }
 *
 * switch_block :=
 *	  switch_block_stmt
 *	| switch_block_stmt switch_block
 *
 * switch_block_stmt :=
 *	  CASE constexpr :
 *	| DEFAULT :
 *	| stmt
 */

func (p *parser) switchStmt() *ast.SwitchStmt {
	s := &ast.SwitchStmt{}
	s.Switch = p.next()
	s.Lparen = p.expect(scan.Lparen)
	s.Tag = p.expr()
	s.Rparen = p.expect(scan.Rparen)
	p.switchBlock(s)
	return s
}

func (p *parser) switchBlock(s *ast.SwitchStmt) {
	s.Body = &ast.BlockStmt{}
	lbrace := p.expect(scan.Lbrace)
	s.Body.Lbrace = &lbrace

	cur := ast.Stmt(s)
	for {
		tok := p.peek()
		if tok.Type == scan.Rbrace {
			break
		}

		if p.eofCheck() {
			return
		}

		switch tok.Type {
		case scan.Case, scan.Default:
			c := &ast.CaseClause{}
			c.Case = p.next()
			if tok.Type != scan.Default {
				c.Value = p.constExpr()
			}
			c.Colon = p.expect(scan.Colon)
			s.Body.Stmt = append(s.Body.Stmt, c)
			cur = c
		default:
			stmt := p.stmt()
			switch n := cur.(type) {
			case *ast.SwitchStmt:
				n.Body.Stmt = append(n.Body.Stmt, stmt)
			case *ast.CaseClause:
				n.Body = append(n.Body, stmt)
			}
		}
	}
	rbrace := p.next()
	s.Body.Rbrace = &rbrace
}

/*
 * while_stmt := WHILE ( expr ) stmt
 */

func (p *parser) whileStmt() *ast.WhileStmt {
	s := &ast.WhileStmt{}
	s.While = p.next()
	s.Lparen = p.expect(scan.Lparen)
	s.Cond = p.expr()
	s.Rparen = p.expect(scan.Rparen)
	s.Body = p.stmt()
	return s
}

/*
 * empty_stmt := ;
 */

func (p *parser) emptyStmt() *ast.EmptyStmt {
	return &ast.EmptyStmt{p.next()}
}
