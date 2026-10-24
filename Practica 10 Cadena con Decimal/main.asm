; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez


INCLUDE Irvine32.inc

.data
	tmArchivo DWORD 100000 
	NumBloques DWORD 125
	tmBloque DWORD 512
	tmGrupo DWORD 1024
	ytesDescargados DWORD ?    ; el ? es para indicar que no se sabe el valor y sera asignado en la ejecucion
	bytesPendientes DWORD ?
	porcentaje DWORD ?
	residuo DWORD ?
	grupos DWORD ?

	msgDescargados BYTE "Bytes descargados: ", 0
	msgPendientes BYTE "Bytes pendientes: ", 0
	msgPorcentaje BYTE "Porcentaje de avance: ", 0
	msgGrupos BYTE "Grupos completos de 1024 bytes: ", 0
	msgResiduo BYTE "Residuo: ", 0
	msgPorcentajeFinal BYTE "%", 0
	buffer BYTE 11 DUP(0)


.code
main PROC
	  ; calcula los bytes descargados, con base en el numero de bloques y el tamaño de cada bloque
    mov eax, NumBloques
    mul tmBloque
    mov bytesDescargados, eax

    ; calcula los bytes pendientes, restando los bytes descargados al tamaño total del archivo
    mov eax, tmArchivo
    sub eax, bytesDescargados
    mov bytesPendientes, eax

    ; calcula el porcentaje de avance, multiplicando los bytes descargados por 100 y dividiendo entre el tamaño total del archivo
    mov eax, bytesDescargados
    mov ebx, 100
    mul ebx
    div tmArchivo
    mov porcentaje, eax

    ; calcula el número de grupos completos de 1024 bytes y el residuo, dividiendo los bytes descargados entre el tamaño del grupo
    xor edx, edx
    mov eax, bytesDescargados
    div tmGrupo
    mov grupos, eax
    mov residuo, edx

    ; imprime los resultados en pantalla
    mov edx, OFFSET msgDescargados
    call WriteString
    mov eax, bytesDescargados
    ; manda a llamar a la funcion de convertir decimal
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; imprime los bytes pendientes
    mov edx, OFFSET msgPendientes
    call WriteString
    mov eax, bytesPendientes
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; imprime el porcentaje de avance
    mov edx, OFFSET msgPorcentaje
    call WriteString
    mov eax, porcentaje
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    mov edx, OFFSET msgPorcentajeFinal
    call WriteString
    call Crlf

    ; imprime el número de grupos completos de 1024 bytes
    mov edx, OFFSET msgGrupos
    call WriteString
    mov eax, grupos
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; imprime el residuo
    mov edx, OFFSET msgResiduo
    call WriteString
    mov eax, residuo
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP

; el uses es para que el proc use esos registros pero no los modifique
convertirDecimal PROC USES ebx ecx edx edi
    ;   se copia de esi a edi para usar edi para escribir en el buffer
    mov edi, esi
    ;   se usa la formula de dividir el numero entre 10 y guardar el residuo, hasta que el numero sea 0
    mov ebx, 10
    ;   se inicializa el contador de digitos en 0
    xor ecx, ecx
    cmp eax, 0
    jne dividirNumero
    ;   si el numero es 0, se escribe '0' en el buffer, BYTE PTR [edi] es para indicar que se escribira un byte en la direccion de memoria apuntada por edi
    mov BYTE PTR [edi], '0'
    ;   se incrementa edi para apuntar a la siguiente direccion de memoria 
    inc edi
    ;   finaliza con el salto a terminarCadena para escribir el 0 al final de la cadena
    jmp terminarCadena

dividirNumero:
    ;   esto deja edx limpio
    xor edx, edx
    div ebx
    ;   se guarda el residuo en edx, que es el digito que se escribira en el buffer
    push edx
    ;   se incrementa el contador de digitos
    inc ecx
    ;  se repite el proceso hasta que eax sea 0
    test eax, eax
    ;   finaliza el ciclo cuando eax sea 0, sino se repite el proceso
    jnz dividirNumero

escribirDigitos:
    ;   se saca el digito del stack y se convierte a caracter sumando '0'
    pop edx
    ;   se convierte el digito a caracter sumando '0' 
    add dl, '0'
    ;   se escribe el digito en el buffer
    mov BYTE PTR [edi], dl
    inc edi
    loop escribirDigitos

terminarCadena:
    ;   se escribe el 0 al final de la cadena para indicar que es una cadena de caracteres
    mov BYTE PTR [edi], 0
    ret
convertirDecimal ENDP
 main ENDP
END main