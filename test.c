#include <stdio.h>


int float_to_int(float value);

int main(){

    float number=9.7;

    int casted_result = float_to_int(number);

    printf("Float value:%f | Casted value + 1:%d \n", number,casted_result);
}