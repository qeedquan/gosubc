// Package arm6 contains a code emitter to
// generate code for the ARMv6 architecture.
package arm6

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
func (c *Emitter) Prelude()        { c.Gen(".syntax unified") }
func (c *Emitter) Postlude()       {}
func (c *Emitter) Public(s string) { c.Raw(".globl\t" + s + "\n") }

func (c *Emitter) Lit2(v, aux int) {
	var l, skip int
	if 0 <= v && v <= 127 {
		if aux == 2 {
			c.Ngen("%s\tr2, #%d", "mov", v)
		} else if aux == 1 {
			c.Ngen("%s\tr1, #%d", "mov", v)
		} else {
			c.Ngen("%s\tr0, #%d", "mov", v)
		}
	} else if -128 <= v && v < 0 {
		v = -v - 1
		if aux == 2 {
			c.Ngen("%s\tr2, #%d", "mvn", v)
		} else if aux == 1 {
			c.Ngen("%s\tr1, #%d", "mvn", v)
		} else {
			c.Ngen("%s\tr0, #%d", "mvn", v)
		}
	} else {
		l = c.Label()
		if aux == 2 {
			c.Lgen("%s\tr2, %c%d", "ldr", l)
		} else if aux == 1 {
			c.Lgen("%s\tr1, %c%d", "ldr", l)
		} else {
			c.Lgen("%s\tr0, %c%d", "ldr", l)
		}
		skip = c.Label()
		c.Lgen("%s\t%c%d", "b", skip)
		c.Lab(l)
		c.Defw(v)
		c.Lab(skip)
	}
}

func (c *Emitter) LocalAddr(n int, aux bool) {
	if n < -255 || n > 255 {
		c.Lit2(n, 2)
		if aux {
			c.Gen("add\tr1, r11, r2")
		} else {
			c.Gen("add\tr0, r11, r2")
		}
	} else {
		if aux {
			c.Ngen("%s\tr1, r11, #%d", "add", n)
		} else {
			c.Ngen("%s\tr0, r11, #%d", "add", n)
		}
	}
}

func (c *Emitter) StatAddr(n int, aux bool) {
	l := c.Label()
	if aux {
		c.Lgen("%s\tr1, %c%d", "ldr", l)
	} else {
		c.Lgen("%s\tr0, %c%d", "ldr", l)
	}
	skip := c.Label()
	c.Lgen("%s\t%c%d", "b", skip)
	c.Lab(l)
	c.Defl(n)
	c.Lab(skip)
}

func (c *Emitter) GlobalAddr(s string, aux bool) {
	l := c.Label()
	if aux {
		c.Lgen("%s\tr1, %c%d", "ldr", l)
	} else {
		c.Lgen("%s\tr0, %c%d", "ldr", l)
	}
	skip := c.Label()
	c.Lgen("%s\t%c%d", "b", skip)
	c.Lab(l)
	c.Sgen("%s\t%s", ".long", s)
	c.Lab(skip)
}

func (c *Emitter) Ind2b() { c.Gen("ldrb\tr1, [r1]") }
func (c *Emitter) Ind2w() { c.Gen("ldr\tr1, [r1]") }

func (c *Emitter) Storb() { c.Gen("strb\tr0, [r1]") }
func (c *Emitter) Storw() { c.Gen("str\tr0, [r1]") }

func (c *Emitter) Synth() {}

func (c *Emitter) Load2() bool {
	n := c.Q.Value
	s := c.Gsym(c.Q.Name)

	switch c.Q.Type {
	case arch.AddrAuto:
		c.LocalAddr(n, true)
	case arch.AddrStatic:
		c.StatAddr(n, true)
	case arch.AddrGlobal:
		c.GlobalAddr(s, true)
	case arch.AddrLabel:
		c.StatAddr(n, true)
	case arch.Literal:
		c.Lit2(n, 1)
	case arch.AutoByte:
		c.LocalAddr(n, true)
		c.Ind2b()
	case arch.AutoWord:
		c.LocalAddr(n, true)
		c.Ind2w()
	case arch.StaticByte:
		c.StatAddr(n, true)
		c.Ind2b()
	case arch.StaticWord:
		c.StatAddr(n, true)
		c.Ind2w()
	case arch.GlobalByte:
		c.GlobalAddr(s, true)
		c.Ind2b()
	case arch.GlobalWord:
		c.GlobalAddr(s, true)
		c.Ind2w()
	case arch.Empty:
		c.Pop2()
	default:
		panic(fmt.Sprintf("bad type in load2(): %v", c.Q.Type))
	}
	q := c.Q.Type
	c.Q.Type = arch.Empty
	return q == arch.Empty
}

func (c *Emitter) Lit(v int) { c.Lit2(v, 0) }
func (c *Emitter) Clear()    {}
func (c *Emitter) Clear2()   {}

func (c *Emitter) Ldgb(s string) {
	c.GlobalAddr(s, false)
	c.Indb()
}

func (c *Emitter) Ldgw(s string) {
	c.GlobalAddr(s, false)
	c.Indw()
}

func (c *Emitter) Ldlb(n int) {
	c.LocalAddr(n, false)
	c.Indb()
}

func (c *Emitter) Ldlw(n int) {
	c.LocalAddr(n, false)
	c.Indw()
}

func (c *Emitter) Ldsb(n int) {
	c.StatAddr(n, false)
	c.Indb()
}

func (c *Emitter) Ldsw(n int) {
	c.StatAddr(n, false)
	c.Indw()
}

func (c *Emitter) Ldla(n int)    { c.LocalAddr(n, false) }
func (c *Emitter) Ldsa(n int)    { c.StatAddr(n, false) }
func (c *Emitter) Ldga(s string) { c.GlobalAddr(s, false) }
func (c *Emitter) Indb()         { c.Gen("ldrb\tr0, [r0]") }
func (c *Emitter) Indw()         { c.Gen("ldr\tr0, [r0]") }
func (c *Emitter) Ldlab(id int)  { c.StatAddr(id, false) }

func (c *Emitter) Push() { c.Gen("push\t{r0}") }

func (c *Emitter) PushLit(n int) {
	c.Lit(n)
	c.Push()
}

func (c *Emitter) Pop2() { c.Gen("pop\t{r1}") }

func (c *Emitter) Swap() {
	c.Gen("mov\tr2,r0")
	c.Gen("mov\tr0,r1")
	c.Gen("mov\tr1,r2")
}

func (c *Emitter) And() { c.Load2(); c.Gen("and\tr0, r0, r1") }
func (c *Emitter) Or()  { c.Load2(); c.Gen("orr\tr0, r0, r1") }
func (c *Emitter) Xor() { c.Load2(); c.Gen("eor\tr0, r0, r1") }
func (c *Emitter) Add() { c.Gen("add\tr0, r0, r1") }
func (c *Emitter) Mul() { c.Gen("mul\tr0, r0, r1") }
func (c *Emitter) Sub() { c.Gen("sub\tr0, r0, r1") }
func (c *Emitter) Div() { c.Gen("bl\tsdiv") }
func (c *Emitter) Mod() { c.Gen("bl\tsrem") }
func (c *Emitter) Shl() { c.Gen("lsl\tr0, r0, r1") }
func (c *Emitter) Shr() { c.Gen("asr\tr0, r0, r1") }

func (c *Emitter) Cmp(inst string) {
	c.Gen("mov\tr3, r0")
	c.Gen("mov\tr0, #0")
	if c.Q.Type == arch.Empty {
		c.Pop2()
		c.Gen("cmp\tr1, r3")
	} else {
		c.Load2()
		c.Gen("cmp\tr3, r1")
	}
	c.Ngen("%s\tr0, #%d", inst, 1)
}

func (c *Emitter) Eq()  { c.Cmp("moveq") }
func (c *Emitter) Ne()  { c.Cmp("movne") }
func (c *Emitter) Lt()  { c.Cmp("movlt") }
func (c *Emitter) Gt()  { c.Cmp("movgt") }
func (c *Emitter) Le()  { c.Cmp("movle") }
func (c *Emitter) Ge()  { c.Cmp("movge") }
func (c *Emitter) Ult() { c.Cmp("movlo") }
func (c *Emitter) Ugt() { c.Cmp("movhi") }
func (c *Emitter) Ule() { c.Cmp("movls") }
func (c *Emitter) Uge() { c.Cmp("movhs") }

func (c *Emitter) BrCond(i string, n int) {
	lab := c.Label()
	if c.Q.Type == arch.Empty {
		c.Pop2()
		c.Gen("cmp\tr1, r0")
	} else {
		c.Load2()
		c.Gen("cmp\tr0, r1")
	}
	c.Lgen("%s\t%c%d", i, lab)
	c.Lgen("%s\t%c%d", "b", n)
	c.Lab(lab)
}

func (c *Emitter) BrEq(n int)  { c.BrCond("beq", n) }
func (c *Emitter) BrNe(n int)  { c.BrCond("bne", n) }
func (c *Emitter) BrLt(n int)  { c.BrCond("blt", n) }
func (c *Emitter) BrGt(n int)  { c.BrCond("bgt", n) }
func (c *Emitter) BrLe(n int)  { c.BrCond("ble", n) }
func (c *Emitter) BrGe(n int)  { c.BrCond("bge", n) }
func (c *Emitter) BrUlt(n int) { c.BrCond("blo", n) }
func (c *Emitter) BrUgt(n int) { c.BrCond("bhi", n) }
func (c *Emitter) BrUle(n int) { c.BrCond("bls", n) }
func (c *Emitter) BrUge(n int) { c.BrCond("bhs", n) }

func (c *Emitter) neg() { c.Gen("neg\tr0, r0") }
func (c *Emitter) not() { c.Gen("mvn\tr0, r0") }

func (c *Emitter) lognot() {
	c.Gen("cmp\tr0, #0")
	c.Gen("mov\tr0, #0")
	c.Gen("moveq\tr0, #1")
}

func (c *Emitter) Scale()   { c.Gen("lsl\tr0, #2") }
func (c *Emitter) Scale2()  { c.Gen("lsl\tr1, #2") }
func (c *Emitter) Unscale() { c.Gen("lsr\tr0, #2") }

func (c *Emitter) ScaleBy(v int) {
	c.Lit2(v, 1)
	c.Gen("mul\tr0, r0, r1")
}

func (c *Emitter) Scale2By(v int) {
	c.Lit2(v, 2)
	c.Gen("mul\tr1, r1, r2")
}

func (c *Emitter) UnscaleBy(v int) {
	c.Lit2(v, 1)
	c.Gen("bl\tudiv")
}

func (c *Emitter) bool() {
	c.Gen("cmp\tr0, #0")
	c.Gen("mov\tr0, #0")
	c.Gen("movne\tr0, #1")
}

func (c *Emitter) Ldinc() { c.Gen("mov\tr2, r0") }

func (c *Emitter) Inc1pi(v int) {
	c.Lit2(v, 1)
	c.Gen("ldr\tr3, [r0]")
	c.Gen("add\tr3, r3, r1")
	c.Gen("str\tr3, [r0]")
}

func (c *Emitter) Dec1pi(v int) {
	c.Lit2(v, 1)
	c.Gen("ldr\tr3, [r0]")
	c.Gen("sub\tr3, r3, r1")
	c.Gen("str\tr3, [r0]")
}

func (c *Emitter) Inc2pi(v int) {
	c.Lit2(v, 1)
	c.Gen("ldr\tr3, [r2]")
	c.Gen("add\tr3, r3, r1")
	c.Gen("str\tr3, [r2]")
}

func (c *Emitter) Dec2pi(v int) {
	c.Lit2(v, 1)
	c.Gen("ldr\tr3, [r2]")
	c.Gen("sub\tr3, r3, r1")
	c.Gen("str\tr3, [r2]")
}

func (c *Emitter) Incpl(v, a int) {
	c.Lit2(v, 2)
	c.LocalAddr(a, true)
	c.Gen("ldr\tr3, [r1]")
	c.Gen("add\tr3, r3, r2")
	c.Gen("str\tr3, [r1]")
}

func (c *Emitter) Decpl(v, a int) {
	c.Lit2(v, 2)
	c.LocalAddr(a, true)
	c.Gen("ldr\tr3, [r1]")
	c.Gen("sub\tr3, r3, r2")
	c.Gen("str\tr3, [r1]")
}

func (c *Emitter) Incps(v, a int) {
	c.Lit2(v, 2)
	c.StatAddr(a, true)
	c.Gen("ldr\tr3, [r1]")
	c.Gen("add\tr3, r3, r2")
	c.Gen("str\tr3, [r1]")
}

func (c *Emitter) Decps(a, v int) {
	c.Lit2(v, 2)
	c.StatAddr(a, true)
	c.Gen("ldr\tr3, [r1]")
	c.Gen("sub\tr3, r3, r2")
	c.Gen("str\tr3, [r1]")
}

func (c *Emitter) Incpg(s string, v int) {
	c.Lit2(v, 2)
	c.GlobalAddr(s, true)
	c.Gen("ldr\tr3, [r1]")
	c.Gen("add\tr3, r3, r2")
	c.Gen("str\tr3, [r1]")
}

func (c *Emitter) Decpg(s string, v int) {
	c.Lit2(v, 2)
	c.GlobalAddr(s, true)
	c.Gen("ldr\tr3, [r1]")
	c.Gen("sub\tr3, r3, r2")
	c.Gen("str\tr3, [r1]")
}

func (c *Emitter) Inc1iw() {
	c.Gen("ldr\tr1, [r0]")
	c.Gen("add\tr1, r1, #1")
	c.Gen("str\tr1, [r0]")
}

func (c *Emitter) Dec1iw() {
	c.Gen("ldr\tr1, [r0]")
	c.Gen("sub\tr1, r1,#1")
	c.Gen("str\tr1, [r0]")
}

func (c *Emitter) Inc2iw() {
	c.Gen("ldr\tr1, [r2]")
	c.Gen("add\tr1, r1, #1")
	c.Gen("str\tr1, [r2]")
}

func (c *Emitter) Dec2iw() {
	c.Gen("ldr\tr1, [r2]")
	c.Gen("sub\tr1, r1, #1")
	c.Gen("str\tr1, [r2]")
}

func (c *Emitter) Inclw(a int) {
	c.LocalAddr(a, true)
	c.Gen("ldr\tr2, [r1]")
	c.Gen("add\tr2, r2, #1")
	c.Gen("str\tr2, [r1]")
}

func (c *Emitter) Declw(a int) {
	c.LocalAddr(a, true)
	c.Gen("ldr\tr2, [r1]")
	c.Gen("sub\tr2, r2, #1")
	c.Gen("str\tr2, [r1]")
}

func (c *Emitter) Incsw(a int) {
	c.StatAddr(a, true)
	c.Gen("ldr\tr2, [r1]")
	c.Gen("add\tr2, r2, #1")
	c.Gen("str\tr2, [r1]")
}

func (c *Emitter) Decsw(a int) {
	c.StatAddr(a, true)
	c.Gen("ldr\tr2, [r1]")
	c.Gen("sub\tr2, r2, #1")
	c.Gen("str\tr2, [r1]")
}

func (c *Emitter) Incgw(s string) {
	c.GlobalAddr(s, true)
	c.Gen("ldr\tr2, [r1]")
	c.Gen("add\tr2, r2, #1")
	c.Gen("str\tr2, [r1]")
}

func (c *Emitter) Decgw(s string) {
	c.GlobalAddr(s, true)
	c.Gen("ldr\tr2, [r1]")
	c.Gen("sub\tr2, r2, #1")
	c.Gen("str\tr2, [r1]")
}

func (c *Emitter) Inc1ib() {
	c.Gen("ldrb\tr1, [r0]")
	c.Gen("add\tr1, r1, #1")
	c.Gen("strb\tr1, [r0]")
}

func (c *Emitter) Dec1ib() {
	c.Gen("ldrb\tr1, [r0]")
	c.Gen("sub\tr1, r1, #1")
	c.Gen("strb\tr1, [r0]")
}

func (c *Emitter) Inc2ib() {
	c.Gen("ldrb\tr1, [r2]")
	c.Gen("add\tr1, r1, #1")
	c.Gen("strb\tr1, [r2]")
}

func (c *Emitter) Dec2ib() {
	c.Gen("ldrb\tr1, [r2]")
	c.Gen("sub\tr1, r1, #1")
	c.Gen("strb\tr1, [r2]")
}

func (c *Emitter) Inclb(a int) {
	c.LocalAddr(a, true)
	c.Gen("ldrb\tr2, [r1]")
	c.Gen("add\tr2, r2, #1")
	c.Gen("strb\tr2, [r1]")
}

func (c *Emitter) Declb(a int) {
	c.LocalAddr(a, true)
	c.Gen("ldrb\tr2, [r1]")
	c.Gen("sub\tr2, r2, #1")
	c.Gen("strb\tr2, [r1]")
}

func (c *Emitter) Incsb(a int) {
	c.StatAddr(a, true)
	c.Gen("ldrb\tr2, [r1]")
	c.Gen("add\tr2, r2, #1")
	c.Gen("strb\tr2, [r1]")
}

func (c *Emitter) Decsb(a int) {
	c.StatAddr(a, true)
	c.Gen("ldrb\tr2, [r1]")
	c.Gen("sub\tr2, r2, #1")
	c.Gen("strb\tr2, [r1]")
}

func (c *Emitter) Incgb(s string) {
	c.GlobalAddr(s, true)
	c.Gen("ldrb\tr2, [r1]")
	c.Gen("add\tr2, r2, #1")
	c.Gen("strb\tr2, [r1]")
}

func (c *Emitter) Decgb(s string) {
	c.GlobalAddr(s, true)
	c.Gen("ldrb\tr2, [r1]")
	c.Gen("sub\tr2, r2, #1")
	c.Gen("strb\tr2, [r1]")
}

func (c *Emitter) Br(how string, n int) {
	lab := c.Label()
	c.Gen("cmp\tr0, #0")
	c.Lgen("%s\t%c%d", how, lab)
	c.Lgen("%s\t%c%d", "b", n)
	c.Lab(lab)
}

func (c *Emitter) BrTrue(n int)  { c.Br("beq", n) }
func (c *Emitter) BrFalse(n int) { c.Br("bne", n) }
func (c *Emitter) Jump(n int)    { c.Lgen("%s\t%c%d", "b", n) }
func (c *Emitter) LdSwtch(n int) { c.StatAddr(n, true) }
func (c *Emitter) CalSwtch()     { c.Gen("b\tswitch") }
func (c *Emitter) Case(v, l int) { c.Lgen2(".long\t%d, %c%d", v, l) }

func (c *Emitter) PopPtr() { c.Gen("pop\t{r2}") }
func (c *Emitter) Storib() { c.Gen("strb\tr0, [r2]") }
func (c *Emitter) Storiw() { c.Gen("str\tr0, [r2]") }

func (c *Emitter) Storlb(n int) {
	c.LocalAddr(n, true)
	c.Storb()
}

func (c *Emitter) Storlw(n int) {
	c.LocalAddr(n, true)
	c.Storw()
}

func (c *Emitter) Storsb(n int) {
	c.StatAddr(n, true)
	c.Storb()
}

func (c *Emitter) Storsw(n int) {
	c.StatAddr(n, true)
	c.Storw()
}

func (c *Emitter) Storgb(s string) {
	c.GlobalAddr(s, true)
	c.Storb()
}

func (c *Emitter) Storgw(s string) {
	c.GlobalAddr(s, true)
	c.Storw()
}

func (c *Emitter) Initlw(v, a int) {
	c.Lit(v)
	c.LocalAddr(a, true)
	c.Storw()
}

func (c *Emitter) Call(s string) { c.Sgen("%s\t%s", "bl", s) }
func (c *Emitter) Calr()         { c.Gen("blx\tr0") }

func (c *Emitter) Stack(n int) {
	c.Lit2(n, 1)
	c.Gen("add\tsp, sp, r1")
}
func (c *Emitter) Entry() {
	c.Gen("push\t{r11, lr}")
	c.Gen("mov\tr11, sp")
}

func (c *Emitter) Exit() { c.Gen("pop\t{r11,pc}") }

func (c *Emitter) Defb(v int)           { c.Ngen("%s\t%d", ".byte", v) }
func (c *Emitter) Defw(v int)           { c.Ngen("%s\t%d", ".long", v) }
func (c *Emitter) Defp(v int)           { c.Ngen("%s\t%d", ".long", v) }
func (c *Emitter) Defl(v int)           { c.Lgen("%s\t%c%d", ".long", v) }
func (c *Emitter) Defc(c_ int)          { c.Ngen("%s\t'%c'", ".byte", c_) }
func (c *Emitter) Gbss(s string, z int) { c.Ngen(".comm\t%s, %d", s, z) }
func (c *Emitter) Lbss(s string, z int) { c.Ngen(".lcomm\t%s, %d", s, z) }
func (c *Emitter) Align()               { c.Gen(".align 2") }
