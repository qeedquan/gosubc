package types

import (
	"fmt"
	"text/scanner"

	"subc/scan"
)

func (c *checker) invalidOp(pos scanner.Position, format string, args ...interface{}) {
	c.errorf(pos, "invalid operation: "+format, args...)
}

func (c *checker) invalidAST(pos scanner.Position, format string, args ...interface{}) {
	c.errorf(pos, "invalid AST: "+format, args...)
}

func (c *checker) invalidArg(pos scanner.Position, format string, args ...interface{}) {
	c.errorf(pos, "invalid argument: "+format, args...)
}

func (c *checker) errorf(pos scanner.Position, format string, args ...interface{}) {
	err := scan.ErrorMessage{pos, fmt.Sprintf(format, args...), false}
	c.errors = append(c.errors, err)
	if c.conf.MaxErrors > 0 && len(c.errors) >= c.conf.MaxErrors {
		panic(bailout{})
	}
}

type bailout struct{}
