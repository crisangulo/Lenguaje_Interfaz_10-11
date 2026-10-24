; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa captura un mensaje del usuario y lo despliega en pantalla.



INCLUDE Irvine32.inc

.data
mensaje BYTE "Escribe tu nombre: ",0
nombre  BYTE 15 DUP(0)

.code
main PROC

    ; Mostrar mensaje
    mov edx, OFFSET mensaje
    call WriteString

    ; Leer nombre
    mov edx, OFFSET nombre
    mov ecx, SIZEOF nombre
    call ReadString

    call Crlf

    ; Mostrar nombre capturado
    mov edx, OFFSET nombre
    call WriteString

    call Crlf

    exit

main ENDP
END main