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
	c.errors.Add(err)
	if c.conf.MaxErrors > 0 && c.errors.NumErrors >= c.conf.MaxErrors {
		c.errors.Add(scan.ErrorMessage{pos, "too many errors", false})
		panic(bailout{})
	}
}

type bailout struct{}
