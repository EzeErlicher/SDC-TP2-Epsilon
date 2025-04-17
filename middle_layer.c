#include <stdio.h>


// Nombre de la rutina en assembly
extern int float_to_int(float value);



int call_assembly_routine(float value){
    int result = float_to_int(value);
    return result;
}