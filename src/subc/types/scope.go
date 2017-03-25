package types

import (
	"text/scanner"

	"subc/ast"
	"subc/scan"
)

// Namespace represents a namespace for the language
type Namespace int

// Possible namespaces for an declaration to be in.
const (
	Ord Namespace = iota // local variables, global variables, enums, etc
	Tag                  // struct and function declarations
	Lab                  // labels
	Fwd                  // forward declarations
)

func (ns Namespace) String() string {
	switch ns {
	case Ord:
		return "ordinary"
	case Tag:
		return "tag"
	case Lab:
		return "label"
	case Fwd:
		return "forward"
	}
	return "unknown"
}

// Scope represent a scope.
type Scope struct {
	parent   *Scope
	children []*Scope
	elems    [4]map[string]Object
	span     scan.Span
}

// NewScope returns a new scope with a span boundary specified by span.
func NewScope(parent *Scope, span scan.Span) *Scope {
	s := &Scope{
		parent: parent,
		span:   span,
	}

	for i := range s.elems {
		s.elems[i] = make(map[string]Object)
	}

	if parent != nil {
		parent.children = append(parent.children, s)
	}
	return s
}

// Lookup looks up a name in a namespace.
func (s *Scope) Lookup(ns Namespace, name string) Object {
	return s.elems[ns][name]
}

// LookupParent will recursively look up to the top level for the object name.
func (s *Scope) LookupParent(ns Namespace, name string, pos scanner.Position) (*Scope, Object) {
	for ; s != nil; s = s.parent {
		if obj := s.elems[ns][name]; obj != nil && (!pos.IsValid() || obj.scopePos().Offset <= pos.Offset) {
			return s, obj
		}
	}
	return nil, nil
}

// Insert inserts into a namespace the object, if it already exists,
// it returns the existing object without overwriting it.
func (s *Scope) Insert(ns Namespace, obj Object) Object {
	name := obj.Name()
	if alt := s.elems[ns][name]; alt != nil {
		return alt
	}
	s.elems[ns][name] = obj
	if obj.Parent() == nil {
		obj.setParent(s)
	}
	return nil
}

// Parent returns the parent scope.
func (s *Scope) Parent() *Scope { return s.parent }

func (c *checker) openScope(n ast.Node) {
	scope := NewScope(c.scope, n.Span())
	c.recordScope(n, scope)
	c.scope = scope
}

func (c *checker) closeScope() {
	c.scope = c.scope.Parent()
}
