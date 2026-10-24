; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez


INCLUDE Irvine32.inc

.data
.code
main PROC
  ;   CONDICION 1: ZERO FLAGS

    mov ebx, 1
    ;   comparamos el contenido de EBX con 1, si son iguales se activa la bandera ZF
    cmp ebx, 1
    ;   dumpRegs es una macro que imprime el contenido de los registros y las banderas
    call dumpRegs 

    ;   01h = 00000001b equivalente a 1 en decimal, por lo que la bandera ZF se activa
    mov EAX, 01h
    cmp EAX, EBX
    call dumpRegs

    ;   1111111b = 127 en decimal, por lo que la bandera ZF no se activa
    mov cl, 1111111b
    cmp cl, cl
    call dumpRegs


    ;   CONDICION 2 : SING FLAG
    ;   la sing flag se activa cuando el resultado de una operacion es negativo, es decir, cuando el bit mas significativo es 1
    mov Eax, 0
    mov EBX, 0
    ;   al es un registro de 8 bits, por lo que puede almacenar valores entre -128 y 127, en este caso se le asigna el valor -5, que es negativo, por lo que la bandera SF se activa
    mov al, -5
    ;   bl tambien es un registro de 8 bits, por lo que puede almacenar valores entre -128 y 127, en este caso se le asigna el valor 1, que es positivo, por lo que la bandera SF no se activa
    mov bl, 1
    cmp al, bl
    call dumpRegs

    ;   CONDICION 3 : CARRY FLAG
    ;   el carry flag se activa cuando hay un acarreo en una operacion arimetica
    mov EAX, 0
    mov EBX, 0

    mov al, 255
    add al, 1

    call dumpRegs

    ;   CASO 4 : OVERFLOW FLAG
    ;   el overflow flag se activa cuando hay un desbordamiento en una operacion arimetica, cuando se supera lo que se puede almacenar, se usa cf para indicar que hubo un desbordamiento
    mov EAX,0
    mov EBX, 0

    mov al, -128
    mov bl, 1

    cmp al, bl
    call dumpRegs


    ;   CASO 5 : TEST
    ;   el test realiza una operacion AND entre dos variables, si el resultado es 0 se activa la bandera ZF, si el resultado es negativo se activa la bandera SF
    mov EAX, 0
    mov EAX, 5 ; 00000101b
    test EAX, 1
    call dumpRegs

    mov EAX, 0
    mov al, 10000000b
    test al, al
    call dumpRegs

    exit
main ENDP
END main
