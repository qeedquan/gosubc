// Package types provide a type-checker for the SubC language.
package types

import (
	"fmt"

	"subc/ast"
	"subc/constant"
	"subc/scan"
)

// Config is used to control the behavior of the type checker while
// it is running.
type Config struct {
	MaxErrors int   // the maximum number of errors before bailing out
	Sizes     Sizes // used to determine the size, offset of and alignment of types.
}

// Info contains the type checked information after the type checker is ran.
type Info struct {
	// stores all the type and values of the expression, values are stored if
	// the expression is constant
	Types map[ast.Expr]TypeAndValue

	// used to store the declaration of objects based on their identifier
	Defs map[*ast.Ident]Object

	// stores identifier that are used, it can be used to lookup to its definitions.
	Uses map[*ast.Ident]Object

	// selections from struct and unions
	Selections map[*ast.SelectorExpr]*Selection

	// scope information
	Scopes map[ast.Node]*Scope
}

// Check type checks an AST tree and return an type information structure
// of map structures indexed by the AST tree nodes.
func Check(conf Config, prog *ast.Prog) (*Info, error) {
	if conf.Sizes == nil {
		return nil, fmt.Errorf("typechecker needs a Sizes interface")
	}
	c := &checker{conf: conf}
	return c.Check(prog)
}

// context provides a context for the type checker.
type context struct {
	scope *Scope
	iota  constant.Value
}

// checker is the type checker.
type checker struct {
	*Info
	conf   Config
	errors scan.ErrorList

	context
}

// Check performs a type check on the AST tree.
// It assumes that the AST tree is valid (passed through the parser).
func (c *checker) Check(prog *ast.Prog) (info *Info, err error) {
	c.Info = &Info{
		Types:      make(map[ast.Expr]TypeAndValue),
		Defs:       make(map[*ast.Ident]Object),
		Uses:       make(map[*ast.Ident]Object),
		Selections: make(map[*ast.SelectorExpr]*Selection),
		Scopes:     make(map[ast.Node]*Scope),
	}

	defer func() {
		if e := recover(); e != nil {
			if _, ok := e.(bailout); !ok {
				panic(e)
			}
			err = c.errors.Err()
		}
	}()

	c.top(prog)

	if c.errors.NumErrors > 0 {
		return c.Info, &c.errors
	}
	return c.Info, nil
}

// top goes through all the top level declarations
// type checks the declarations.
func (c *checker) top(prog *ast.Prog) {
	c.scope = NewScope(nil, scan.NoSpan)
	for _, d := range prog.Decls {
		switch d := d.(type) {
		case *ast.BadDecl:
			// ignore
		case *ast.EnumDecl:
			c.enumDecl(d)
		case *ast.RecordDecl:
			c.recordDecl(d)
		case *ast.FuncDecl:
			c.funcDecl(d)
		case *ast.VarDecl:
			c.varDecl(d, true)
		default:
			c.invalidAST(d.Span().Start, "unknown ast.Decl: %T", d)
		}
	}
}

// recordTypeAndValue records the type and value information of an expression.
func (c *checker) recordTypeAndValue(x ast.Expr, mode operandMode, typ Type, val constant.Value) {
	if mode == invalid {
		return
	}

	c.Types[x] = TypeAndValue{mode, typ, val}
}

// recordUse records the use of an object.
func (c *checker) recordUse(id *ast.Ident, obj Object) {
	c.Uses[id] = obj
}
