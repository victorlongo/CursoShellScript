#!/bin/bash

#########################################################
#							#
#	Criando e Executando Scripts - Exercícios 	#
#							#
#########################################################

# 1. Crie um Script que após executado solicite dois valores como entrada. Esses valores devem ser somados e o resultado exibido para o usuário.

read -p "Digite um número inteiro: " NUM1
read -p "Digite outro número inteiro: " NUM2
echo "Resultado da soma: " ; expr $NUM1 + $NUM2



