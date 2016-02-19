package compile

import (
	"strconv"

	"subc/ast"
	"subc/scan"
)

// stmt generates code for statements.
func (c *compiler) stmt(s ast.Stmt) {
	pos := s.Span().Start
	switch s := s.(type) {
	case *ast.EmptyStmt, *ast.BadStmt:
		// skip
	case *ast.BlockStmt:
		for _, x := range s.Stmt {
			c.stmt(x)
		}
	case *ast.IfStmt:
		c.ifStmt(s)
	case *ast.ForStmt:
		c.forStmt(s)
	case *ast.DoStmt:
		c.doStmt(s)
	case *ast.WhileStmt:
		c.whileStmt(s)
	case *ast.ReturnStmt:
		c.returnStmt(s)
	case *ast.SwitchStmt:
		c.switchStmt(s)
	case *ast.GotoStmt:
		c.cg.Jump(c.labels[s.Label.Name])
	case *ast.LabeledStmt:
		c.cg.Lab(c.labels[s.Label.Name])
		c.stmt(s.Stmt)
	case *ast.BranchStmt:
		switch s.Type {
		case scan.Break:
			c.cg.Jump(c.breakStack[len(c.breakStack)-1])
		case scan.Continue:
			c.cg.Jump(c.continueStack[len(c.continueStack)-1])
		default:
			c.invalidAST(pos, "bad statement: %T", s)
		}
	case *ast.ExprStmt:
		c.expr(s.X)
		c.cg.Clear(true)
	default:
		c.invalidAST(pos, "bad statement: %T", s)
	}
	c.cg.Clear(true)
}

// ifStmt generates code for an if statement.
func (c *compiler) ifStmt(s *ast.IfStmt) {
	c.expr(s.Cond)
	l1 := c.cg.Label()
	c.cg.BrFalse(l1)
	c.cg.Clear(true)
	c.stmt(s.Body)
	if s.Else != nil {
		l2 := c.cg.Label()
		c.cg.Jump(l2)
		c.cg.Lab(l1)
		l1 = l2
		c.stmt(s.Else)
	}
	c.cg.Lab(l1)
}

// forStmt generates code for a for statement.
func (c *compiler) forStmt(s *ast.ForStmt) {
	ls := c.cg.Label()
	lbody := c.cg.Label()
	lb := c.cg.Label()
	lc := c.cg.Label()
	c.breakStack = append(c.breakStack, lb)
	c.continueStack = append(c.continueStack, lc)

	if s.Init != nil {
		c.expr(s.Init)
		c.cg.Clear(true)
	}

	c.cg.Lab(ls)

	if s.Cond != nil {
		c.expr(s.Cond)
		c.cg.BrFalse(lb)
		c.cg.Clear(true)
	}
	c.cg.Jump(lbody)
	c.cg.Lab(lc)

	if s.Post != nil {
		c.expr(s.Post)
	}

	c.cg.Clear(true)
	c.cg.Jump(ls)
	c.cg.Lab(lbody)

	c.stmt(s.Body)

	c.cg.Jump(lc)
	c.cg.Lab(lb)

	c.breakStack = c.breakStack[:len(c.breakStack)-1]
	c.continueStack = c.continueStack[:len(c.continueStack)-1]
}

func (c *compiler) doStmt(s *ast.DoStmt) {
	ls := c.cg.Label()
	lb := c.cg.Label()
	lc := c.cg.Label()
	c.breakStack = append(c.breakStack, lb)
	c.continueStack = append(c.continueStack, lc)
	c.cg.Lab(ls)

	c.stmt(s.Body)

	c.cg.Lab(lc)

	c.expr(s.Cond)

	c.cg.BrTrue(ls)
	c.cg.Clear(true)
	c.cg.Lab(lb)
	c.breakStack = c.breakStack[:len(c.breakStack)-1]
	c.continueStack = c.continueStack[:len(c.continueStack)-1]
}

func (c *compiler) whileStmt(s *ast.WhileStmt) {
	lb := c.cg.Label()
	lc := c.cg.Label()
	c.breakStack = append(c.breakStack, lb)
	c.continueStack = append(c.continueStack, lc)

	c.cg.Lab(lc)
	c.expr(s.Cond)
	c.cg.BrFalse(lb)
	c.cg.Clear(true)

	c.stmt(s.Body)

	c.cg.Jump(lc)
	c.cg.Lab(lb)
	c.breakStack = c.breakStack[:len(c.breakStack)-1]
	c.continueStack = c.continueStack[:len(c.continueStack)-1]
}

func (c *compiler) returnStmt(s *ast.ReturnStmt) {
	if s.X != nil {
		c.expr(s.X)
	}
	c.cg.Jump(c.cg.Retlab)
}

func (c *compiler) switchStmt(s *ast.SwitchStmt) {
	c.expr(s.Tag)
	c.cg.Commit()
	c.cg.Clear(false)

	lb := c.cg.Label()
	ls := c.cg.Label()
	c.breakStack = append(c.breakStack, lb)
	c.cg.Jump(ls)

	var ldflt int
	var cval, clab []int
	var nc bool
	for _, x := range s.Body.Stmt {
		switch x := x.(type) {
		case *ast.CaseClause:
			if x.Case.Type == scan.Default {
				ldflt = c.cg.Label()
				c.cg.Lab(ldflt)
				for _, y := range x.Body {
					c.stmt(y)
				}
				continue
			}

			tv, found := c.typAndValue(x.Value)
			if found {
				n, _ := strconv.Atoi(tv.Value.String())
				cval = append(cval, n)
			} else {
				cval = append(cval, 0)
			}
			label := c.cg.Label()
			clab = append(clab, label)
			c.cg.Lab(label)

			for _, y := range x.Body {
				c.stmt(y)
			}
			nc = true

		default:
			c.errorf(s.Span().Start, "bad statement in switch: %T", x)
		}
	}

	if !nc && ldflt != 0 {
		cval = append(cval, 0)
		clab = append(clab, ldflt)
	}

	if ldflt == 0 {
		ldflt = lb
	}

	c.cg.Jump(lb)
	c.cg.Lab(ls)
	c.cg.Switch(cval, clab, ldflt)
	c.cg.Text()
	c.cg.Lab(lb)
	c.breakStack = c.breakStack[:len(c.breakStack)-1]
}
