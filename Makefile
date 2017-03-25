mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
SCCPATH := $(dir ${mkfile_path})
TMP := ${SCCPATH}tmp
SCC := ${SCCPATH}subc
LIB := ${SCCPATH}subc/src/lib
RUNTIME := ${SCCPATH}runtime
export SCCROOT := ${SCCPATH}

AS=as

all: linux-amd64 clean go scc

clean: linux-amd64
	rm -rf ${SCCPATH}pkg
	rm -rf ${SCCPATH}bin
	rm -rf ${SCCPATH}fuzzrun
	rm -rf ${TMP}
	rm -rf ${RUNTIME}
	rm -f ${SCCPATH}subcast-fuzz.zip
	mkdir -p ${RUNTIME}
	cd ${SCC}; make clean

linux-amd64:
	$(eval ARCH := amd64)
	$(eval OS := linux)
	$(eval RUNTIME := $(RUNTIME)/$(ARCH)/$(OS))

go:
	export GOPATH=${SCCPATH}; go install scc sas tools/objcmp;

scc:
	cd ${SCC}; make clean; ./configure
	bin/scc -T ${TMP} -c ${LIB}/*.c
	ar -rc ${RUNTIME}/libscc.a ${TMP}/*.o
	$(AS) -o ${RUNTIME}/crt0.o ${LIB}/crt0.s
	cd ${SCC}/src; cp ${SCCPATH}/bin/scc scc0; make scc; cp scc ${SCCPATH}/bin/sccb

fuzz:
	export GOPATH=${GOPATH}:${SCCPATH}; go-fuzz-build fuzz/subcasm; go-fuzz -bin=./subcast-fuzz.zip -workdir=${SCCPATH}fuzzrun
	export GOPATH=${GOPATH}:${SCCPATH}; go-fuzz-build fuzz/subcast; go-fuzz -bin=./subcast-fuzz.zip -workdir=${SCCPATH}fuzzrun
