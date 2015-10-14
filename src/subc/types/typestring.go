package types

import (
	"bytes"
	"fmt"
)

// TypeString returns a pretty printed string of a type.
func TypeString(typ Type) string {
	var buf bytes.Buffer
	WriteType(&buf, typ)
	return buf.String()
}

// WriteType returns a pretty printed string of a type.
func WriteType(buf *bytes.Buffer, typ Type) {
	writeType(buf, typ, make([]Type, 8))
}

func writeType(buf *bytes.Buffer, typ Type, visited []Type) {
	for _, t := range visited {
		if t == typ {
			fmt.Fprintf(buf, "○%T", typ)
			return
		}
	}
	visited = append(visited, typ)

	switch t := typ.(type) {
	case nil:
		buf.WriteString("<nil>")

	case *Basic:
		buf.WriteString(t.name)

	case *Array:
		fmt.Fprintf(buf, "[%d]", t.len)
		writeType(buf, t.elem, visited)

	case *Enum:
		buf.WriteString("enum { ")
		for i, v := range t.values {
			buf.WriteString(v.name + " = " + v.val.String())
			if i+1 < len(t.values) {
				buf.WriteString(", ")
			}
		}
		buf.WriteString(" }")

	case *Record:
		rec := "struct"
		if t.union {
			rec = "union"
		}
		buf.WriteString(rec + " { ")
		for i, f := range t.fields {
			if i > 0 {
				buf.WriteString("; ")
			}

			buf.WriteString(f.name)
			buf.WriteByte(' ')

			writeType(buf, f.typ, visited)
		}
		buf.WriteString(" }")

	case *Pointer:
		buf.WriteByte('*')
		writeType(buf, t.base, visited)

	case *Tuple:
		writeTuple(buf, t, false, visited)

	case *Signature:
		buf.WriteString("func")
		writeSignature(buf, t, visited)

	case *Named:
		buf.WriteString(t.obj.name + " :: ")
		writeType(buf, t.obj.typ, visited)

	default:
		buf.WriteString(t.String())
	}
}

func writeTuple(buf *bytes.Buffer, tup *Tuple, variadic bool, visited []Type) {
	buf.WriteByte('(')
	if tup != nil {
		for i, v := range tup.vars {
			if i > 0 {
				buf.WriteString(", ")
			}
			if v.name != "" {
				buf.WriteString(v.name)
				buf.WriteByte(' ')
			}
			typ := v.typ
			if variadic && i == len(tup.vars)-1 {
				buf.WriteString("...")
			}
			writeType(buf, typ, visited)
		}
	}
	buf.WriteByte(')')
}

// WriteSignature writes the representation of the signature sig to buf,
func WriteSignature(buf *bytes.Buffer, sig *Signature) {
	writeSignature(buf, sig, make([]Type, 8))
}

func writeSignature(buf *bytes.Buffer, sig *Signature, visited []Type) {
	writeTuple(buf, sig.params, sig.variadic, visited)
	buf.WriteByte(' ')
	writeType(buf, sig.result.typ, visited)

}
