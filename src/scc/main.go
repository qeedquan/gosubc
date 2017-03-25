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
	"runtime"
	"runtime/pprof"
	"sort"
	"strings"
	"text/scanner"

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

	if flags.CpuProfile != "" {
		f, err := os.Create(flags.CpuProfile)
		if err != nil {
			fmt.Fprintln(os.Stderr, "could not generate cpu profile output:", err)
		} else {
			pprof.StartCPUProfile(f)
			defer pprof.StopCPUProfile()
		}
	}
	if flags.MemProfile != "" {
		f, err := os.Create(flags.MemProfile)
		if err != nil {
			fmt.Fprintln(os.Stderr, "could not generate memory profile output:", err)
		} else {
			defer func() {
				runtime.GC()
				err := pprof.WriteHeapProfile(f)
				if err != nil {
					fmt.Fprintln(os.Stderr, "could not write memory profile:", err)
				}
				f.Close()
			}()
		}
	}

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
				if strings.ToLower(ext) == ".o" {
					objFile = name + ".o"
				} else {
					objFile = name[:len(name)-len(ext)] + ".o"
				}
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

func getCmdArgs(env, def string) []string {
	cmd := os.Getenv(env)
	if cmd == "" {
		cmd = def
	}
	return strings.Fields(cmd)
}

func newScanner(name string) (*scan.Scanner, error) {
	var (
		reader scan.Reader
		err    error
	)
	if flags.UseCpp {
		args := getCmdArgs("CPP", "cpp")
		for _, include := range flags.Includes {
			args = append(args, fmt.Sprintf("-I%s", include))
		}
		args = append(args, name)

		cmd := exec.Command(args[0], args[1:]...)
		cmd.Stderr = os.Stderr
		buf, err := cmd.Output()
		if err != nil {
			return nil, err
		}
		reader = scan.StringReader(scanner.Position{
			Filename: name,
			Line:     1,
			Column:   1,
		}, string(buf), false)
	} else {
		reader, err = scan.OpenFile(name)
		if err != nil {
			return nil, err
		}
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
	if err = checkFrontEndError(err); err != nil {
		return prog, nil, err
	}

	typeConfig := types.Config{Sizes: emitter.Sizes, MaxErrors: flags.MaxErrors}
	info, err := types.Check(typeConfig, prog)
	return prog, info, checkFrontEndError(err)
}

func checkFrontEndError(err error) error {
	l, _ := err.(*scan.ErrorList)
	if l == nil {
		return err
	}
	if flags.NoWarnings {
		l.NumErrors += l.NumWarnings
		l.NumWarnings = 0
		for i := range l.Messages {
			l.Messages[i].Warning = false
		}
	}
	if l.NumErrors > 0 {
		return err
	}

	for _, m := range l.Messages {
		fmt.Fprintln(os.Stderr, m)
	}
	return nil
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
	err = compile.Compile(compileConfig, prog, info)
	if err != nil {
		return err
	}

	if flags.PrintAsm {
		fmt.Println(buf.String())
		return nil
	}

	args := getCmdArgs("AS", "as")
	args = append(args, "-o", output)

	cmdErr := new(bytes.Buffer)
	cmdOut := new(bytes.Buffer)

	cmd := exec.Command(args[0], args[1:]...)
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
		if line == "" {
			continue
		}
		if lp >= len(line) {
			fmt.Fprintf(w, "%s: %s\n", name, line)
		} else {
			fmt.Fprintf(w, "%s: %s\n", name, line[lp:])
		}
	}
}

func linkObjs(output string, objFiles ...string) error {
	if len(objFiles) == 0 {
		return nil
	}

	runtimeDir := filepath.Join(flags.RuntimeDir, flags.Arch, flags.OS)

	args := getCmdArgs("LD", "ld")
	args = append(args, "-o", output)
	args = append(args, filepath.Join(runtimeDir, "crt0.o"))
	args = append(args, objFiles...)
	args = append(args, filepath.Join(runtimeDir, "libscc.a"))

	cmd := exec.Command(args[0], args[1:]...)
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

	if flags.DumpCpp {
		file := ""
		line, col := 1, 1
		for tok := range scanner.Tokens {
			tok.Pos.Filename = strings.TrimRight(tok.Pos.Filename, " (macro)")
			if file != tok.Pos.Filename {
				fmt.Printf("\n# %d %s\n\n", tok.Pos.Line, tok.Pos.Filename)
				file = tok.Pos.Filename
				line = tok.Pos.Line
				col = tok.Pos.Column
			}
			for ; line < tok.Pos.Line; line, col = line+1, 1 {
				fmt.Printf("\n")
			}
			for ; col < tok.Pos.Column; col++ {
				fmt.Printf(" ")
			}
			if tok.Type == scan.String {
				fmt.Printf("%q", tok.Text)
			} else {
				fmt.Printf("%s", tok.Text)
			}
			col += len(tok.Text)
		}
		fmt.Printf("\n")

		scanner, err = newScanner(name)
		if err != nil {
			return err
		}
		defer scanner.Close()
	}

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
