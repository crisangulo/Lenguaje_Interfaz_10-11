; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
;descripcion: Este programa muestra el uso de la instrucción jmp, que es un salto incondicional, y nos permite saltar a otra parte del código. En este caso, se asigna un valor a eax, luego se salta a la etiqueta continuar, y finalmente se muestra el valor de eax mediante la función DumpRegs.
INCLUDE Irvine32.inc

.data
.code
main PROC
	  ;   asignamos el valor a eax
    mov eax, 5
    ;   jmp es la instrucción de salto incondicional, que nos permite saltar a otra parte del código, continuar es el nombre de la funcion
    jmp continuar
    ;   asignamos el valor a eax
    mov eax, 10

    continuar: 
    ;   vamos mostrando el cambio de eax mediante la funcion DumpRegs
    call DumpRegs
    exit 
main ENDP
END main







main ENDP
END main
