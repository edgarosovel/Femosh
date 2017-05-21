#!/bin/bash
function cerrar(){
	if [[ $# -eq 0 ]]; then
		escribir negrita amarillo "	Cierra el proceso deseado\n"
		escribir normal azul "	Uso: cerrar «PID»\n "
	elif [[ $# -eq 1 ]]; then
		kill $1 2> $dir_actual/errores
		if [[ $? -eq 0 ]]; then
			escribir normal verde "	Proceso «${1}» cerrado\n"
		else
			escribir normal rojo "	Error al cerrar el proceso «${1}», ¿Desea cerrar el proceso forzadamente? [s/n]\n"
			read r
			if [ "$r" == "s" ]; then
				kill -9 $1 2> $dir_actual/errores
				if [[ $? -eq 0 ]]; then
					escribir normal verde "	Proceso «${1}» cerrado\n"
				else
					escribir normal rojo "	Error al cerrar el proceso «${1}», probablemente no tenga los permisos necesarios.\n"
				fi
			fi
		fi
	else
		escribir negrita amarillo "	Lista los procesos actuales\n"
		escribir normal azul "	Uso: procesos\n"
	fi
}