// Package i386 contains code to
// generate code for the x86 architecture.
package i386

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
	c.Emitter = &arch.Emitter{W: w, B: c, Sizes: &types.StdSizes{4, 4}}
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
		c.Ngen("%s\t%d(%%ebp), %%ecx", "leal", n)
		c.Sgen("%s\t%s, %%eax", op, "%ecx")

	case arch.AddrStatic:
		c.Lgen("%s\t$%c%d, %%eax", op, n)

	case arch.AddrGlobal:
		c.Sgen("%s\t$%s, %%eax", op, s)

	case arch.Literal:
		c.Ngen("%s\t$%d, %%eax", op, n)

	case arch.AutoWord:
		c.Ngen("%s\t%d(%%ebp), %%eax", op, n)

	case arch.StaticWord:
		c.Lgen("%s\t%c%d, %%eax", op, n)

	case arch.GlobalWord:
		c.Sgen("%s\t%s, %%eax", op, s)

	case arch.AutoByte:
		fallthrough
	case arch.StaticByte:
		fallthrough
	case arch.GlobalByte:
		c.Load2()
		c.Ngen("%s\t%%ecx, %%eax", op)

	case arch.Empty:
		c.Pop2()
		c.Sgen("%s\t%s, %%eax", op, "%ecx")

	default:
		panic(fmt.Sprint("bad type in synth: ", c.Q.Type))
	}
	c.Q.Type = arch.Empty
}

func (c *Emitter) Load2() bool {
	op := "movl"
	opb := "movb"
	n := c.Q.Value
	s := c.Gsym(c.Q.Name)
	switch c.Q.Type {
	case arch.AddrAuto:
		c.Ngen("%s\t%d(%%ebp), %%ecx", "leal", n)

	case arch.AddrStatic:
		c.Lgen("%s\t$%c%d, %%ecx", op, n)

	case arch.AddrGlobal:
		c.Sgen("%s\t$%s, %%ecx", op, s)

	case arch.AddrLabel:
		c.Lgen("%s\t$%c%d, %%ecx", op, n)

	case arch.Literal:
		c.Ngen("%s\t$%d, %%ecx", op, n)

	case arch.AutoByte:
		c.Clear2()
		c.Ngen("%s\t%d(%%ebp), %%cl", opb, n)

	case arch.AutoWord:
		c.Ngen("%s\t%d(%%ebp), %%ecx", op, n)

	case arch.StaticByte:
		c.Clear2()
		c.Lgen("%s\t%c%d, %%cl", opb, n)

	case arch.StaticWord:
		c.Lgen("%s\t%c%d, %%ecx", op, n)

	case arch.GlobalByte:
		c.Clear2()
		c.Sgen("%s\t%s, %%cl", opb, s)

	case arch.GlobalWord:
		c.Sgen("%s\t%s, %%ecx", op, s)

	case arch.Empty:
		c.Pop2()

	default:
		panic(fmt.Sprint("bad type in load:", c.Q.Type))
	}

	q := c.Q.Type
	c.Q.Type = arch.Empty
	return q == arch.Empty
}

func (c *Emitter) Lit(v int)     { c.Ngen("%s\t$%d, %%eax", "movl", v) }
func (c *Emitter) Clear()        { c.Gen("xorl\t%eax, %eax") }
func (c *Emitter) Clear2()       { c.Gen("xorl\t%ecx, %ecx") }
func (c *Emitter) Ldgb(s string) { c.Sgen("%s\t%s, %%al", "movb", s) }
func (c *Emitter) Ldgw(s string) { c.Sgen("%s\t%s, %%eax", "movl", s) }
func (c *Emitter) Ldlb(n int)    { c.Ngen("%s\t%d(%%ebp), %%al", "movb", n) }
func (c *Emitter) Ldlw(n int)    { c.Ngen("%s\t%d(%%ebp), %%eax", "movl", n) }
func (c *Emitter) Ldsb(n int)    { c.Lgen("%s\t%c%d, %%al", "movb", n) }
func (c *Emitter) Ldsw(n int)    { c.Lgen("%s\t%c%d, %%eax", "movl", n) }
func (c *Emitter) Ldla(n int)    { c.Ngen("%s\t%d(%%ebp), %%eax", "leal", n) }
func (c *Emitter) Ldsa(n int)    { c.Lgen("%s\t$%c%d, %%eax", "movl", n) }
func (c *Emitter) Ldga(s string) { c.Sgen("%s\t$%s, %%eax", "movl", s) }

func (c *Emitter) Indb() {
	c.Gen("movl\t%eax, %edx")
	c.Clear()
	c.Gen("movb\t(%edx), %al")
}

func (c *Emitter) Indw()        { c.Gen("movl\t(%eax), %eax") }
func (c *Emitter) Ldlab(id int) { c.Lgen("%s\t$%c%d, %%eax", "movl", id) }

func (c *Emitter) Push()         { c.Gen("pushl\t%eax") }
func (c *Emitter) PushLit(n int) { c.Ngen("%s\t$%d", "pushl", n) }
func (c *Emitter) Pop2()         { c.Gen("popl\t%ecx") }
func (c *Emitter) Swap()         { c.Gen("xchgl\t%eax, %ecx") }

func (c *Emitter) And() { c.Synth("andl") }
func (c *Emitter) Or()  { c.Synth("orl") }
func (c *Emitter) Xor() { c.Synth("xorl") }
func (c *Emitter) Add() { c.Gen("addl\t%ecx, %eax") }
func (c *Emitter) Mul() { c.Gen("imull\t%ecx, %eax") }
func (c *Emitter) Sub() { c.Gen("subl\t%ecx, %eax") }

func (c *Emitter) Div() {
	c.Gen("cdq")
	c.Gen("idivl\t%ecx")
}

func (c *Emitter) Mod() {
	c.Div()
	c.Gen("movl\t%edx, %eax")
}

func (c *Emitter) Shl() { c.Gen("shll\t%cl, %eax") }
func (c *Emitter) Shr() { c.Gen("sarl\t%cl, %eax") }

func (c *Emitter) Cmp(inst string) {
	lab := c.Label()
	c.Gen("xorl\t%edx, %edx")
	if c.Q.Type == arch.Empty {
		c.Pop2()
		c.Gen("cmpl\t%eax, %ecx")
	} else {
		c.Synth("cmpl")
	}
	c.Lgen("%s\t%c%d", inst, lab)
	c.Gen("incl\t%edx")
	c.Lab(lab)
	c.Gen("movl\t%edx, %eax")
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
		c.Gen("cmpl\t%eax, %ecx")
	} else {
		c.Synth("cmpl")
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

func (c *Emitter) Neg() { c.Gen("negl\t%eax") }
func (c *Emitter) Not() { c.Gen("notl\t%eax") }

func (c *Emitter) LogNot() {
	c.Gen("negl\t%eax")
	c.Gen("sbbl\t%eax, %eax")
	c.Gen("incl\t%eax")
}

func (c *Emitter) Scale()   { c.Gen("shll\t$2, %eax") }
func (c *Emitter) Scale2()  { c.Gen("shll\t$2, %ecx") }
func (c *Emitter) Unscale() { c.Gen("shrl\t$2, %eax") }

func (c *Emitter) ScaleBy(v int) {
	c.Ngen("%s\t$%d, %%ecx", "movl", v)
	c.Gen("mull\t%ecx")
}

func (c *Emitter) Scale2By(v int) {
	c.Gen("pushl\t%eax")
	c.Ngen("%s\t$%d, %%eax", "movl", v)
	c.Gen("mull\t%ecx")
	c.Gen("movl\t%eax, %ecx")
	c.Gen("popl\t%eax")
}

func (c *Emitter) UnscaleBy(v int) {
	c.Ngen("%s\t$%d, %%ecx", "movl", v)
	c.Gen("xorl\t%edx, %edx")
	c.Gen("divl\t%ecx")
}

func (c *Emitter) Bool() {
	c.Gen("negl\t%eax")
	c.Gen("sbbl\t%eax, %eax")
	c.Gen("negl\t%eax")
}

func (c *Emitter) Ldinc()                { c.Gen("movl\t%eax, %edx") }
func (c *Emitter) Inc1pi(v int)          { c.Ngen("%s\t$%d, (%%eax)", "addl", v) }
func (c *Emitter) Dec1pi(v int)          { c.Ngen("%s\t$%d, (%%eax)", "subl", v) }
func (c *Emitter) Inc2pi(v int)          { c.Ngen("%s\t$%d, (%%edx)", "addl", v) }
func (c *Emitter) Dec2pi(v int)          { c.Ngen("%s\t$%d, (%%edx)", "subl", v) }
func (c *Emitter) Incpl(a int, v int)    { c.Ngen2("%s\t$%d, %d(%%ebp)", "addl", v, a) }
func (c *Emitter) Decpl(a int, v int)    { c.Ngen2("%s\t$%d, %d(%%ebp)", "subl", v, a) }
func (c *Emitter) Incps(a int, v int)    { c.Lgen2("addl\t$%d, %c%d", v, a) }
func (c *Emitter) Decps(a int, v int)    { c.Lgen2("subl\t$%d, %c%d", v, a) }
func (c *Emitter) Incpg(s string, v int) { c.Sgen2("%s\t$%d, %s", "addl", v, s) }
func (c *Emitter) Decpg(s string, v int) { c.Sgen2("%s\t$%d, %s", "subl", v, s) }
func (c *Emitter) Inc1iw()               { c.Ngen("%s\t(%%eax)", "incl") }
func (c *Emitter) Dec1iw()               { c.Ngen("%s\t(%%eax)", "decl") }
func (c *Emitter) Inc2iw()               { c.Ngen("%s\t(%%edx)", "incl") }
func (c *Emitter) Dec2iw()               { c.Ngen("%s\t(%%edx)", "decl") }
func (c *Emitter) Inclw(a int)           { c.Ngen("%s\t%d(%%ebp)", "incl", a) }
func (c *Emitter) Declw(a int)           { c.Ngen("%s\t%d(%%ebp)", "decl", a) }
func (c *Emitter) Incsw(a int)           { c.Lgen("%s\t%c%d", "incl", a) }
func (c *Emitter) Decsw(a int)           { c.Lgen("%s\t%c%d", "decl", a) }
func (c *Emitter) Incgw(s string)        { c.Sgen("%s\t%s", "incl", s) }
func (c *Emitter) Decgw(s string)        { c.Sgen("%s\t%s", "decl", s) }
func (c *Emitter) Inc1ib()               { c.Ngen("%s\t(%%eax)", "incb", 0) }
func (c *Emitter) Dec1ib()               { c.Ngen("%s\t(%%eax)", "decb", 0) }
func (c *Emitter) Inc2ib()               { c.Ngen("%s\t(%%edx)", "incb", 0) }
func (c *Emitter) Dec2ib()               { c.Ngen("%s\t(%%edx)", "decb", 0) }
func (c *Emitter) Inclb(a int)           { c.Ngen("%s\t%d(%%ebp)", "incb", a) }
func (c *Emitter) Declb(a int)           { c.Ngen("%s\t%d(%%ebp)", "decb", a) }
func (c *Emitter) Incsb(a int)           { c.Lgen("%s\t%c%d", "incb", a) }
func (c *Emitter) Decsb(a int)           { c.Lgen("%s\t%c%d", "decb", a) }
func (c *Emitter) Incgb(s string)        { c.Sgen("%s\t%s", "incb", s) }
func (c *Emitter) Decgb(s string)        { c.Sgen("%s\t%s", "decb", s) }

func (c *Emitter) Br(how string, n int) {
	lab := c.Label()
	c.Gen("orl\t%eax, %eax")
	c.Lgen("%s\t%c%d", how, lab)
	c.Lgen("%s\t%c%d", "jmp", n)
	c.Lab(lab)
}

func (c *Emitter) BrTrue(n int)  { c.Br("jz", n) }
func (c *Emitter) BrFalse(n int) { c.Br("jnz", n) }
func (c *Emitter) Jump(n int)    { c.Lgen("%s\t%c%d", "jmp", n) }
func (c *Emitter) LdSwtch(n int) { c.Lgen("%s\t$%c%d, %%edx", "movl", n) }
func (c *Emitter) CalSwtch()     { c.Gen("jmp\tswitch") }
func (c *Emitter) Case(v, l int) { c.Lgen2(".long\t%d, %c%d", v, l) }

func (c *Emitter) PopPtr()         { c.Gen("popl\t%edx") }
func (c *Emitter) Storib()         { c.Ngen("%s\t%%al, (%%edx)", "movb") }
func (c *Emitter) Storiw()         { c.Ngen("%s\t%%eax, (%%edx)", "movl") }
func (c *Emitter) Storlb(n int)    { c.Ngen("%s\t%%al, %d(%%ebp)", "movb", n) }
func (c *Emitter) Storlw(n int)    { c.Ngen("%s\t%%eax, %d(%%ebp)", "movl", n) }
func (c *Emitter) Storsb(n int)    { c.Lgen("%s\t%%al, %c%d", "movb", n) }
func (c *Emitter) Storsw(n int)    { c.Lgen("%s\t%%eax, %c%d", "movl", n) }
func (c *Emitter) Storgb(s string) { c.Sgen("%s\t%%al, %s", "movb", s) }
func (c *Emitter) Storgw(s string) { c.Sgen("%s\t%%eax, %s", "movl", s) }

func (c *Emitter) Initlw(v int, a int) { c.Ngen2("%s\t$%d, %d(%%ebp)", "movl", v, a) }
func (c *Emitter) Call(s string)       { c.Sgen("%s\t%s", "call", s) }
func (c *Emitter) Calr()               { c.Gen("call\t*%eax") }
func (c *Emitter) Stack(n int)         { c.Ngen("%s\t$%d, %%esp", "addl", n) }

func (c *Emitter) Entry() {
	c.Gen("pushl\t%ebp")
	c.Gen("movl\t%esp, %ebp")
}

func (c *Emitter) Exit() {
	c.Gen("popl\t%ebp")
	c.Gen("ret")
}

func (c *Emitter) Defb(v int)           { c.Ngen("%s\t%d", ".byte", v) }
func (c *Emitter) Defw(v int)           { c.Ngen("%s\t%d", ".long", v) }
func (c *Emitter) Defp(v int)           { c.Ngen("%s\t%d", ".long", v) }
func (c *Emitter) Defl(v int)           { c.Lgen("%s\t%c%d", ".long", v) }
func (c *Emitter) Defc(ch int)          { c.Ngen("%s\t'%c'", ".byte", ch) }
func (c *Emitter) Gbss(s string, z int) { c.Ngen(".comm\t%s,%d", s, z) }
func (c *Emitter) Lbss(s string, z int) { c.Ngen(".lcomm\t%s,%d", s, z) }
func (c *Emitter) Align()               {}
