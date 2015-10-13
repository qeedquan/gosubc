// Package darwinamd64 contains code to generate a x86_64 architecture
// that is running on darwin. The difference between this package and
// amd64 is that darwin loads things relative to the rip register.
package darwinamd64

import (
	"fmt"
	"io"

	"subc/compile/arch"
	"subc/types"
)

type Emitter struct {
	*arch.Emitter
}

func NewEmitter(w io.Writer) *arch.Emitter {
	c := &Emitter{}
	c.Emitter = &arch.Emitter{W: w, B: c, Sizes: &types.StdSizes{8, 8}}
	return c.Emitter
}

func (c *Emitter) Data()           { c.Gen(".data") }
func (c *Emitter) Text()           { c.Gen(".text") }
func (c *Emitter) Prelude()        {}
func (c *Emitter) Postlude()       {}
func (c *Emitter) Public(s string) { c.Raw("\t.globl\t" + s + "\n") }

func (c *Emitter) Synth(op string) {
	n := c.Q.Value
	s := c.Gsym(c.Q.Name)
	switch c.Q.Type {
	case arch.AddrAuto:
		c.Ngen("%s\t%d(%%rbp), %%rcx", "leaq", n)
		c.Sgen("%s\t%s, %%rax", op, "%rcx")

	case arch.AddrStatic:
		c.Lgen("%s\t%c%d(%%rip),%%rax", op, n)

	case arch.AddrGlobal:
		c.Sgen("%s\t%s(%%rip),%%rax", op, s)

	case arch.AddrLabel:
		c.Lgen("%s\t%c%d(%%rip),%%rax", op, n)

	case arch.Literal:
		c.Ngen("%s\t$%d, %%rax", op, n)

	case arch.AutoWord:
		c.Ngen("%s\t%d(%%rbp), %%rax", op, n)

	case arch.StaticWord:
		c.Lgen("%s\t%c%d(%%rip),%%rax", op, n)

	case arch.GlobalWord:
		c.Sgen("%s\t%s(%%rip),%%rax", op, s)

	case arch.AutoByte:
		fallthrough
	case arch.StaticByte:
		fallthrough
	case arch.GlobalByte:
		c.Load2()
		c.Ngen("%s\t%%rcx, %%rax", op)

	case arch.Empty:
		c.Pop2()
		c.Sgen("%s\t%s, %%rax", op, "%rcx")

	default:
		panic(fmt.Sprint("bad type in synth: ", c.Q.Type))
	}
	c.Q.Type = arch.Empty
}

func (c *Emitter) Load2() bool {
	op := "movq"
	opb := "movb"
	n := c.Q.Value
	s := c.Gsym(c.Q.Name)
	switch c.Q.Type {
	case arch.AddrAuto:
		c.Ngen("%s\t%d(%%rbp), %%rcx", "leaq", n)

	case arch.AddrStatic:
		c.Lgen("%s\t%c%d(%%rip),%%rcx", op, n)

	case arch.AddrGlobal:
		c.Sgen("%s\t%s(%%rip),%%rcx", op, s)

	case arch.AddrLabel:
		c.Lgen("%s\t%c%d(%%rip),%%rcx", op, n)

	case arch.Literal:
		c.Ngen("%s\t$%d, %%rcx", op, n)

	case arch.AutoByte:
		c.Clear2()
		c.Ngen("%s\t%d(%%rbp), %%cl", opb, n)

	case arch.AutoWord:
		c.Ngen("%s\t%d(%%rbp), %%rcx", op, n)

	case arch.StaticByte:
		c.Clear2()
		c.Lgen("%s\t%c%d(%%rip),%%cl", opb, n)

	case arch.StaticWord:
		c.Lgen("%s\t%c%d(%%rip),%%rcx", op, n)

	case arch.GlobalByte:
		c.Clear2()
		c.Sgen("%s\t%s(%%rip),%%cl", opb, s)

	case arch.GlobalWord:
		c.Sgen("%s\t%s(%%rip),%%rcx", op, s)

	case arch.Empty:
		c.Pop2()

	default:
		panic(fmt.Sprint("bad type in load:", c.Q.Type))
	}

	q := c.Q.Type
	c.Q.Type = arch.Empty
	return q == arch.Empty
}

func (c *Emitter) Lit(v int)     { c.Ngen("%s\t$%d, %%rax", "movq", v) }
func (c *Emitter) Clear()        { c.Gen("xorq\t%rax, %rax") }
func (c *Emitter) Clear2()       { c.Gen("xorq\t%rcx, %rcx") }
func (c *Emitter) Ldgb(s string) { c.Sgen("%s\t%s(%%rip),%%al", "movb", s) }
func (c *Emitter) Ldgw(s string) { c.Sgen("%s\t%s(%%rip),%%rax", "movq", s) }
func (c *Emitter) Ldlb(n int)    { c.Ngen("%s\t%d(%%rbp), %%al", "movb", n) }
func (c *Emitter) Ldlw(n int)    { c.Ngen("%s\t%d(%%rbp), %%rax", "movq", n) }
func (c *Emitter) Ldsb(n int)    { c.Lgen("%s\t%c%d(%%rip),%%al", "movb", n) }
func (c *Emitter) Ldsw(n int)    { c.Lgen("%s\t%c%d(%%rip),%%rax", "movq", n) }
func (c *Emitter) Ldla(n int)    { c.Ngen("%s\t%d(%%rbp), %%rax", "leaq", n) }
func (c *Emitter) Ldsa(n int)    { c.Lgen("%s\t%c%d(%%rip),%%rax", "leaq", n) }
func (c *Emitter) Ldga(s string) { c.Sgen("%s\t%s(%%rip),%%rax", "leaq", s) }

func (c *Emitter) Indb() {
	c.Gen("movq\t%rax, %rdx")
	c.Clear()
	c.Gen("movb\t(%rdx), %al")
}

func (c *Emitter) Indw()        { c.Gen("movq\t(%rax), %rax") }
func (c *Emitter) Ldlab(id int) { c.Lgen("%s\t%c%d(%%rip),%%rax", "leaq", id) }

func (c *Emitter) Push()         { c.Gen("pushq\t%rax") }
func (c *Emitter) PushLit(n int) { c.Ngen("%s\t$%d", "pushq", n) }
func (c *Emitter) Pop2()         { c.Gen("popq\t%rcx") }
func (c *Emitter) Swap()         { c.Gen("xchgq\t%rax, %rcx") }

func (c *Emitter) And() { c.Synth("andq") }
func (c *Emitter) Or()  { c.Synth("orq") }
func (c *Emitter) Xor() { c.Synth("xorq") }
func (c *Emitter) Add() { c.Gen("addq\t%rcx, %rax") }
func (c *Emitter) Mul() { c.Gen("imulq\t%rcx, %rax") }
func (c *Emitter) Sub() { c.Gen("subq\t%rcx, %rax") }

func (c *Emitter) Div() {
	c.Gen("cqo")
	c.Gen("idivq\t%rcx")
}

func (c *Emitter) Mod() {
	c.Div()
	c.Gen("movq\t%rdx, %rax")
}

func (c *Emitter) Shl() { c.Gen("shlq\t%cl, %rax") }
func (c *Emitter) Shr() { c.Gen("sarq\t%cl, %rax") }

func (c *Emitter) Cmp(inst string) {
	lab := c.Label()
	c.Gen("xorq\t%rdx, %rdx")
	if c.Q.Type == arch.Empty {
		c.Pop2()
		c.Gen("cmpq\t%rax, %rcx")
	} else {
		c.Synth("cmpq")
	}
	c.Lgen("%s\t%c%d", inst, lab)
	c.Gen("incq\t%rdx")
	c.Lab(lab)
	c.Gen("movq\t%rdx, %rax")
}

func (c *Emitter) Eq()  { c.Cmp("jne") }
func (c *Emitter) Ne()  { c.Cmp("je") }
func (c *Emitter) Lt()  { c.Cmp("jge") }
func (c *Emitter) Gt()  { c.Cmp("jle") }
func (c *Emitter) Le()  { c.Cmp("jg") }
func (c *Emitter) Ge()  { c.Cmp("jl") }
func (c *Emitter) Ult() { c.Cmp("jae") }
func (c *Emitter) Ugt() { c.Cmp("jbe") }
func (c *Emitter) Ule() { c.Cmp("ja") }
func (c *Emitter) Uge() { c.Cmp("jb") }

func (c *Emitter) BrCond(i string, n int) {
	lab := c.Label()
	if c.Q.Type == arch.Empty {
		c.Pop2()
		c.Gen("cmpq\t%rax, %rcx")
	} else {
		c.Synth("cmpq")
	}
	c.Lgen("%s\t%c%d", i, lab)
	c.Lgen("%s\t%c%d", "jmp", n)
	c.Lab(lab)
}

func (c *Emitter) BrEq(n int)  { c.BrCond("je", n) }
func (c *Emitter) BrNe(n int)  { c.BrCond("jne", n) }
func (c *Emitter) BrLt(n int)  { c.BrCond("jl", n) }
func (c *Emitter) BrGt(n int)  { c.BrCond("jg", n) }
func (c *Emitter) BrLe(n int)  { c.BrCond("jle", n) }
func (c *Emitter) BrGe(n int)  { c.BrCond("jge", n) }
func (c *Emitter) BrUlt(n int) { c.BrCond("jb", n) }
func (c *Emitter) BrUgt(n int) { c.BrCond("ja", n) }
func (c *Emitter) BrUle(n int) { c.BrCond("jbe", n) }
func (c *Emitter) BrUge(n int) { c.BrCond("jae", n) }

func (c *Emitter) Neg() { c.Gen("negq\t%rax") }
func (c *Emitter) Not() { c.Gen("notq\t%rax") }

func (c *Emitter) LogNot() {
	c.Gen("negq\t%rax")
	c.Gen("sbbq\t%rax, %rax")
	c.Gen("incq\t%rax")
}

func (c *Emitter) Scale()   { c.Gen("shlq\t$3, %rax") }
func (c *Emitter) Scale2()  { c.Gen("shlq\t$3, %rcx") }
func (c *Emitter) Unscale() { c.Gen("shrq\t$3, %rax") }

func (c *Emitter) ScaleBy(v int) {
	c.Ngen("%s\t$%d, %%rcx", "movq", v)
	c.Gen("mulq\t%rcx")
}

func (c *Emitter) Scale2By(v int) {
	c.Gen("pushq\t%rax")
	c.Ngen("%s\t$%d, %%rax", "movq", v)
	c.Gen("mulq\t%rcx")
	c.Gen("movq\t%rax, %rcx")
	c.Gen("popq\t%rax")
}

func (c *Emitter) UnscaleBy(v int) {
	c.Ngen("%s\t$%d, %%rcx", "movq", v)
	c.Gen("xorq\t%rdx, %rdx")
	c.Gen("divq\t%rcx")
}

func (c *Emitter) Bool() {
	c.Gen("negq\t%rax")
	c.Gen("sbbq\t%rax, %rax")
	c.Gen("negq\t%rax")
}

func (c *Emitter) Ldinc()                { c.Gen("movq\t%rax, %rdx") }
func (c *Emitter) Inc1pi(v int)          { c.Ngen("%s\t$%d, (%%rax)", "addq", v) }
func (c *Emitter) Dec1pi(v int)          { c.Ngen("%s\t$%d, (%%rax)", "subq", v) }
func (c *Emitter) Inc2pi(v int)          { c.Ngen("%s\t$%d, (%%rdx)", "addq", v) }
func (c *Emitter) Dec2pi(v int)          { c.Ngen("%s\t$%d, (%%rdx)", "subq", v) }
func (c *Emitter) Incpl(a int, v int)    { c.Ngen2("%s\t$%d, %d(%%rbp)", "addq", v, a) }
func (c *Emitter) Decpl(a int, v int)    { c.Ngen2("%s\t$%d, %d(%%rbp)", "subq", v, a) }
func (c *Emitter) Incps(a int, v int)    { c.Lgen2("addq\t$%d,%c%d(%%rip)", v, a) }
func (c *Emitter) Decps(a int, v int)    { c.Lgen2("subq\t$%d,%c%d(%%rip)", v, a) }
func (c *Emitter) Incpg(s string, v int) { c.Sgen2("%s\t$%d,%s(%%rip)", "addq", v, s) }
func (c *Emitter) Decpg(s string, v int) { c.Sgen2("%s\t$%d,%s(%%rip)", "subq", v, s) }
func (c *Emitter) Inc1iw()               { c.Ngen("%s\t(%%rax)", "incq") }
func (c *Emitter) Dec1iw()               { c.Ngen("%s\t(%%rax)", "decq") }
func (c *Emitter) Inc2iw()               { c.Ngen("%s\t(%%rdx)", "incq") }
func (c *Emitter) Dec2iw()               { c.Ngen("%s\t(%%rdx)", "decq") }
func (c *Emitter) Inclw(a int)           { c.Ngen("%s\t%d(%%rbp)", "incq", a) }
func (c *Emitter) Declw(a int)           { c.Ngen("%s\t%d(%%rbp)", "decq", a) }
func (c *Emitter) Incsw(a int)           { c.Lgen("%s\t%c%d(%%rip)", "incq", a) }
func (c *Emitter) Decsw(a int)           { c.Lgen("%s\t%c%d(%%rip)", "decq", a) }
func (c *Emitter) Incgw(s string)        { c.Sgen("%s\t%s(%%rip)", "incq", s) }
func (c *Emitter) Decgw(s string)        { c.Sgen("%s\t%s(%%rip)", "decq", s) }
func (c *Emitter) Inc1ib()               { c.Ngen("%s\t(%%rax)", "incb", 0) }
func (c *Emitter) Dec1ib()               { c.Ngen("%s\t(%%rax)", "decb", 0) }
func (c *Emitter) Inc2ib()               { c.Ngen("%s\t(%%rdx)", "incb", 0) }
func (c *Emitter) Dec2ib()               { c.Ngen("%s\t(%%rdx)", "decb", 0) }
func (c *Emitter) Inclb(a int)           { c.Ngen("%s\t%d(%%rbp)", "incb", a) }
func (c *Emitter) Declb(a int)           { c.Ngen("%s\t%d(%%rbp)", "decb", a) }
func (c *Emitter) Incsb(a int)           { c.Lgen("%s\t%c%d(%%rip)", "incb", a) }
func (c *Emitter) Decsb(a int)           { c.Lgen("%s\t%c%d(%%rip)", "decb", a) }
func (c *Emitter) Incgb(s string)        { c.Sgen("%s\t%s(%%rip)", "incb", s) }
func (c *Emitter) Decgb(s string)        { c.Sgen("%s\t%s(%%rip)", "decb", s) }

func (c *Emitter) Br(how string, n int) {
	lab := c.Label()
	c.Gen("orq\t%rax, %rax")
	c.Lgen("%s\t%c%d", how, lab)
	c.Lgen("%s\t%c%d", "jmp", n)
	c.Lab(lab)
}

func (c *Emitter) BrTrue(n int)  { c.Br("jz", n) }
func (c *Emitter) BrFalse(n int) { c.Br("jnz", n) }
func (c *Emitter) Jump(n int)    { c.Lgen("%s\t%c%d", "jmp", n) }
func (c *Emitter) LdSwtch(n int) { c.Lgen("%s\t$%c%d(%%rip), %%rdx", "leaq", n) }
func (c *Emitter) CalSwtch()     { c.Gen("jmp\tswitch") }
func (c *Emitter) Case(v, l int) { c.Lgen2(".quad\t%d, %c%d", v, l) }

func (c *Emitter) PopPtr()         { c.Gen("popq\t%rdx") }
func (c *Emitter) Storib()         { c.Ngen("%s\t%%al, (%%rdx)", "movb") }
func (c *Emitter) Storiw()         { c.Ngen("%s\t%%rax, (%%rdx)", "movq") }
func (c *Emitter) Storlb(n int)    { c.Ngen("%s\t%%al, %d(%%rbp)", "movb", n) }
func (c *Emitter) Storlw(n int)    { c.Ngen("%s\t%%rax, %d(%%rbp)", "movq", n) }
func (c *Emitter) Storsb(n int)    { c.Lgen("%s\t%%al, %c%d(%%rip)", "movb", n) }
func (c *Emitter) Storsw(n int)    { c.Lgen("%s\t%%rax, %c%d(%%rip)", "movq", n) }
func (c *Emitter) Storgb(s string) { c.Sgen("%s\t%%al, %s(%%rip)", "movb", s) }
func (c *Emitter) Storgw(s string) { c.Sgen("%s\t%%rax, %s(%%rip)", "movq", s) }

func (c *Emitter) Initlw(v int, a int) { c.Ngen2("%s\t$%d, %d(%%rbp)", "movq", v, a) }
func (c *Emitter) Call(s string)       { c.Sgen("%s\t%s", "call", s) }
func (c *Emitter) Calr()               { c.Gen("call\t*%rax") }
func (c *Emitter) Stack(n int)         { c.Ngen("%s\t$%d, %%rsp", "addq", n) }

func (c *Emitter) Entry() {
	c.Gen("pushq\t%rbp")
	c.Gen("movq\t%rsp, %rbp")
}

func (c *Emitter) Exit() {
	c.Gen("popq\t%rbp")
	c.Gen("ret")
}

func (c *Emitter) Defb(v int)           { c.Ngen("%s\t%d", ".byte", v) }
func (c *Emitter) Defw(v int)           { c.Ngen("%s\t%d", ".quad", v) }
func (c *Emitter) Defp(v int)           { c.Ngen("%s\t%d", ".quad", v) }
func (c *Emitter) Defl(v int)           { c.Lgen("%s\t%c%d", ".quad", v) }
func (c *Emitter) Defc(ch int)          { c.Ngen("%s\t'%c'", ".byte", ch) }
func (c *Emitter) Gbss(s string, z int) { c.Ngen(".comm\t%s,%d", s, z) }
func (c *Emitter) Lbss(s string, z int) { c.Ngen(".lcomm\t%s,%d", s, z) }
func (c *Emitter) Align()               {}
