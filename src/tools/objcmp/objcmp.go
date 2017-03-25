package main

import (
	"bytes"
	"debug/elf"
	"encoding/binary"
	"errors"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"sort"
	"strings"
)

var (
	status = 0
)

func main() {
	log.SetFlags(0)
	log.SetPrefix("")
	parseFlags()

	f1, t1, err := open(flag.Arg(0))
	ck(err)

	f2, t2, err := open(flag.Arg(1))
	ck(err)

	if t1 != t2 {
		log.Fatal("file types don't match, %q is not %q", t1, t2)
	}

	fmt.Printf("comparing %q and %q\n", flag.Arg(0), flag.Arg(1))
	switch t1 {
	case "elf":
		c := celf{
			f1: f1.(*elf.File),
			f2: f2.(*elf.File),
		}
		c.compare()
	}

	if status == 0 {
		fmt.Println("no mismatch found")
	}
	os.Exit(status)
}

func parseFlags() {
	flag.Usage = usage
	flag.Parse()
	if flag.NArg() != 2 {
		usage()
	}
}

func usage() {
	fmt.Fprintf(os.Stderr, "usage: %s [options] <file1> <file2>\n", os.Args[0])
	flag.PrintDefaults()
	os.Exit(2)
}

func ck(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func ek(err error) bool {
	if err != nil {
		errf("%v", err)
		return true
	}
	return false
}

func errf(format string, args ...interface{}) {
	fmt.Fprintf(os.Stderr, format+"\n", args...)
	status = 1
}

func open(name string) (exe interface{}, typ string, err error) {
	exe, err = elf.Open(name)
	if err == nil {
		typ = "elf"
		return
	}

	err = &os.PathError{"open", name, errors.New("unknown file format")}
	return
}

type celf struct {
	f1, f2 *elf.File
}

func (c *celf) compare() {
	x, y := c.f1.FileHeader, c.f2.FileHeader
	if x != y {
		errf("file header mismatch %v %v", x, y)
	}
	c.sections()
	c.raw(".text")
	c.raw(".data")
	c.strz(".strtab")
	c.symtab()
	c.rela(".rela.text")
	c.rela(".rela.data")
}

func (c *celf) sections() {
	var n1, n2 []string
	for _, s := range c.f1.Sections {
		n1 = append(n1, s.Name)
	}
	for _, s := range c.f2.Sections {
		n2 = append(n2, s.Name)
	}
	sort.Strings(n1)
	sort.Strings(n2)

	for i := 0; ; i++ {
		if i >= len(n1) && i >= len(n2) {
			break
		}

		oob := false
		if i >= len(n2) {
			errf("file #1 has section %q, but file #2 doesn't", n1[i])
			oob = true
		}
		if i >= len(n1) {
			errf("file #2 has section %q, but file #1 doesn't", n2[i])
			oob = true
		}
		if oob {
			continue
		}

		s1 := c.f1.Section(n1[i])
		s2 := c.f2.Section(n2[i])
		if s1 == nil || s2 == nil {
			continue
		}

		check := func(name string, v1, v2 interface{}) {
			if v1 != v2 {
				errf("section %q: entry %q differ %v %v", n1[i], name, v1, v2)
			}
		}
		check("type", s1.Type, s2.Type)
		check("flags", s1.Flags, s2.Flags)
		check("entsize", s1.Entsize, s2.Entsize)
		check("info", s1.Info, s2.Info)
		check("addralign", s1.Addralign, s2.Addralign)
		if n1[i] != ".shstrtab" && n1[i] != ".strtab" {
			check("size", s1.Size, s2.Size)
		}
	}
}

func (c *celf) raw(name string) {
	t1 := c.f1.Section(name)
	t2 := c.f2.Section(name)
	if t1 == nil || t2 == nil {
		errf("no %s sections in one of the files", name)
		return
	}

	d1, e1 := t1.Data()
	d2, e2 := t2.Data()
	if ek(e1) || ek(e2) {
		return
	}
	for i := 0; ; i++ {
		if i >= len(d1) && i >= len(d2) {
			break
		}

		oob := false
		if i >= len(d2) {
			errf("%s #1 contains %x at %x", name, d1[i], i)
			oob = true
		}
		if i >= len(d1) {
			errf("%s #2 contains %x at %x", name, d2[i], i)
			oob = true
		}
		if oob {
			continue
		}

		if d1[i] != d2[i] {
			errf("%s differs at %x containing %x %x", name, i, d1[i], d2[i])
		}
	}
}

func (c *celf) strz(name string) {
	t1 := c.f1.Section(name)
	t2 := c.f2.Section(name)
	if t1 == nil || t2 == nil {
		errf("no %s sections in one of the files", name)
		return
	}

	d1, e1 := t1.Data()
	d2, e2 := t2.Data()
	if ek(e1) || ek(e2) {
		return
	}

	// gnu assembler does string merging, and we don't
	// so do not error out, just print them
	if len(d1) != len(d2) {
		fmt.Println("string section length mismatch")
	}

	s1 := strings.SplitN(string(d1), "\x00", -1)
	s2 := strings.SplitN(string(d2), "\x00", -1)
	sort.Strings(s1)
	sort.Strings(s2)
	for i := 0; ; i++ {
		if i >= len(s1) && i >= len(s2) {
			break
		}
		if i >= len(s1) {
			fmt.Printf("string #2 %d %q\n", i, s2[i])
			continue
		}
		if i >= len(s2) {
			fmt.Printf("string #1 %d %q\n", i, s1[i])
			continue
		}
		if s1[i] != s2[i] {
			fmt.Printf("string mismatch %d %q %q\n", i, s1[i], s2[i])
		}
	}
}

func (c *celf) symtab() {
	s1, err := c.f1.Symbols()
	if ek(err) {
		return
	}
	s2, err := c.f2.Symbols()
	if ek(err) {
		return
	}
	c.sdiff(s1, s2)

	d1, err := c.f1.DynamicSymbols()
	d2, xerr := c.f2.DynamicSymbols()
	if err != nil && xerr != nil {
		return
	}
	if ek(err) || ek(xerr) {
		return
	}
	c.sdiff(d1, d2)
}

func (c *celf) sdiff(s1, s2 []elf.Symbol) {
	sort.SliceStable(s1, func(i, j int) bool {
		i1 := elf.SymBind((s1[i].Info >> 4) & 0xf)
		i2 := elf.SymBind((s1[j].Info >> 4) & 0xf)
		if i1 == elf.STB_GLOBAL && i2 != elf.STB_GLOBAL {
			return true
		}
		return s1[i].Name < s1[j].Name
	})

	sort.SliceStable(s2, func(i, j int) bool {
		i1 := elf.SymBind((s2[i].Info >> 4) & 0xf)
		i2 := elf.SymBind((s2[j].Info >> 4) & 0xf)
		if i1 == elf.STB_GLOBAL && i2 != elf.STB_GLOBAL {
			return true
		}
		return s2[i].Name < s2[j].Name
	})

	for i := 0; ; i++ {
		if i >= len(s1) && i >= len(s2) {
			break
		}

		oob := false
		if i >= len(s2) {
			errf("symtab #1 %v", s1[i])
			oob = true
		}
		if i >= len(s1) {
			errf("symtab #2 %v", s2[i])
			oob = true
		}
		if oob {
			continue
		}

		x, y := s1[i], s2[i]
		s, t := c.f1.Sections, c.f2.Sections
		n, m := int(x.Section), int(y.Section)
		in := n < len(s) && m < len(t)

		switch {
		case x.Name != y.Name,
			x.Info != y.Info,
			x.Other != y.Other,
			x.Value != y.Value,
			x.Size != y.Size,
			(in && s[n].Name != t[m].Name) || (!in && n != m):

			errf("symtab mismatch: \n\t%#v\n\t%#v", s1[i], s2[i])
			errf("section %s %s\n", s[n].Name, t[m].Name)
		}
	}
}

func (c *celf) rela(name string) {
	s1 := c.f1.Section(name)
	s2 := c.f2.Section(name)
	if s1 == nil && s2 == nil {
		return
	}

	if s1 == nil || s2 == nil {
		errf("one binary contains %s but not the other", name)
		return
	}

	d1, err := s1.Data()
	d2, xerr := s2.Data()
	if ek(err) || ek(xerr) {
		return
	}

	if len(d1) != len(d2) {
		errf("section size mismatch")
	}

	b1 := bytes.NewReader(d1)
	b2 := bytes.NewReader(d2)

	p1, err := c.f1.Symbols()
	p2, xerr := c.f2.Symbols()
	if ek(err) || ek(xerr) {
		return
	}

	var r1, r2 []elf.Rela64
	for {
		var (
			v1, v2    elf.Rela64
			err, xerr error
		)
		switch c.f1.Class {
		case elf.ELFCLASS64:
			err = binary.Read(b1, binary.LittleEndian, &v1)
			xerr = binary.Read(b2, binary.LittleEndian, &v2)

		case elf.ELFCLASS32:
			var x1, x2 elf.Rela32
			err = binary.Read(b1, binary.LittleEndian, &x1)
			xerr = binary.Read(b2, binary.LittleEndian, &x2)
			v1 = elf.Rela64{uint64(x1.Off), uint64(x1.Info), int64(x1.Addend)}
			v2 = elf.Rela64{uint64(x2.Off), uint64(x2.Info), int64(x2.Addend)}
		}
		r1 = append(r1, v1)
		r2 = append(r2, v2)

		if err == io.EOF && xerr == io.EOF {
			break
		}
		if ek(err) || ek(xerr) {
			return
		}
	}

	sort.SliceStable(r1, func(i, j int) bool {
		return r1[i].Off < r1[j].Off
	})
	sort.SliceStable(r2, func(i, j int) bool {
		return r2[i].Off < r2[j].Off
	})

	for i := range r1 {
		v1 := r1[i]
		v2 := r2[i]
		i1 := int64(v1.Info >> 32)
		i2 := int64(v2.Info >> 32)
		if c.f1.Class == elf.ELFCLASS32 {
			i1 = int64(v1.Info >> 16)
			i2 = int64(v2.Info >> 16)
		}

		if i1 == 0 {
			i1 = 1
		}
		if i2 == 0 {
			i2 = 1
		}

		if v1.Off != v2.Off || v1.Addend != v2.Addend ||
			v1.Info&0xffffffff != v2.Info&0xffffffff || p1[i1-1].Name != p2[i2-1].Name {
			errf("rela mismatch\n\t%#v\n\t%#v", v1, v2)
			errf("\t%q %q\n", p1[i1-1].Name, p2[i2-1].Name)
		}
	}
}
