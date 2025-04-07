#include <stdio.h>

// Declaración de la función escrita en NASM
extern int convertir_y_sumar(float valor);

int main() {
    float numero = 31.4;
    int resultado = convertir_y_sumar(numero);
    printf("Resultado entero: %d\n", resultado); // Debería ser 4
    return 0;
}
