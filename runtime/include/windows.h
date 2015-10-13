/*
 *	NMH's Simple C Compiler, 2013,2014
 *	Windows/386 API
 */

#define EXPORT 
#define __stdcall

#define OPENMAX 32

#define SEEK_SET	0
#define SEEK_CUR	1
#define SEEK_END	2

struct _STARTUPINFO {  
	int cb;  
	char *lpReserved;  
	char *lpDesktop;  
	char *lpTitle;  
	int dwX;  
	int dwY;  
	int dwXSize;  
	int dwYSize;  
	int dwXCountChars;  
	int dwYCountChars;  
	int dwFillAttribute;  
	int dwFlags;  
	char wShowWindow[2];  
	char cbReserved2[2];  
	void *lpReserved2;  
	void *hStdInput;  
	void *hStdOutput;  
	void *hStdError;
};

struct _PROCESS_INFORMATION { 
	void *hProcess;  
	void *hThread;  
	int dwProcessId;  
	int dwThreadId;
};

struct _SYSTEMTIME {
	char wYear[2];
	char wMonth[2];
	char wDayOfWeek[2];
	char wDay[2];
	char wHour[2];
	char wMinute[2];
	char wSecond[2];
	char wMilliseconds[2];
};

struct _FILETIME {
	int dwLowDateTime;
	int dwHighDateTime;
};

EXPORT int __stdcall GetExitCodeProcess(
	void *hProcess,
	int *lpExitCode
);

EXPORT int __stdcall MoveFileA(
	char *lpExistingFileName,
	char *lpNewFileName
);

EXPORT int __stdcall WaitForSingleObject(
	void *hHandle,
	int dwMilliseconds
);

EXPORT int __stdcall CreateProcessA(
	char *lpApplicationName,
	char *lpCommandLine,
	void *lpProcessAttributes,
	void *lpThreadAttributes,
	int bInheritHandles,
	int dwCreationFlags,
	void *lpEnvironment,
	char *lpCurrentDirectory,
	void *lpStartupInfo,
	void *lpProcessInformation
);

EXPORT int __stdcall DeleteFileA(
	char *lpFileName
);

EXPORT int __stdcall WriteFile(
	void *hFile,
	void *lpBuffer,
	int nNumberOfBytesToWrite,
	int *lpNumberOfBytesWritten,
	void *lpOverlapped
);

EXPORT int __stdcall ReadFile(
	void *hFile,
	char *lpBuffer,
	int nNumberOfBytesToRead,
	int *lpNumberOfBytesRead,
	void *lpOverlapped
);

EXPORT int __stdcall SetFilePointer(
	void *hFile,
	int lDistanceToMove,
	int *lpDistanceToMoveHigh,
	int dwMoveMethod
);

EXPORT int __stdcall SetEndOfFile(
	void *hFile
);

EXPORT void * __stdcall CreateFileA(
	char *lpFileName,
	int dwDesiredAccess,
	int dwShareMode,
	void *lpSecurityAttributes,
	int dwCreationDisposition,
	int dwFlagsAndAttributes,
	void *hTemplateFile
);

EXPORT int __stdcall CloseHandle(void *handle);

EXPORT void * __stdcall GetStdHandle(int id);

EXPORT void * __stdcall GetProcessHeap(void);

EXPORT void * __stdcall HeapCreate(
	int flOptions,
	int dwInitialSize,
	int dwMaximumSize
);

EXPORT void __stdcall ExitProcess(int errorcode);

EXPORT char * __stdcall GetCommandLineA(void);

/*EXPORT char * __stdcall GetEnvironmentStringsA(void);*/
EXPORT char * __stdcall GetEnvironmentA(void);

EXPORT void * __stdcall HeapReAlloc(
	void *hHeap,
	int dwFlags,
	void *lpMem,
	int dwBytes
);

EXPORT void * __stdcall HeapAlloc(
	void *hHeap,
	int dwFlags,
	int dwBytes
);

EXPORT void __stdcall GetSystemTime(
	void *lpSystemTime
);

EXPORT int __stdcall SystemTimeToFileTime(
	void *lpSystemTime,
	void *lpFileTime
);
