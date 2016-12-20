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
	Pos     scanner.Position
	Text    string
	Warning bool
}

func (e ErrorMessage) Error() string {
	typ := "error"
	if e.Warning {
		typ = "warning"
	}
	return fmt.Sprintf("%v: %v: %v", e.Pos, typ, e.Text)
}

// ErrorList keeps a list of error messages
type ErrorList struct {
	Messages    []ErrorMessage
	NumWarnings int
	NumErrors   int
}

func (l *ErrorList) Add(msg ErrorMessage) {
	l.Messages = append(l.Messages, msg)
	if msg.Warning {
		l.NumWarnings++
	} else {
		l.NumErrors++
	}
}

func (l *ErrorList) Error() string {
	const maxErrors = 30

	var buf bytes.Buffer
	for i, e := range l.Messages {
		buf.WriteString(e.Error())
		buf.WriteString("\n")
		if i == maxErrors {
			fmt.Fprintf(&buf, "%v: suppressed %d more errors...\n", e.Pos, len(l.Messages)-i)
			break
		}
	}

	return strings.TrimSpace(buf.String())
}

// Err returns an error to satisfy the error interface.
func (l *ErrorList) Err() error {
	if len(l.Messages) == 0 {
		return nil
	}
	return l
}
