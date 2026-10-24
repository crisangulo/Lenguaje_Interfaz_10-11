; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa muestra el uso de las operaciones de desplazamiento y rotacion, y el uso de las instrucciones shl, shr, sar, rol, ror, rcl y rcr.

INCLUDE Irvine32.inc

.data
.code
main PROC
	  mov eax, 0

; 1 - SHL: Desplazamieto de un bit hacia a la izquierda
    mov al, 10000010b
    shl al, 1
    movzx eax, al
    call WriteBin
    call Crlf

    
; 2 - SHR: Desplazamiento de un bit hacia la derecha
    mov eax, 0
    mov al, 00001001b
    shr al, 1
    movzx eax, al
    call WriteBin
    call Crlf


; 3 - Desplazamiento con signo
    mov eax, 0
    mov al, -8
    sar al, 1
    movsx eax, al
    call WriteBin
    call Crlf

; 4 - Desplazamiento con constante
    mov eax, 0
    mov al, 00001100b
    shl al, 2
    movzx eax, al
    call WriteBin
    call Crlf

; 5 - Desplazamiento con cl
    mov eax, 0
    mov al, 00010100b
    mov cl, 2
    shr al, cl
    movzx eax, al
    call WriteBin
    call Crlf

; ROL, ROR, RCL, RCR
;10000001b
; clc limpia los flags
; 6 - Rotacion a la izquierda
    mov eax, 0
    mov al, 10000001b
    rol al, 1
    ;    copia al a eax y llena con 0 los 24 bits superiores
    movzx eax, al
    call WriteBin
    call Crlf

; 7 - Rotacion a la derecha
    mov eax, 0
    mov al, 10000001b
    ;   rota los bits de al a una posicion a la derecha, el bit que sale vuelve a entrar por el lado izquierdo
    ror al, 1
    movzx eax, al
    call WriteBin
    call Crlf

    mov eax, 0
    mov al, 10000001b
    clc
    ;   el rcl rota hacia la izquierda a traves de cf, el bit mas significativo de al, este pasa por cf y el valor anterior de cf entra por el bit menos significativos
    rcl al, 1
    movzx eax, al
    call WriteBin
    call Crlf

    mov eax, 0
    mov al, 10000001b
    clc
    ;   rcr rota hacia la derecha a traves de cf y el valor pasado de cf  entra por el bit mas significativo
    rcr al, 1
    movzx eax, al
    call WriteBin
    call Crlf

    exit
main ENDP
END main