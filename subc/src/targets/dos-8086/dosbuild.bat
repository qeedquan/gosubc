@echo off

if "%1"=="go" goto doit
if "%1"=="Go" goto doit
if "%1"=="GO" goto doit

echo *******************************************
echo This script will copy the compiler sources
echo to this directory and build a new compiler!
echo Type  DOSBUILD GO  if you really want to do
echo do this!
echo *******************************************
goto end

:doit

echo copying source files
copy src\*.* .>NUL

scc -cv cg.c
scc -cv decl.c
scc -cv dosmain.c
scc -cv error.c
scc -cv expr.c
scc -cv gen.c
scc -cv misc.c
scc -cv opt.c
scc -cv prep.c
scc -cv scan.c
scc -cv stmt.c
scc -cv sym.c
scc -cv tree.c
scc -cv ulibc.c

sld -vvv -o sccmain1.exe -f link.lst
:end
