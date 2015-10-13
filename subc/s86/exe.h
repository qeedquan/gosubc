/*
 *	S86 -- A Simple 8086 Tool Chain
 *	EXE header format
 *	Nils M Holm, 1993,2013,2014
 *	In the public domain
 */

/* Default values */

#define	XMAGIC		"MZ"
#define XMINAL		0
#define XMAXAL		0xffff
#define XCKSUM		0
#define XENTRY		0
#define XCSEG		0
#define XOVL		0
#define XORELOC		0x1c

/* EXE header structure */

#define X_MAGIC		0	/* XMAGIC */
#define X_NBYTES	2	/* bytes in last page */
#define	X_NPAGES	4	/* number of pages */
#define X_NRELOC	6	/* number of relocation entries */
#define X_HDSIZE	8	/* size of header */
#define X_MINAL		10	/* minimum dynamic memory required */
#define X_MAXAL		12	/* max. dynamic memory */
#define X_SSEG		14	/* init stack segment */
#define X_STKPTR	16	/* init stack pointer */
#define X_CKSUM		18	/* check sum (neg. sum of all words) */
#define X_ENTRY		20	/* initial entry point (IP) */
#define X_CSEG		22	/* initial entry point (CS) */
#define X_ORELOC	24	/* offset of RELOC table */
#define X_OVLID		26	/* overlay id (0) */

/* EXE header size */

#define XHDR_SZ		28

