/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Print EXE headers
 *	Nils M Holm, 1993,1995,2013,2014
 *	In the public domain
 */

#include <stdio.h>
#include <string.h>
#include "exe.h"

int main(int argc, char **argv) {
	char	*p;
	FILE	*f;
	char	xhdr[XHDR_SZ];
	char	name[20];

	if (argc < 2) {
		printf("usage: xhd file ...\n");
		exit(1);
	}
	printf(
"file       last size nrel hdsz mina maxa sseg stkp csum entr cseg orel ovid\n"
	);
	printf(
"--------   ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----\n"
	);
	while (--argc) {
		p = *++argv;
		if ((f = fopen(p, "rb")) == NULL) {
			fprintf(stderr, "xhd: no such file: %s\n", p);
			continue;
		}
		if (fread(xhdr, 1, XHDR_SZ, f) != XHDR_SZ) {
			fprintf(stderr, "xhd: file read error: %s\n", p);
			fclose(f);
			continue;
		}
		if (memcmp(&xhdr[X_MAGIC], XMAGIC, 2)) {
			fprintf(stderr, "xhd: not a valid exe file: %s\n",
				p);
			fclose(f);
			continue;
		}
		strcpy(name, strchr(p, '\\')?  strrchr(p, '\\')+1:
				strchr(p, '/')?  strrchr(p, '/'): p);
		if (p = strchr(name, '.')) *p = 0;
		printf(
		"%-10s %4x %4x %4x %4x %4x %4x %4x %4x %4x %4x %4x %4x %4x\n",
		name,
		xhdr[X_NBYTES] + (xhdr[X_NBYTES+1]<<8),
		xhdr[X_NPAGES] + (xhdr[X_NPAGES+1]<<8),
		xhdr[X_NRELOC] + (xhdr[X_NRELOC+1]<<8),
		xhdr[X_HDSIZE]*16 + (xhdr[X_HDSIZE+1]*16<<8),
		xhdr[X_MINAL] + (xhdr[X_MINAL+1]<<8),
		xhdr[X_MAXAL] + (xhdr[X_MAXAL+1]<<8),
		xhdr[X_SSEG] + (xhdr[X_SSEG+1]<<8),
		xhdr[X_STKPTR] + (xhdr[X_STKPTR+1]<<8),
		xhdr[X_CKSUM] + (xhdr[X_CKSUM+1]<<8),
		xhdr[X_ENTRY] + (xhdr[X_ENTRY+1]<<8),
		xhdr[X_CSEG] + (xhdr[X_CSEG+1]<<8),
		xhdr[X_ORELOC] + (xhdr[X_ORELOC+1]<<8),
		xhdr[X_OVLID] + (xhdr[X_OVLID+1]<<8));
		fclose(f);
	}
	return(0);
}
