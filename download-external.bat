@echo off
setlocal
set root="%~dp0"
pushd %root%

::tool cache
if not exist external\cache (
mkdir external\cache
)
::download 7z
if not exist external\cache\7z2201-x64.msi (
curl -L --show-error https://www.7-zip.org/a/7z2201-x64.msi -o external\cache\7z2201-x64.msi
)
::install 7z
if not exist external\7z2201-x64\Files\7-Zip\7z.exe (
msiexec /a external\cache\7z2201-x64.msi /qn TARGETDIR="%CD%\external\7z2201-x64" /qb /l*v "install_7z.log"
)
::download Uncrustify
if not exist external\cache\uncrustify-0.80.1_f-win64.zip (
curl -L --show-error https://github.com/uncrustify/uncrustify/releases/download/uncrustify-0.80.1/uncrustify-0.80.1_f-win64.zip -o external\cache\uncrustify-0.80.1_f-win64.zip
)
::install Uncrustify
if not exist external\uncrustify-0.80.1_f-win64\bin\uncrustify.exe (
external\7z2201-x64\Files\7-Zip\7z.exe x -y external\cache\uncrustify-0.80.1_f-win64.zip -oexternal\uncrustify-0.80.1_f-win64\
copy /y /v external\uncrustify-0.80.1_f-win64\bin\uncrustify.exe uncrustify.exe
)
popd
endlocal
