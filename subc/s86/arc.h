/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Archive entry format
 *	Nils M Holm, 1993,1995,2013,2014
 *	In the public domain
 */

/* Blocksize, Max archive size == BLKSIZE*65536 */

#define BLKSIZE	16

/* Header length, must be a multiple of BLKSIZE! */

#define ARH_LEN	32

/* SAR header structure */

#define AR_MAGIC	0
#define AR_NAME		2
#define AR_SIZE		14

/* SAR file magic */

#define A_MAGIC		"AR"

/* Name of the dictionary entry */

#define SYMDEF		"__SYMDEF.__"

