package compile

import (
	"fmt"

	"subc/scan"
)

func (c *compiler) invalidAST(pos scan.Position, format string, args ...interface{}) {
	c.errorf(pos, "invalid AST: "+format, args...)
}

func (c *compiler) errorf(pos scan.Position, format string, args ...interface{}) {
	c.errors = append(c.errors, scan.ErrorMessage{pos, fmt.Sprintf(format, args...), false})
	if c.conf.MaxErrors > 0 && len(c.errors) >= c.conf.MaxErrors {
		panic(bailout{})
	}
}

type bailout struct{}
