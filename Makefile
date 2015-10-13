mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
GOPATH := $(dir ${mkfile_path})
TMP := ${GOPATH}tmp
SCC := ${GOPATH}subc
LIB := ${GOPATH}subc/src/lib
RUNTIME := ${GOPATH}runtime
export SCCROOT := ${GOPATH}

AS=as

all: linux-amd64 clean go scc

clean: linux-amd64
	rm -rf ${GOPATH}pkg
	rm -rf ${GOPATH}bin
	rm -rf ${TMP}
	rm -rf ${RUNTIME}
	mkdir -p ${RUNTIME}
	cd ${SCC}; make clean

linux-amd64:
	$(eval ARCH := amd64)
	$(eval OS := linux)
	$(eval RUNTIME := $(RUNTIME)/$(ARCH)/$(OS))

go:
	export GOPATH=${GOPATH}; go install scc

scc:
	cd ${SCC}; make clean; ./configure
	bin/scc -T ${TMP} -c ${LIB}/*.c
	ar -rc ${RUNTIME}/libscc.a ${TMP}/*.o
	$(AS) -o ${RUNTIME}/crt0.o ${LIB}/crt0.s
	cd ${SCC}/src; cp ${GOPATH}/bin/scc scc0; make scc; cp scc ${GOPATH}/bin/sccb

