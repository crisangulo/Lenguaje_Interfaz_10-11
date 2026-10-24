; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa muestra el uso de las operaciones logicas AND, OR, XOR y TEST, y el uso de la instruccion jz.

INCLUDE Irvine32.inc

.data
	msg1 BYTE "Alarma Apagada", 0
	msg2 BYTE "Alarma Encendida", 0

.code
main PROC

; 1 - Operacion AND: Evaluacion de estado de alarma

    mov eax, 0
    mov al, 00000101b
    and al ,00000010b
    
    call WriteBin ; Imprime los 32 BIts
    call Crlf
    nop

; 2 - Operacion OR: Enceder Alarma
    mov eax, 0
    mov al, 00000101b
    or al, 00000010b

    call WriteBin
    call Crlf
    nop

; 3 - Operacion XOR: Apagar y encender la computadora
    mov eax, 0
    mov al, 00000101b
    xor al, 00000001b

    call WriteBin
    call Crlf

    mov eax, 0
    mov al, 00000101b
    xor al, 00000001b

    call WriteBin
    call Crlf
    nop

; 4 - Operacion TEST: Evaluar la alarma encendida y apagada
; Mandar mensaje de alarma encendida o alarma apagada

    test al, 00000010b
    ;   si test fue cero salta a la alarmaApagada, si no a alarmaEncendida
    jz alarmaApagada
    jmp alarmaEncendida

alarmaApagada:
    mov edx, OFFSET msg1
    call WriteString
    call Crlf
    jmp fin

alarmaEncendida:
    mov edx, OFFSET msg2
    call WriteString
    call Crlf

fin:
    exit

main ENDP
END main