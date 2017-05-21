#!/bin/bash
function di () {
	if [[ $# -eq 0 ]]; then
		escribir negrita amarillo "	Dice una oración (Solo para dispositivos Apple)\n"
		escribir normal azul "	Uso: di «Oración a decir»\n"
	fi
	say $@ 2> $dir_actual/errores
	if [[ ! $? -eq 0 ]]; then
		escribir normal rojo "	Comando disponible solo para dispositivos Apple"
	fi
}
