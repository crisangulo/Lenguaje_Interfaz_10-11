; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion:? hazla en todos
INCLUDE Irvine32.inc
 
  ; este programa muestra el uso de la pila, el uso de la instruccion call y ret, y el uso de la instruccion loop.
.data
.code
main PROC
    ; le damos el valor de 20 a eax y lo guardamos en la pila
    mov eax, 20

    push eax

    nop
    ; se le pone 0 a ebx
    mov ebx, 0

    ; se saca el valor de la pila y se guarda en ebx
    pop ebx

    nop


    ; BLOQUE 2: LIFO

    mov eax, 10 ; ESP + 8
    push eax

    mov eax, 20 ; ESP + 4 , 
    push eax

    mov eax, 30 ; ESP
    push eax

    nop ; hace que el programa se detenga y espere a que se presione una tecla para continuar
        
        ;los valores se sacan de la pila en orden inverso al que fueron guardados, es decir, el último valor que se guardó es el primero que se saca.
    pop eax
    pop ebx
    pop ecx
    mov eax, 100
    mov ebx, 200
    push eax ; hace que el valor de eax se guarde en la pila
    push ebx

    mov eax, 999
    mov ebx, 666

    pop ebx
    pop eax

    ; BLOQUE 4: CALL Y RET

    mov eax, 111
    mov ebx, 222
    ;   
    call aumentarDiez



    nop

    exit
main ENDP

aumentarDiez PROC ; aumenta el valor de eax en 10 y lo devuelve en eax
    push ebx

    mov ebx, 10
    add eax, ebx 

    pop ebx

    ret
aumentarDiez ENDP

END main
