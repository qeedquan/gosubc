BINDIR	=	/u/bin

CC	=	scc
CC86	=	scc86
CFLAGS	=

all:		sar s86 sld snm xhd xstrip

xhd:	xhd.c exe.h
	$(CC) $(CFLAGS) -o xhd xhd.c

snm:	snm.c exe.h obj.h arc.h sym.h ufseek.o
	$(CC) $(CFLAGS) -o snm snm.c ufseek.o

xstrip:	xstrip.c obj.h exe.h ufseek.o
	$(CC) $(CFLAGS) -o xstrip xstrip.c ufseek.o

sld:	sld.c exe.h obj.h sym.h defs.h ufseek.o
	$(CC) $(CFLAGS) -o sld sld.c ufseek.o

s86:	s86.c sym.h obj.h defs.h ufseek.o
	$(CC) $(CFLAGS) -o s86 s86.c ufseek.o

sar:	sar.c sym.h obj.h arc.h ufseek.o
	$(CC) $(CFLAGS) -o sar sar.c ufseek.o

ufseek.o:	ufseek.c
	$(CC) $(CFLAGS) -c ufseek.c

exe:	sar.exe s86.exe sld.exe snm.exe xhd.exe xstrip.exe

xhd.exe:	xhd.c exe.h
	$(CC86) $(CFLAGS) -o xhd.exe xhd.c

snm.exe:	snm.c exe.h obj.h arc.h sym.h ufseekx.o
	$(CC86) $(CFLAGS) -o snm.exe snm.c ufseekx.o

xstrip.exe:	xstrip.c obj.h exe.h ufseekx.o
	$(CC86) $(CFLAGS) -o xstrip.exe xstrip.c ufseekx.o

sld.exe:	sld.c exe.h obj.h sym.h defs.h ufseekx.o
	$(CC86) $(CFLAGS) -o sld.exe sld.c ufseekx.o

s86.exe:	s86.c sym.h obj.h defs.h ufseekx.o
	$(CC86) $(CFLAGS) -o s86.exe s86.c ufseekx.o

sar.exe:	sar.c sym.h obj.h arc.h ufseekx.o
	$(CC86) $(CFLAGS) -o sar.exe sar.c ufseekx.o

ufseekx.o:	ufseek.c
	$(CC86) $(CFLAGS) -o ufseekx.o -c ufseek.c

install:	all
	strip sar s86 sld snm xstrip xhd
	cp sar s86 sld snm xstrip xhd $(BINDIR)

clean:
	rm -f s86 sar sld snm xstrip xhd *.o *.tmp *.a debug core *.core \
		s86.exe sar.exe sld.exe snm.exe xstrip.exe xhd.exe \
		aout.exe
