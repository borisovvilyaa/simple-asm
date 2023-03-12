NULL EQU 0
STD_OUTPUT_HANDLE EQU -11

extern _GetStdHandle@4
extern _MessageBoxA@16
extern _ExitProcess@4

MB_OK equ 0x00000000
NULL equ 0

global Start

section .data

    szCaption db "Window", 0
    szText db "Dialog window", 0

section .bss
    StandardHandle resd 1
    Written resd 1

section .text
    Start:
        ; Виклик MessageBoxA
        push MB_OK
        push szCaption
        push szText
        push NULL
        call _MessageBoxA@16

        ; Виклик ExitProcess
        push NULL
        call _ExitProcess@4