#!/bin/bash
function copiar(){
	declare -a arr
	necesitaPermisos=0
	esSudo=""
	arr=( "$@" )

	if [ $# -lt 2 ]
	then
		escribir negrita amarillo "	Copia n cantidad de archivos a una ruta\n"
		escribir normal azul "	Uso: copiar «ruta de destino» «archivo1 archivo2 archivo3...»\n"
	else
		if [ -d ${arr[0]} ] || [ ! -f ${arr[0]} ]; then
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
				if [ $i != ${arr[0]} ]; then
					cmd="${esSudo} cp -r $i ${arr[0]} 2> $dir_actual/errores"
					eval $cmd
					if [ $? -eq 0 ]; then
						escribir normal verde "	El archivo «${i}» fue copiado con éxito\n"
					else
						escribir normal rojo "	Error al copiar el archivo «${i}».\n"
					fi
				fi
			done
		else
			escribir normal rojo "	Ya existe un elemento con ese nombre\n"
		fi
	fi
}