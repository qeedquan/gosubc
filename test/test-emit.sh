#!/bin/sh

set -e

rm -f *.s *.S *.o *.O

export SCCROOT="$(pwd)/.."
for i in *.c
do
	file=`basename $i .c`
    $SCCROOT/bin/scc -compat -S $i > $file.S
	$SCCROOT/bin/sas -o $file.o $file.S
	as -o $file.O $file.S
	$SCCROOT/bin/objcmp $file.o $file.O
done

cd $SCCROOT/subc/src/
for i in $SCCROOT/test/*.c
do
	file=`basename $i .c`
    ./scc -S $i
done

cd $SCCROOT/test
for i in *.c
do
    diff -u -w -B `basename $i .c`.S `basename $i .c`.s
done

rm -f *.s *.S *.o *.O
