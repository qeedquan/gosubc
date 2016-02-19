#!/bin/sh

S=_stage
S2=$S-2
S3=$S-3

SRC=`echo cg.c decl.c error.c expr.c gen.c main.c misc.c opt.c prep.c \
	scan.c stmt.c sym.c tree.c`
ASM=`echo $SRC | sed -e 's/\.c/.s/g'`
OBJ=`echo $SRC | sed -e 's/\.c/.o/g'`

./scc1 -o $S2-bin $SRC
./scc  -o $S3-bin $SRC

if cmp $S2-bin $S3-bin; then
	rm -f $S2-bin $S3-bin
	exit 0
fi

echo
echo Something interesting happend, please stand by ...
echo

rm -f $ASM

if [ "`echo $S*`" != '_stage*' ]; then
	
	cat <<EOT
***************************************************
	
There appear to be some left-over stage files here:
EOT
	echo ${S}*
cat <<EOT
	
You need to delete or rename them manually before
running this test. Just in case they are important.

***************************************************
EOT
	exit 1
fi

./scc1 -S $SRC && cat $ASM >$S2-dump && tar cf $S2-asm.tar $ASM && rm $ASM
./scc  -S $SRC && cat $ASM >$S3-dump && tar cf $S3-asm.tar $ASM && rm $ASM

if ! cmp $S2-dump $S3-dump; then
	tar cvf ${S}dump.tar $S2-asm.tar $S3-asm.tar && \
		rm -f $S2-asm.tar $S3-asm.tar
	cat <<EOT

***** TRIPLE TEST FAILED *******************************

Please mail the following file to  n m h @ t 3 x . o r g

${S}dump.tar

********************************************************

EOT
	rm -f $S2-dump $S3-dump
	exit 1
fi

rm -f $S2-dump $S3-dump
rm -f $S2-asm.tar $S3-asm.tar

./scc1 -c $SRC && tar cf $S2-obj.tar $OBJ && ./scc1 -o $S2-bin $OBJ
./scc  -c $SRC && tar cf $S3-obj.tar $OBJ && ./scc  -o $S3-bin $OBJ

rm -f $OBJ

if ! cmp $S2-bin $S3-bin ; then
	tar cvf ${S}dump.tar $S2-bin $S2-obj.tar $S3-bin $S3-obj.tar && \
		rm -f $S2-bin $S2-obj.tar $S3-bin $S3-obj.tar && \
	cat <<EOT

***** TRIPLE TEST ANOMALY ******************************

The triple test passed at assembly level, but failed at
binary level. This is weird and interesting!

Please mail the following file to  n m h @ t 3 x . o r g

${S}dump.tar

********************************************************

EOT
	exit 1
fi

rm -f $S2-bin $S2-obj.tar $S3-bin $S3-obj.tar ${S}dump.tar
