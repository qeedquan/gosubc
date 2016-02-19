@echo off
set MINGWPATH=c:\\mingw
set CC=gcc
set MAKE=mingw32-make

if "%1"=="go" goto doit
if "%1"=="Go" goto doit
if "%1"=="GO" goto doit

echo This batch file requires MinGW and MSYS to be installed and
echo some common Unix tools, like ar, rm, etc to be in the PATH.
echo MINGWPATH must be set to your MinGW root directory (i.e. the
echo directory containing lib/, bin/, etc.)
echo Type WINBUILD.BAT GO to actually run this batch file!
goto end

:doit
PATH=%MINGWPATH%\bin;%MINGWPATH%\msys\1.0\bin;%PATH%
echo on

cd src
if exist defs.org goto copyback
copy defs.h defs.org
:copyback
copy defs.org defs.h

copy targets\lib\init-windows.c lib\init.c
copy targets\lib\system-windows.c lib\system.c
copy targets\cg\cg386.c cg.c
copy targets\cg\cg386.h cg.h
copy targets\windows-386\sys-windows-386.h sys.h
copy targets\windows-386\crt0-windows-386.s lib\crt0.s
copy targets\include\limits-32.h include\limits.h

echo #undef SYSLIBC >> sys.h
echo #define SYSLIBC	"%MINGWPATH%/lib/libuser32.a %MINGWPATH%/lib/libkernel32.a %MINGWPATH%/lib/libgdi32.a" >> sys.h
echo /**/ >> sys.h

%MAKE% clean
%MAKE% all
echo #undef SCCDIR >> defs.h
echo #define SCCDIR	"%MINGWPATH%/scc" >> defs.h

mkdir %MINGWPATH%\scc
mkdir %MINGWPATH%\scc\lib
mkdir %MINGWPATH%\scc\include
copy include\*.* %MINGWPATH%\scc\include\
copy lib\libscc.a %MINGWPATH%\scc\lib\
copy lib\crt0.o %MINGWPATH%\scc\lib\

%MAKE% scc1
copy scc1 %MINGWPATH%\bin\scc.exe

cd ..
echo done!
:end
