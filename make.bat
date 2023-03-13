@echo off

set ASSEMBLY_FILE=%~n1.asm
set OBJ_FILE=obj\out.obj
set EXE_FILE=out\out.exe

echo Assembling %ASSEMBLY_FILE%...
nasm -f win32 %ASSEMBLY_FILE% -o %OBJ_FILE%
if errorlevel 1 (
    echo ERROR: Assembling failed with error code %errorlevel%.
    echo Check for syntax errors or invalid directives in %ASSEMBLY_FILE%.
    exit /b %errorlevel%
)
echo Assembled %ASSEMBLY_FILE% to %OBJ_FILE%.

echo Linking %OBJ_FILE% with required libraries...
golink /entry:Start /console kernel32.dll Shell32.dll fpu.dll user32.dll %OBJ_FILE%
if errorlevel 1 (
    echo ERROR: Linking failed with error code %errorlevel%.
    echo Check for missing libraries or unresolved symbols.
    exit /b %errorlevel%
)
echo Linked %OBJ_FILE% with required libraries.

echo Moving executable to output directory...
cd obj
move "out.exe" "../out/out.exe"
cd ../
echo Moved out.exe to %EXE_FILE%.

echo Running %EXE_FILE%...
cd out
echo --------------------------------------------------------------
echo Output application: %EXE_FILE%
echo --------------------------------------------------------------
.\out.exe
