package types

import (
	"bytes"
	"fmt"
)

// Selection represents a selection expression.
// Examples include a.x or a->x.
type Selection struct {
	obj      Object
	typ      Type
	indirect bool
	offset   int64
	isUnion  bool
}

func (s *Selection) Obj() Object    { return s.obj }
func (s *Selection) Type() Type     { return s.typ }
func (s *Selection) Indirect() bool { return s.indirect }
func (s *Selection) IsUnion() bool  { return s.isUnion }
func (s *Selection) Offset() int64  { return s.offset }
func (s *Selection) String() string { return SelectionString(s) }

// SelectionString returns a pretty printed output of a selection.
func SelectionString(s *Selection) string {
	var buf bytes.Buffer

	fmt.Fprintf(&buf, "field %v (offset %v) ", s.obj.Name(), s.offset)
	WriteType(&buf, s.Type())
	return buf.String()
}
