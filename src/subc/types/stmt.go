package types

import (
	"strconv"

	"subc/ast"
	"subc/constant"
	"subc/scan"
)

// stmtContext specifies a context where different things are legal.
type stmtContext uint

const (
	breakOk    stmtContext = 1 << iota // break are allowed within statement block
	continueOk                         // continue are allowed within the statement block
)

// checkFuncBody type checks the function body.
func (c *checker) checkFuncBody(params []*ast.FieldDecl, paramVars []*Var, decls []ast.Decl, labels []*ast.LabeledStmt, body *ast.BlockStmt) {
	defer func(ctx context) {
		c.context = ctx
	}(c.context)

	c.openScope(body)
	defer c.closeScope()

	// declare all arguments
	for i, p := range paramVars {
		if params[i].Name != nil {
			c.declare(Ord, c.scope, params[i].Name, p, scan.NoPos)
		}
	}

	// declare all locals
	c.declList(decls)

	// declare all labels
	for _, l := range labels {
		label := NewLabel(l.Span().Start, l.Label.Name)
		c.declare(Lab, c.scope, l.Label, label, scan.NoPos)
	}

	// parse statements
	c.stmtList(0, body.Stmt)
}

// declList type checks a function declaration list.
func (c *checker) declList(list []ast.Decl) {
	for _, d := range list {
		switch d := d.(type) {
		case *ast.EnumDecl:
			c.enumDecl(d)
		case *ast.VarDecl:
			c.varDecl(d, false)
		default:
			c.invalidAST(d.Span().Start, "invalid local ast.Decl %T", d)
		}
	}
}

// stmtList type checks a statements within a block.
func (c *checker) stmtList(ctx stmtContext, list []ast.Stmt) {
	for _, s := range list {
		c.stmt(ctx, s)
	}
}

// stmt type checks a statement.
func (c *checker) stmt(ctx stmtContext, s ast.Stmt) {
	var x operand

	pos := s.Span().Start
	inner := ctx

	c.recordScope(s, c.scope)
	switch s := s.(type) {
	case *ast.BadStmt, *ast.EmptyStmt:
		// ignore

	case *ast.BranchStmt:
		switch s.Type {
		case scan.Break:
			if ctx&breakOk == 0 {
				c.errorf(pos, "break not in for/while or switch statement")
			}
		case scan.Continue:
			if ctx&continueOk == 0 {
				c.errorf(pos, "continue not in for/while statement")
			}
		default:
			c.invalidAST(pos, "branch statement: %s", s.Text)
		}

	case *ast.BlockStmt:
		c.openScope(s)
		defer c.closeScope()
		c.stmtList(inner, s.Stmt)

	case *ast.DoStmt:
		inner |= breakOk | continueOk
		c.stmt(inner, s.Body)
		c.expr(&x, s.Cond)

	case *ast.ExprStmt:
		c.expr(&x, s.X)

	case *ast.GotoStmt:
		obj, _ := c.scope.LookupParent(Lab, s.Label.Name, scan.NoPos)
		if obj == nil {
			c.errorf(pos, "goto cannot jump to non-existent label %v", s.Label.Name)
		}

	case *ast.LabeledStmt:
		c.stmt(inner, s.Stmt)

	case *ast.IfStmt:
		c.expr(&x, s.Cond)
		c.stmt(inner, s.Body)
		if s.Else != nil {
			c.stmt(inner, s.Else)
		}

	case *ast.ForStmt:
		inner |= breakOk | continueOk
		c.simpleStmt(s.Init)
		if s.Cond != nil {
			c.expr(&x, s.Cond)
		}
		c.simpleStmt(s.Post)
		c.stmt(inner, s.Body)

	case *ast.ReturnStmt:
		if s.X != nil {
			c.expr(&x, s.X)
		} else {
			x.mode = novalue
		}

	case *ast.SwitchStmt:
		inner |= breakOk
		c.expr(&x, s.Tag)

		sawCases := make(map[constant.Value]scan.Position)
		defaultPos := scan.NoPos
		for _, n := range s.Body.Stmt {
			xpos := n.Span().Start
			switch n := n.(type) {
			case *ast.CaseClause:
				if n.Value != nil {
					c.expr(&x, n.Value)
					xpos := x.pos()
					if x.typ == Typ[Invalid] {
						continue
					}

					_, err := strconv.Atoi(x.val.String())
					if x.mode != constant_ || err != nil {
						c.errorf(xpos, "non-constant integer in case statement")
						continue
					}

					if cpos, found := sawCases[x.val]; found {
						c.errorf(xpos, "duplicate case value")
						c.errorf(cpos, "\tpreviously used here")
					} else {
						sawCases[x.val] = n.Case.Span().Start
					}
				} else if defaultPos != scan.NoPos {
					c.errorf(xpos, "multiple defaults in one switch")
					c.errorf(defaultPos, "\tthis is the first default label")
				} else {
					defaultPos = xpos
				}
				c.stmtList(inner, n.Body)

			default:
				c.errorf(xpos, "switch only supports case/default clauses, got %T", n)
			}
		}
		if len(s.Body.Stmt) == 0 {
			c.errorf(pos, "empty switch statement")
		}

	case *ast.WhileStmt:
		inner |= breakOk | continueOk
		c.expr(&x, s.Cond)
		c.stmt(inner, s.Body)

	case *ast.BinaryExpr:
		c.expr(&x, s)

	case *ast.UnaryExpr:
		c.expr(&x, s)

	default:
		c.errorf(pos, "invalid statement: %T", s)
	}
}

// simpleStmt types check a statement and just skips it if it is a nil.
func (c *checker) simpleStmt(s ast.Stmt) {
	if s != nil {
		c.stmt(0, s)
	}
}

// recordScope records the scope information.
func (c *checker) recordScope(s ast.Stmt, scope *Scope) {
	c.Scopes[s] = scope
}

// assignOp converts an assignment binary operation into a binary operation.
func (c *checker) assignOp(op scan.Type) (scan.Type, bool) {
	tab := map[scan.Type]scan.Type{
		scan.PlusEq:  scan.Plus,
		scan.MinusEq: scan.Minus,
		scan.MulEq:   scan.Mul,
		scan.DivEq:   scan.Div,
		scan.ModEq:   scan.Mod,
		scan.LshEq:   scan.Lsh,
		scan.RshEq:   scan.Rsh,
		scan.AndEq:   scan.And,
		scan.XorEq:   scan.Xor,
		scan.OrEq:    scan.Or,
	}
	if op, ok := tab[op]; ok {
		return op, true
	}
	return 0, false
}
