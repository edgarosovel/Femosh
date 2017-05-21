#!/bin/bash
function crear(){
	if [[ $# -eq 0 ]]; then
		escribir negrita amarillo "	Crea un archivo o directorio nuevo\n"
		escribir normal azul "	Uso: crear «opcion» «nombre/ruta»
		Opciones:
		d ➩ directorio
		a ➩ archivo\n"
	elif [[ $# -eq 2 ]]; then
		case $1 in
			d)
				foo="mkdir"
			;;
			a)
				foo="touch"
			;;
			*)
				escribir normal rojo "	Opcion «${1}» no válida.\n"
				escribir normal azul "	Uso: crear «opcion» «nombre/ruta»
		Opciones:
		d ➩ directorio
		a ➩ archivo\n"
				return
			;;
		esac
		if [[ ! -e $2 ]]; then
			tmp=`${foo} $2 2> $dir_actual/errores`
			if [[ $? -eq 0 ]]; then
				escribir normal verde "	«${2}» creado exitosamente.\n"
			else
				escribir normal rojo "	Error al crear «${2}», ¿Desea intentar como super usuario? (Escriba contraseña si sí, o de enter si no)\n"
				read -s pass
				if [ "$pass" != "" ]; then
					tmp=`echo ${pass} | sudo -S ${foo} $2 2> $dir_actual/errores`
					if [ $? -eq 0 ]; then
						escribir normal verde "	«${2}» creado exitosamente.\n"
					else
						escribir normal rojo "\n	Ocurrió un error\n"
					fi
				fi
			fi
		else
			escribir normal rojo "	«${2}» ya existe.\n"
		fi
	else
		escribir normal rojo "	Error. Se necesitan dos argumentos\n"
		escribir normal azul "	Uso: crear «opcion» «nombre/ruta»
		Opciones:
		d ➩ directorio
		a ➩ archivo\n"
	fi
}