package main

import (
	"flag"
	"fmt"
	"os"
	"runtime"
)

var flags struct {
	Output string
	Arch   string
	OS     string
}

func init() {
	flag.StringVar(&flags.Output, "o", "", "output file")

	theArch := runtime.GOARCH
	theOS := runtime.GOOS
	if theArch == "arm" {
		theArch = "arm6"
	}
	flag.StringVar(&flags.Arch, "arch", theArch, "specify machine architecture to compile for [amd64]")
	flag.StringVar(&flags.OS, "os", theOS, "specify os to compile for [linux]")

	flag.Usage = usage
	flag.Parse()
}

func usage() {
	fmt.Fprintln(os.Stderr, "usage:", os.Args[0], "[options] [file]")
	flag.PrintDefaults()
	os.Exit(0)
}
