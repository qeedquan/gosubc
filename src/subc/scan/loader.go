package scan

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

// Reader is an interface that provides input
// to the scanner.
type Reader interface {
	io.ByteReader
	io.Closer
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

type nopCloser struct{ io.ByteReader }

func (nopCloser) Close() error { return nil }

// OpenFile returns a reader made from opening a file on the filesystem.
func OpenFile(name string) (Reader, error) {
	var l fileLoader
	return l.Open(name)
}
