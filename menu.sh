#!/bin/bash

source ./config.sh

while true;do 
	echo "############################################################"
	echo -e "\nOlá, Bem-Vindo!\n"
	echo "PROGRAMA DE BACKUP"
	echo "############################################################"
	echo "-----------------------------------------------------------"
	echo "1- Realizar backup"
	echo "-----------------------------------------------------------"
	echo "2- Adicionar dispositivo"
	echo "-----------------------------------------------------------"
	echo "3- Remover dispositivo"
	echo "-----------------------------------------------------------"
	echo "4-Listar backup"
	echo "-----------------------------------------------------------"
	echo "5-Listar dispositivos"
	echo "-----------------------------------------------------------"
	echo "6-Encerrar programa"
	echo "-----------------------------------------------------------"
	echo "7-Verificar tamanho dos backups feitos"	
	echo "-----------------------------------------------------------"
	read -p "Selecione uma opçao: " alternativa
	case $alternativa in 
		"1") backup;;
		"2") cadastrar;;
		"3") remover;;
		"4") bdisponiveis;;
		"5") listagem;;
		"6") break;;
		"7") tamanho;;
	esac
done
