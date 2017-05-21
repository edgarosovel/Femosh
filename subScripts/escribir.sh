#!/bin/bash
function escribir () {
	if [[ $# -gt 2 ]]; then
		texto=$@
		#texto=${texto[@]2:@}

		if [[ "$1" = "negrita" ]]; then
			f="1;"
		else
			f=""
		fi

		case "$2" in
			italica) #3m
				formato="\\e[${f}3m"
			;;
			subrayar)
				formato="\\e[${f}4m"
			;;
			negro) #30m
				formato="\\e[${f}30m"
			;;
			rojo) #31m
				formato="\\e[${f}31m"
			;;
			verde) #32m
				formato="\\e[${f}32m"
			;;
			amarillo) #33m
				formato="\\e[${f}33m"
			;;
			azul)
				formato="\\e[${f}34m"
			;;
			morado) #35
				formato="\\e[${f}35m"
			;;
			cyan) #36
				formato="\\e[${f}36m"
			;;
			blanco) #37
				formato="\\e[${f}37m"
			;;
			default) #39
				formato="\\e[${f}39m"
			;;
			*)
				formato="\\e[0m"
			;;
		esac
		printf "${formato}${3}\\e[m"
		else
		escribir negrita rojo "Error de formato"
	fi
}