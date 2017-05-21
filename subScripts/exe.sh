#!/bin/bash
function exe (){
	if [ $# -gt 0 ]
	then
		ruta="$dir_actual/exe/$1"
		if [ ! -e $ruta ]
		then
			if [ ! -d "$dir_actual/exe" ]
			then
				#PATH=$PATH:${HOME}/bin
				mkdir "$dir_actual/exe"
			fi
			touch $ruta
			chmod +x $ruta
			echo "#!/bin/bash" >> $ruta
			vim $ruta
			if [ ! -s $ruta ]
			then
				rm $ruta
			fi
		else
			escribir normal azul "	El ejecutable \"$1\" ya existe, ¿Desea editarlo? [s/n]\n"
			read res
			if [ $res == "s" ]
			then
				vim $ruta
			fi
		fi
	else
		escribir negrita amarillo "	Crea un archivo ejecutable\n"
		escribir normal azul "	Uso: exe «Nombre del ejecutable»\n"
	fi
}
