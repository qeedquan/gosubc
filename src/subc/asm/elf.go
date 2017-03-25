package asm

import (
	"bytes"
	"debug/elf"
	"encoding/binary"
	"fmt"
	"io"
	"sort"
	"strconv"
)

// genelf creates an ELF emitter.
func genelf(w io.Writer, prog *prog) {
	c := gelf{
		prog: prog,
		w:    w,
	}
	c.gen()
}

// self is a ELF symbol.
type self struct {
	*sym
	index int
}

// gelf is an ELF emitter.
// It will emit a shared object file.
type gelf struct {
	*prog
	w io.Writer

	symtab   *section
	strtab   *section
	shstrtab *section
	syms     map[string]*self
}

// gen generates an ELF object file.
func (c *gelf) gen() {
	sort.SliceStable(c.osyms, func(i, j int) bool {
		p, q := c.osyms[i], c.osyms[j]
		if !p.exported && q.exported {
			return true
		}
		if !q.exported && p.exported {
			return false
		}
		return p.name < q.name
	})
	c.syms = make(map[string]*self)
	for i, p := range c.osyms {
		c.syms[p.name] = &self{p, i}
	}

	c.strtab = c.genstrtab()
	c.shstrtab = c.genshstrtab()
	c.symtab = c.gensymtab()

	c.writehdr()
	c.writesection(c.text)
	c.writesection(c.data)
	c.writesection(c.symtab)
	c.writesection(c.strtab)
	c.writesection(c.shstrtab)
	c.writereloc(c.text)
	c.writereloc(c.data)
	c.writeshdr()
}

// convsym returns a ELF symbol data structure
// based on the architecture.
func (c *gelf) convsym(s elf.Symbol) interface{} {
	name, _ := strconv.ParseInt(s.Name, 0, 64)
	switch c.arch {
	case "amd64":
		return elf.Sym64{
			Name:  uint32(name),
			Info:  s.Info,
			Other: s.Other,
			Shndx: uint16(s.Section),
			Value: uint64(s.Value),
			Size:  uint64(s.Size),
		}
	case "i386":
		return elf.Sym32{
			Name:  uint32(name),
			Info:  s.Info,
			Other: s.Other,
			Shndx: uint16(s.Section),
			Value: uint32(s.Value),
			Size:  uint32(s.Size),
		}
	}
	return nil
}

// gensymtab generates a .symtab section.
// .symtab is the section where all the symbols information live.
func (c *gelf) gensymtab() *section {
	b := new(bytes.Buffer)
	binary.Write(b, c.endian, c.convsym(elf.Symbol{}))
	for i := 1; i <= 3; i++ {
		binary.Write(b, c.endian, c.convsym(elf.Symbol{
			Info:    uint8(elf.STB_LOCAL<<4) | uint8(elf.STT_SECTION),
			Section: elf.SectionIndex(i),
		}))
	}

	name := c.strtab.strings
	for i, p := range c.osyms {
		value := uint64(p.off)
		info := uint8(elf.STB_LOCAL << 4)
		if p.exported {
			info = uint8(elf.STB_GLOBAL << 4)
		}

		shndx := uint16(0)
		if p.sect != nil {
			switch p.sect.name {
			case ".text":
				shndx = 1
			case ".data":
				shndx = 2
			case ".bss":
				shndx = 3
				info |= uint8(elf.STT_OBJECT)
			default:
				errf("unknown section name %q", p.sect.name)
			}
			if !p.allocated {
				info |= uint8(elf.STT_OBJECT)
				shndx = uint16(elf.SHN_COMMON)
				value = uint64(align2(p.size))
				if value > 0x10 {
					value = 0x10
				}
			}
		}

		binary.Write(b, c.endian, c.convsym(elf.Symbol{
			Name:    fmt.Sprint(name[i+1].off),
			Value:   value,
			Size:    uint64(p.size),
			Info:    info,
			Section: elf.SectionIndex(shndx),
		}))
	}

	s := newsection(".symtab")
	s.bytes(b.Bytes())
	return s
}

// genstrtab generates a .strtab section
// .strtab is a section that contains all
// the strings used in the ELF object.
// It does not do string merging on the strings.
func (c *gelf) genstrtab() *section {
	s := newsection(".strtab")
	s.strz("")
	for _, p := range c.osyms {
		s.strz(p.name)
	}
	return s
}

// genshstrtab generates a .shstrtab section
// .shstrtab section contains the strings
// for the ELF header section names.
func (c *gelf) genshstrtab() *section {
	s := newsection(".shstrtab")
	s.strz("")
	s.strz(".text")
	s.strz(".data")
	s.strz(".bss")
	s.strz(".symtab")
	s.strz(".strtab")
	s.strz(".shstrtab")
	if len(c.text.relocs) > 0 {
		s.strz(".rela.text")
	}
	if len(c.data.relocs) > 0 {
		s.strz(".rela.data")
	}
	return s
}

// writehdr writes the ELF header information.
func (c *gelf) writehdr() {
	shoff := c.text.size + c.data.size + c.symtab.size + c.strtab.size + c.shstrtab.size
	shnum := 7
	if len := len(c.text.relocs); len > 0 {
		shoff += int64(len * 0x18)
		shnum++
	}
	if len := len(c.data.relocs); len > 0 {
		shoff += int64(len * 0x18)
		shnum++
	}

	switch c.arch {
	case "amd64":
		c.write(elf.Header64{
			Ident:     [elf.EI_NIDENT]byte{0x7f, 'E', 'L', 'F', 0x2, 0x1, 0x1},
			Type:      1,
			Machine:   0x3e,
			Version:   1,
			Shoff:     0x40 + uint64(shoff),
			Ehsize:    0x40,
			Shentsize: 0x40,
			Shnum:     uint16(shnum),
			Shstrndx:  6,
		})
	case "i386":
		c.write(elf.Header32{
			Ident:     [elf.EI_NIDENT]byte{0x7f, 'E', 'L', 'F', 0x1, 0x1, 0x1},
			Type:      1,
			Machine:   0x3,
			Version:   1,
			Shoff:     0x34 + uint32(shoff),
			Ehsize:    0x34,
			Shentsize: 0x28,
			Shnum:     uint16(shnum),
			Shstrndx:  6,
		})
	}
}

// writeshdr writes the ELF section headers.
func (c *gelf) writeshdr() {
	var (
		off         int64
		rsz, ralign int
	)
	switch c.arch {
	case "amd64":
		off = 0x40
		rsz = 0x18
		ralign = 8
	case "i386":
		off = 0x32
		rsz = 0xc
		ralign = 4
	}

	// null
	c.writeshdra(elf.SectionHeader{})

	// text
	c.writeshdra(elf.SectionHeader{
		Name:      ".text",
		Type:      elf.SHT_PROGBITS,
		Flags:     elf.SHF_ALLOC | elf.SHF_EXECINSTR,
		Size:      uint64(c.text.size),
		Offset:    uint64(off),
		Addralign: 1,
	})
	off += c.text.size

	// data
	c.writeshdra(elf.SectionHeader{
		Name:      ".data",
		Type:      elf.SHT_PROGBITS,
		Flags:     elf.SHF_ALLOC | elf.SHF_WRITE,
		Size:      uint64(c.data.size),
		Offset:    uint64(off),
		Addralign: 1,
	})
	off += c.data.size

	// bss
	c.writeshdra(elf.SectionHeader{
		Name:      ".bss",
		Type:      elf.SHT_NOBITS,
		Flags:     elf.SHF_ALLOC | elf.SHF_WRITE,
		Offset:    uint64(off),
		Size:      uint64(c.bss.blocksize),
		Addralign: uint64(c.bss.blockalign),
	})

	// symtab
	info := uint32(0)
	for i, p := range c.osyms {
		if p.exported {
			info = 4 + uint32(i)
			break
		}
	}
	c.writeshdra(elf.SectionHeader{
		Name:      ".symtab",
		Type:      elf.SHT_SYMTAB,
		Offset:    uint64(off),
		Size:      uint64(0x18 * (len(c.osyms) + 4)),
		Entsize:   0x18,
		Link:      5,
		Info:      info,
		Addralign: 8,
	})
	off += c.symtab.size

	// strtab
	c.writeshdra(elf.SectionHeader{
		Name:      ".strtab",
		Type:      elf.SHT_STRTAB,
		Offset:    uint64(off),
		Size:      uint64(c.strtab.size),
		Addralign: 1,
	})
	off += c.strtab.size

	// shstrtab
	c.writeshdra(elf.SectionHeader{
		Name:      ".shstrtab",
		Type:      elf.SHT_STRTAB,
		Offset:    uint64(off),
		Size:      uint64(c.shstrtab.size),
		Addralign: 1,
	})
	off += c.shstrtab.size

	// .rela.text
	if len := len(c.text.relocs); len > 0 {
		c.writeshdra(elf.SectionHeader{
			Name:      ".rela.text",
			Type:      elf.SHT_RELA,
			Flags:     elf.SHF_INFO_LINK,
			Link:      4,
			Offset:    uint64(off),
			Size:      uint64(len * rsz),
			Info:      1,
			Addralign: uint64(ralign),
			Entsize:   uint64(rsz),
		})
	}

	// .rela.data
	if len := len(c.data.relocs); len > 0 {
		c.writeshdra(elf.SectionHeader{
			Name:      ".rela.data",
			Type:      elf.SHT_RELA,
			Flags:     elf.SHF_INFO_LINK,
			Link:      4,
			Offset:    uint64(off),
			Size:      uint64(len * rsz),
			Info:      2,
			Addralign: uint64(ralign),
			Entsize:   uint64(rsz),
		})
	}
}

// writeshdra writes the section header
// for a specific architecture.
func (c *gelf) writeshdra(h elf.SectionHeader) {
	name := int64(0)
	switch h.Name {
	case ".text":
		name = 1
	case ".data":
		name = 2
	case ".bss":
		name = 3
	case ".symtab":
		name = 4
	case ".strtab":
		name = 5
	case ".shstrtab":
		name = 6
	case ".rela.text":
		name = 7
	case ".rela.data":
		name = 8
	}
	if name >= int64(len(c.shstrtab.strings)) {
		errf("no name index for section header")
	}
	name = c.shstrtab.strings[name].off

	switch c.arch {
	case "amd64":
		c.write(elf.Section64{
			Name:      uint32(name),
			Type:      uint32(h.Type),
			Flags:     uint64(h.Flags),
			Addr:      uint64(h.Addr),
			Off:       uint64(h.Offset),
			Size:      uint64(h.Size),
			Link:      uint32(h.Link),
			Info:      uint32(h.Info),
			Addralign: uint64(h.Addralign),
			Entsize:   uint64(h.Entsize),
		})
	case "i386":
		c.write(elf.Section32{
			Name:      uint32(name),
			Type:      uint32(h.Type),
			Flags:     uint32(h.Flags),
			Addr:      uint32(h.Addr),
			Off:       uint32(h.Offset),
			Size:      uint32(h.Size),
			Link:      uint32(h.Link),
			Info:      uint32(h.Info),
			Addralign: uint32(h.Addralign),
			Entsize:   uint32(h.Entsize),
		})
	}
}

func (c *gelf) write(v interface{}) {
	binary.Write(c.w, c.endian, v)
}

func (c *gelf) writesection(s *section) {
	for _, i := range s.inst {
		c.w.Write(i.code)
	}
}

// writereloc writes the relocation information.
func (c *gelf) writereloc(s *section) {
	if len(s.relocs) == 0 {
		return
	}

	rtyp := [][3]uint64{
		{uint64(elf.R_X86_64_32S), uint64(elf.R_X86_64_PC32), uint64(elf.R_X86_64_64)},
		{uint64(elf.R_386_32), uint64(elf.R_386_PC32), uint64(elf.R_386_32)},
	}
	var ri int
	switch c.arch {
	case "amd64":
		ri = 0
	case "i386":
		ri = 1
	}

	for _, p := range s.relocs {
		var info uint64
		var addend int64

		y := c.syms[p.relname]

		switch y.typ {
		case sBSS:
			if !y.allocated {
				info = uint64(y.index) + 4
			} else {
				info = 3
				addend = y.off
			}

		default:
			info = uint64(y.index + 4)
			if !y.exported {
				switch y.sect {
				case c.text:
					info = 1
				case c.data:
					info = 2
				}
				addend = y.off
			}
			switch p.op {
			case opCALL, opJMP, opJNE, opJE, opJGE, opJLE, opJG, opJL,
				opJAE, opJBE, opJA, opJB, opJZ, opJNZ:
				addend -= 4
			}
		}
		info <<= 32

		switch p.reltyp {
		case lS:
			info |= rtyp[ri][0]
		case lPC:
			info |= rtyp[ri][1]
		case lV:
			info |= rtyp[ri][2]
		default:
			errf("unknown relocation type %d", p.reltyp)
		}

		if info&0xffffffff == 0 {
			errf("specified %d but got no relocation type", p.reltyp)
		}

		switch c.arch {
		case "amd64":
			c.write(elf.Rela64{
				Info:   uint64(info),
				Off:    uint64(p.rel),
				Addend: int64(addend),
			})
		case "i386":
			c.write(elf.Rela32{
				Info:   uint32(info),
				Off:    uint32(p.rel),
				Addend: int32(addend),
			})
		}
	}
}
