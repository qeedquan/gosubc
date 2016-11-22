// Package compile provides an interface for compiling a type checked
// parse tree into native code. It is a stack machine with a simple queuing
// mechanism to avoid reloading registers.
// It uses an accumulator described in the SubC compiler.
package compile

import (
	"subc/ast"
	"subc/compile/arch"
	"subc/scan"
	"subc/types"
)

// Config provide options for how the compiler will act when compiling.
type Config struct {
	Emitter   *arch.Emitter // the code emitter for the compiler, needed for generating code for an architecture
	MaxErrors int           // max number of errors before bailing out
}

// Compile compiles a AST tree down to native machine code.
// It assumes a correct AST and valid typed check structure for the AST.
func Compile(conf Config, prog *ast.Prog, info *types.Info) error {
	c := &compiler{
		Info: info,
		conf: conf,
		cg:   conf.Emitter,
		sym:  make(map[types.Object]*arch.LV),
	}
	return c.Compile(prog)
}

// compiler holds the structure for the compiler during execution.
type compiler struct {
	*types.Info
	cg     *arch.Emitter
	conf   Config
	errors scan.ErrorList

	sym map[types.Object]*arch.LV

	labels        map[string]int
	breakStack    []int
	continueStack []int
}

// Compile compiles an AST tree.
func (c *compiler) Compile(prog *ast.Prog) (err error) {
	defer func() {
		if e := recover(); e != nil {
			if _, ok := e.(bailout); !ok {
				panic(e)
			}
		}
		err = c.errors.Err()
	}()

	c.top(prog)
	return nil
}

// top represents the top level declaration of the code.
// It will walk through the declarations and generate code for them.
func (c *compiler) top(prog *ast.Prog) {
	c.cg.Prelude()
	for _, d := range prog.Decls {
		switch d := d.(type) {
		case *ast.VarDecl:
			c.varDecl(d)
		case *ast.FuncDecl:
			c.funcDecl(d)
		}
	}
	c.cg.Postlude()

}
