; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa convierte un valor hexadecimal a su representación en cadena de caracteres.

INCLUDE Irvine32.inc


.code
main PROC 
     mov eax, 12AB34CDh
    mov ecx, 8

ciclo:

        ;obtiene el valor del nibble mas significativo
    mov edx, eax
    shr edx, 28
    and edx, 0Fh

        ;hacer la conversion a ASCII
    cmp edx, 9
    jbe esDigito

    add edx, 37h        ; valor ASCII para A-F
    jmp mostrar

esDigito:
    add edx, '0'        ; valor ASCII para 0-9

mostrar:
    push eax
    push ecx

    mov al, dl
    call WriteChar

    pop ecx ; restaurar ecx
    pop eax

    shl eax, 4 ; desplazar el valor de eax 4 bits a la izquierda para procesar el siguiente nibble
    loop ciclo

    call Crlf
    exit

main ENDP
END main
