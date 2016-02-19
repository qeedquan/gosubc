package arch

import (
	"fmt"
	"io"

	"subc/constant"
	"subc/types"
)

// LV is a structure that an emitter uses as arguments
// to generate code, it mainly contains data structure for variables
// and their resulting types after an expression has been done on them.
type LV struct {
	Ident       bool           // if the variable is an identifier
	Addressable bool           // if the variable is addressable
	Storage     types.Storage  // the storage type of the variable
	Type        types.Type     // type of the variable
	Btype       types.Type     // for binary expressions where it can implicitly cast the result  such as pointer - pointer becomes an integer
	Name        string         // name of the variable if any
	Size        int            // size of the variable, for sizeof
	Addr        int            // the location of the variable, such as the offset of where it is on the stack
	Value       constant.Value // if the variable is a constant, the constant will be stored here
}

// prefixes used when generating labels, functions get prefix while labels get a lprefix.
const (
	prefix  = 'C'
	lprefix = 'L'
)

// synth is a code synthesizer, used to generate a little bit better code than a stack machine
// by queuing up results into an accumulator register and not spilling registers every single time.
type synth struct {
	Type  int    // addressing mode
	Cmp   int    // if it is a comparison
	Bool  int    // if it a bool operation
	Value int    // value of the constant
	Name  string // name of the variable
}

// Emitter is uses to emit code.
type Emitter struct {
	types.Sizes
	W io.Writer
	B Backend

	Q       synth
	Retlab  int
	Acc     bool
	textSeg bool
	labelID int
}

// Addressing modes for the code synthesizer.
const (
	Empty = iota
	AddrAuto
	AddrStatic
	AddrGlobal
	AddrLabel
	Literal
	AutoByte
	AutoWord
	StaticByte
	StaticWord
	GlobalByte
	GlobalWord
)

// Comparison operations.
const (
	Cnone = iota
	Equal
	NotEqual
	Less
	Greater
	LessEqual
	GreaterEqual
	Below
	Above
	BelowEqual
	AboveEqual
)

// Boolean operations.
const (
	Bnone = iota
	LogNot
	Normalize
)

// Clear resets the accumulator.
func (c *Emitter) Clear(q bool) {
	c.Acc = false
	if q {
		c.Q.Type = Empty
		c.Q.Cmp = Cnone
		c.Q.Bool = Bnone
	}
}

// Load enables the accumulator, meaning it tells
// the later code generation it must spills if it wants
// to mess with the accumulator.
func (c *Emitter) Load() {
	c.Acc = true
}

// Label generates a new label ID for labels.
func (c *Emitter) Label() int {
	c.labelID++
	return c.labelID
}

// Spill pushes the registers in use onto the stack.
func (c *Emitter) Spill() {
	if c.Acc {
		c.Text()
		c.B.Push()
	}
}

// Raw emits raw text.
func (c *Emitter) Raw(s string) {
	fmt.Fprint(c.W, s)
}

// Gen emits a line of assembly with an instruction.
func (c *Emitter) Gen(s string) {
	fmt.Fprintf(c.W, "\t%s\n", s)
}

// Ngen emits a line of assembly with instruction and one or zero argument.
func (c *Emitter) Ngen(s string, args ...interface{}) {
	fmt.Fprint(c.W, "\t")
	fmt.Fprintf(c.W, s, args...)
	fmt.Fprint(c.W, "\n")
}

// Ngen2 emits a line of assembly with instruction and two arguments.
func (c *Emitter) Ngen2(s, inst string, n, a int) {
	fmt.Fprint(c.W, "\t")
	fmt.Fprintf(c.W, s, inst, n, a)
	fmt.Fprintf(c.W, "\n")
}

// Lgen emits an instruction that acts on a label.
func (c *Emitter) Lgen(s, inst string, n int) {
	fmt.Fprint(c.W, "\t")
	fmt.Fprintf(c.W, s, inst, lprefix, n)
	fmt.Fprint(c.W, "\n")
}

// Lgen2 emits an instruction with one argument that acts on a label.
func (c *Emitter) Lgen2(s string, v1, v2 int) {
	fmt.Fprint(c.W, "\t")
	fmt.Fprintf(c.W, s, v1, lprefix, v2)
	fmt.Fprint(c.W, "\n")
}

// Sgen emits a prefix and instruction with one argument.
func (c *Emitter) Sgen(s, inst, s2 string) {
	fmt.Fprint(c.W, "\t")
	fmt.Fprintf(c.W, s, inst, s2)
	fmt.Fprint(c.W, "\n")
}

// Sgen2 emits a prefix and instruction with two arguments.
func (c *Emitter) Sgen2(s, inst string, v int, s2 string) {
	fmt.Fprintf(c.W, "\t")
	fmt.Fprintf(c.W, s, inst, v, s2)
	fmt.Fprintf(c.W, "\n")
}

// Lab emits a label.
func (c *Emitter) Lab(id int) {
	fmt.Fprintf(c.W, "%c%d:\n", lprefix, id)
}

// Gsym returns a label string with the code prefix for string s.
func (c *Emitter) Gsym(s string) string {
	return string(prefix) + s
}

// Prelude emits code for the prelude.
func (c *Emitter) Prelude() {
	c.B.Prelude()
	c.textSeg = false
	c.Text()
}

// Postlude emits code for the postlude.
func (c *Emitter) Postlude() {
	c.B.Postlude()
}

// Data emits code to switch to the data segment.
func (c *Emitter) Data() {
	if c.textSeg {
		c.B.Data()
	}
	c.textSeg = false
}

// Text emits code to switch to the text segment.
func (c *Emitter) Text() {
	if !c.textSeg {
		c.B.Text()
	}
	c.textSeg = true
}

// Name emits a code label for name.
func (c *Emitter) Name(name string) {
	c.Raw(c.Gsym(name))
	c.Raw(":")
}

// Public emits code for defining a global symbol,
// used for global identifiers.
func (c *Emitter) Public(name string) {
	c.B.Public(c.Gsym(name))
}

// Jump emits code to jump to a destination.
func (c *Emitter) Jump(dest int) {
	c.Text()
	c.Commit()
	c.B.Jump(dest)
}

// Commit flushes the code synthesizer to load
// and spill the registers to memory.
func (c *Emitter) Commit() {
	if c.Q.Cmp != Cnone {
		c.commitCmp()
		return
	}
	if c.Q.Bool != Bnone {
		c.commitBool()
		return
	}

	if c.Q.Type == Empty {
		return
	}

	c.Spill()
	switch c.Q.Type {
	case AddrAuto:
		c.B.Ldla(c.Q.Value)

	case AddrStatic:
		c.B.Ldsa(c.Q.Value)

	case AddrGlobal:
		c.B.Ldga(c.Gsym(c.Q.Name))

	case AddrLabel:
		c.B.Ldlab(c.Q.Value)

	case Literal:
		c.B.Lit(c.Q.Value)

	case AutoByte:
		c.B.Clear()
		c.B.Ldlb(c.Q.Value)

	case AutoWord:
		c.B.Ldlw(c.Q.Value)

	case StaticByte:
		c.B.Clear()
		c.B.Ldsb(c.Q.Value)

	case StaticWord:
		c.B.Ldsw(c.Q.Value)

	case GlobalByte:
		c.B.Clear()
		c.B.Ldgb(c.Gsym(c.Q.Name))

	case GlobalWord:
		c.B.Ldgw(c.Gsym(c.Q.Name))

	default:
		panic(fmt.Sprintf("unknown Q-Type: %v", c.Q.Type))
	}
	c.Load()
	c.Q.Type = Empty
}

// QueueCmp queues a comparison operator.
func (c *Emitter) QueueCmp(op int) {
	if c.Q.Bool != Bnone {
		c.commitBool()
	}
	if c.Q.Cmp != Cnone {
		c.commitCmp()
	}
	c.Q.Cmp = op
}

// Queue queues a value into the code synthesizer.
func (c *Emitter) Queue(typ, value int, name string) {
	c.Commit()
	c.Q.Type = typ
	c.Q.Value = value
	if name != "" {
		c.Q.Name = name
	}
	c.Q.Cmp = Cnone
}

// Addr emits code for queuing up addresses.
func (c *Emitter) Addr(lv LV) {
	c.Text()

	switch lv.Storage {
	case types.Auto:
		c.Queue(AddrAuto, lv.Addr, "")
	case types.LocalStatic:
		c.Queue(AddrStatic, lv.Addr, "")
	default:
		c.Queue(AddrGlobal, 0, lv.Name)
	}
}

// Ldlab queues an address label with id.
func (c *Emitter) Ldlab(id int) {
	c.Text()
	c.Queue(AddrLabel, id, "")
}

// Lit queues a literal.
func (c *Emitter) Lit(v int) {
	c.Text()
	c.Queue(Literal, v, "")
}

// commitCmp flushes a comparison operator.
func (c *Emitter) commitCmp() {
	switch c.Q.Cmp {
	case Equal:
		c.B.Eq()
	case NotEqual:
		c.B.Ne()
	case Less:
		c.B.Lt()
	case Greater:
		c.B.Gt()
	case LessEqual:
		c.B.Le()
	case GreaterEqual:
		c.B.Ge()
	case Below:
		c.B.Ult()
	case Above:
		c.B.Ugt()
	case BelowEqual:
		c.B.Ule()
	case AboveEqual:
		c.B.Uge()
	}
	c.Q.Cmp = Cnone
}

// commitBool flushes a boolean operator.
func (c *Emitter) commitBool() {
	switch c.Q.Bool {
	case LogNot:
		c.B.LogNot()
	case Normalize:
		c.B.Bool()
	}
	c.Q.Bool = Bnone
}

// QueueBool queues a boolean operation.
func (c *Emitter) QueueBool(op int) {
	c.Commit()
	c.Q.Bool = op
}

// Exit emits code for exit.
func (c *Emitter) Exit() {
	c.Text()
	c.B.Exit()
}

// Push emits code for pushing to the stack after
// flushing the code synthesizer.
func (c *Emitter) Push() {
	c.Text()
	c.Commit()
	c.B.Push()
}

// PushLit pushes a literal to the stack after
// flushing the code synthesizer.
func (c *Emitter) PushLit(n int) {
	c.Text()
	c.Commit()
	c.Spill()
	c.B.PushLit(n)
}

// Stack emits a stack grows if n is not zero.
func (c *Emitter) Stack(n int) {
	if n != 0 {
		c.Text()
		c.B.Stack(n)
	}
}

// LocInit emits code for initializing words with pair (addr, value)
func (c *Emitter) LocInit(localInits [][2]int) {
	c.Text()
	for _, l := range localInits {
		c.B.Initlw(l[1], l[0])
	}
}

// AlignText emits code for aligning the text segment.
func (c *Emitter) AlignText() {
	c.B.Align()
}

// Defb emits code for byte declaration.
func (c *Emitter) Defb(v int) {
	c.Data()
	c.B.Defb(v)
}

// Defp emits code for pointer declaration.
func (c *Emitter) Defp(v int) {
	c.Data()
	c.B.Defp(v)
}

// Defw emits code for word declaration.
func (c *Emitter) Defw(v int) {
	c.Data()
	c.B.Defw(v)
}

// Entry emits code for entry.
func (c *Emitter) Entry() {
	c.Text()
	c.B.Entry()
}

// Branch emits code for branching.
func (c *Emitter) Branch(dest int, inv bool) {
	f := [...][2]func(int){
		Equal:        {c.B.BrNe, c.B.BrEq},
		NotEqual:     {c.B.BrEq, c.B.BrNe},
		Less:         {c.B.BrGe, c.B.BrLt},
		Greater:      {c.B.BrLe, c.B.BrGt},
		LessEqual:    {c.B.BrGt, c.B.BrLe},
		GreaterEqual: {c.B.BrLt, c.B.BrGe},
		Below:        {c.B.BrUge, c.B.BrUlt},
		Above:        {c.B.BrUle, c.B.BrUgt},
		BelowEqual:   {c.B.BrUgt, c.B.BrUle},
		AboveEqual:   {c.B.BrUlt, c.B.BrUge},
	}
	if inv {
		f[c.Q.Cmp][0](dest)
	} else {
		f[c.Q.Cmp][1](dest)
	}

	c.Q.Cmp = Cnone
}

// LogBr emits code for logical branching.
func (c *Emitter) LogBr(dest int, inv bool) {
	switch c.Q.Bool {
	case Normalize:
		inv = !inv
		fallthrough
	case LogNot:
		if inv {
			c.B.BrTrue(dest)
		} else {
			c.B.BrFalse(dest)
		}
	}
	c.Q.Bool = Bnone
}

// BrFalse emits code for branching.
func (c *Emitter) BrFalse(dest int) {
	c.Text()
	if c.Q.Cmp != Cnone {
		c.Branch(dest, false)
		return
	}
	if c.Q.Bool != Bnone {
		c.LogBr(dest, true)
		return
	}
	c.Commit()
	c.B.BrFalse(dest)
}

// BrTrue emits code for branching.
func (c *Emitter) BrTrue(dest int) {
	c.Text()
	if c.Q.Cmp != Cnone {
		c.Branch(dest, true)
		return
	}
	if c.Q.Bool != Bnone {
		c.LogBr(dest, false)
		return
	}
	c.Commit()
	c.B.BrTrue(dest)
}

// Mul emits for code for the multiplication operator.
func (c *Emitter) Mul() {
	c.Text()
	c.B.Load2()
	c.B.Mul()
}

// And emits code for the bitwise and operator.
func (c *Emitter) And() {
	c.Text()
	c.B.And()
}

// Or emits code for the bitwise or operator.
func (c *Emitter) Or() {
	c.Text()
	c.B.Or()
}

// Xor emits code for the bitwise xor operator.
func (c *Emitter) Xor() {
	c.Text()
	c.B.Xor()
}

// Shl emits code for left shifting.
func (c *Emitter) Shl(swapped bool) {
	c.Text()
	if c.B.Load2() || !swapped {
		c.B.Swap()
	}
	c.B.Shl()
}

// Shr emits code for right shifting.
func (c *Emitter) Shr(swapped bool) {
	c.Text()
	if c.B.Load2() || !swapped {
		c.B.Swap()
	}
	c.B.Shr()
}

// Div emits code for the division operator.
func (c *Emitter) Div(swapped bool) {
	c.Text()
	if c.B.Load2() || !swapped {
		c.B.Swap()
	}
	c.B.Div()
}

// Mod emits code for the modulus operator.
func (c *Emitter) Mod(swapped bool) {
	c.Text()
	if c.B.Load2() || !swapped {
		c.B.Swap()
	}
	c.B.Mod()
}

// Call emits code to call a function with a name
func (c *Emitter) Call(lv LV) {
	c.Text()
	c.Commit()
	c.B.Call(c.Gsym(lv.Name))
	c.Load()
}

// Calr emits code to call a function pointer.
func (c *Emitter) Calr(lv LV) {
	c.Text()
	c.Commit()
	c.B.Calr()
	c.Load()
}

// Store emits code to store a value.
func (c *Emitter) Store(lv LV) {
	c.Text()

	typ := lv.Type.Underlying()
	switch {
	case !lv.Ident:
		c.B.PopPtr()
		if typ == types.Typ[types.Char] {
			c.B.Storib()
		} else {
			c.B.Storiw()
		}

	case lv.Storage == types.Auto:
		if typ == types.Typ[types.Char] {
			c.B.Storlb(lv.Addr)
		} else {
			c.B.Storlw(lv.Addr)
		}

	case lv.Storage == types.LocalStatic:
		if typ == types.Typ[types.Char] {
			c.B.Storsb(lv.Addr)
		} else {
			c.B.Storsw(lv.Addr)
		}

	default:
		if typ == types.Typ[types.Char] {
			c.B.Storgb(c.Gsym(lv.Name))
		} else {
			c.B.Storgw(c.Gsym(lv.Name))
		}
	}
}

// Bool emits code for a bool.
func (c *Emitter) Bool() {
	c.QueueBool(Normalize)
}

// LogNot emits code for a logical not.
func (c *Emitter) LogNot() {
	c.QueueBool(LogNot)
}

// Neg emits code for switching a sign.
func (c *Emitter) Neg() {
	c.Text()
	c.Commit()
	c.B.Neg()
}

// Not emits code for a negation.
func (c *Emitter) Not() {
	c.Text()
	c.Commit()
	c.B.Not()
}

// Scale emits code to scale indices for pointer arithmetic and array accesses.
func (c *Emitter) Scale() {
	c.Text()
	c.Commit()
	c.B.Scale()
}

// incPtr emits code to increment a pointer.
func (c *Emitter) incPtr(lv LV, inc, pre bool) {
	c.Text()
	c.Commit()
	if !lv.Ident && !pre {
		c.B.Ldinc()
	}
	if !pre {
		c.Rval(lv)
		c.Commit()
	}

	size := c.Sizeof(deref(lv.Type))

	switch {
	case !lv.Ident:
		switch {
		case pre && inc:
			c.B.Inc1pi(size)
		case pre && !inc:
			c.B.Dec1pi(size)
		case !pre && inc:
			c.B.Inc2pi(size)
		case !pre && !inc:
			c.B.Dec2pi(size)
		}

	case lv.Storage == types.Auto:
		if inc {
			c.B.Incpl(lv.Addr, size)
		} else {
			c.B.Decpl(lv.Addr, size)
		}

	case lv.Storage == types.LocalStatic:
		if inc {
			c.B.Incps(lv.Addr, size)
		} else {
			c.B.Decps(lv.Addr, size)
		}

	default:
		if inc {
			c.B.Incpg(c.Gsym(lv.Name), size)
		} else {
			c.B.Decpg(c.Gsym(lv.Name), size)
		}
	}

	if pre {
		c.Rval(lv)
	}
}

// Inc emits code to increment a variable.
func (c *Emitter) Inc(lv LV, inc, pre bool) {
	c.Text()

	if needScale(lv.Type) {
		c.incPtr(lv, inc, pre)
		return
	}

	isChar := lv.Type == types.Typ[types.Char]
	c.Commit()
	if !lv.Ident && !pre {
		c.B.Ldinc()
	}
	if !pre {
		c.Rval(lv)
		c.Commit()
	}

	switch {
	case !lv.Ident:
		switch {
		case pre && inc:
			if isChar {
				c.B.Inc1ib()
			} else {
				c.B.Inc1iw()
			}

		case pre && !inc:
			if isChar {
				c.B.Dec1ib()
			} else {
				c.B.Dec1iw()
			}

		case !pre && inc:
			if isChar {
				c.B.Inc2ib()
			} else {
				c.B.Inc2iw()
			}

		case !pre && !inc:
			if isChar {
				c.B.Dec2ib()
			} else {
				c.B.Dec2iw()
			}
		}

	case lv.Storage == types.Auto:
		switch {
		case inc && isChar:
			c.B.Inclb(lv.Addr)
		case inc && !isChar:
			c.B.Inclw(lv.Addr)
		case !inc && isChar:
			c.B.Declb(lv.Addr)
		case !inc && !isChar:
			c.B.Declw(lv.Addr)
		}

	case lv.Storage == types.LocalStatic:
		switch {
		case inc && isChar:
			c.B.Incsb(lv.Addr)
		case inc && !isChar:
			c.B.Incsw(lv.Addr)
		case !inc && isChar:
			c.B.Decsb(lv.Addr)
		case !inc && !isChar:
			c.B.Decsw(lv.Addr)
		}

	default:
		switch {
		case inc && isChar:
			c.B.Incgb(c.Gsym(lv.Name))
		case inc && !isChar:
			c.B.Incgw(c.Gsym(lv.Name))
		case !inc && isChar:
			c.B.Decgb(c.Gsym(lv.Name))
		case !inc && !isChar:
			c.B.Decgw(c.Gsym(lv.Name))
		}
	}

	if pre {
		c.Rval(lv)
	}
}

// needScale returns if the variable needs scaling for accessing its values through indices.
func needScale(typ types.Type) bool {
	ptr, ok := typ.(*types.Pointer)
	if !ok {
		return false
	}
	elem := ptr.Elem()
	if elem == types.Typ[types.Char] || elem == types.Typ[types.Void] {
		return false
	}
	return true
}

// Add emits code for addition.
func (c *Emitter) Add(p1, p2 types.Type, swapped bool) types.Type {
	c.Text()
	if c.B.Load2() || !swapped {
		p1, p2 = p2, p1
	}

	var rp types.Type = types.Typ[types.Int]
	if isPointer(p1) {
		if needScale(p1) {
			if p := deref(p1); isRecord(p) {
				c.B.Scale2By(c.Sizeof(p))
			} else {
				c.B.Scale2()
			}
		}
		rp = p1
	} else if isPointer(p2) {
		if needScale(p2) {
			if p := deref(p2); isRecord(p) {
				c.B.ScaleBy(c.Sizeof(p))
			} else {
				c.B.Scale()
			}
		}
		rp = p2
	}

	c.B.Add()
	return rp
}

// deref dereferences a pointer.
func deref(typ types.Type) types.Type {
	return typ.(*types.Pointer).Elem().Underlying()
}

// isPointer returns if type is a pointer.
func isPointer(typ types.Type) bool {
	_, ok := typ.(*types.Pointer)
	return ok
}

// isRecord returns if a type is a record.
func isRecord(typ types.Type) bool {
	_, ok := typ.(*types.Record)
	return ok
}

// Ind emits code to do an indirection.
func (c *Emitter) Ind(lv LV) {
	c.Text()
	c.Commit()
	if lv.Type == types.Typ[types.Char] {
		c.B.Indb()
	} else {
		c.B.Indw()
	}
}

// ScaleBy emits code to scale the indices.
func (c *Emitter) ScaleBy(v int) {
	c.Text()
	c.Commit()
	c.B.ScaleBy(v)
}

// Rval emits code to load an address.
func (c *Emitter) Rval(lv LV) {
	c.Text()

	typ := lv.Type
	switch {
	case !lv.Ident:
		c.Ind(lv)

	case lv.Storage == types.Auto:
		if typ == types.Typ[types.Char] {
			c.Queue(AutoByte, lv.Addr, "")
		} else {
			c.Queue(AutoWord, lv.Addr, "")
		}

	case lv.Storage == types.LocalStatic:
		if typ == types.Typ[types.Char] {
			c.Queue(StaticByte, lv.Addr, "")
		} else {
			c.Queue(StaticWord, lv.Addr, "")
		}

	default:
		if typ == types.Typ[types.Char] {
			c.Queue(GlobalByte, 0, lv.Name)
		} else {
			c.Queue(GlobalWord, 0, lv.Name)
		}
	}
}

// Align emits code to align to an alignment starting at k.
func (c *Emitter) Align(k, align int) {
	c.Data()
	for ; k%align != 0; k++ {
		c.B.Defb(0)
	}
}

// Defs emits code for storing a string on a data segment.
func (c *Emitter) Defs(s string) {
	c.Data()
	for i := 0; i < len(s); i++ {
		switch r := s[i]; {
		case 'a' <= r && r <= 'z' || 'A' <= r && r <= 'Z' || '0' <= r && r <= '9':
			c.B.Defc(int(s[i]))
		default:
			c.B.Defb(int(s[i]))
		}
	}
}

// Sub emits code for subtraction.
func (c *Emitter) Sub(p1, p2 types.Type, swapped bool) types.Type {
	c.Text()
	if c.B.Load2() || !swapped {
		c.B.Swap()
	}

	var rp types.Type = types.Typ[types.Int]
	if isPointer(p1) && !isPointer(p2) {
		if needScale(p1) {
			if p := deref(p1); isRecord(p) {
				c.B.Scale2By(c.Sizeof(p))
			} else {
				c.B.Scale2()
			}
		}
		rp = p1
	}

	c.B.Sub()

	if needScale(p1) && needScale(p2) {
		p := deref(p1)
		if isRecord(p) {
			c.B.UnscaleBy(c.Sizeof(p))
		} else {
			c.B.Unscale()
		}
	}

	return rp
}

// Switch emits code for a switch statement.
func (c *Emitter) Switch(vals, labs []int, dflt int) {
	ltbl := c.Label()
	c.Text()
	c.B.LdSwtch(ltbl)
	c.B.CalSwtch()
	c.Lab(ltbl)
	c.B.Defw(len(vals))
	for i := range vals {
		c.B.Case(vals[i], labs[i])
	}
	c.B.Defl(dflt)
}

// BSS emits code to store things on the .bss
func (c *Emitter) BSS(name string, length int, static bool) {
	intSize := c.Int()
	c.Data()
	if static {
		c.B.Lbss(name, (length+intSize-1)/intSize*intSize)
	} else {
		c.B.Gbss(name, (length+intSize-1)/intSize*intSize)
	}
}

// Labname returns a label name with an lprefix.
func (c *Emitter) Labname(id int) string {
	return fmt.Sprintf("%c%d", lprefix, id)
}

// Int returns the size of an integer.
func (c *Emitter) Int() int {
	return c.Sizeof(types.Typ[types.Int])
}

// Pointer returns the size of a pointer.
func (c *Emitter) Pointer() int {
	return c.Sizeof(types.NewPointer(types.Typ[types.Int], nil))
}

// Sizeof returns the sizze of a type.
func (c *Emitter) Sizeof(T types.Type) int {
	return int(c.Sizes.Sizeof(T))
}
