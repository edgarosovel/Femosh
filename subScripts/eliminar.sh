#!/bin/bash
function eliminar(){
	if [[ $# -eq 0 ]]; then
		escribir negrita amarillo "	Elimina una serie de archivos o directorios\n"
		escribir normal azul "	Uso: eliminar «elemento1 elemento2 elemento3...»\n"
	else
		declare -a arr
		necesitaPermisos=0
		esSudo=""
		arr=( "$@" )
		for i in ${arr[@]}; do
			if [[ ! -O $i ]]; then
				necesitaPermisos=1
			fi
		done

		if [[ necesitaPermisos -eq 1 ]]; then
			escribir normal rojo "	No tiene los permisos necesarios de alguno de los archivos o carpetas, ¿Ejecutar como superusuario? (Escriba contraseña si sí, o de enter si no)\n"
			read -s pass
			if [ "$pass" != "" ]; then
				esSudo="echo ${pass} | sudo -S"
			fi
		fi

		for i in ${arr[@]}; do
			if [ -e $i ]; then
				cmd="$esSudo rm -r $i 2> $dir_actual/errores"
				eval $cmd
				if [ $? -eq 0 ]; then
					escribir normal verde "	El elemento «${i}» fue eliminado con éxito\n"
				else
					escribir normal rojo "	Error al eliminar el elemento «${i}».\n"
				fi
			else
				escribir normal rojo "	El elemento «${i}» no existe.\n"
			fi
		done
	fi
}