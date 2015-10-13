SNAP=	20140420
REL=	20150218
ARC=	subc-$(SNAP).tgz
DIST=	subc-$(REL).tgz

default:
	@echo "Use ./configure instead."

csums:
	csum -u <_sums >_newsums ; mv -f _newsums _sums

sums:	clean
	find . -type f | grep -v _sums | csum >_sums

version:
	vi src/defs.h Makefile README

clean:
	cd src && make clean
	cd s86 && make clean
	rm -f tests/ptest.c $(ARC) $(DIST)
	rm -f tests/ptest tests/systest tests/libtest
	if [ -f src/Makefile.ORIG ]; then \
		mv -f src/Makefile.ORIG src/Makefile; \
	fi

arc:	clean
	tar cvfz $(ARC) *

dist:	clean
	(cd .. && tar cvfz $(DIST) subc) && mv ../$(DIST) .
