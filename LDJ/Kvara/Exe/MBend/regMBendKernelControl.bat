@echo off
pushd
cd /D "%~dp0"
if exist "%windir%\Microsoft.NET\Framework64\v4.0.30319" (
echo Registering 64 bit
%windir%\Microsoft.NET\Framework64\v4.0.30319\regasm MxViewerKernelControl.dll -u
)

echo Registering 32 bit
%windir%\Microsoft.NET\Framework\v4.0.30319\regasm MxViewerKernelControl.dll -u
%windir%\Microsoft.NET\Framework\v4.0.30319\regasm MxViewerKernelControl.dll -codebase 
popd

IF NOT "%1"=="nocheck" IF NOT %errorlevel% == 0 PAUSE



PAUSE
