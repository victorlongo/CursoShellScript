#!/bin/bash

#########################################################
#                                                       #
#       Criando e Executando Scripts - Exercícios       #
#                                                       #
#########################################################

# 3. Crie um script que receba um nome de usuário como parâmetro e exiba as seguintes informações:
# - UID do usuário
# - Nome Completo / Descrição do Usuário
# - Total em uso no /home do usuário
# - Informações do último login do usuário
# - Validar se o usuário existe ou não sem o uso do if. 
# 	*Se não existir, retorne o exit code 1
#	*Se existir, retorne exit 0

ls /home/$1 > /dev/null 2>&1 || { echo "Usuário Inexistente" ; exit 1; }

echo "==========================================================================="
echo "Relatório do usuário: " $1
echo -n "UID: "; grep $1 /etc/passwd | cut -d":" -f"3"
echo -n "Nome ou Descrição: "; grep $1 /etc/passwd | cut -d":" -f"5"
echo ""
echo -n "Total Usado no /home/$1: "; du -h /home/$1 | egrep ''/home/$1'$' | cut -f1
echo ""
echo "Último Login: "; lastlog -u $1
echo "==========================================================================="
exit 0
