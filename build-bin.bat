@echo off
setlocal enabledelayedexpansion
set root="%~dp0"
pushd %root%

::newline
call nl\build.bat
echo %cd%
copy /v /b "%CD%\nl\x64\nl.exe" "%CD%\nl.exe"

::ntstr
call ntstr\build.bat
echo %cd%
copy /v /b "%CD%\ntstr\out\x64\ntstrx64.exe" "%CD%\ntstrx64.exe"

popd
endlocal