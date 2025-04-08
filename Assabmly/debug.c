#include <stdio.h>

void debug_dump_stack(void **stack_ptr) {
    float valor_float = *((float *)stack_ptr);
    void *ret_address = *(stack_ptr + 1);

    printf("=== Dump Stack ===\n");
    printf("Parametro float recibido: %f\n", valor_float);
    printf("Direccion de retorno: %p\n", ret_address);
    printf("==================\n");
}
