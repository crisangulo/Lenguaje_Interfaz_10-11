; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa muestra el uso de los ciclos while y do while.

INCLUDE Irvine32.inc

.data
.code
main PROC

 ;   ebx se usa como contador para los ciclos while y do while
    mov ebx, 1

cicloWhile:
        ;condicion del ciclo while, se compara ebx con 100 
    jg fin 
        ; si ebx es menor o igual a 100 se imprime el valor de ebx
    mov eax, ebx
    call WriteDec 
    call Crlf 

        ;incrementa ebx en 1
    inc ebx 
    
    jmp cicloWhile  ; regresa al inicio del ciclo while

fin:
    call Crlf 
   
    mov ebx, 1 
cicloDoWhile:
        ;imprime el valor de ebx
    mov eax, ebx 
    call WriteDec 
    call Crlf 
        ; ebx se incrementa en 1
    inc ebx
        ; incrementa ebx en 1 y se compara con 100, si es menor o igual a 100 se regresa al inicio del ciclo do while
    cmp ebx, 100 
        ; si ebx es menor o igual a 100 se regresa al inicio del ciclo do while
    jle cicloDoWhile 
    exit 
main ENDP

END main







main ENDP
END main
