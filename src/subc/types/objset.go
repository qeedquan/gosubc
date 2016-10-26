package types

import "text/scanner"

// objset is used to see if there are redeclarations of variables.
type objset map[string]Object

func (s *objset) insert(obj Object) Object {
	id := obj.Name()
	if alt := (*s)[id]; alt != nil {
		return alt
	}
	if *s == nil {
		*s = make(map[string]Object)
	}
	(*s)[id] = obj
	return nil
}

func (c *checker) declareInSet(oset *objset, pos scanner.Position, obj Object) bool {
	if alt := oset.insert(obj); alt != nil {
		c.errorf(pos, "%s redeclared", obj.Name())
		c.reportAltDecl(alt)
		return false
	}
	return true
}
