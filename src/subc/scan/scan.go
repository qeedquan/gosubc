// Package scan implements a scanner for the SubC language.
// It takes an interface that can return bytes and transforms it into tokens.
package scan

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"strconv"
	"strings"
	"text/scanner"
	"time"
	"unicode"
	"unicode/utf8"
)

// Interface defines an interface for scanning.
type Interface interface {
	Scan() Token
	Close() error
}

// Config specifies the behavior of the scanner.
type Config struct {
	ApplyPreprocessor bool        // applies the preprocessor upon encountering macros
	Loader            Loader      // the loader interface is used for loading include files
	MaxIncludes       int         // max number of nested includes during macro expansion before aborting
	IncludePaths      []string    // paths to look for include files
	Macros            [][2]string // macro definitions in the form of (macro, text expansion)
	ScanComments      bool        // scan comments as tokens when turned on, otherwise it is ignored
	scanRaw           bool        // during scanning, used to tell the scanner not to expand anything, for internal processing of macros
	expandingMacro    bool        // enabled when the scanner is expanding the macro
}

// DefaultConfig specifies a reasonable default for the scanner.
// It is intended to be extended by making a copy of this struct and
// then customizing some of the fields.
var DefaultConfig = Config{
	ApplyPreprocessor: true,
	Loader:            fileLoader{},
	MaxIncludes:       16,
	Macros: [][2]string{
		{"__SUBC__", ""},
		{"__" + runtime.GOOS + "__", ""},
		{"__DATE__", "\"" + time.Now().Format("Jan 2 2006") + "\""},
		{"__TIME__", "\"" + time.Now().Format("15:04:05") + "\""},
	},
	ScanComments: false,
}

// a reader is one input during scanning
type reader struct {
	Reader
	scanner.Position
	cwd string
}

type stateFn func(*Scanner) stateFn

// Scanner is the scanner structure for scanning tokens.
type Scanner struct {
	Tokens        chan Token // channel used for returning tokens.
	conf          Config
	r             *reader
	s             []*reader
	c             []int
	done          bool
	buf           []byte
	rbuf          []rune
	input         string
	peekch        rune
	prevPos       scanner.Position
	peekPos       scanner.Position
	emitPos       scanner.Position
	state         stateFn
	macros        map[string]string
	peekDirective bool
	directive     bool
}

// Special sentinels for the scanner
const (
	eof       = -1
	notPeeked = -2
)

// Preprocessor sentinels
const (
	p_ifdef = iota + 1
	p_ifndef
	p_else
	p_elsenot
)

// newReader returns a reader for a scanner to use.
func newReader(name string, r Reader, cwd string) *reader {
	return &reader{
		Reader: r,
		Position: scanner.Position{
			Filename: name,
			Line:     1,
			Column:   1,
		},
		cwd: cwd,
	}
}

// New returns a scanner for reading tokens using name as the filename identifier and r as a reader.
// It starts a goroutine and runs concurrently to get the next token which must be drained by user.
func New(conf Config, name string, r Reader) *Scanner {
	l := &Scanner{
		Tokens:    make(chan Token),
		conf:      conf,
		r:         newReader(name, r, "."),
		peekch:    notPeeked,
		macros:    make(map[string]string),
		directive: !conf.expandingMacro,
	}
	for _, m := range conf.Macros {
		l.macros[m[0]] = m[1]
	}

	if conf.Macros != nil {
		if l.macros["__FILE__"] == "" {
			l.macros["__FILE__"] = strconv.Quote(name)
		}
		l.macros["__LINE__"] = ""
	}

	l.s = []*reader{l.r}
	go l.run()
	return l
}

// Scan reads the next token from the channel.
func (l *Scanner) Scan() Token {
	return <-l.Tokens
}

// Close drains the tokens from the channel, it is used for cleaning up.
func (l *Scanner) Close() error {
	go func() {
		for _ = range l.Tokens {
		}
	}()
	return nil
}

// perrorf sends an error down the token channel.
// The force flag is true whenever it is scanning in a #ifdef/#ifndef macros are used to
// disable a section of the source, but is an error that occurs in the preprocessor.
func (l *Scanner) perrorf(force bool, format string, args ...interface{}) stateFn {
	if !force && l.frozen(1) {
		return lexAny
	}
	l.Tokens <- Token{Error, l.emitPos, fmt.Sprintf(format, args...)}
	return lexAny
}

// errorf sends an error down the channel.
func (l *Scanner) errorf(format string, args ...interface{}) stateFn {
	return l.perrorf(false, format, args...)
}

// emit emits a token down a channel.
func (l *Scanner) emit(typ Type, text string) {
	l.emitp(typ, l.emitPos, text)
}

// emitp emits a token down a channel if we are not in a disabled macro expansion.
func (l *Scanner) emitp(typ Type, pos scanner.Position, text string) {
	if !l.frozen(1) {
		l.Tokens <- Token{typ, pos, text}
	}
}

// resetInput resets the input, it is used to setup the next reader.
func (l *Scanner) resetInput() {
	l.peekch = notPeeked
	l.peekDirective = true
	l.directive = true
	l.done = false
	l.input = ""
	l.macros["__FILE__"] = strconv.Quote(l.s[len(l.s)-1].Filename)
}

// loadLine loads a line into the input buffer for the scanner.
func (l *Scanner) loadLine() {
	l.buf = l.buf[:0]
	for {
		c, err := l.r.ReadByte()
		if err != nil {
			l.done = true
			break
		}
		l.buf = append(l.buf, c)
		if c == '\n' {
			break
		}
	}
	l.input += string(l.buf)
}

// next returns the next rune, it can either decode the input
// or if there is a peek character, it will use that.
func (l *Scanner) next() rune {
	if l.peekch != notPeeked {
		l.prevPos = l.r.Position
		l.r.Position = l.peekPos
		l.directive = l.peekDirective

		r := l.peekch
		l.peekch = notPeeked
		return r
	}
	if !l.done && len(l.input) == 0 {
		l.loadLine()
	}
	if len(l.input) == 0 {
		return eof
	}

	r, w := utf8.DecodeRuneInString(l.input)
	l.input = l.input[w:]
	l.prevPos = l.r.Position
	l.r.Offset += w
	l.r.Column += w
	if r == '\n' {
		l.r.Line++
		l.r.Column = 1
		l.directive = true
	} else if !unicode.IsSpace(r) && r != '#' {
		l.directive = false
	}

	return r
}

// peek looks at the next rune without consuming input
// by saving the peek character in a buffer that next() will use.
func (l *Scanner) peek() rune {
	if l.peekch == notPeeked {
		pos := l.r.Position
		directive := l.directive

		l.peekch = l.next()
		l.peekPos = l.r.Position
		l.peekDirective = l.directive

		l.r.Position = pos
		l.directive = directive
	}
	return l.peekch
}

// run runs the scanner state machine
func (l *Scanner) run() {
	for l.state = lexAny; l.state != nil; {
		l.state = l.state(l)
	}
	close(l.Tokens)
}

// acceptRun scans the input until a character not in the valid set appears.
func (l *Scanner) acceptRun(valid string) {
	l.acceptRunFunc(func(r rune) bool {
		return strings.IndexRune(valid, r) >= 0
	})
}

// acceptRunFunc scans the input until a character not in the valid set appears.
func (l *Scanner) acceptRunFunc(f func(rune) bool) {
	for {
		r := l.peek()
		if !f(r) {
			break
		}
		l.next()
		l.rbuf = append(l.rbuf, r)
	}
}

// lexAny is the main state function that looks at the character and decides
// what state to dispatch to scan the input.
func lexAny(l *Scanner) stateFn {
	r := l.next()
	l.rbuf = l.rbuf[:0]
	l.rbuf = append(l.rbuf, r)
	l.emitPos = l.prevPos
	switch {
	case r == eof:
		return lexNextReader
	case unicode.IsSpace(r):
		return lexSpace
	case unicode.IsNumber(r):
		return lexNumber
	case unicode.IsLetter(r) || r == '_':
		return lexWord
	case r == '\'':
		return lexRune
	case r == '"':
		return lexString
	case r == '/':
		if r := l.peek(); r == '/' || r == '*' {
			return lexComment
		}
		l.isOperator(r)
		return lexOperator
	case l.isOperator(r):
		return lexOperator
	case l.directive && r == '#' && !l.conf.scanRaw:
		return lexPreprocessor
	default:
		if l.conf.scanRaw {
			l.emit(Rune, string(r))
			return lexAny
		}
		return l.errorf("unrecognized character: %#U", r)
	}
	return lexAny
}

// lexNextReader is called when the reader has reached the end of its input,
// it will pop the finished reader and get the next reader.
func lexNextReader(l *Scanner) stateFn {
	n := len(l.s) - 1
	if n == 0 {
		return nil
	}
	l.r = l.s[n-1]
	l.s = l.s[:n]
	l.resetInput()
	return lexAny
}

// lexSpace scans whitespaces.
func lexSpace(l *Scanner) stateFn {
	l.acceptRunFunc(unicode.IsSpace)
	return lexAny
}

// lexNumber scans numbers in base 10 or base 16.
func lexNumber(l *Scanner) stateFn {
	const digits = "0123456789abcdefABCDEF"

	l.acceptRun(digits[:10])
	s := string(l.rbuf)

	l.rbuf = l.rbuf[:0]
	l.acceptRunFunc(func(r rune) bool {
		return unicode.IsLetter(r) || r == '_' || unicode.IsDigit(r)
	})

	if len(l.rbuf) > 0 {
		var suffix string
		hex := false
		for i, r := range l.rbuf {
			switch {
			case i == 0 && (r == 'x' || r == 'X'):
				hex = true
				s += string(r)
			case hex && strings.IndexRune(digits, r) >= 0:
				s += string(r)
			default:
				suffix += string(r)
			}
		}

		if r := s[len(s)-1]; r == 'x' || r == 'X' {
			s = s[:len(s)-1]
			suffix = string(r) + suffix
		}

		if len(suffix) > 0 {
			return l.errorf("invalid suffix %q on integer constant: %q", suffix, s)
		}
	}

	l.emit(Number, s)
	return lexAny
}

// lexWord scans keywords.
func lexWord(l *Scanner) stateFn {
	var keywords = map[string]Type{
		"_Bool":         Bool,
		"_Complex":      Complex,
		"_Noreturn":     Noreturn,
		"_Thread_local": Thread_local,

		"auto":     Auto,
		"break":    Break,
		"case":     Case,
		"char":     Char,
		"const":    Const,
		"continue": Continue,
		"default":  Default,
		"do":       Do,
		"double":   Double,
		"else":     Else,
		"enum":     Enum,
		"extern":   Extern,
		"float":    Float,
		"for":      For,
		"goto":     Goto,
		"if":       If,
		"int":      Int,
		"long":     Long,
		"register": Register,
		"return":   Return,
		"short":    Short,
		"sizeof":   Sizeof,
		"static":   Static,
		"struct":   Struct,
		"switch":   Switch,
		"typedef":  Typedef,
		"union":    Union,
		"unsigned": Unsigned,
		"void":     Void,
		"volatile": Volatile,
		"while":    While,
	}

	l.acceptRunFunc(func(r rune) bool {
		return r == '_' || unicode.IsLetter(r)
	})
	l.acceptRunFunc(func(r rune) bool {
		return r == '_' || unicode.IsLetter(r) || unicode.IsDigit(r)
	})

	s := string(l.rbuf)
	if l.expandMacro(s) {
		return lexAny
	}

	if keyword, ok := keywords[s]; ok {
		l.emit(keyword, s)
	} else {
		l.emit(Ident, s)
	}
	return lexAny
}

// expandMacro expands a macro, it will return false
// if there is no macro expansion for a given macro.
func (l *Scanner) expandMacro(macro string) bool {
	if _, found := l.macros[macro]; !found {
		return false
	}

	if macro == "__LINE__" {
		l.macros[macro] = fmt.Sprintf("%v", l.r.Line)
	}

	c := l.conf
	c.ScanComments = true
	c.ApplyPreprocessor = false
	c.Macros = nil
	c.scanRaw = true
	p := New(c, "", nopCloser{strings.NewReader(macro)})

	// Whenever we expand a macro, we will mark it "blue"
	// to prevent infinite expansion. The expansion
	// will continue until it reaches a fixed point,
	// then we know it is a the text after expansion has stopped.
	var x []Token
	seen := make(map[string]bool)
	for {
		fixed := true
		x = x[:0]
		for t := range p.Tokens {
			if !isIdent(t.Text) {
				x = append(x, t)
				continue
			}

			s, found := l.macros[t.Text]
			if !found || seen[t.Text] {
				x = append(x, t)
				continue
			}

			fixed = false
			seen[t.Text] = true

			q := New(c, "(macro)", nopCloser{strings.NewReader(s)})
			for t := range q.Tokens {
				x = append(x, t)
			}
		}

		macro = ""
		for _, t := range x {
			macro += t.Text + " "
		}
		if fixed {
			break
		}
		p = New(c, "", nopCloser{strings.NewReader(macro)})
	}

	// We started a separate scanner while expanding the text, now feed back
	// the output to our scanner.
	c.expandingMacro = true
	c.scanRaw = false
	p = New(c, fmt.Sprintf("%v (macro)", l.r.Filename), nopCloser{strings.NewReader(macro)})
	for t := range p.Tokens {
		pos := l.emitPos
		pos.Filename = t.Pos.Filename
		l.emitp(t.Type, pos, t.Text)
	}

	return true
}

// scanRune scans rune and handle escape codes in runes if necessary.
// it returns the rune and whether not it was escaped, and an error on bad input.
func (l *Scanner) scanRune() (rune, bool, error) {
	r := l.next()
	if r == '\\' {
		switch r := l.next(); r {
		case 'a':
			return '\a', true, nil
		case 'b':
			return '\b', true, nil
		case 'f':
			return '\f', true, nil
		case 'n':
			return '\n', true, nil
		case 'r':
			return '\r', true, nil
		case 't':
			return '\t', true, nil
		case 'v':
			return '\v', true, nil
		case '\\':
			return '\\', true, nil
		case '"':
			return '"', true, nil
		case '\'':
			return '\'', true, nil
		case '0', '1', '2', '3', '4', '5', '6', '7':
			n := r - '0'
			for i := 0; i < 2; i++ {
				r := l.peek()
				if !('0' <= r && r <= '7') {
					break
				}
				l.next()
				n = n*8 + r - '0'
			}
			if n > 255 {
				return 0, false, fmt.Errorf("octal sequence overflowed")
			}

			return n, false, nil
		case 'x':
			const hex = "0123456789abcdef"
			n := 0
			s := "\\x"
			for {
				r := unicode.ToLower(l.peek())
				i := strings.IndexRune(hex, r)
				if i < 0 {
					break
				}
				s += string(r)
				if n <= 255 {
					n = n*16 + i
				}
				l.next()
			}
			if n > 255 {
				return 0, false, fmt.Errorf("hex sequence overflowed: %q", s)
			}
			return rune(n), false, nil
		default:
			return 0, false, fmt.Errorf("unknown escape sequence: %q", r)
		}
	}
	return r, false, nil
}

// scanRaw scans until a sentinel term is reached or eof,
// it is usually used for scanning strings where the term is the quote.
func (l *Scanner) scanRaw(typ Type, term rune) stateFn {
loop:
	for {
		r := l.next()
		l.rbuf = append(l.rbuf, r)
		switch {
		case r == term:
			break loop
		case r == '\n' || r == eof:
			return l.errorf("missing terminating ' character: %q")
		}
	}
	l.emit(typ, string(l.rbuf))
	return lexAny
}

// lexRune scans a rune.
func lexRune(l *Scanner) stateFn {
	if l.conf.scanRaw {
		return l.scanRaw(Rune, '\'')
	}

	r, escapeChar, err := l.scanRune()
	if err == nil && r == '\'' && !escapeChar {
		return l.errorf("empty character sequence")
	}
	stray := false
	s := ""

loop:
	for {
		switch r := l.next(); r {
		case '\'':
			break loop
		case eof, '\n':
			return l.errorf("missing terminating ' character")
		default:
			s += string(r)
			stray = true
		}
	}
	if stray {
		return l.errorf("stray characters %q in character sequence", s)
	}
	if err != nil {
		return l.errorf("%v", err)
	}

	l.emit(Rune, "'"+string(r)+"'")
	return lexAny
}

// lexString scans a string.
func lexString(l *Scanner) stateFn {
	if l.conf.scanRaw {
		return l.scanRaw(String, '"')
	}

	var err error
	l.rbuf = l.rbuf[:0]
	l.rbuf = append(l.rbuf, '"')
	for {
		r, escapeChar, e := l.scanRune()
		if err == nil {
			err = e
		}
		if !escapeChar && (r == '\n' || r == eof) {
			return l.errorf("missing terminating \" character")
		}

		l.rbuf = append(l.rbuf, r)

		if r == '"' && !escapeChar {
			break
		}
	}
	if err != nil {
		return l.errorf("%v", err)
	}
	l.emit(String, string(l.rbuf))
	return lexAny
}

// lexComment scans comments.
func lexComment(l *Scanner) stateFn {
	l.rbuf = append(l.rbuf, l.peek())
	switch l.next() {
	case '/':
		for {
			r := l.peek()
			if r == '\n' || r == eof {
				break
			}
			l.rbuf = append(l.rbuf, r)
			l.next()
		}
	case '*':
		for {
			r := l.peek()
			if r == eof {
				return l.errorf("unterminated comment")
			}
			if r == '*' {
				l.rbuf = append(l.rbuf, r)
				l.next()
				r = l.peek()
				if r == '/' {
					l.rbuf = append(l.rbuf, r)
					l.next()
					break
				}
			} else {
				l.rbuf = append(l.rbuf, r)
				l.next()
			}
		}
	}

	if l.conf.ScanComments {
		l.emit(Comment, string(l.rbuf))
	}
	return lexAny
}

// lexOperator scans operators and other special symbols.
func lexOperator(l *Scanner) stateFn {
	operators := map[string]Type{
		"/":   Div,
		"*":   Mul,
		"%":   Mod,
		"+":   Plus,
		"-":   Minus,
		"<<":  Lsh,
		">>":  Rsh,
		">":   Gt,
		">=":  Geq,
		"<":   Lt,
		"<=":  Leq,
		"==":  Eq,
		"!=":  Neq,
		"&":   And,
		"^":   Xor,
		"|":   Or,
		"&&":  Land,
		"||":  Lor,
		"->":  Arrow,
		"&=":  AndEq,
		"^=":  XorEq,
		"<<=": LshEq,
		"-=":  MinusEq,
		"%=":  ModEq,
		"|=":  OrEq,
		"+=":  PlusEq,
		">>=": RshEq,
		"/=":  DivEq,
		"*=":  MulEq,
		"=":   Assign,
		":":   Colon,
		",":   Comma,
		"--":  Dec,
		".":   Dot,
		"...": Ellipsis,
		"++":  Inc,
		"{":   Lbrace,
		"[":   Lbrack,
		"(":   Lparen,
		"!":   Not,
		"?":   Qmark,
		"}":   Rbrace,
		"]":   Rbrack,
		")":   Rparen,
		";":   Semi,
		"~":   Negate,
	}
	s := string(l.rbuf)
	if op, ok := operators[s]; ok {
		l.emit(op, s)
	}
	return lexAny
}

// isOperator looks ahead to see if it is a symbol
// for the state machine to decide whether or not to go into
// the operator state.
func (l *Scanner) isOperator(r rune) bool {
	switch r {
	case '+':
		switch r := l.peek(); r {
		case '+', '=':
			l.rbuf = append(l.rbuf, r)
			l.next()
		}

	case '-':
		switch r := l.peek(); r {
		case '-', '>', '=':
			l.rbuf = append(l.rbuf, r)
			l.next()
		}

	case '*', '/', '%', '^', '=', '!':
		if r := l.peek(); r == '=' {
			l.rbuf = append(l.rbuf, r)
			l.next()
		}

	case '|', '&':
		if c := l.peek(); c == '=' || r == c {
			l.rbuf = append(l.rbuf, c)
			l.next()
		}

	case '<', '>':
		switch c := l.peek(); {
		case c == r:
			l.rbuf = append(l.rbuf, r)
			l.next()
			if r := l.peek(); r == '=' {
				l.rbuf = append(l.rbuf, r)
				l.next()
			}
		case c == '=':
			l.rbuf = append(l.rbuf, c)
			l.next()
		}

	case '.':
		if r := l.peek(); r == '.' {
			l.next()
			if l.peek() == '.' {
				l.rbuf = append(l.rbuf, []rune{'.', '.'}...)
				l.next()
			} else {
				l.emit(Dot, ".")
			}
		}

	case '?', ':', ',', '(', ')', '{', '}', '[', ']', '~', ';':

	default:
		return false
	}

	return true
}

// lexPreprocessor scans a preprocessor directive.
func lexPreprocessor(l *Scanner) stateFn {
	l.acceptRunFunc(func(r rune) bool {
		return r != '\n' && r != eof
	})
	l.next()

	if !l.conf.ApplyPreprocessor {
		l.emit(Preprocessor, string(l.rbuf))
		return lexAny
	}
	line := string(l.rbuf[1:])

	c := l.conf
	c.ApplyPreprocessor = false
	c.ScanComments = true
	c.Macros = nil
	c.scanRaw = true
	p := New(c, l.r.Filename, nopCloser{strings.NewReader(line)})
	defer p.Close()

	switch t := <-p.Tokens; t.Text {
	case "define":
		l.defineDirective(p)
	case "else":
		l.elseDirective(p)
	case "endif":
		l.endifDirective(p)
	case "error":
		l.errorDirective(p)
	case "ifdef":
		l.ifdefDirective(p, true)
	case "ifndef":
		l.ifdefDirective(p, false)
	case "include":
		l.includeDirective(p, line)
	case "line":
		l.lineDirective(p)
	case "pragma":
	case "undef":
		l.undefDirective(p)
	case "":
		return l.errorf("empty directive")
	default:
		return l.errorf("unknown directive: %q", t.Text)
	}

	return lexAny
}

// defineDirective handles #define directives.
func (l *Scanner) defineDirective(p *Scanner) {
	t := <-p.Tokens
	if !isIdent(t.Text) {
		l.errorf("#define: expected identifier, got %q", t.Text)
		return
	}

	s := ""
	for t := range p.Tokens {
		s += t.Text + " "
	}
	if s != "" {
		s = s[:len(s)-1]
	}

	if r, ok := l.macros[t.Text]; ok && r != s {
		l.errorf("#define: %q redefined", t.Text)
		return
	}

	l.macros[t.Text] = s
}

// frozen tells if the scanner should discard the tokens it generates
// while scanning, this occurs whenever the scanner is in a #ifdef/#ifndef block
// that disabled the part of the code.
func (l *Scanner) frozen(depth int) bool {
	return len(l.c) >= depth &&
		(l.c[len(l.c)-depth] == p_ifndef || l.c[len(l.c)-depth] == p_elsenot)
}

// elseDirective handles the #else directive.
func (l *Scanner) elseDirective(p *Scanner) {
	switch n := len(l.c); {
	case n == 0:
		l.perrorf(true, "#else: no matching #ifdef/#ifndef")
	case l.frozen(2):
	case l.c[n-1] == p_ifdef:
		l.c[n-1] = p_elsenot
	case l.c[n-1] == p_ifndef:
		l.c[n-1] = p_else
	default:
		l.perrorf(true, "#else: no matching #ifdef/#ifndef")
	}
}

// endifDirective handles the #endif directive.
func (l *Scanner) endifDirective(p *Scanner) {
	if len(l.c) == 0 {
		l.perrorf(true, "#endif: no matching #ifdef/#ifndef")
	} else {
		l.c = l.c[:len(l.c)-1]
	}
}

// errorDirective handles the #error directive.
func (l *Scanner) errorDirective(p *Scanner) {
	var err string
	for s := range p.Tokens {
		err += s.Text + " "
	}
	if err != "" {
		err = err[:len(err)-1]
	}
	l.perrorf(false, "#error: %v", err)
}

// ifdefDirective handles the #ifdef directive.
func (l *Scanner) ifdefDirective(p *Scanner, cond bool) {
	t := <-p.Tokens
	if !isIdent(t.Text) {
		l.perrorf(true, "#ifdef: expected identifier, got %q", t.Text)
		return
	}

	switch {
	case l.frozen(1):
		l.c = append(l.c, p_ifndef)
	default:
		if _, found := l.macros[t.Text]; found == cond {
			l.c = append(l.c, p_ifdef)
		} else {
			l.c = append(l.c, p_ifndef)
		}
	}
}

// includeDirective handles the #include directive.
func (l *Scanner) includeDirective(p *Scanner, line string) {
	xname := ""
	name := ""
	paths := l.conf.IncludePaths

	switch t := <-p.Tokens; t.Type {
	case String:
		name = t.Text[1 : len(t.Text)-1]
		paths = append(paths, l.r.cwd)
		xname = strconv.Quote(name)
	case Lt:
		xpaths := []string{l.r.cwd}
		xpaths = append(xpaths, paths...)
		paths = xpaths
		name = line[t.Pos.Offset+1:]
		i := strings.IndexRune(name, '>')
		if i < 0 {
			l.errorf("missing terminating > character")
			return
		}
		name = name[:i]
		xname = "<" + name + ">"
	case Error:
		l.errorf("%v", t.Text)
		return
	default:
		l.errorf("#include: expected filename, got %q", t.Text)
		return
	}

	if name == "" {
		l.errorf("#include: empty filename")
		return
	}

	var fileErr error
	found := false
	for i := len(paths) - 1; i >= 0; i-- {
		filename := filepath.Join(paths[i], name)
		f, err := l.conf.Loader.Open(filename)
		if err == nil {
			if len(l.s)-1 >= l.conf.MaxIncludes {
				f.Close()
				l.errorf("#include: max number of %v includes reached", l.conf.MaxIncludes)
				return
			}
			r := newReader(filename, f, filepath.Dir(filename))
			l.s = append(l.s, r)
			l.r = r
			l.resetInput()
			found = true
			break
		}
		if !os.IsNotExist(err) {
			fileErr = err
		}
	}
	if fileErr != nil {
		l.errorf("#include: %v", fileErr)
		return
	}

	if !found {
		l.errorf("#include: could not find %v", xname)
		return
	}
}

// lineDirective handles #line directives.
func (l *Scanner) lineDirective(p *Scanner) {
	t := <-p.Tokens
	if t.Type != Number {
		l.errorf("#line: expected a non-negative integer, got %q", t.Text)
		return
	}

	line, err := strconv.Atoi(t.Text)
	if err != nil {
		l.errorf("#line: invalid line number: %v", err)
		return
	}
	l.r.Line = line + 1
	l.peekPos.Line = l.r.Line
}

// undefDirective handles #undef directives.
func (l *Scanner) undefDirective(p *Scanner) {
	t := <-p.Tokens
	if !isIdent(t.Text) {
		l.errorf("#undef expected an identifier, got %q", t.Text)
		return
	}
	delete(l.macros, t.Text)
}

// isIdent returns if a given input is a valid identifier
func isIdent(s string) bool {
	for i, r := range s {
		if i == 0 && !unicode.IsLetter(r) && r != '_' {
			return false
		} else if !unicode.IsLetter(r) && r != '_' && !unicode.IsDigit(r) {
			return false
		}
	}
	return true
}
