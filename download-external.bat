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
::unzip Uncrustify
if not exist external\uncrustify-0.80.1_f-win64\bin\uncrustify.exe (
external\7z2201-x64\Files\7-Zip\7z.exe x -y external\cache\uncrustify-0.80.1_f-win64.zip -oexternal\uncrustify-0.80.1_f-win64\
copy /y /v external\uncrustify-0.80.1_f-win64\bin\uncrustify.exe uncrustify.exe
)
::download SystemInformer
if not exist external\cache\systeminformer-3.1.24298-release-bin.zip (
curl -L --show-error https://sourceforge.net/projects/systeminformer/files/systeminformer-3.1.24298-release-bin.zip/download -o external\cache\systeminformer-3.1.24298-release-bin.zip
)
::unzip SystemInformer
if not exist external\systeminformer-3.1.24298-release-bin\amd64\SystemInformer.exe (
external\7z2201-x64\Files\7-Zip\7z.exe x -y external\cache\systeminformer-3.1.24298-release-bin.zip -oexternal\systeminformer-3.1.24298-release-bin\
)
popd
endlocal
