; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez


INCLUDE Irvine32.inc

.data

    msgIngresar1 BYTE "Teclea el primer valor: ", 0
    msgIngresar2 BYTE "Teclea el segundo valor: ", 0

    msgMayor   BYTE "El primer numero es mayor.", 0
    msgMenor   BYTE "El primer numero es menor.", 0
    msgIguales BYTE "Los numeros son iguales.", 0

.code
main PROC

    mov edx, OFFSET msgIngresar1 
    call WriteString
    ;   ReadInt lee un valor entero y lo almacena en EAX 
    call ReadInt 
    ;   hace que guarde el valor en ecx porque se volverá a usar ReadInt y se sobreescribirá el valor en EAX
    mov ecx, eax
    ;   Se despliega el mensaje para ingresar el segundo valor
    mov edx, OFFSET msgIngresar2 
    call WriteString 
    call ReadInt 
    mov ebx, eax 
    mov eax, ecx 
    cmp eax, ebx 
    jg mayor
    jl menor
    ;   en caso de que la comparación de mayor o menor no se cumpla, se va directamente al mensaje de iguales
    mov edx, OFFSET msgIguales
    call WriteString
    jmp fin ;   salta a la etiqueta fin para terminar el programa

    mayor:
        mov edx, OFFSET msgMayor ;  muestra el mensaje de que el primer número es mayor
        call WriteString 
        jmp fin
    
    menor:
        mov edx, OFFSET msgMenor ;  muestra el mensaje de que el primer número es menor
        call WriteString 

    fin: 
        call Crlf
        exit

main ENDP
END main