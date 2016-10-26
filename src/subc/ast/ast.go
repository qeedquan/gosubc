// Package ast defines all the nodes for a SubC AST.
package ast

import (
	"text/scanner"

	"subc/scan"
)

// Node is a generic interface that all AST nodes
// must implement.
type Node interface {
	// Span returns the beginning and end position of a node
	Span() scan.Span
}

// Directive is a preprocessor node.
type Directive interface {
	Node
}

// Decl is a declaration node.
type Decl interface {
	Node
}

// Expr is a expression node.
type Expr interface {
	Node
}

// Stmt is a statement node.
type Stmt interface {
	Node
}

// VarDecl is a node for a variable declaration.
type VarDecl struct {
	Storage *scan.Token
	Type    Expr
	Name    *Ident
	Value   Expr
}

// FieldDecl is a field declaration inside a record.
type FieldDecl struct {
	Type Expr
	Name *Ident
}

// ConstDecl is a constant declaration.
type ConstDecl struct {
	Name *Ident
	X    Expr
}

// EnumDecl is a enum declaration.
type EnumDecl struct {
	Storage *scan.Token
	Enum    scan.Token
	Name    *Ident
	Lbrace  scan.Token
	List    []*ConstDecl
	Rbrace  scan.Token
}

// FuncDecl is a function declaration.
type FuncDecl struct {
	Storage *scan.Token
	Result  Expr
	Name    *Ident
	Lparen  scan.Token
	Params  []*FieldDecl
	Rparen  scan.Token
	Labels  []*LabeledStmt
	Decls   []Decl
	Body    *BlockStmt
}

// RecordDecl is a struct or union declaration.
type RecordDecl struct {
	Storage *scan.Token
	Record  scan.Token
	Name    *Ident
	Lbrace  scan.Token
	Fields  []*FieldDecl
	Rbrace  scan.Token
}

// BadDecl is a bad declaration.
type BadDecl struct {
	From, To scanner.Position
}

// BasicType represents a type.
type BasicType struct {
	Type scan.Token
	X    Expr
}

// FuncType represents a function pointer declaration.
type FuncType struct {
	Result Expr
	Star   scan.Token
	Params []Expr
	Lparen [2]scan.Token
	Rparen [2]scan.Token
}

// ArrayType represents an array declaration.
type ArrayType struct {
	Lbrack scan.Token
	Len    Expr
	Rbrack scan.Token
}

// RecordType represents a record declaration.
type RecordType struct {
	Record scan.Token
	X      Expr
	Name   *Ident
}

// BinaryExpr represents a binary expression.
type BinaryExpr struct {
	X  Expr
	Op scan.Token
	Y  Expr
}

// BadExpr represents an invalid expression.
type BadExpr struct {
	From, To scanner.Position
}

// Affix defines what type of unary expression it is.
// It is used for the ++/-- operators to say if the operator is ++x or x++.
type Affix int

const (
	Prefix Affix = iota + 1
	Postfix
)

func (a Affix) String() string {
	switch a {
	case Prefix:
		return "Prefix"
	case Postfix:
		return "Postfix"
	default:
		return "Invalid"
	}
}

// UnaryExpr represents a unary expression.
type UnaryExpr struct {
	Op    scan.Token
	Affix Affix
	X     Expr
}

// ParanExpr represents a parentheses expression.
type ParenExpr struct {
	Lparen scan.Token
	X      Expr
	Rparen scan.Token
}

// CondExpr represents ternary expressions.
type CondExpr struct {
	Cond Expr
	X    Expr
	Y    Expr
}

// SizeofExpr represents a sizeof expression.
type SizeofExpr struct {
	Sizeof scan.Token
	Lparen scan.Token
	X      Expr
	Rparen scan.Token
}

// StarExpr represents a dereference expression or a pointer declaration.
type StarExpr struct {
	Star scan.Token
	X    Expr
}

// IndexExpr represents an array access.
type IndexExpr struct {
	X      Expr
	Lbrack scan.Token
	Index  Expr
	Rbrack scan.Token
}

// SelectorExpr represents a record access using the . or -> operator.
type SelectorExpr struct {
	X   Expr
	Op  scan.Token
	Sel *Ident
}

// CallExpr represents a function call expression.
type CallExpr struct {
	Fun    Expr
	Lparen scan.Token
	Args   []Expr
	Rparen scan.Token
}

// CastExpr represents a cast expression.
type CastExpr struct {
	Lparen scan.Token
	Type   Expr
	Rparen scan.Token
	X      Expr
}

// BlockStmt represents a block statement.
type BlockStmt struct {
	Lbrace *scan.Token
	Stmt   []Stmt
	Rbrace *scan.Token
}

// ForStmt represents a for statement.
type ForStmt struct {
	For    scan.Token
	Lparen scan.Token
	Init   Expr
	Cond   Expr
	Post   Expr
	Rparen scan.Token
	Body   Stmt
}

// GotoStmt represents a goto statement.
type GotoStmt struct {
	Goto  scan.Token
	Label *Ident
}

// WhileStmt represents a while statement.
type WhileStmt struct {
	While  scan.Token
	Lparen scan.Token
	Cond   Expr
	Rparen scan.Token
	Body   Stmt
}

// IfStmt represents an if statement.
type IfStmt struct {
	If     scan.Token
	Lparen scan.Token
	Cond   Expr
	Rparen scan.Token
	Body   Stmt
	Else   Stmt
}

// BranchStmt represents a branch statement, such as a break, continue or goto.
type BranchStmt struct {
	scan.Token
}

// DoStmt represents a do-while statement.
type DoStmt struct {
	Do     scan.Token
	Body   Stmt
	While  scan.Token
	Lparen scan.Token
	Cond   Expr
	Rparen scan.Token
}

// CaseClause represents a case statement inside a switch statement.
type CaseClause struct {
	Case  scan.Token
	Value Expr
	Colon scan.Token
	Body  []Stmt
}

// EmptyStmt represents a ; statement.
type EmptyStmt struct {
	Semi scan.Token
}

// LabeledStmt represents a labeled statement.
type LabeledStmt struct {
	Label *Ident
	Colon scan.Token
	Stmt  Stmt
}

// ReturnStmt represents a return statement.
type ReturnStmt struct {
	Return scan.Token
	X      Expr
}

// SwitchStmt represents a switch statement.
type SwitchStmt struct {
	Switch scan.Token
	Lparen scan.Token
	Tag    Expr
	Rparen scan.Token
	Body   *BlockStmt
}

// ExprStmt is a wrapper for expressions that can appear as a statement.
// Examples include call expressions and assignment expressions.
type ExprStmt struct {
	X Expr
}

// BadStmt represents an invalid statement.
type BadStmt struct {
	From, To scanner.Position
}

// Ident represents an identifier.
type Ident struct {
	Pos  scanner.Position
	Name string
}

// BasicLit represents a character, number, or a string literal.
type BasicLit struct {
	scan.Token
}

// CompositeLit represents an initialization list for arrays.
type CompositeLit struct {
	Lbrace scan.Token
	Elts   []Expr
	Rbrace scan.Token
}

// StringLit represents string literals that are concatenated together.
// Example includes char *s = "a" "b" where "a" and "b" would be inside one StringLit.
type StringLit struct {
	Lits []*BasicLit
}

// Prog represents the top level of the AST tree, it holds all the top level declarations.
type Prog struct {
	Decls []Decl
}

func spanText(pos scanner.Position, text string) scan.Span {
	n, m := pos, pos
	m.Offset += len(text)
	m.Column += len(text)
	return scan.Span{n, m}
}

func span2(a, b Node) scan.Span {
	n := a.Span()
	m := b.Span()
	return scan.Span{n.Start, m.End}
}

func (d *EnumDecl) Span() scan.Span {
	if d.Storage != nil {
		return span2(d.Storage, d.Rbrace)
	}
	return span2(d.Enum, d.Rbrace)
}

func (d *RecordDecl) Span() scan.Span { return span2(d.Record, d.Rbrace) }
func (d *BadDecl) Span() scan.Span    { return scan.Span{d.From, d.To} }

func (d *FieldDecl) Span() scan.Span {
	if d.Type == nil {
		return d.Name.Span()
	}

	if d.Name == nil {
		return d.Type.Span()
	}

	return span2(d.Type, d.Name)
}

func (d *FuncDecl) Span() scan.Span {
	n := d.Result.Span()
	if d.Storage != nil {
		n = d.Storage.Span()
	}

	m := d.Rparen.Span()
	if d.Body != nil {
		if d.Body.Rbrace != nil {
			m = d.Body.Rbrace.Span()
		} else if len(d.Body.Stmt) > 0 {
			m = d.Body.Stmt[len(d.Body.Stmt)-1].Span()
		}
	}

	return scan.Span{n.Start, m.End}
}

func (d *ConstDecl) Span() scan.Span {
	return span2(d.Name, d.X)
}

func (d *VarDecl) Span() scan.Span {
	var span [3]scan.Span
	var n, m scanner.Position

	if d.Storage != nil {
		span[0] = d.Storage.Span()
	} else {
		span[0] = d.Type.Span()
	}
	span[1] = d.Name.Span()
	if d.Value != nil {
		span[2] = d.Value.Span()
	}

	for _, s := range span {
		if n == scan.NoPos || n.Offset < s.Start.Offset {
			n = s.Start
		}
		if m == scan.NoPos || m.Offset < s.End.Offset {
			m = s.End
		}
	}

	return scan.Span{n, m}
}

func (t *BasicType) Span() scan.Span {
	if t.X == nil {
		return t.Type.Span()
	}
	return span2(t.Type, t.X)
}

func (t *RecordType) Span() scan.Span { return span2(t.Record, t.Name) }

func (t *FuncType) Span() scan.Span {
	if t.Params == nil {
		return t.Result.Span()
	}
	return span2(t.Result, t.Params[len(t.Params)-1])
}

func (t *ArrayType) Span() scan.Span { return span2(t.Lbrack, t.Rbrack) }

func (e *CastExpr) Span() scan.Span     { return span2(e.Lparen, e.X) }
func (e *CallExpr) Span() scan.Span     { return span2(e.Fun, e.Rparen) }
func (e *BinaryExpr) Span() scan.Span   { return span2(e.X, e.Y) }
func (e *UnaryExpr) Span() scan.Span    { return span2(e.Op, e.X) }
func (e *ParenExpr) Span() scan.Span    { return span2(e.Lparen, e.Rparen) }
func (e *CondExpr) Span() scan.Span     { return span2(e.Cond, e.Y) }
func (e *SizeofExpr) Span() scan.Span   { return span2(e.Sizeof, e.Rparen) }
func (e *SelectorExpr) Span() scan.Span { return span2(e.X, e.Sel) }
func (e *IndexExpr) Span() scan.Span    { return span2(e.X, e.Rbrack) }
func (e *BadExpr) Span() scan.Span      { return scan.Span{e.From, e.To} }

func (e *StarExpr) Span() scan.Span {
	if e.X == nil {
		return e.Star.Span()
	}
	return span2(e.Star, e.X)
}

func (e *Ident) Span() scan.Span { return spanText(e.Pos, e.Name) }

func (e *CompositeLit) Span() scan.Span { return span2(e.Lbrace, e.Rbrace) }

func (e StringLit) Span() scan.Span {
	l := len(e.Lits) - 1
	n := e.Lits[0].Pos
	m := e.Lits[l].Pos
	m.Offset += len(e.Lits[l].Text)
	m.Column += len(e.Lits[l].Text)
	return scan.Span{n, m}
}

func (s *BlockStmt) Span() scan.Span {
	if s.Lbrace != nil {
		return span2(s.Lbrace, s.Rbrace)
	}
	return span2(s.Stmt[0], s.Stmt[len(s.Stmt)-1])
}

func (s *SwitchStmt) Span() scan.Span { return span2(s.Switch, s.Body.Rbrace) }
func (s *DoStmt) Span() scan.Span     { return span2(s.Do, s.Rparen) }
func (s *WhileStmt) Span() scan.Span  { return span2(s.While, s.Body) }
func (s *ForStmt) Span() scan.Span    { return span2(s.For, s.Body) }
func (s *GotoStmt) Span() scan.Span   { return span2(s.Goto, s.Label) }

func (s *CaseClause) Span() scan.Span {
	if len(s.Body) > 0 {
		return span2(s.Case, s.Body[len(s.Body)-1])
	}
	return span2(s.Case, s.Colon)
}

func (s *ReturnStmt) Span() scan.Span {
	if s.X == nil {
		return s.Return.Span()
	}
	return span2(s.Return, s.X)
}

func (s *IfStmt) Span() scan.Span {
	if s.Else == nil {
		return span2(s.If, s.Body)
	}
	return span2(s.If, s.Else)
}

func (s *LabeledStmt) Span() scan.Span {
	if s.Stmt == nil {
		return span2(s.Label, s.Colon)
	}
	return span2(s.Label, s.Colon)
}

func (s *EmptyStmt) Span() scan.Span { return s.Semi.Span() }
func (s *ExprStmt) Span() scan.Span  { return s.X.Span() }
func (s *BadStmt) Span() scan.Span   { return scan.Span{s.From, s.To} }
