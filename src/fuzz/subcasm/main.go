package subcast

import (
	"io/ioutil"

	"subc/asm"
)

func Fuzz(data []byte) int {
	err := asm.Assemble("amd64", "linux", "fuzz", ioutil.Discard, data)
	if err != nil {
		return 0
	}

	return 1
}
