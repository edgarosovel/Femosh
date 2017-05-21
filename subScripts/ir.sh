#!/bin/bash
function ir (){
	if [ $# == 1 ]; then
		if [ -d $1 ]; then
			cd "$1" 2> $dir_actual/errores
		elif [ -f $1 ]; then
			escribir normal rojo "	No es un directorio, es un archivo\n"
		else
			escribir normal rojo "	No existe tal directorio\n"
		fi
	else
		escribir negrita amarillo "	Comando para moverse en el sistema de directorios/archivos\n"
		escribir normal azul "	Uso: ir «ruta del directorio de destino»\n"
	fi
}