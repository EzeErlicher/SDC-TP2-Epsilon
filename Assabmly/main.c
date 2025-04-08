#include <stdio.h>

// Prototipo de la función en ensamblador
extern int funcion(float valor);

int main() {
    float mi_float = 3.14f;

    int resultado = funcion(mi_float);

    printf("Resultado final (float convertido a entero + 1): %d\n", resultado);

    return 0;
}
