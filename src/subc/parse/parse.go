package parse

import (
	"fmt"

	"subc/ast"
	"subc/scan"
)

// Config controls the behavior of the parser during parsing.
type Config struct {
	MaxErrors int // the number of errors before bailing out, if it is 0 or less then it will capture all errors
}

// Parse parses a stream of token and builds an AST tree out of it.
func Parse(conf Config, scanner scan.Interface) (prog *ast.Prog, err error) {
	p := &parser{
		conf:    conf,
		scanner: scanner,
	}

	defer func() {
		if e := recover(); e != nil {
			p.scanner.Close()
			if _, ok := e.(bailout); !ok {
				panic(e)
			}
			err = p.errors.Err()
		}
		err = p.errors.Err()
		p.scanner.Close()
	}()

	prog = &ast.Prog{}
	for {
		if tok := p.peek(); tok.Type == scan.EOF {
			break
		}

		if decls := p.top(); decls != nil {
			prog.Decls = append(prog.Decls, decls...)
		}
	}

	return
}

// parser is a parser structure for parsing.
type parser struct {
	conf Config // config

	scanner    scan.Interface // scanner
	peekTok    scan.Token     // peek token
	putbackTok scan.Token     // putback token for look ahead
	curTok     scan.Token     // current token
	errTok     scan.Token     // last error token

	curFn *ast.FuncDecl // current function we are parsing

	errors scan.ErrorList // errors during parsing
}

// scan gets the next token, ignoring any comment and preprocessor tokens.
func (p *parser) scan() scan.Token {
	for {
		tok := p.scanner.Scan()
		switch tok.Type {
		case scan.Comment, scan.Preprocessor:
		case scan.Error:
			p.errorf(tok.Pos, "%v", tok.Text)
			p.errTok = tok
		default:
			return tok
		}
	}
}

// next gets the next token to parse.
func (p *parser) next() scan.Token {
	if p.putbackTok.Type != scan.EOF {
		tok := p.putbackTok
		p.putbackTok = scan.Token{Type: scan.EOF}
		return tok
	}

	tok := p.peekTok
	if tok.Type != scan.EOF {
		p.peekTok = scan.Token{Type: scan.EOF}
	} else {
		tok = p.scan()
	}
	p.curTok = tok
	return tok
}

// peek looks at the next token without advancing.
func (p *parser) peek() scan.Token {
	if p.putbackTok.Type != scan.EOF {
		return p.putbackTok
	}

	tok := p.peekTok
	if tok.Type != scan.EOF {
		return tok
	}
	p.peekTok = p.scan()
	return p.peekTok
}

// putBack puts the token back for lookahead.
func (p *parser) putBack(tok scan.Token) {
	p.putbackTok = tok
}

// bailout is a structure that is thrown by panic whenever max errors is reached.
type bailout struct{}

// errorf reports an error.
func (p *parser) errorf(pos scan.Position, format string, args ...interface{}) {
	text := fmt.Sprintf(format, args...)
	p.errors = append(p.errors, scan.ErrorMessage{pos, text, false})
	if p.conf.MaxErrors > 0 && len(p.errors) >= p.conf.MaxErrors {
		panic(bailout{})
	}
}

// expect expects a token, erroring if it does not match.
func (p *parser) expect(typ scan.Type) scan.Token {
	tok := p.next()
	if typ != tok.Type {
		s := tok.Type.String()
		if tok.IsLiteral() {
			s = tok.Text
		}
		p.errorf(tok.Pos, "expected %q, but got %q", typ, s)
	}
	return tok
}

// expectIdent expects an identifier
func (p *parser) expectIdent() *ast.Ident {
	tok := p.expect(scan.Ident)
	return &ast.Ident{tok.Pos, tok.Text}
}

// synch synchronizes the parsing to a known clean slate upon a bad parse.
// It looks for a synchronizing token, usually a semicolon.
func (p *parser) synch(lastPos scan.Position, typ scan.Type) scan.Span {
	pos := p.peek().Pos
	end := pos
	for {
		tok := p.next()
		if tok.Pos.IsValid() {
			end = tok.Pos
		}
		if p.errTok.Pos.Offset > end.Offset {
			end = p.errTok.Pos
		}

		if tok.Type == typ {
			break
		} else if tok.Type == scan.EOF {
			if !end.IsValid() {
				end = lastPos
			}

			p.errorf(end, "encountered EOF before synchronization character %v", typ)
			panic(bailout{})
		}
	}

	return scan.Span{pos, end}
}

// eofCheck checks if EOF is prematurely encountered.
func (p *parser) eofCheck() bool {
	curTok := p.curTok
	if tok := p.peek(); tok.Type == scan.EOF {
		pos := tok.Pos
		if !pos.IsValid() {
			pos = curTok.Pos
		}
		p.errorf(pos, "missing }")
		return true
	}
	return false
}
