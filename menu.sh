#!/bin/bash


source ./config.sh

while true;do 
	echo -e "\nola, Bem Vindo!\n"
	echo "programa de backup"
	

	echo "1- Realizar backup"
	echo "2- Adicionar dispositivo"
	echo "3- Remover dispositivo"
	echo "4-Listar backup"
	echo "5-Listar dispositivos"
	echo "6-Encerrar programa"

	read -p "Selecione uma opçao: " alternativa
	case $alternativa in 
		"1") backup;;
		"2") cadastrar;;
		"3") remover;;
		"4") 
		"5") listagem;;
		"6") break;;
	esac
done
