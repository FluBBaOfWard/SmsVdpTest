@echo off
PATH=D:\Work\Tools\WLADX
rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem ::               WLA DX compiling batch file               ::
rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: You have to edit this file before it will work!         ::
rem :: Locate the two lines  marked below which point to the   ::
rem :: directory "C:\WLA DX\" and CHANGE them so they point to ::
rem :: where you've put WLA DX. Don't change the bit after the ::
rem :: filename, it's important!                               ::
rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


if exist object.o del object.o
rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: First line:
rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
wla-z80 -o %1 object.o

echo [objects]>linkfile
echo object.o>>linkfile

rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: Second line:
rem :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
wlalink -drvs linkfile output.sms

if exist output.sms.sym del output.sms.sym
ren output.sym output.sms.sym
if exist linkfile del linkfile
if exist object.o del object.o

copy output.sms VDPTest.sms