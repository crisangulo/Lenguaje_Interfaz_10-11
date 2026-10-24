; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa solicita al usuario ingresar un codigo en el formato "XXX-123", donde "XXX" son letras mayusculas y "123" son digitos. El programa valida el formato del codigo ingresado y despliega un mensaje indicando si el formato es valido o invalido, especificando el error en caso de ser invalido.


INCLUDE Irvine32.inc

.data
	.data
    prompt BYTE "Ingresa el codigo (ej. TEC-123): ",0

    msg_valido BYTE "Formato valido. La cadena cumple todas las reglas.",13,10,0

    err_longitud BYTE "Formato invalido: La longitud no es igual a 7.",13,10,0
    err_letras   BYTE "Formato invalido: Las posiciones 0-2 no son letras mayusculas (A-Z).",13,10,0
    err_guion    BYTE "Formato invalido: Falta el separador '-'.",13,10,0
    err_digitos  BYTE "Formato invalido: Las posiciones 4-6 no son digitos (0-9).",13,10,0

    buffer BYTE 20 DUP(0)
    bytesLeidos DWORD ?

.code
main PROC

    ; Solicitar codigo
    mov edx, OFFSET prompt
    call WriteString

    ; Leer cadena
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString

    mov bytesLeidos, eax

    ; PASO 1: Verificar longitud = 7
    cmp eax, 7
    jne error_longitud

    mov esi, OFFSET buffer

    ; PASO 2: Validar 3 letras mayusculas
    mov ecx, 3

validar_letras:
    mov al, [esi]

    cmp al, 'A'
    jb error_letras

    cmp al, 'Z'
    ja error_letras

    inc esi
    loop validar_letras

    ; PASO 3: Validar guion
    mov al, [esi]
    cmp al, '-'
    jne error_guion

    inc esi

    ; PASO 4: Validar 3 digitos
    mov ecx, 3

validar_digitos:
    mov al, [esi]

    cmp al, '0'
    jb error_digitos

    cmp al, '9'
    ja error_digitos

    inc esi
    loop validar_digitos

    ; Todo correcto
    mov edx, OFFSET msg_valido
    call WriteString
    jmp fin

error_longitud:
    mov edx, OFFSET err_longitud
    call WriteString
    jmp fin

error_letras:
    mov edx, OFFSET err_letras
    call WriteString
    jmp fin

error_guion:
    mov edx, OFFSET err_guion
    call WriteString
    jmp fin

error_digitos:
    mov edx, OFFSET err_digitos
    call WriteString

fin:
    exit

main ENDP
END main