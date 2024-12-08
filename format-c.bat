@echo off
setlocal enabledelayedexpansion

set un="%~dp0uncrustify.exe"
set cfg="%~dp0c.cfg"
set nl="%~dp0nl.exe"
set tok= ^
extern EXTERN_C inline INLINE FORCEINLINE CFORCEINLINE PFORCEINLINE ^
NTSYSAPI NTSTATUS NTAPI

for %%f in (*.c *.cpp *.h *.hpp) do (
    echo Processing %%f
    %un% -c %cfg% --no-backup %%f && %nl% %%f %tok%
)

endlocal
