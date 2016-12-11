#!/bin/sh

export SCCROOT="$(pwd)/.."
for i in *.c
do
    $SCCROOT/bin/scc -compat -S $i > `basename $i .c`.S
done

cd $SCCROOT/subc/src/
for i in $SCCROOT/test/*.c
do
    ./scc -S $i
done

cd $SCCROOT/test
for i in *.c
do
    diff -u -w -B `basename $i .c`.S `basename $i .c`.s
done

rm -f *.s *.S
