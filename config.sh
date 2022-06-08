#!/bin/bash

#Arquivo de configuração do backup

#Função para cadastro de outros computadores


function cadastrar(){
	clear
	comp=$(( $(wc -l < pcs.txt) + 1))
	read -p "Qual nome de usuário?" usuario
	read -p "Digite o ip" ip
	echo "comp-$comp $usuario $ip" >> pcs.txt
	echo "computador cadastrado com sucesso"
}

#Função para remoção dos computadores

function remover(){
	clear
	cat pcs.txt
	read -p "Qual computador deseja remover?" comp
	sed -i $comp"d" pcs.txt 
	echo "comp-$comp removido"
}

#Função para listagem de computadores disponiveis

function listagem(){
	clear
	echo "computadores disponiveis"
	cat pcs.txt
}

#Função para realização do backup

function backup(){
	clear
	formato=$(date +"%F-%H%M%S")
	arquivo="backup-$formato.tar.gz"
	cat pcs.txt
	read -p "Escolha qual computador ira realizar o backup" comp
	usuario=$(cat pcs.txt | grep comp-$comp | awk '{print $2}')
	ip=$(cat pcs.txt | grep comp-$comp | awk '{print $3}')
	read -p " Qual pasta deseja realizar o backup?"  pbackup
	mkdir "${PWD}/backup/comp-$comp/$(basename $pbackup)" &> /dev/null
	scp -r "$usuario@$ip:$pbackup" "${PWD}/backup/com-$comp/$(basename $pbackup)"
	tar -czvf $arquivo "${PWD}/backup/comp-$comp/$(basename $pbackup)/$(basename $pbackup)"
        clear
	rm -rf "${PWD}/backup/comp-$comp/$(basename $pbackup)/$(basename $pbackup)"
	cp $arquivo "./backup/comp-$comp/$(basename $pbackup)"
	rm $arquivo
	echo "backup salvo"
}




