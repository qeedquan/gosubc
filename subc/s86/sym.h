/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Symbol entry format
 *	Nils M Holm, 1993,1995,2013,2014
 *	In the public domain
 */

/* Segments: Unknown, Data, Code */

#define SNONE	'X'
#define SDATA	'D'
#define SCODE	'C'

/* Storage classes: Public, External, Local, Unknown */

#define PUBLIC	'P'
#define EXTRN	'E'
#define LOCAL	'L'
#define UNDEFD	'U'

/* Mark structure: Flags, Address, Ptr to next Mark, Size */

#define MKFLAG	0
#define MKADDR	2
#define MKPTR	4
#define MKSZ	6

/* Mark Flags: short/long mark, relative/absolute address */

#define MKSHORT	1
#define MKREL	2

/* Symbol entry structure */

#define SNAME	0
#define SSEGMT	15
#define SCLASS	16
#define SADDR	17
#define SMARK	19
#define SSIZE	21
