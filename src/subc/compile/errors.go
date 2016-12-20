package compile

import (
	"fmt"
	"text/scanner"

	"subc/scan"
)

func (c *compiler) invalidAST(pos scanner.Position, format string, args ...interface{}) {
	c.errorf(pos, "invalid AST: "+format, args...)
}

func (c *compiler) errorf(pos scanner.Position, format string, args ...interface{}) {
	c.errors.Add(scan.ErrorMessage{pos, fmt.Sprintf(format, args...), false})
	if c.conf.MaxErrors > 0 && c.errors.NumErrors >= c.conf.MaxErrors {
		panic(bailout{})
	}
}

type bailout struct{}
