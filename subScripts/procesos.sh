#!/bin/bash
function procesos(){
	if [[ $# -eq 0 ]]; then
		ps au 2> $dir_actual/errores
	else
		escribir negrita amarillo "	Lista los procesos actuales\n"
		escribir normal azul "	Uso: procesos\n"
	fi
}