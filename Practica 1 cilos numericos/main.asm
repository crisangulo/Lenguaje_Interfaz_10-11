; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa muestra el uso de la pila, el uso de la instruccion call y ret, y el uso de la instruccion loop.

INCLUDE Irvine32.inc
.data

 ;AQUI SE UTILIZA UN CONTADOR PARA REPETIR LA INSTRUCCION DE NTRO DE LA ESTRUCTURA HASTA QUE LLEGUE A 0.

.code
main PROC
	
    mov ecx, 5 ;ecx es el contador.
ciclo:
    ;Imprime el valor ecx
    mov eax, ecx 
    ; impirme  eax en decimal
    call WriteDec
    call Crlf
    ;repite el codigo las veces necesarias hasta que ecx sea igual a 0. Decrementa el valor en 1
    loop ciclo 

    exit


main ENDP
END main
