//7- Generar en Google Colab, con la IA, la misma versión de problema, pero resuelto en C.

long long calcular_factorial(int n) {
    long long resultado = 1;
    if (n < 0) return 0;
    if (n == 0) return 1;
    for (int i = 1; i <= n; i++) {
        resultado *= i;
    }
    return resultado;
}

int main() {
    int numero = 5; // Definido directamente para Colab
    long long factorial;

    printf("Calculando el factorial de %d...\n", numero);

    factorial = calcular_factorial(numero);

    if (factorial > 0 || numero == 0) {
        printf("El factorial de %d es: %lld\n", numero, factorial);
    }

    return 0;
}