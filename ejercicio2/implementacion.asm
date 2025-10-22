3- Implementar en Turbo Asm y ejecutar.

; FACTORIAL.ASM: Calcula 5! (120) en ensamblador de 16 bits (TASM)
.MODEL SMALL           ; Define el modelo de memoria pequeño (1 segmento de código, 1 de datos)
.STACK 100h            ; Reserva 256 bytes para la pila

.DATA
    num     DW 5       ; Variable: Número a calcular (DW = Define Word / 16 bits)
    result  DD ?       ; Variable: Resultado (DD = Define Doubleword / 32 bits, para resultados grandes)

.CODE
START:
    ; 1. Inicializar el Segmento de Datos (DS)
    ; MOV AX, @DATA suele funcionar, pero usamos DGROUP para mayor compatibilidad con TASM
    MOV AX, DGROUP
    MOV DS, AX

    ; 2. Inicialización de 'Registros' (Valores iniciales)
    MOV AX, 1          ; AX = 1 (Factorial inicial)
    MOV CX, [num]      ; CX = 5 (Contador/Multiplicador, carga el valor de 'num')

    ; 3. Comprobar si CX es cero (0! = 1)
    CMP CX, 0
    JE FACT_DONE       ; Si CX es 0, salta al final (resultado ya es 1)

FACT_LOOP:
    ; Multiplicación: AX = AX * CX
    ; El resultado de 16 bits se almacena en AX.
    MUL CX

    ; 4. Decremento y Salto
    DEC CX             ; Decrementa el contador (CX = CX - 1)
    JNE FACT_LOOP      ; Si CX no es cero, vuelve a FACT_LOOP

FACT_DONE:
    ; 5. Almacenar el Resultado de AX en la variable 'result' (32 bits)
    MOV WORD PTR [result], AX    ; Guarda los 16 bits bajos (el 120)
    MOV WORD PTR [result + 2], 0 ; Limpia los 16 bits altos (DX estaría vacío para 5!)

    ; 6. Salir del programa (Llamada al sistema DOS: INT 21h, AH=4Ch)
    MOV AH, 4Ch
    INT 21h
END START              ; Define el punto de entrada del programa