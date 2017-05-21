#!/bin/bash
function l(){
	if [ $# -eq 0 ]; then
		ls -la
	elif [ $# -eq 1 ]; then
		if [[ -e $1 ]]; then
			ls -la $1 2> $dir_actual/errores
		else
			escribir normal rojo "	El elemento «${1}» no existe\n"
		fi
	else
		escribir negrita amarillo "	Lista los archivos y carpetas de un directorio\n"
		escribir normal azul "	Uso:\n	«l» Lista los archivos y carpetas del directorio actual\n	«l» «directorio» Lista los archivos y carpetas del directorio\n"
	fi
}