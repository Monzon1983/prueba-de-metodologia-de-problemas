%%writefile sum_numbers.c
#include <stdio.h>

int main() {
    int num1, num2;
    printf("Ingrese el 1er número: ");
    scanf("%d", &num1);
    printf("Ingrese el 2do número: ");
    scanf("%d", &num2);
    printf("La suma de los números es: %d\n", num1 + num2);
    return 0;
}