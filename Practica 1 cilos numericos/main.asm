; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez


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
