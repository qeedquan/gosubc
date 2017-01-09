package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"strings"
)

type MultiFlag []string

func (m *MultiFlag) String() string {
	return fmt.Sprint(*m)
}

func (m *MultiFlag) Set(s string) error {
	*m = append(*m, s)
	return nil
}

var flags struct {
	Includes       MultiFlag
	Defines        MultiFlag
	UseCpp         bool
	CompileOnly    bool
	PrintAsm       bool
	RemoveOnFinish bool
	Profile        string
	Output         string
	TempDir        string
	MaxErrors      int

	Arch       string
	OS         string
	RootDir    string
	RuntimeDir string

	DumpCpp    bool
	DumpTokens bool
	DumpAST    bool
	DumpTypes  bool

	Compat bool
}

func init() {
	flag.Var(&flags.Includes, "I", "include paths, also settable via SCCINC environment variable")
	flag.Var(&flags.Defines, "D", "define a macro of the form macro=expansion")
	flag.BoolVar(&flags.UseCpp, "cpp", false, "use external C preprocessor, settable via CPP environment variable")
	flag.BoolVar(&flags.CompileOnly, "c", false, "compile only")
	flag.BoolVar(&flags.PrintAsm, "S", false, "print asm only")
	flag.BoolVar(&flags.RemoveOnFinish, "R", true, "remove generated files on finish")
	flag.StringVar(&flags.Output, "o", "", "output file (for one file input only)")
	flag.StringVar(&flags.TempDir, "T", "", "temporary directory to use for work")
	flag.StringVar(&flags.Profile, "profile", "", "generate cpu profiling output to file")
	flag.IntVar(&flags.MaxErrors, "errors", 10, "max errors (use a number <= 0 for all the errors) ")

	theArch := runtime.GOARCH
	theOS := runtime.GOOS
	if theArch == "arm" {
		theArch = "arm6"
	}

	flag.StringVar(&flags.Arch, "arch", theArch, "specify machine architecture to compile for [amd64 | i386 | arm6]")
	flag.StringVar(&flags.OS, "os", theOS, "specify os to compile for [linux | darwin]")
	flag.StringVar(&flags.RootDir, "root", os.Getenv("SCCROOT"), "specify the root directory, also settable via SCCROOT environment variable")

	flag.BoolVar(&flags.DumpCpp, "E", false, "dump preprocessor text")
	flag.BoolVar(&flags.DumpTokens, "dump-tokens", false, "dump lexical tokens for debugging")
	flag.BoolVar(&flags.DumpAST, "dump-ast", false, "dump ast tree for debugging")
	flag.BoolVar(&flags.DumpTypes, "dump-types", false, "dump types for debugging")
	flag.BoolVar(&flags.Compat, "compat", false, "compatibility mode with the scc compiler")

	flag.Usage = usage
	flag.Parse()
	if flag.NArg() == 0 {
		usage()
	}

	if dumping() {
		flags.MaxErrors = 0
	}

	if flags.Output == "" && !flags.CompileOnly {
		flags.Output = "a.out"
	}

	flags.RuntimeDir = filepath.Join(flags.RootDir, "runtime")
	flags.Includes = append(flags.Includes, filepath.Join(flags.RuntimeDir, "include"))
	flags.Includes = append(flags.Includes, filepath.Join(flags.RuntimeDir, flags.Arch, "include"))

	includes := os.Getenv("SCCINC")
	if includes != "" {
		for _, include := range strings.Split(includes, ":") {
			flags.Includes = append(flags.Includes, include)
		}
	}
}

func usage() {
	fmt.Fprintln(os.Stderr, os.Args[0]+" usage: [options] file ...")
	flag.PrintDefaults()
	os.Exit(0)
}

func dumping() bool {
	return flags.DumpCpp || flags.DumpTokens || flags.DumpAST || flags.DumpTypes
}
