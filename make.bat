cd out
del out.exe
cd ../
cd obj/
del obj/out.obj
cd ../
nasm -f win32 .\%~n1.asm -o obj/out.obj
cd obj

golink /entry:Start /console kernel32.dll user32.dll out.obj 
move "out.exe" "../out/out.exe" 

cd ../out

.\out.exe

