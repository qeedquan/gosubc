package ast

import (
	"fmt"
	"io"
	"os"
	"reflect"
)

// FieldFilter is a function used to filter out nodes.
type FieldFilter func(name string, value reflect.Value) bool

// NotNilFilter filters out nil nodes.
func NotNilFilter(_ string, v reflect.Value) bool {
	switch v.Kind() {
	case reflect.Chan, reflect.Func, reflect.Interface, reflect.Map, reflect.Ptr, reflect.Slice:
		return !v.IsNil()
	}
	return true
}

// Print prints an AST tree given a node.
func Print(x interface{}) (err error) {
	p := &printer{
		output: os.Stdout,
		filter: NotNilFilter,
	}
	if x == nil {
		p.printf("nil\n")
		return
	}

	defer func() {
		if e := recover(); e != nil {
			err = e.(localError).err
		}
	}()

	p.print(reflect.ValueOf(x))
	p.printf("\n")

	return
}

type printer struct {
	output io.Writer
	indent int
	line   int
	last   byte
	filter FieldFilter
}

var indent = []byte(".  ")

func (p *printer) Write(data []byte) (n int, err error) {
	var m int
	for i, b := range data {
		if b == '\n' {
			m, err = p.output.Write(data[n : i+1])
			n += m
			if err != nil {
				return
			}
			p.line++
		} else if p.last == '\n' {
			_, err = fmt.Fprintf(p.output, "%6d  ", p.line)
			if err != nil {
				return
			}
			for j := p.indent; j > 0; j-- {
				_, err = p.output.Write(indent)
				if err != nil {
					return
				}
			}
		}
		p.last = b
	}
	if len(data) > n {
		m, err = p.output.Write(data[n:])
		n += m
	}
	return
}

type localError struct {
	err error
}

func (p *printer) printf(format string, args ...interface{}) {
	if _, err := fmt.Fprintf(p, format, args...); err != nil {
		panic(localError{err})
	}
}

func (p *printer) print(x reflect.Value) {
	switch x.Kind() {
	case reflect.Interface:
		p.print(x.Elem())

	case reflect.Map:
		p.printf("%s (len = %d) {", x.Type(), x.Len())
		if x.Len() > 0 {
			p.indent++
			p.printf("\n")
			for _, key := range x.MapKeys() {
				p.print(key)
				p.printf(": ")
				p.print(x.MapIndex(key))
				p.printf("\n")
			}
			p.indent--
		}
		p.printf("}")

	case reflect.Ptr:
		p.printf("*")
		p.print(x.Elem())

	case reflect.Array:
		p.printf("%s {", x.Type())
		if x.Len() > 0 {
			p.indent++
			p.printf("\n")
			for i, n := 0, x.Len(); i < n; i++ {
				p.printf("%d: ", i)
				p.print(x.Index(i))
				p.printf("\n")
			}
			p.indent--
		}
		p.printf("}")

	case reflect.Slice:
		if s, ok := x.Interface().([]byte); ok {
			p.printf("%#q", s)
			return
		}
		p.printf("%s (len = %d) {", x.Type(), x.Len())
		if x.Len() > 0 {
			p.indent++
			p.printf("\n")
			for i, n := 0, x.Len(); i < n; i++ {
				p.printf("%d: ", i)
				p.print(x.Index(i))
				p.printf("\n")
			}
			p.indent--
		}
		p.printf("}")

	case reflect.Struct:
		t := x.Type()
		p.printf("%s {", t)
		p.indent++
		first := true
		for i, n := 0, t.NumField(); i < n; i++ {
			name := t.Field(i).Name
			value := x.Field(i)
			if p.filter == nil || p.filter(name, value) {
				if first {
					p.printf("\n")
					first = false
				}
				p.printf("%s: ", name)
				p.print(value)
				p.printf("\n")
			}
		}
		p.indent--
		p.printf("}")

	default:
		v := x.Interface()
		switch v := v.(type) {
		case string:
			p.printf("%q", v)
			return
		}
		p.printf("%v", v)
	}
}
