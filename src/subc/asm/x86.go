package asm

import (
	"bufio"
	"bytes"
	"fmt"
	"math"
	"strconv"
	"strings"
	"unicode/utf8"
)

const (
	opADDQ op = iota + 100
	opANDQ
	opCALL
	opCLD
	opCMPQ
	opCQO
	opDECB
	opDECQ
	opDIVQ
	opIDIVQ
	opIMULQ
	opINCB
	opINCQ
	opINT
	opJA
	opJAE
	opJB
	opJBE
	opJE
	opJG
	opJGE
	opJL
	opJLE
	opJMP
	opJNE
	opJNZ
	opJZ
	opLEAQ
	opLODSL
	opLODSQ
	opMOVB
	opMOVQ
	opNEGQ
	opNOTQ
	opORQ
	opPOPQ
	opPUSHQ
	opRET
	opSARQ
	opSBBQ
	opSHLQ
	opSHRQ
	opSUBQ
	opSYSCALL
	opXCHGQ
	opXORQ
)

const (
	rAX = 0
	rCX = 1
	rDX = 2
	rBX = 3
	rSP = 4
	rBP = 5
	rSI = 6
	rDI = 7
	rAL = 0
	rCL = 1
	rDL = 2
	rBL = 3
	rAH = 4
	rCH = 5
	rDH = 6
	rBH = 7
)

var x86regs = map[string]struct {
	reg byte
}{
	"rax": {rAX},
	"rcx": {rCX},
	"rdx": {rDX},
	"rbx": {rBX},
	"rsp": {rSP},
	"rbp": {rBP},
	"rsi": {rSI},
	"rdi": {rDI},
	"al":  {rAL},
	"cl":  {rCL},
	"dl":  {rBL},
	"bl":  {rAH},
	"ah":  {rAH},
	"ch":  {rCH},
	"dh":  {rDH},
	"bh":  {rBH},
}

type x86 struct {
	as
}

func x86as(prog *prog, name string, src []byte) {
	as := x86{
		as: as{
			prog: prog,
			file: name,
		},
	}
	as.assemble(src)
}

func (as *x86) bytes(op op, addr [2]addr, v interface{}) {
	x, y := addr[0], addr[1]
	switch x.typ | y.typ<<8 {
	case aINT:
		as.emit(op, addr, v)
	case aPTR:
		as.addrel(op, addr)
	case aINT | aPTR<<8:
		as.emit(op, addr, v)
		as.addrel(op, addr)
	default:
		as.errorf("unknown argument")
	}
}

func (as *x86) assemble(src []byte) {
	unk := func() {
		as.errorf("unknown argument")
	}

	b := bytes.NewReader(src)
	s := bufio.NewScanner(b)

	as.sect = as.text
	for as.lineno = 1; s.Scan(); as.lineno++ {
		as.line = strings.TrimSpace(s.Text())
		line := as.line

	scan:
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}
		if i := strings.Index(line, "#"); i >= 0 {
			line = line[:i]
		}

		for {
			i := strings.Index(line, ":")
			if i > 0 {
				as.addlabel(line[:i], as.sect.size, as.sect.pc)
				line = line[i+1:]
				goto scan
			}
			break
		}

		var op_ string
		fmt.Sscan(line, &op_)

		var addr [2]addr
		if len(line) > len(op_) {
			line = strings.TrimSpace(line[len(op_)+1:])
			args := strings.Split(line, ",")
			if len(args) > len(addr) {
				as.errorf("junk at end")
			}
			for i, arg := range args {
				arg = strings.TrimSpace(arg)
				addr[i] = as.arg(arg)
			}
		}

		x, y := addr[0], addr[1]
		switch lop := strings.ToLower(op_); lop {
		case ".text":
			as.sect = as.text
			continue
		case ".data":
			as.sect = as.data
			continue
		case ".lcomm":
			as.addbss(x.ident, y.ival, true)
			continue
		case ".comm":
			as.addbss(x.ident, y.ival, false)
			continue
		case ".globl":
			as.addglobal(x.ident)
			continue
		case ".extern":
		case ".quad":
			as.bytes(opQUAD, addr, uint64(x.ival))
		case ".long":
			as.bytes(opLONG, addr, uint32(x.ival))
		case ".short":
			as.bytes(opSHORT, addr, uint16(x.ival))
		case ".byte":
			as.bytes(opBYTE, addr, uint8(x.ival))
		case "addq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opADDQ, addr, 0x48, 0x01, 0xc0+x.reg*8+y.reg)
			case aINT | aREG<<8:
				switch n := x.ival; {
				case -128 <= n && n <= 127:
					as.emit(opADDQ, addr, 0x48, 0x83, 0xc0+y.reg, byte(n))
				case y.reg == rAX:
					as.emit(opADDQ, addr, 0x48, 0x05, uint32(n))
				default:
					as.emit(opADDQ, addr, 0x48, 0x81, 0xc0+y.reg, uint32(n))
				}
			case aINT | aMEM<<8:
				as.emit(opADDQ, addr, 0x48, 0x83, as.poff(y.ival)+y.reg, as.xoff(y.ival), as.xoff(x.ival))
			case aINT | aPTR<<8:
				as.addrel(opADDQ, addr)
			default:
				unk()
			}
		case "andq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opANDQ, addr, 0x48, 0x21, 0xc0+x.reg*8+y.reg)
			default:
				unk()
			}
		case "call":
			switch x.typ {
			case aREG:
				switch {
				case x.deref && x.ival == 0:
					as.emit(opCALL, addr, 0xff, 0xd0+x.reg)
				default:
					unk()
				}
			case aPTR:
				as.addrel(opCALL, addr)
			default:
				unk()
			}
		case "cld":
			as.emit(opCLD, addr, 0xfc)
		case "cmpq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opCMPQ, addr, 0x48, 0x39, 0xc0+x.reg*8+y.reg)
			default:
				unk()
			}
		case "cqo":
			as.emit(opCQO, addr, 0x48, 0x99)
		case "decq":
			switch x.typ {
			case aREG:
				as.emit(opDECQ, addr, 0x48, 0xff, 0xc8+x.reg)
			case aMEM:
				as.emit(opDECQ, addr, 0x48, 0xff, as.poff(x.ival)+8+x.reg, as.xoff(x.ival))
			case aPTR:
				as.addrel(opDECQ, addr)
			default:
				unk()
			}
		case "divq":
			switch x.typ | y.typ<<8 {
			case aREG:
				as.emit(opDIVQ, addr, 0x48, 0xf7, 0xf0+x.reg)
			default:
				unk()
			}
		case "idivq":
			switch x.typ | y.typ<<8 {
			case aREG:
				as.emit(opIDIVQ, addr, 0x48, 0xf7, 0xf8+x.reg)
			default:
				unk()
			}
		case "imulq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opIMULQ, addr, 0x48, 0xf, 0xaf, 0xc0+x.reg+8*y.reg)
			default:
				unk()
			}
		case "incq":
			switch x.typ | y.typ<<8 {
			case aREG:
				as.emit(opINCQ, addr, 0x48, 0xff, 0xc0+x.reg)
			case aMEM:
				as.emit(opINCQ, addr, 0x48, 0xff, as.poff(x.ival)+x.reg, as.xoff(x.ival))
			case aPTR:
				as.addrel(opINCQ, addr)
			default:
				unk()
			}
		case "int":
			switch x.typ | y.typ<<8 {
			case aINT:
				as.emit(opINT, addr, 0xcd, x.ival)
			default:
				unk()
			}
		case "jmp", "jne", "je", "jge", "jle", "jg", "jl", "jae", "jbe", "ja", "jb", "jz", "jnz", "jc", "jnc":
			branches := map[string]op{
				"jmp": opJMP,
				"jne": opJNE,
				"je":  opJE,
				"jge": opJGE,
				"jle": opJLE,
				"jg":  opJG,
				"jl":  opJL,
				"jae": opJAE,
				"jbe": opJBE,
				"ja":  opJA,
				"jb":  opJB,
				"jz":  opJZ,
				"jnz": opJNZ,
				"jnc": opJAE,
				"jc":  opJB,
			}
			switch x.typ {
			case aPTR:
				as.addrel(branches[lop], addr)
			case aREG:
				as.emit(opJMP, addr, 0xff, 0xe0+x.reg)
			default:
				unk()
			}
		case "leaq":
			switch x.typ | y.typ<<8 {
			case aMEM | aREG<<8:
				switch {
				case x.reg != rSP:
					as.emit(opLEAQ, addr, 0x48, 0x8d, as.poff(x.ival)+x.reg+8*y.reg, as.xoff(x.ival))
				case x.reg == rSP:
					as.emit(opLEAQ, addr, 0x48, 0x8d, as.poff(x.ival)+x.reg+8*y.reg, 0x24, as.xoff(x.ival))
				default:
					unk()
				}
			default:
				unk()
			}
		case "lodsl":
			as.emit(opLODSL, addr, 0xad)
		case "lodsq":
			as.emit(opLODSQ, addr, 0x48, 0xad)
		case "movb":
			switch x.typ | y.typ<<8 {
			case aREG | aMEM<<8:
				as.emit(opMOVB, addr, 0x88, as.poff(y.ival)+8*x.reg+y.reg, as.xoff(y.ival))
			case aPTR | aREG<<8:
				as.addrel(opMOVB, addr)
			case aMEM | aREG<<8:
				switch {
				case x.reg != rSP:
					as.emit(opMOVB, addr, 0x8a, as.poff(x.ival)+x.reg+8*y.reg, as.xoff(x.ival))
				default:
					unk()
				}
			default:
				unk()
			}
		case "movq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opMOVQ, addr, 0x48, 0x89, 0xc0+x.reg*8+y.reg)
			case aVAR | aREG<<8:
				as.addrel(opMOVQ, addr)
			case aREG | aPTR<<8:
				as.addrel(opMOVQ, addr)
			case aINT | aREG<<8:
				switch {
				case x.ival < math.MinInt32 || x.ival > math.MaxUint32:
					as.emit(opMOVQ, addr, 0x48, 0xb8+y.reg, uint64(x.ival))
				default:
					as.emit(opMOVQ, addr, 0x48, 0xc7, 0xc0+y.reg, uint32(x.ival))
				}
			case aINT | aMEM<<8:
				as.emit(opMOVQ, addr, 0x48, 0xc7, as.poff(y.ival)+y.reg, as.xoff(y.ival), uint32(x.ival))
			case aPTR | aREG<<8:
				as.addrel(opMOVQ, addr)
			case aMEM | aREG<<8:
				switch {
				case x.reg != rSP:
					as.emit(opMOVQ, addr, 0x48, 0x8b, as.poff(x.ival)+x.reg+8*y.reg, as.xoff(x.ival))
				case x.reg == rSP:
					as.emit(opMOVQ, addr, 0x48, 0x8b, as.poff(x.ival)+x.reg+8*y.reg, 0x24, as.xoff(x.ival))
				default:
					unk()
				}
			case aREG | aMEM<<8:
				switch {
				case x.reg != rSP:
					as.emit(opMOVQ, addr, 0x48, 0x89, as.poff(y.ival)+8*x.reg+y.reg, as.xoff(y.ival))
				default:
					unk()
				}
			default:
				unk()
			}
		case "negq":
			switch x.typ {
			case aREG:
				as.emit(opNEGQ, addr, 0x48, 0xf7, 0xd8+x.reg)
			default:
				unk()
			}
		case "notq":
			switch x.typ {
			case aREG:
				as.emit(opNOTQ, addr, 0x48, 0xf7, 0xd0+x.reg)
			default:
				unk()
			}
		case "orq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opORQ, addr, 0x48, 0x9, 0xc0+8*x.reg+y.reg)
			default:
				unk()
			}
		case "pushq":
			as.emit(opPUSHQ, addr, 0x50+x.reg)
		case "popq":
			as.emit(opPOPQ, addr, 0x58+x.reg)
		case "sarq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				if x.reg != rCL {
					unk()
				}
				as.emit(opSARQ, addr, 0x48, 0xd3, 0xf8+y.reg)
			default:
				unk()
			}
		case "sbbq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opSBBQ, addr, 0x48, 0x19, 0xc0+x.reg*8+y.reg)
			default:
				unk()
			}
		case "shlq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				if x.reg != rCL {
					unk()
				}
				as.emit(opSHLQ, addr, 0x48, 0xd3, 0xe0+y.reg)
			case aINT | aREG<<8:
				as.emit(opSHLQ, addr, 0x48, 0xc1, 0xe0+y.reg, byte(x.ival))
			default:
				unk()
			}
		case "shrq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				if x.reg != rCL {
					unk()
				}
				as.emit(opSHRQ, addr, 0x48, 0xd3, 0xe8+y.reg)
			case aINT | aREG<<8:
				as.emit(opSHRQ, addr, 0x48, 0xc1, 0xe8+y.reg, byte(x.ival))
			default:
				unk()
			}
		case "subq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opSUBQ, addr, 0x48, 0x29, 0xc0+x.reg*8+y.reg)
			case aINT | aMEM<<8:
				as.emit(opSUBQ, addr, 0x48, 0x83, as.poff(y.ival)+0x28+y.reg, as.xoff(y.ival), as.xoff(x.ival))
			default:
				unk()
			}
		case "xchgq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				if x.reg == 0 || y.reg == 0 {
					as.emit(opXCHGQ, addr, 0x48, 0x90+x.reg+y.reg)
				} else {
					as.emit(opXCHGQ, addr, 0x48, 0x87, 0xc0+x.reg*8+y.reg)
				}
			default:
				unk()
			}
		case "xorq":
			switch x.typ | y.typ<<8 {
			case aREG | aREG<<8:
				as.emit(opXORQ, addr, 0x48, 0x31, 0xc0+x.reg*8+y.reg)
			default:
				unk()
			}
		case "ret":
			as.emit(opRET, addr, 0xc3)
		case "syscall":
			as.emit(opSYSCALL, addr, 0xf, 0x5)
		default:
			as.errorf("unknown instruction %s", lop)
		}

		as.sect.pc++
	}
	as.line = ""

	as.fixupRelocs(as.text)
	as.fixupRelocs(as.data)
	as.fixupBSS()
}

// poff generates an x86 prefix based on
// the offset.
func (as *x86) poff(n int64) byte {
	switch {
	case n == 0:
		return 0
	case -128 <= n && n <= 127:
		return 0x40
	default:
		return 0x80
	}
}

// xoff generates the right sized type based on the offset.
func (as *x86) xoff(n int64) interface{} {
	if n == 0 {
		return nil
	}
	if -128 <= n && n <= 127 {
		return byte(int8(n))
	}
	return uint32(int32(n))
}

// relOp returns a instruction based on the offset.
// X86 can generate variable sized instruction on branches
// based on how big the offsets are.
func (as *x86) relOp(p *relocation, o int64) (code []byte, reltyp int, relname string) {
	x := p.addr[0]
	y := p.addr[1]
	l := as.fsym(x.ident)

	reltyp = lS
	relname = x.ident
	if relname == "" {
		relname = y.ident
	}
	switch p.op {
	case opJMP, opJNE, opJE, opJGE, opJLE, opJG, opJL, opJAE, opJBE, opJA, opJB, opJZ, opJNZ:
		branches := map[op]struct {
			s byte
			l []byte
		}{
			opJMP: {0xeb, []byte{0xe9}},
			opJNE: {0x75, []byte{0xf, 0x85}},
			opJE:  {0x74, []byte{0xf, 0x84}},
			opJGE: {0x7d, []byte{0xf, 0x8d}},
			opJLE: {0x7e, []byte{0xf, 0x8e}},
			opJG:  {0x7f, []byte{0xf, 0x8f}},
			opJL:  {0x7c, []byte{0xf, 0x8c}},
			opJAE: {0x73, []byte{0xf, 0x83}},
			opJBE: {0x76, []byte{0xf, 0x86}},
			opJA:  {0x77, []byte{0xf, 0x87}},
			opJB:  {0x72, []byte{0xf, 0x82}},
			opJZ:  {0x74, []byte{0xf, 0x84}},
			opJNZ: {0x75, []byte{0xf, 0x85}},
		}
		switch {
		case p.section == l.sect && l.typ == sLABEL:
			switch {
			case -128 <= o && o <= 127:
				code = []byte{branches[p.op].s, byte(int8(o))}
			default:
				code = append(code, branches[p.op].l...)
				code = append(code, byte(o), byte(o>>8), byte(o>>16), byte(o>>24))
			}
		case p.section != l.sect || l.typ == sBSS || l.typ == sUND:
			code = append(code, branches[p.op].l...)
			code = append(code, 0, 0, 0, 0)
			reltyp = lPC
		default:
			as.errorf("unknown jmp op %d", x.typ)
		}

	case opCALL:
		if l == nil {
			as.errorf("no identifier for call op")
		}
		switch l.typ {
		case sLABEL:
			if !l.exported && p.section == l.sect {
				reltyp = lN
				code = []byte{0xe8, byte(o), byte(o >> 8), byte(o >> 16), byte(o >> 24)}
				break
			}
			fallthrough
		case sUND, sBSS:
			code = []byte{0xe8, 0, 0, 0, 0}
			reltyp = lPC
		default:
			as.errorf("unknown call op %d", x.typ)
		}

	case opADDQ:
		code = []byte{0x48, 0x83, 0x4, 0x25, 0, 0, 0, 0}
		code = append(code, as.code(as.xoff(x.ival))...)
		reltyp = lS

	case opDECQ:
		code = []byte{0x48, 0xff, 0xc, 0x25, 0, 0, 0, 0}

	case opINCQ:
		code = []byte{0x48, 0xff, 0x4, 0x25, 0, 0, 0, 0}

	case opMOVB:
		switch x.typ | y.typ<<8 {
		case aPTR | aREG<<8:
			code = []byte{0x8a, 0x4 + 8*x.reg, 0x25, 0, 0, 0, 0}
		default:
			as.errorf("unknown movb op %d %d", x.typ, y.typ)
		}

	case opMOVQ:
		switch x.typ | y.typ<<8 {
		case aVAR | aREG<<8:
			code = []byte{0x48, 0xc7, 0xc0 + y.reg, 0, 0, 0, 0}
		case aREG | aPTR<<8:
			code = []byte{0x48, 0x89, 0x4 + 8*x.reg, 0x25, 0, 0, 0, 0}
		case aPTR | aREG<<8:
			code = []byte{0x48, 0x8b, 0x4 + 8*x.reg + y.reg, 0x25, 0, 0, 0, 0}
		default:
			as.errorf("unknown movq op %d %d", x.typ, y.typ)
		}

	case opQUAD:
		reltyp = lV
		code = []byte{0, 0, 0, 0, 0, 0, 0, 0}

	case opLONG:
		reltyp = lV
		code = []byte{0, 0, 0, 0}

	case opSHORT:
		reltyp = lV
		code = []byte{0, 0}

	case opBYTE:
		reltyp = lV
		code = []byte{0}

	default:
		as.errorf("unknown relocation op %v", p.op)
	}

	return
}

// adjustRel adjusts all of the offsets for labels
// and relocations. It is needed to fix the offset
// for x86 variable sized instruction.
func (as *x86) adjustRel(p *relocation, off int64) {
	for _, q := range p.labels {
		if q.pc > p.pc {
			q.off += off
		}
	}
	for _, q := range p.relocs {
		if q.pc > p.pc {
			q.off += off
		}
	}
	for i := range p.strings {
		q := p.strings[i]
		if q.pc > p.pc {
			q.off += off
		}
	}
	p.size += off
}

// fixupRelocs tries to emit the right offsets and
// correct relocations for all instructions that need it.
func (as *x86) fixupRelocs(s *section) {
	// this works on a list of variable sized instruction
	// so each variable sized instruction can later affect the offsets
	// of everyone else once it has been expanded.
	// so we need to keep generating instruction
	// whose offset is the closest and continue until we reach a fixed point.
	// An example case of where this is used:
	// L1: jz L3
	// ...code
	// L3: jnz L1
	// jz needs to know how far it needs to jump forward but
	// jnz needs to know how far it needs to jump back, but they
	// have a circular dependency so they can't move forward.
	for tries := 0; ; tries++ {
		if tries > 20 {
			as.errorf("x86 relocation did not reach a fixed point")
		}

		fixed := true
		for _, p := range s.relocs {
			x := p.addr[0]
			y := p.addr[1]
			l := as.fsym(x.ident)
			if l == nil {
				l = as.fsym(y.ident)
			}
			if l == nil {
				as.errorf("bad relocation data")
			}
			p.code, p.reltyp, p.relname = as.relOp(p, l.off-p.off-int64(len(p.code)))
			if p.isize != len(p.code) {
				as.adjustRel(p, int64(len(p.code)-p.isize))
				p.isize = len(p.code)
				fixed = false
			}
		}
		if fixed {
			break
		}
	}

	for i := 0; i < len(s.relocs); {
		p := s.relocs[i]
		x := p.addr[0]
		l := as.fsym(x.ident)

		switch p.op {
		case opCALL:
			if p.reltyp == lN {
				s.relocs = append(s.relocs[:i], s.relocs[i+1:]...)
				continue
			}
		case opJMP, opJNE, opJE, opJGE, opJLE, opJG, opJL, opJAE, opJBE, opJA, opJB, opJZ, opJNZ:
			switch l.typ {
			case sLABEL:
				s.relocs = append(s.relocs[:i], s.relocs[i+1:]...)
				continue
			}
		}

		switch p.op {
		case opADDQ:
			p.rel = p.off + 4
		case opQUAD, opLONG, opSHORT, opBYTE:
			p.rel = p.off
		default:
			p.rel = p.off + int64(len(p.code)) - 4
		}
		i++
	}
}

// fixupBSS fixes the BSS offsets after
// everything has been relocated correctly.
func (as *x86) fixupBSS() {
	as.bss.blockalign = 1
	off := int64(0)
	for _, p := range as.bss.blocks {
		if p.exported {
			continue
		}
		if p.size == 0 {
			as.errorf("invalid fixup bbs size of 0")
		}
		if n := off % p.size; p.size < 8 && n > 0 {
			off += p.size - n
		}

		p.off = off
		off += p.size
		as.bss.blockalign = int64(align2(p.size))
	}
	if as.bss.blockalign > 8 {
		as.bss.blockalign = 8
	}
}

// arg decodes an argument.
func (as *x86) arg(s string) (a addr) {
	if strings.HasPrefix(s, "'") {
		s = strings.Trim(s, "'")
		r, _ := utf8.DecodeRuneInString(s)
		a.typ = aINT
		a.ival = int64(r)
		return
	}

	ptr := true
	if strings.HasPrefix(s, "$") {
		s = s[1:]
		ptr = false
	}

	if isIdent(s) {
		a.typ = aPTR
		a.ident = s
		if !ptr {
			a.typ = aVAR
		}
		return
	}

	ival, err := strconv.ParseInt(s, 0, 64)
	if err == nil {
		a.typ = aINT
		a.ival = ival
		return
	}

	if n := strings.Index(s, "*"); n >= 0 {
		s = strings.TrimLeft(s, "*")
		a.deref = true
	}

	mem := false
	if n := strings.Index(s, "("); n >= 0 {
		if n > 0 {
			a.ival, err = strconv.ParseInt(s[:n], 0, 64)
			if err != nil {
				as.errorf("%v", err)
			}
		}
		s = s[n:]
		s = strings.TrimLeft(s, "(")
		s = strings.TrimRight(s, ")")
		mem = true
	}

	if strings.HasPrefix(s, "%") {
		p := strings.ToLower(s[1:])
		r, ok := x86regs[p]
		if ok {
			a.typ = aREG
			a.reg = r.reg
			if mem {
				a.typ = aMEM
			}
			return
		}
	}

	as.errorf("unsupported arg %q", s)
	return
}
