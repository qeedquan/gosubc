package types

import (
	"bytes"
	"fmt"

	"subc/ast"
)

// ExprString returns a pretty printed version of an expression.
func ExprString(x ast.Expr) string {
	var buf bytes.Buffer
	WriteExpr(&buf, x)
	return buf.String()
}

// WriteExpr writes a pretty printed version of an expression.
func WriteExpr(buf *bytes.Buffer, x ast.Expr) {
	switch x := x.(type) {
	default:
		fmt.Fprintf(buf, "(%T)", x)

	case *ast.BadExpr:
		buf.WriteString("(bad expr)")

	case nil:

	case *ast.RecordDecl:
		var str string
		if x.Storage != nil {
			str += x.Storage.Text + " "
		}
		str += x.Record.Text + " " + x.Name.Name
		buf.WriteString(str)

	case *ast.BasicType:
		buf.WriteString(x.Type.Text + " " + ExprString(x.X))

	case *ast.VarDecl:
		var str string
		if x.Storage != nil {
			str += x.Storage.Text + " "
		}
		if x.Type != nil {
			str += ExprString(x.Type)
		}
		str += x.Name.Name
		if x.Value != nil {
			str += " = " + ExprString(x.Value)
		}
		buf.WriteString(str)

	case *ast.CondExpr:
		buf.WriteString(ExprString(x.Cond) + " ? " + ExprString(x.X) + " : " + ExprString(x.Y))

	case *ast.CastExpr:
		buf.WriteString("(" + ExprString(x.Type) + ")" + ExprString(x.X))

	case *ast.SizeofExpr:
		buf.WriteString("sizeof(" + ExprString(x.X) + ")")

	case *ast.Ident:
		buf.WriteString(x.Name)

	case *ast.BasicLit:
		buf.WriteString(x.Text)

	case *ast.StringLit:
		s := ""
		for _, y := range x.Lits {
			s += y.Text
		}
		buf.WriteString(s)

	case *ast.ParenExpr:
		buf.WriteByte('(')
		WriteExpr(buf, x.X)
		buf.WriteByte(')')

	case *ast.SelectorExpr:
		WriteExpr(buf, x.X)
		buf.WriteString(x.Op.Type.String())
		buf.WriteString(x.Sel.Name)

	case *ast.IndexExpr:
		WriteExpr(buf, x.X)
		buf.WriteByte('[')
		WriteExpr(buf, x.Index)
		buf.WriteByte(']')

	case *ast.CallExpr:
		WriteExpr(buf, x.Fun)
		buf.WriteByte('(')
		for i, arg := range x.Args {
			if i > 0 {
				buf.WriteString(", ")
			}
			WriteExpr(buf, arg)
		}
		buf.WriteByte(')')

	case *ast.StarExpr:
		buf.WriteByte('*')
		WriteExpr(buf, x.X)

	case *ast.UnaryExpr:
		buf.WriteString(x.Op.String())
		WriteExpr(buf, x.X)

	case *ast.BinaryExpr:
		WriteExpr(buf, x.X)
		buf.WriteByte(' ')
		buf.WriteString(x.Op.String())
		buf.WriteByte(' ')
		WriteExpr(buf, x.Y)

	case *ast.ArrayType:
		buf.WriteByte('[')
		if x.Len != nil {
			WriteExpr(buf, x.Len)
		}
		buf.WriteByte(']')

	case *ast.RecordType:
		buf.WriteString(x.Record.Text + " ")
		WriteExpr(buf, x.X)
		buf.WriteString(" " + x.Name.Name)

	case *ast.FuncDecl:
		buf.WriteString("func")
		writeSigExpr(buf, x)
	}
}

func writeSigExpr(buf *bytes.Buffer, sig *ast.FuncDecl) {
	buf.WriteByte('(')
	writeFieldList(buf, sig.Params, ", ")
	buf.WriteByte(')')

	buf.WriteByte(' ')
	WriteExpr(buf, sig.Result)
	return
}

func writeFieldList(buf *bytes.Buffer, fields []*ast.FieldDecl, sep string) {
	for i, f := range fields {
		if i > 0 {
			buf.WriteString(sep)
		}

		// field list names
		buf.WriteString(", ")
		if f.Name != nil {
			buf.WriteString(f.Name.Name)
		}

		WriteExpr(buf, f.Type)
	}
}
