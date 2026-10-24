; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa solicita al usuario ingresar la cantidad de unidades que llegaron (de 1 a 99) y actualiza la existencia actual de un producto. Si el usuario ingresa un valor fuera del rango permitido, se muestra un mensaje de error y se solicita nuevamente la entrada.

INCLUDE Irvine32.inc

.data
	 mensajeEntrada BYTE "Cuantas unidades llegaron (1-99): ", 0
    mensajeError BYTE "Entrada invalida. Escribe solo digitos, de 1 a 99.", 13, 10, 0
    mensajeResultado BYTE "Existencia actual: ", 0
    mensajeUnidades BYTE " unidades", 13, 10, 0


    entrada BYTE 16 DUP(0)
    salida BYTE 11 DUP(0)

    cantidadRecibida DWORD ? ; la variable para almacenar la cantidad recibida del usuario
    existenciaActual DWORD 25
.code
main PROC
    solicitarEntrada:
    mov edx, OFFSET mensajeEntrada
    call WriteString

   
    mov edx, OFFSET entrada ; estamos moviendo la direccion de memoria de la variable entrada a edx para que ReadString pueda almacenar la cadena ingresada por el usuario en esa direccion de memoria.
    mov ecx, SIZEOF entrada
    call ReadString

   
    cmp eax, 1
    jb entradaInvalida ;salto a la etiqueta entradaInvalida si el valor en eax es menor que 1
    cmp eax, 2
    ja entradaInvalida ;salto a la etiqueta entradaInvalida si el valor en eax es mayor que 2

    
    mov esi, OFFSET entrada
    mov ecx, eax
    xor ebx, ebx

convertirDigitos:
    movzx eax, BYTE PTR [esi] ;hacemos un movzx para mover el valor de un byte a un registro de 32 bits, en este caso movemos el valor del primer caracter de la cadena ingresada por el usuario a eax.
    cmp al, '0'
    jb entradaInvalida ;salto a la etiqueta entradaInvalida si el valor en al es menor que '0'
    cmp al, '9'
    ja entradaInvalida ;salto a la etiqueta entradaInvalida si el valor en al es mayor que '9'

    sub eax, '0'
    imul ebx, ebx, 10 ; multiplicamos el valor actual por 10
    add ebx, eax

    inc esi
    loop convertirDigitos

    
    cmp ebx, 1
    jb entradaInvalida
    cmp ebx, 99
    ja entradaInvalida

    mov cantidadRecibida, ebx

    mov eax, existenciaActual
    add eax, cantidadRecibida
    mov existenciaActual, eax

    mov eax, existenciaActual
    mov edi, OFFSET salida
    call DwordToString ;llamamos a la funcion DwordToString para convertir el valor de existenciaActual a una cadena de caracteres y almacenarla en la variable salida.

    mov edx, OFFSET mensajeResultado
    call WriteString
    mov edx, OFFSET salida
    call WriteString
    mov edx, OFFSET mensajeUnidades
    call WriteString

    exit

entradaInvalida:
    mov edx, OFFSET mensajeError
    call WriteString
    jmp solicitarEntrada

main ENDP ;aqui termina el procedimiento main

DwordToString PROC USES eax ebx ecx edx edi
    mov ebx, 10
    xor ecx, ecx

    cmp eax, 0
    jne dividirNumero
    mov BYTE PTR [edi], '0'
    inc edi
    jmp terminarCadena

dividirNumero:
    xor edx, edx
    div ebx
    push edx
    inc ecx
    test eax, eax
    jnz dividirNumero

escribirDigitos:
    pop edx
    add dl, '0'
    mov BYTE PTR [edi], dl
    inc edi
    loop escribirDigitos

terminarCadena:
    mov BYTE PTR [edi], 0
    ret
DwordToString ENDP

END main
