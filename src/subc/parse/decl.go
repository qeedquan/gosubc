package parse

import (
	"fmt"

	"subc/ast"
	"subc/scan"
)

/*
 * top :=
 *	  ENUM enumdecl
 *	| decl
 *	| primtype decl
 *	| storclass decl
 *	| storclass primtype decl
 *
 * storclass :=
 *	  EXTERN
 *	| STATIC
 *	| VOLATILE
 */

func (p *parser) top() (decls []ast.Decl) {
	var storage *scan.Token
	switch tok := p.peek(); tok.Type {
	case scan.Extern, scan.Static, scan.Volatile:
		storage = &tok
		p.next()
	}

	switch tok := p.peek(); tok.Type {
	case scan.Enum:
		d := p.enumDecl(true)
		d.Storage = storage
		decls = append(decls, d)
	case scan.Struct, scan.Union:
		decls = p.structDecl(storage)
	case scan.Char, scan.Int, scan.Void:
		p.next()
		decls = p.decl(storage, &ast.BasicType{Type: tok})
	case scan.Ident:
		decls = p.decl(storage, nil)
	default:
		p.errorf(tok.Pos, "expected type specifier, got %v", tok.Type)
		span := p.synch(tok.Pos, scan.Semi)
		badDecl := &ast.BadDecl{span.Start, span.End}
		decls = append(decls, badDecl)
	}

	return
}

/*
 * enumdecl := { enumlist } ;
 *
 * enumlist :=
 *	  enumerator
 *	| enumerator , enumlist
 *
 * enumerator :=
 *	  IDENT
 *	| IDENT = constexpr
 */

func (p *parser) enumDecl(global bool) *ast.EnumDecl {
	d := &ast.EnumDecl{}
	d.Enum = p.next()
	if tok := p.peek(); tok.Type == scan.Ident {
		d.Name = &ast.Ident{tok.Pos, tok.Text}
		p.next()
	}
	d.Lbrace = p.expect(scan.Lbrace)
	for {
		if tok := p.peek(); tok.Type == scan.Rbrace {
			break
		}

		e := &ast.ConstDecl{}
		name := p.expect(scan.Ident)
		e.Name = &ast.Ident{name.Pos, name.Text}
		if tok := p.peek(); tok.Type == scan.Assign {
			p.next()
			e.X = p.constExpr()
		}

		d.List = append(d.List, e)

		if tok := p.peek(); tok.Type != scan.Comma {
			break
		}

		if p.eofCheck() {
			return d
		}
		p.next()
	}
	d.Rbrace = p.expect(scan.Rbrace)
	p.expect(scan.Semi)
	return d
}

/*
 * initlist :=
 *	  { const_list }
 *	| STRLIT
 *
 * const_list :=
 *	  constexpr
 *	| constexpr , const_list
 */

func (p *parser) initList() ast.Expr {
	s := &ast.StringLit{}
	for {
		tok := p.peek()
		if tok.Type != scan.String {
			break
		}
		s.Lits = append(s.Lits, &ast.BasicLit{tok})
		p.next()
	}
	if len(s.Lits) > 0 {
		return s
	}

	e := &ast.CompositeLit{}
	e.Lbrace = p.expect(scan.Lbrace)
	for {
		if tok := p.peek(); tok.Type == scan.Rbrace {
			e.Rbrace = tok
			break
		}
		e.Elts = append(e.Elts, p.constExpr())

		if tok := p.peek(); tok.Type == scan.Comma {
			p.next()
		} else {
			break
		}

		if p.eofCheck() {
			return e
		}
	}
	p.expect(scan.Rbrace)
	return e
}

/*
 * structdecl :=
 *	  STRUCT identifier { member_list } ;
 *
 * member_list :=
 *	  primtype mdecl_list ;
 *	| primtype mdecl_list ; member_list
 *
 * mdecl_list :=
 *	  declarator
 *	| declatator , mdecl_list
 */

func (p *parser) structDecl(storage *scan.Token) (decls []ast.Decl) {
	typ := p.next()
	name := p.expect(scan.Ident)
	ident := &ast.Ident{name.Pos, name.Text}
	if tok := p.peek(); tok.Type != scan.Lbrace {
		prim := &ast.RecordType{Record: typ, Name: ident}
		decls = p.decl(storage, prim)
		return
	}

	d := &ast.RecordDecl{}
	d.Record = typ
	d.Name = &ast.Ident{name.Pos, name.Text}
	d.Lbrace = p.next()

	for {
		tok := p.peek()
		if !isType(tok.Type) {
			break
		}

		prim := p.primType(tok)

		for {
			if p.eofCheck() {
				decls = append(decls, d)
				return
			}

			v := p.declarator(true, storage, prim).(*ast.VarDecl)
			f := &ast.FieldDecl{Type: prim}
			f.Name = v.Name
			f.Type = v.Type
			d.Fields = append(d.Fields, f)

			if tok := p.peek(); tok.Type != scan.Comma {
				break
			}
			p.next()
		}
		p.expect(scan.Semi)
	}
	d.Rbrace = p.expect(scan.Rbrace)
	p.expect(scan.Semi)
	decls = append(decls, d)
	return
}

/*
 * decl :=
 *	  declarator { localdecls stmt_list }
 *	| decl_list ;
 *
 * decl_list :=
 *	  declarator
 *	| declarator , decl_list
 */

func (p *parser) decl(storage *scan.Token, prim ast.Decl) (decls []ast.Decl) {
	for {
		d := p.declarator(false, storage, prim)
		decls = append(decls, d)
		switch d := d.(type) {
		case *ast.FuncDecl:
			if tok := p.peek(); tok.Type == scan.Lbrace {
				p.curFn = d
				p.next()
				d.Decls = p.localDecls()
				d.Body = p.compound(&tok)
			} else {
				p.expect(scan.Semi)
			}
			p.curFn = nil
			return
		}

		if tok := p.peek(); tok.Type == scan.Comma {
			p.next()
		} else {
			break
		}
	}

	p.expect(scan.Semi)
	return
}

/*
 * declarator :=
 *	  IDENT
 *	| * IDENT
 *	| * * IDENT
 *	| * IDENT [ constexpr ]
 *	| IDENT [ constexpr ]
 *	| IDENT = constexpr
 *	| IDENT [ ] = initlist
 *	| IDENT pmtrdecl
 *	| IDENT [ ]
 *	| * IDENT [ ]
 *	| ( * IDENT ) ( )
 */

func (p *parser) declarator(pmtr bool, storage *scan.Token, prim ast.Decl) ast.Decl {
	var f *ast.FuncType
	var a *ast.ArrayType
	var s *ast.StarExpr
	v := &ast.VarDecl{Storage: storage, Type: copyPrim(prim)}

	switch tok := p.peek(); tok.Type {
	case scan.Mul:
		star := &ast.StarExpr{Star: tok}
		s = star
		p.next()
		switch tok := p.peek(); tok.Type {
		case scan.Mul:
			s = &ast.StarExpr{Star: tok}
			star.X = s
			p.next()
		}

		setType(v.Type, star)

	case scan.Lparen:
		f = &ast.FuncType{Result: copyPrim(prim)}
		f.Lparen[0] = tok
		p.next()
		f.Star = p.expect(scan.Mul)
	}

	if tok := p.peek(); !pmtr || tok.Type == scan.Ident {
		name := p.expect(scan.Ident)
		v.Name = &ast.Ident{name.Pos, name.Text}
	}

	if f != nil {
		v.Type = f
		f.Rparen[0] = p.expect(scan.Rparen)
		f.Lparen[1] = p.expect(scan.Lparen)
		f.Rparen[1] = p.expect(scan.Rparen)
	}

	d := ast.Decl(v)
	switch tok := p.peek(); {
	case !pmtr && tok.Type == scan.Assign:
		p.next()
		v.Value = p.constExpr()

	case !pmtr && tok.Type == scan.Lparen:
		fd := &ast.FuncDecl{}
		fd.Storage = storage
		fd.Result = v.Type
		fd.Name = v.Name
		fd.Lparen = p.next()
		fd.Params = p.pmtrDecls()
		fd.Rparen = p.expect(scan.Rparen)
		d = fd

	case tok.Type == scan.Lbrack:
		a = &ast.ArrayType{}
		a.Lbrack = tok
		p.next()
		if tok := p.peek(); tok.Type == scan.Rbrack {
			a.Rbrack = tok
			p.next()
			if tok := p.peek(); tok.Type == scan.Assign {
				p.next()
				v.Value = p.initList()
			}
		} else {
			a.Len = p.constExpr()
			a.Rbrack = p.expect(scan.Rbrack)
		}

		if s != nil {
			s.X = a
		} else {
			setType(v.Type, a)
		}
	}

	return d
}

/*
 * pmtrdecl :=
 *	  ( )
 *	| ( pmtrlist )
 *	| ( pmtrlist , ... )
 *
 * pmtrlist :=
 *	  primtype declarator
 *	| primtype declarator , pmtrlist
 */

func (p *parser) pmtrDecls() (fields []*ast.FieldDecl) {
	if tok := p.peek(); tok.Type == scan.Rparen {
		return nil
	}

	var prim ast.Decl
	nargs := 0

loop:
	for {
		switch tok := p.peek(); {
		case nargs > 0 && tok.Type == scan.Ellipsis:
			fields = append(fields, &ast.FieldDecl{Type: tok})
			p.next()
			break loop

		case tok.Type == scan.Ident:

		default:
			if !isType(tok.Type) {
				p.errorf(tok.Pos, "type specifier expected")
				p.synch(tok.Pos, scan.Rparen)
				break loop
			}

			xtok := tok
			prim = p.primType(tok)
			if tok := p.peek(); tok.Type == scan.Rparen && xtok.Type == scan.Void && nargs == 0 {
				fields = append(fields, &ast.FieldDecl{Type: prim})
				break loop
			}
		}

		v := p.declarator(true, nil, prim)
		switch v := v.(type) {
		case *ast.VarDecl:
			field := &ast.FieldDecl{Type: v.Type, Name: v.Name}
			fields = append(fields, field)

		default:
			panic(fmt.Sprintf("unimplemented parameter type: %T", v))
		}

		nargs++
		if tok := p.peek(); tok.Type == scan.Comma {
			p.next()
		} else {
			break
		}
	}

	return
}

/*
 * localdecls :=
 *        ldecl
 *      | ldecl localdecls
 *
 * ldecl :=
 *	  primtype ldecl_list ;
 *	| lclass primtype ldecl_list ;
 *	| lclass ldecl_list ;
 *	| enum_decl
 *	| struct_decl
 *
 * lclass :=
 *	| AUTO
 *	| EXTERN
 *	| REGISTER
 *	| STATIC
 *	| VOLATILE
 *
 * ldecl_list :=
 *	  declarator
 *	| declarator , ldecl_list
 */

func (p *parser) localDecls() []ast.Decl {
	var d []ast.Decl

	for {
		tok := p.peek()
		if !isLocalType(tok.Type) {
			break
		}

		if tok.Type == scan.Enum {
			d = append(d, p.enumDecl(false))
			continue
		}

		var storage *scan.Token
		var prim ast.Decl
		if isQualifier(tok.Type) {
			storage = &tok
			p.next()
			if tok := p.peek(); isType(tok.Type) {
				prim = p.primType(tok)
			}
		} else {
			prim = p.primType(tok)
		}

		for {
			if p.eofCheck() {
				return d
			}

			n := p.declarator(false, storage, prim)
			d = append(d, n)

			if tok := p.peek(); tok.Type == scan.Comma {
				p.next()
			} else {
				break
			}
		}
		p.expect(scan.Semi)
	}

	return d
}

// primType creates a basic type or a record type from token
func (p *parser) primType(tok scan.Token) ast.Expr {
	switch tok.Type {
	case scan.Char, scan.Int, scan.Void:
		p.next()
		return &ast.BasicType{Type: tok}

	case scan.Union, scan.Struct:
		p.next()
		name := p.expect(scan.Ident)
		ident := &ast.Ident{name.Pos, name.Text}
		return &ast.RecordType{Record: tok, Name: ident}

	default:
		panic(fmt.Sprintf("unimplemented primary type %v", tok))
	}
}

// setType sets y to be an element that x points to, x needs to be a basic type
// or a record type.
func setType(x, y ast.Expr) {
	switch x := x.(type) {
	case *ast.BasicType:
		x.X = y
	case *ast.RecordType:
		x.X = y
	case nil:
	default:
		panic(fmt.Sprintf("unimplemented type: %T", x))
	}
}

// copyPrim makes a copy of prim.
func copyPrim(prim ast.Expr) ast.Expr {
	var d ast.Expr
	switch x := prim.(type) {
	case *ast.BasicType:
		y := &ast.BasicType{}
		*y = *x
		d = y
	case *ast.RecordType:
		y := &ast.RecordType{}
		*y = *x
		d = y
	case nil:
	default:
		panic(fmt.Sprintf("unimplemented new primary type: %v", x))
	}
	return d
}
