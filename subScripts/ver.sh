#!/bin/bash
function ver(){
	if [[ $# -eq 0 ]]; then
		escribir negrita amarillo "	Visualiza un archivo o el contenido de un directorio\n"
		escribir normal azul "	Uso: ver «archivo o documento»\n"
	elif [[ $# -eq 1 ]]; then
		if [[ -f $1 ]]; then
			cat $1 2> $dir_actual/errores
		elif [[ -d $1 ]]; then
			ls -la $1 2> $dir_actual/errores
		else
			escribir normal rojo "	Elemento inexistente o no soportado\n"
		fi
	else
		escribir normal rojo "	Solo se acepta un argumento\n"

	fi
}