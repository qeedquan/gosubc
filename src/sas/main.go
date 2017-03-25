package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"

	"subc/asm"
)

var (
	status = 0
)

func main() {
	log.SetPrefix("")
	log.SetFlags(0)

	var (
		input string
		src   []byte
		err   error
	)
	if flag.NArg() < 1 {
		input = "<stdin>"
		src, err = ioutil.ReadAll(os.Stdin)
	} else {
		input = flag.Arg(0)
		src, err = ioutil.ReadFile(input)
	}
	ck(err)

	output := flags.Output
	if output == "" {
		if input == "<stdin>" {
			output = "a.out"
		} else {
			output = filepath.Base(input)
			ext := filepath.Ext(output)
			if strings.ToLower(ext) == ".o" {
				output += ".o"
			} else {
				output = output[:len(output)-len(ext)] + ".o"
			}
		}
	}

	fd, err := os.Create(output)
	ck(err)

	err = asm.Assemble(flags.Arch, flags.OS, input, fd, src)
	if ek(err) {
		os.Remove(output)
	}
	ck(fd.Close())
	os.Exit(status)
}

func ck(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func ek(err error) bool {
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		status = 1
		return true
	}
	return false
}
