; Nombre: Alma Crispina Angulo Machado
; Materia: Lenguajes de Interfaz
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Este programa crea un archivo de texto llamado "Inventario.txt", escribe el valor "125" en él y luego cierra el archivo. Si la operación es exitosa, muestra un mensaje de éxito; de lo contrario, muestra un mensaje de error.

INCLUDE Irvine32.inc

.data
	nombreArchivo BYTE "Inventario.txt", 0 ; Nombre del archivo
	texto BYTE "125", 0 ; Texto a guardar
	archivoHandle DWORD ? ; Manejador del archivo

	mensajeExito BYTE "Archivo guardado correctamente.", 0
	mensajeError BYTE "No se pudo guardar el archivo.", 0
.code
main PROC
	;1. Crear el archivo txt.
		mov edx, OFFSET nombreArchivo ; Cargar la dirección del nombre del archivo
		call createopenFile ; Llamar a la función para crear/abrir el archivo


		cmp eax, INVALID_HANDLE_VALUE 
		je error ; Si el manejador es inválido, saltar a la etiqueta de error


		mov archivoHandle, eax

	;2.Escribir caracteres en archivo txt.
		mov eax, archivoHandle ; Cargar el manejador del archivo
		mov edx, OFFSET texto
		mov ecx, SIZEOF texto - 1 ; Tamaño del texto a escribir
		call WriteFile

		jc errorEscritura

		cmp eax, SIZEOF texto - 1 
		jne errorEscritura ; Si no se escribieron todos los caracteres, saltar a la etiqueta de error de escritura

	;3. Cerrar el archivo txt.
			mov eax, archivoHandle
			call CloseFile ; Cerrar el archivo

			test eax, eax
			jz,error ; Si la operación de cierre falla, saltar a la etiqueta de error

			mov edx, OFFSET mensajeExito
			call WriteString ; Mostrar mensaje de éxito
			jmp fin ; Saltar al final del programa

	errorEscritura:
		mov eax, archivoHandle
		call CloseFile
	error:
		mov edx, OFFSET mensajeError
		call WriteString 
	fin:
	exit
main ENDP
END main
