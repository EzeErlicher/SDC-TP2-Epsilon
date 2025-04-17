global float_to_int

section .text
; int float_to_int(float f);
; Recibe el float en xmm0 (por convención del ABI)
; Retorna el entero en eax
float_to_int:
    ; Convertir float a entero truncado (xmm0 -> eax)
    cvttss2si eax, xmm0

    ; Sumar 1 al entero
    add eax, 1

    ; Retornar (resultado está en eax)
    ret
