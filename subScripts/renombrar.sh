#!/bin/bash
function renombrar(){
	if [ $# -eq 2 ]; then
		dir1="$(dirname "$1")"
		dir2="$(dirname "$2")"
		if [ $dir1 == $dir2 ]; then
			if [ $1 != $2 ]; then
				mv $1 $2 2> $dir_actual/errores
				if [ $? -eq 0 ]; then
					escribir normal verde "	Archivo renombrado a \"$2\" exitosamente\n"
				else
					escribir normal rojo "	Ocurrió un error, ¿Desea intentar como super usuario? (Escriba contraseña si sí, o de enter si no)\n"
					read -s pass
					if [ "$pass" != "" ]; then
						cmd="echo ${pass} | sudo -S mv $1 $2 2> $dir_actual/errores"
						eval $cmd
						if [ $? -eq 0 ]; then
							escribir normal verde "	Archivo renombrado a \"$2\" exitosamente\n"
						else
							escribir normal rojo "\n	Ocurrió un error\n"
						fi
					fi
				fi
			else
				escribir normal rojo "	El archivo no puede tener el mismo nombre\n"
			fi
		else
			escribir normal rojo "	El archivo no puede tener diferente ubicación\n"
		fi
	else
		escribir negrita amarillo "	Modifica el nombre de archivos y directorios\n"
		escribir normal azul "	Uso: renombrar «ubicacion del archivo» «nuevo nombre»\n"
	fi
}