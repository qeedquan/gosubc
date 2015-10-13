/*
 *	S86 -- A Simple 8086 Tool Chain
 *	Global definitions
 *	Nils M Holm, 1993,1995,2013,2014
 *	In the public domain
 */

/* Max. code segment size, must be <64K */
#define CODESZ	60000

/* Max. data segment size, must be <64K */
#define DATASZ	60000

/* Max. number of DOS EXE relocation entries */
#define NDOSREL	100
