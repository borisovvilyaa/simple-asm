section .data
    result db "%d", 10, 0 ; формат вывода для printf

section .text
    global _start ; точка входа в программу

_start:
    mov rax, 2 ; загрузить число 2 в регистр RAX
    add rax, 3 ; добавить число 3 к RAX
    mov rdi, result ; загрузить адрес формата вывода в RDI
    mov rsi, rax ; загрузить значение RAX в RSI (первый аргумент для printf)
    xor rax, rax ; очистить RAX
    call printf ; вызвать функцию printf для вывода результата на экран

    xor edi, edi ; установить код завершения в 0 (нет ошибок)
    call exit ; вызвать функцию exit для корректного завершения программы