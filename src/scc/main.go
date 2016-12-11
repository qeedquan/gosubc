package main

import (
	"bytes"
	"flag"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
	"sort"
	"strings"

	"subc/ast"
	"subc/compile"
	"subc/compile/arch"
	"subc/compile/arch/amd64"
	"subc/compile/arch/arm6"
	"subc/compile/arch/darwinamd64"
	"subc/compile/arch/i386"
	"subc/parse"
	"subc/scan"
	"subc/types"
)

func main() {
	os.Exit(build())
}

func build() int {
	var err error
	var objFiles []string

	exitStatus := 0
	for i := 0; i < flag.NArg(); i++ {
		name := flag.Arg(i)
		switch {
		case dumping():
			err = dump(name)

		default:
			objFile := name
			if flag.NArg() == 1 && flags.Output != "" && flags.CompileOnly {
				objFile = flags.Output
			} else {
				os.MkdirAll(flags.TempDir, 0755)
				ext := filepath.Ext(name)
				objFile = name[:len(name)-len(ext)] + ".o"
				if flags.TempDir != "" {
					objFile = filepath.Join(flags.TempDir, filepath.Base(objFile))
				}
			}
			name = filepath.Clean(name)
			objFile = filepath.Clean(objFile)
			if flags.RemoveOnFinish && !flags.CompileOnly {
				defer os.Remove(objFile)
			}

			err = makeObj(name, objFile)
			if err == nil && !flags.PrintAsm {
				objFiles = append(objFiles, objFile)
			}
		}

		if err != nil {
			fmt.Fprintln(os.Stderr, err)
			exitStatus = 1
		}
	}

	if dumping() || flags.CompileOnly || flags.PrintAsm {
		return exitStatus
	}

	err = linkObjs(flags.Output, objFiles...)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		exitStatus = 1
	}

	return exitStatus
}

func newScanner(name string) (*scan.Scanner, error) {
	reader, err := scan.OpenFile(name)
	if err != nil {
		return nil, err
	}

	scanConfig := scan.DefaultConfig
	scanConfig.IncludePaths = flags.Includes
	scanner := scan.New(scanConfig, name, reader)
	return scanner, nil
}

func parseAndTypecheck(scanner *scan.Scanner, emitter *arch.Emitter) (*ast.Prog, *types.Info, error) {
	predecl := true
	if flags.Compat {
		predecl = false
	}
	parseConfig := parse.Config{MaxErrors: flags.MaxErrors, Predecl: predecl}
	prog, err := parse.Parse(parseConfig, scanner)
	if err != nil {
		return prog, nil, err
	}

	typeConfig := types.Config{Sizes: emitter.Sizes, MaxErrors: flags.MaxErrors}
	info, err := types.Check(typeConfig, prog)
	return prog, info, err
}

func newArchEmitter(w io.Writer) (*arch.Emitter, error) {
	var emitter *arch.Emitter
	switch flags.Arch {
	case "amd64":
		if flags.OS == "darwin" {
			emitter = darwinamd64.NewEmitter(w)
		} else {
			emitter = amd64.NewEmitter(w)
		}

	case "i386":
		emitter = i386.NewEmitter(w)

	case "arm6":
		emitter = arm6.NewEmitter(w)
	}

	if emitter != nil {
		return emitter, nil
	}

	return nil, fmt.Errorf("unknown architecture %v", flags.Arch)
}

func makeObj(input, output string) error {
	scanner, err := newScanner(input)
	if err != nil {
		return err
	}

	buf := new(bytes.Buffer)
	emitter, err := newArchEmitter(buf)
	if err != nil {
		return err
	}

	prog, info, err := parseAndTypecheck(scanner, emitter)
	if err != nil {
		return err
	}

	compileConfig := compile.Config{Emitter: emitter, MaxErrors: flags.MaxErrors}
	compile.Compile(compileConfig, prog, info)

	if flags.PrintAsm {
		fmt.Println(buf.String())
		return nil
	}

	as := os.Getenv("AS")
	if as == "" {
		as = "as"
	}

	cmdErr := new(bytes.Buffer)
	cmdOut := new(bytes.Buffer)

	cmd := exec.Command(as, "-o", output)
	cmd.Stdin = buf
	cmd.Stderr = cmdErr
	cmd.Stdout = cmdOut
	err = cmd.Run()

	printAsmOutput(os.Stderr, input, cmdErr)
	printAsmOutput(os.Stdout, input, cmdOut)

	if err != nil {
		return err
	}

	return nil
}

func printAsmOutput(w io.Writer, name string, buf *bytes.Buffer) {
	lines := strings.Split(buf.String(), "\n")
	for len(lines) > 0 {
		if strings.TrimSpace(lines[0]) == "" {
			lines = lines[1:]
		} else {
			break
		}
	}

	lp := -1
	for i := 1; i < len(lines)-1; i++ {
		j := 0
		for ; ; j++ {
			if j >= len(lines[i-1]) || j >= len(lines[i]) {
				break
			}

			if lines[i-1][j] != lines[i][j] {
				break
			}
		}

		if lp < 0 || j < lp {
			lp = j
		}
	}

	if lp < 0 {
		lp = 0
	}

	for _, line := range lines {
		fmt.Fprintf(w, "%s: %s\n", name, line[lp:])
	}
}

func linkObjs(output string, objFiles ...string) error {
	if len(objFiles) == 0 {
		return nil
	}

	ld := os.Getenv("LD")
	if ld == "" {
		ld = "ld"
	}

	runtimeDir := filepath.Join(flags.RuntimeDir, flags.Arch, flags.OS)
	args := []string{"-o", output}
	args = append(args, filepath.Clean(filepath.Join(runtimeDir, "crt0.o")))
	args = append(args, objFiles...)
	args = append(args, filepath.Clean(filepath.Join(runtimeDir, "libscc.a")))

	cmd := exec.Command(ld, args...)
	cmd.Stderr = os.Stderr
	cmd.Stdout = os.Stdout
	return cmd.Run()
}

func dump(name string) error {
	scanner, err := newScanner(name)
	if err != nil {
		return err
	}
	defer scanner.Close()

	if flags.DumpTokens {
		fmt.Println()
		for tok := range scanner.Tokens {
			fmt.Printf("%v: %v %q\n", tok.Pos, tok.Type, tok.Text)
		}
		fmt.Println()

		scanner, err = newScanner(name)
		if err != nil {
			return err
		}
		defer scanner.Close()
	}

	if !flags.DumpAST && !flags.DumpTypes {
		return nil
	}

	emitter, err := newArchEmitter(ioutil.Discard)
	if err != nil {
		return err
	}

	prog, info, err := parseAndTypecheck(scanner, emitter)
	if prog != nil && flags.DumpAST {
		fmt.Println()
		ast.Print(prog)
		fmt.Println()
	}

	if info != nil && flags.DumpTypes {
		fmt.Println()
		fmt.Println("Defs and Uses of each named object:")

		usesByObj := make(map[types.Object][]string)
		for id, obj := range info.Uses {
			pos := fmt.Sprintf("%v", id.Pos)
			usesByObj[obj] = append(usesByObj[obj], pos)
		}

		var items []string
		for obj, uses := range usesByObj {
			sort.Strings(uses)
			item := fmt.Sprintf("%s:\n defined at %s\n  used at %s",
				types.ObjectString(obj), obj.Pos(), strings.Join(uses, ", "))
			items = append(items, item)
		}
		sort.Strings(items)
		fmt.Println(strings.Join(items, "\n"))
		fmt.Println()

		fmt.Println("Types and Values of each expression:")
		items = nil
		for expr, tv := range info.Types {
			var buf bytes.Buffer

			tvstr := tv.Type.String()
			if tv.Value != nil {
				tvstr += " = " + tv.Value.String()
			}

			fmt.Fprintf(&buf, "%v | %-19s | %s", expr.Span().Start, types.ExprString(expr), tvstr)
			items = append(items, buf.String())
		}
		sort.Strings(items)
		fmt.Println(strings.Join(items, "\n"))
		fmt.Println()
	}

	return err
}
