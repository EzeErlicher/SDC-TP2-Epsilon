global funcion
extern debug_dump_stack

section .text
funcion:
    push    rbp
    mov     rbp, rsp

    ; Reservamos espacio para "simular" el stack: float + ret addr
    sub     rsp, 16

    ; Guardar una copia del float en stack (sin tocar xmm0 aún)
    movss   [rsp], xmm0

    ; Guardar dirección de retorno desde [rbp+8]
    mov     rax, [rbp+8]
    mov     [rsp+8], rax

    ; Llamar a debug_dump_stack con puntero al bloque simulado
    mov     rdi, rsp
    call    debug_dump_stack

    ; Restauramos el valor float antes de convertir
    movss   xmm0, [rsp]           ; volver a cargar el valor original

    ; Convertir float a entero
    cvttss2si eax, xmm0
    add     eax, 1

    add     rsp, 16
    pop     rbp
    ret
