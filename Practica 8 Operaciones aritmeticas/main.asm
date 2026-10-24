; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa muestra el uso de las operaciones aritmeticas, y el uso de la instruccion mul e imul.

INCLUDE Irvine32.inc

.data
.code
main PROC

	; LOOP: REPETICION DE INSTRUCCIONES
mov eax, 50
mov ebx, 20

	;ADD: SUMA DE VALORES DENTRO DE 32 BITS  sub: para restar valores dentro de 32 bits
add eax, ebx
sub eax, 15

nop

	;CF: BANDERA DE CARRY, SE ACTIVA CUANDO SE SUPERA LA CAPACIDAD DE UN REGISTRO, acarreo en la suma sin signo
mov eax, 0
mov al, 255
add al,1
call dumpRegs

nop

	;desbordamiento de suma con signo 

mov eax, 0
mov al, 127
add al, 1

nop

	; MUL: PRODUCTO DE VALORES DENTRO DE 32 BITS SIN SIGNO

mov eax, 25
mov ebx, 3

mul ebx

nop

	; IMUL: PRODUCTO DE VALORES CON SIGNO DENTRO DE 32 BITS

mov eax, -5
imul eax, eax,3

	; MUL: PRODUCTO DE VALORES QUE EXCEDEN 32 BITS

mov eax, 65537
mov ebx, 65537

mul ebx

nop

exit

main ENDP
END main