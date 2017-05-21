#!/bin/bash
function editar(){
	if [[ $# -eq 0 ]]; then
		escribir negrita amarillo "	Edita el contenido de un archivo con VI\n"
		escribir normal azul "	Uso: editar «archivo»\n"
	elif [[ $# -eq 1 ]]; then
		if [[ -f $1 ]]; then
			if [[ -w $1 ]]; then
				vi $1 2> $dir_actual/errores
			else
				escribir normal rojo "	No tiene permisos para editar este archivo, ¿Desea intentar como super usuario? [s/n]\n"
				read -s pass
				if [ "$pass" == "s" ]; then
					cmd="sudo vi $1 2> $dir_actual/errores"
					eval $cmd
				fi
			fi
		else
			escribir normal rojo "	Elemento inexistente o no soportado\n"
		fi
	else
		escribir normal rojo "	Solo se acepta un argumento\n"

	fi
}