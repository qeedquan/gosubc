package subcast

import (
	"io/ioutil"
	"text/scanner"

	"subc/compile/arch/amd64"
	"subc/parse"
	"subc/scan"
	"subc/types"
)

func Fuzz(data []byte) int {
	r := scan.StringReader(scanner.Position{
		Filename: "fuzz",
		Line:     1,
		Column:   1,
	}, string(data), false)

	scanner := scan.New(scan.DefaultConfig, "fuzz", r)
	prog, err := parse.Parse(parse.Config{}, scanner)
	if err != nil {
		return 0
	}

	emitter := amd64.NewEmitter(ioutil.Discard)
	_, err = types.Check(types.Config{
		Sizes: emitter.Sizes,
	}, prog)
	if err != nil {
		return 0
	}

	return 1
}
