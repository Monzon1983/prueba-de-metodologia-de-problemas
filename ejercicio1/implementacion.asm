%%writefile fibonacci.c
#include <stdio.h>

int main() {
    int N;
    long long t1 = 0, t2 = 1;
    long long siguiente_termino;
    int i;

    printf("Ingrese la cantidad de terminos de la secuencia de Fibonacci que desea generar (N > 0): ");

    if (scanf("%d", &N) != 1 || N <= 0) {
        printf("Error: Ingrese un numero entero positivo.\n");
        return 1;
    }

    printf("Secuencia de Fibonacci (primeros %d terminos):\n", N);

    if (N == 1) {
        printf("%lld\n", t1);
    } else {
        printf("%lld, %lld", t1, t2);

        for (i = 3; i <= N; ++i) {
            siguiente_termino = t1 + t2;
            printf(", %lld", siguiente_termino);

            t1 = t2;
            t2 = siguiente_termino;
        }
        printf("\n");
    }

    return 0;
}