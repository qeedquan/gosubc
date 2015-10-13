PREFIX=	/u
EXESFX=	
SCCDIR=	$(PREFIX)/scc
BINDIR=	$(PREFIX)/bin
SC86DIR=$(PREFIX)/scc86

LINT=	gcc -O3 -c -o /dev/null -ansi -pedantic -Wall

SRC=	cg.c decl.c error.c expr.c gen.c main.c misc.c \
	opt.c prep.c scan.c stmt.c sym.c tree.c

HDRS=	cgen.h data.h decl.h defs.h prec.h sys.h

LIBOBJS=lib/init.o lib/abort.o lib/abs.o lib/atexit.o lib/atoi.o \
	lib/bsearch.o lib/calloc.o lib/clearerr.o lib/ctime.o \
	lib/ctype.o lib/difftime.o lib/exit.o lib/fclose.o \
	lib/fdopen.o lib/feof.o lib/ferror.o lib/fflush.o lib/fgetc.o \
	lib/fgetpos.o lib/fgets.o lib/fileno.o lib/fopen.o \
	lib/fprintf.o lib/fputc.o lib/fputs.o lib/fread.o lib/free.o \
	lib/freopen.o lib/fscanf.o lib/fseek.o lib/fsetpos.o \
	lib/ftell.o lib/fwrite.o lib/getchar.o lib/getenv.o \
	lib/kprintf.o lib/malloc.o lib/memchr.o lib/memcmp.o \
	lib/memcpy.o lib/memmove.o lib/memset.o lib/perror.o \
	lib/printf.o lib/putchar.o lib/puts.o lib/qsort.o lib/rand.o \
	lib/realloc.o lib/remove.o lib/rename.o lib/rewind.o \
	lib/scanf.o lib/setbuf.o lib/setvbuf.o lib/sprintf.o \
	lib/sscanf.o lib/strcat.o lib/strchr.o lib/strcmp.o \
	lib/strcpy.o lib/strcspn.o lib/strdup.o lib/strerror.o \
	lib/strlen.o lib/strncat.o lib/strncmp.o lib/strncpy.o \
	lib/strpbrk.o lib/strrchr.o lib/strspn.o lib/strtok.o \
	lib/strtol.o lib/system.o lib/time.o lib/tmpfile.o \
	lib/tmpnam.o lib/ungetc.o lib/varargs.o lib/vformat.o \
	lib/vfprintf.o lib/vprintf.o lib/vscan.o lib/vsprintf.o

AS=	as
AR=	ar -rc
RANLIB=	ranlib

all:	scc0 crt0 ncrt0 lib

scc:	scc1 $(SRC)
	./scc1 -o scc $(SRC)

scc1:	scc0 lib/crt0.o lib/libscc.a $(SRC)
	./scc0 -o scc1 $(SRC)

scc0:	$(SRC)
	$(CC) -o scc0 $(SRC)

lib:	lib/libscc.a

crt0:	lib/crt0.o

ncrt0:	lib/ncrt0.o

exe:	scc.exe sccmain.exe

lib/crt0.o:	lib/crt0.s
	$(AS) -o lib/crt0.o lib/crt0.s

lib/ncrt0.o:	lib/ncrt0.s
	$(AS) -o lib/ncrt0.o lib/ncrt0.s

lib/ncrt0.s:	lib/crt0.s
	sed -e '/C_init.*[;@#]INIT/d' \
	    -e 's/\(.*\)Cexit\(.*\)EXIT/\1C_exit\2EXIT/' \
	    <lib/crt0.s >lib/ncrt0.s

lib/libscc.a:	$(LIBOBJS)
	$(AR) lib/libscc.a $(LIBOBJS)
	$(RANLIB) lib/libscc.a

$(SRC):		$(HDRS)
libscc.a:	$(OBJS)

.c.o:
	./scc0 -c $<

scc.exe:	main.c
	./scc0 -o scc.exe main.c

sccmain.exe:	$(SRC) targets/lib/ulibc.c targets/dos-8086/dosmain.c
	./scc0 -c $(SRC) && rm -f main.o
	./scc0 -o ulibc.o -c targets/lib/ulibc.c
	./scc0 -o dosmain.o -c targets/dos-8086/dosmain.c
	sld -o sccmain.exe lib/crt0.o *.o lib/libscc.a

tests:	test ptest systest libtest sigtest
	@echo "Looks good!"

test:	scc $(SRC)
	sh ../tests/triple-test.sh

ptest:	scc0 lib/crt0.o lib/libscc.a ../tests/ptest.src ../tests/ptest.awk
	awk -f ../tests/ptest.awk <../tests/ptest.src >../tests/ptest.c
	./scc0 -o ../tests/ptest ../tests/ptest.c
	../tests/ptest
	rm ../tests/ptest

systest:	scc0 lib/crt0.o lib/libscc.a ../tests/systest.c
	./scc0 -o ../tests/systest ../tests/systest.c
	 (cd ../tests && ./systest)
	rm ../tests/systest

libtest:	scc0 lib/crt0.o lib/libscc.a ../tests/libtest.c
	./scc0 -o ../tests/libtest$(EXESFX) ../tests/libtest.c
	(cd ../tests && ./libtest$(EXESFX))
	rm ../tests/libtest$(EXESFX)

sigtest:	scc0 lib/crt0.o lib/libscc.a ../tests/sigtest.c
	./scc0 -o ../tests/sigtest ../tests/sigtest.c
	(cd ../tests && ./sigtest)
	rm ../tests/sigtest

dirs:
	-mkdir $(PREFIX)
	-mkdir $(SCCDIR)
	-mkdir $(BINDIR)
	-mkdir $(SCCDIR)/include
	-mkdir $(SCCDIR)/lib

dirs86:
	-mkdir $(PREFIX)
	-mkdir $(SC86DIR)
	-mkdir $(BINDIR)
	-mkdir $(SC86DIR)/include
	-mkdir $(SC86DIR)/lib

install:	all
	./scc0 -o scc -D 'SCCDIR="$(SCCDIR)"' $(SRC)
	cp scc $(BINDIR)/scc$(EXESFX)
	strip $(BINDIR)/scc$(EXESFX)
	cp include/* $(SCCDIR)/include
	cp lib/libscc.a lib/crt0.o lib/ncrt0.o $(SCCDIR)/lib

install-scc86:	all
	scc -o scc86 -D 'SCCDIR="$(SC86DIR)"' $(SRC)
	cp scc86 $(BINDIR)/scc86$(EXESFX)
	strip $(BINDIR)/scc86$(EXESFX)
	cp include/* $(SC86DIR)/include
	cp lib/libscc.a lib/crt0.o lib/ncrt0.o $(SC86DIR)/lib

subc-dos.zip:
	mkdir subc-dos
	mkdir subc-dos/include
	mkdir subc-dos/lib
	mkdir subc-dos/src
	cp include/* subc-dos/include
	cp lib/crt0.o lib/ncrt0.o lib/libscc.a subc-dos/lib
	cp *.[ch] targets/lib/ulibc.c targets/dos-8086/dosmain.c subc-dos/src
	cp targets/dos-8086/dosbuild.bat targets/dos-8086/link.lst subc-dos
	cp scc.exe sccmain.exe subc-dos
	cp ../s86/*.exe subc-dos
	echo "This a binary-only archive of SubC for DOS/8086." \
		> subc-dos/ABOUT.TXT
	echo "You can find the source code at http://t3x.org." \
		>> subc-dos/ABOUT.TXT
	echo "The SubC compiler is in the public domain." \
		>> subc-dos/ABOUT.TXT
	echo "WARNING:" >> subc-dos/ABOUT.TXT
	echo "Most text files in this archive are in Unix format!" \
		>> subc-dos/ABOUT.TXT
	sed -e 's/$$/~/' <../README | tr '~' '\015' >subc-dos/README.TXT
	zip -9r subc-dos.zip subc-dos
	rm -r subc-dos

lint:
	$(LINT) cg.c
	$(LINT) decl.c
	$(LINT) error.c
	$(LINT) expr.c
	$(LINT) gen.c
	$(LINT) main.c
	$(LINT) misc.c
	$(LINT) opt.c
	$(LINT) prep.c
	$(LINT) scan.c
	$(LINT) stmt.c
	$(LINT) sym.c
	$(LINT) tree.c

clean:
	rm -f scc0 scc1 scc2 scc scc86 test.s *.o *.core core a.out \
		*.tmp lib/*.o lib/ncrt0.s lib/libscc.a *.exe subc-dos.zip
