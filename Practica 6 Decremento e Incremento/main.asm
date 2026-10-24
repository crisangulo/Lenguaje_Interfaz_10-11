; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa solicita al usuario ingresar una clave, y permite un máximo de 3 intentos para ingresar la clave correcta. Si el usuario ingresa la clave correcta, se muestra un mensaje de acceso permitido. Si el usuario agota los 3 intentos sin ingresar la clave correcta, se muestra un mensaje de sistema bloqueado.

INCLUDE Irvine32.inc

.data
	
	 msgPIN BYTE "Ingrese la clave: ",0
    msgError BYTE "Clave Incorrecta.",0
    msgAcceso BYTE "Acceso permitido",0
    msgBloqueo BYTE "Sistema Bloqueado",0
    msgIntentos BYTE "Intentos restantes: ",0

    claveCorrecta = 1234

.code
main PROC

        ;se inicializa el contador de intentos en 3
    mov ebx, 3 
        ;se salta a la etiqueta de intentar para permitir al usuario ingresar la clave
    intentar:
        ;imprime el mensaje de ingreso de clave
    mov edx, OFFSET msgPIN
    call WriteString 
    
    call ReadInt 

        ;compara el valor ingresado con la clave correcta
    cmp eax, claveCorrecta

        ; si es igual, se salta a la etiqueta de acceso permitido
    je acceso 

        ; si no es igual, se imprime el mensaje de error
    mov edx, OFFSET msgError 
    call WriteString
    call crlf 
    dec ebx ; decrementa el contador de intentos   
    jz bloqueado ; si el contador llega a 0, se salta a la etiqueta de sistema bloqueado

        ; se imprime el mensaje de intentos restantes
    mov edx, OFFSET msgIntentos
    call WriteString
    mov eax, ebx
    call WriteDec
    call crlf
    jmp intentar

acceso:
        ; se imprime el mensaje de acceso permitido
    mov edx, OFFSET msgAcceso
    call WriteString
    jmp fin ; termina el programa

bloqueado:
       ; imprime el mensaje de sistema bloqueado
    mov edx, OFFSET msgBloqueo
    call WriteString
    jmp fin
fin:
    exit 
main ENDP

END main
