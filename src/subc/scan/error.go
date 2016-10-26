package scan

import (
	"bytes"
	"fmt"
	"strings"
	"text/scanner"
)

// ErrorMessage is a struct that contains
// the error message and whether or not if it is critical.
type ErrorMessage struct {
	Pos  scanner.Position
	Text string
	Soft bool
}

func (e ErrorMessage) Error() string {
	return fmt.Sprintf("%v: %v", e.Pos, e.Text)
}

// ErrorList keeps a list of error messages
type ErrorList []ErrorMessage

func (l ErrorList) Error() (err string) {
	const maxErrors = 30

	var buf bytes.Buffer
	for i, e := range l {
		buf.WriteString(e.Error())
		buf.WriteString("\n")
		if i == maxErrors {
			fmt.Fprintf(&buf, "%v: suppressed %d more errors...\n", e.Pos, len(l)-i)
			break
		}
	}

	return strings.TrimSpace(buf.String())
}

// Err returns an error to satisfy the error interface.
func (e ErrorList) Err() error {
	if len(e) == 0 {
		return nil
	}
	return e
}
