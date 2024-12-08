@echo off
setlocal enabledelayedexpansion
set root="%~dp0"
pushd %root%

::newline
nl\build.bat && copy nl\x64\nl.exe nl.exe
 
popd
endlocal