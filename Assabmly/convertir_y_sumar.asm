section .data
    ; buffer temporal para guardar el float (opcional si querés verlo en C)
    valor_float resd 1

section .text
    extern dump_stack
    global convertir_y_sumar

convertir_y_sumar:
    push rbp
    mov rbp, rsp

    ; guardar xmm0 (float) en memoria
    sub rsp, 8               ; espacio para guardar float como double para alineación
    movss [rsp], xmm0        ; guardar solo 4 bytes del float

    ; pasar rsp a C para hacer dump
    mov rdi, rsp
    call dump_stack

    ; cargar el float desde la pila y convertirlo a entero
    movss xmm1, [rsp]
    cvttss2si eax, xmm1      ; convertir float a int truncado
    add eax, 1

    add rsp, 8               ; limpiar la pila

    pop rbp
    ret
