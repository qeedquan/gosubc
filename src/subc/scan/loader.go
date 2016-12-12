package scan

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
	"text/scanner"
)

// Reader is an interface that provides input
// to the scanner.
type Reader interface {
	io.ByteReader
	io.Closer
	Pos() scanner.Position
	LockedPos() bool
}

// Loader is an interface for opening files that are used
// by the #include mechanism.
type Loader interface {
	Open(name string) (Reader, error)
}

// fileLoader is a loader that loads from the filesystem.
type fileLoader struct{}

type file struct {
	*bufio.Reader
	*os.File
}

func (f *file) Pos() scanner.Position {
	return scanner.Position{
		Filename: f.Name(),
		Line:     1,
		Column:   1,
	}
}

func (f *file) LockedPos() bool { return false }

func (fileLoader) Open(name string) (Reader, error) {
	f, err := os.Open(name)
	if err != nil {
		return nil, err
	}

	fi, err := f.Stat()
	if err == nil && fi.IsDir() {
		f.Close()
		return nil, fmt.Errorf("%v: is a directory", name)
	}

	return &file{bufio.NewReader(f), f}, nil
}

type stringReader struct {
	io.ByteReader
	pos       scanner.Position
	lockedPos bool
}

func (s stringReader) Pos() scanner.Position { return s.pos }
func (s stringReader) LockedPos() bool       { return s.lockedPos }
func (stringReader) Close() error            { return nil }

// StringReader returns a reader out of a string.
func StringReader(pos scanner.Position, src string, lockedPos bool) Reader {
	if !pos.IsValid() {
		pos = scanner.Position{
			Line:   1,
			Column: 1,
		}
	}
	return stringReader{strings.NewReader(src), pos, lockedPos}
}

// OpenFile returns a reader made from opening a file on the filesystem.
func OpenFile(name string) (Reader, error) {
	var l fileLoader
	return l.Open(name)
}
