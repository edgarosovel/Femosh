#!/bin/bash
function valorOctal(){
	valor=0
	for i in $@; do
		if [ "$1" != "$i" ]; then
			case $i in
				l )
					valor=$(( valor+4 ))
					;;
				m )
					valor=$(( valor+2 ))
					;;
				e )
					valor=$(( valor+1 ))
					;;
				* )
					;;
			esac
		fi
	done
	return $valor
}

function permisos (){
	if [ $# -eq 0 ]; then
		escribir negrita amarillo "	Lista y modifica los permisos de archivos y directorios\n"
		escribir normal azul "	Uso: \n	permisos «archivo» Regresa los permios del archivo\n	permisos «archivo» «ulme gulme tulme ...» Asigna los permisos al archivo
		Permisos:
		u ➩ Usuario
		g ➩ Grupo
		t ➩ Todos

		l ➩ Lectura
		m ➩ Modificación
		e ➩ Ejecución
		\n"
	elif [ $# -eq 1 ]; then
		if [ -f $1 ] || [ -d $1 ]; then
			ls -l $1 | awk '{print $1;}'
		else
			escribir normal rojo "	\"$1\" no es un archivo o directorio\n"
		fi
	else
		if [ -f $1 ] || [ -d $1 ]; then
			arr=( "$@" )
			modo="ugt"
			for i in ${arr[@]}; do
				if [ "$1" != "$i" ]; then
					declare -a foo
					foo=( `echo $i | fold -w1` )
					case ${foo[0]} in
						u)
							valorOctal ${foo[@]}
							v=$?
							modo=`echo ${modo} | tr "u" $v`
						;;
						g)
							valorOctal ${foo[@]}
							v=$?
							modo=`echo ${modo} | tr "g" $v`
						;;
						t)
							valorOctal ${foo[@]}
							v=$?
							modo=`echo ${modo} | tr "t" $v`
						;;
					esac
				fi
			done
			modo=`echo ${modo} | tr '[ugt]' '0'`
			chmod "${modo}" "$1" 2> $dir_actual/errores
			if [ $? -eq 0 ]; then
				escribir normal verde "	Permisos asigandos correctamente\n"
			else
				escribir normal rojo "	Ocurrió un error, ¿Desea intentar como super usuario? (Escriba contraseña si sí, o de enter si no)\n"
				read -s pass
				if [ "$pass" != "" ]; then
					cmd="echo ${pass} | sudo -S chmod ${modo} $1 2> $dir_actual/errores"
					eval $cmd
					if [ $? -eq 0 ]; then
						escribir normal verde "	Permisos asigandos correctamente\n"
					else
						escribir normal rojo "\n	Ocurrió un error\n"
					fi
				fi
			fi
		else
			escribir normal rojo "	\"$1\" no es un archivo o directorio\n"
		fi
	fi
}