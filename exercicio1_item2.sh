#!/bin/bash

#########################################################
#                                                       #
#       Criando e Executando Scripts - Exercícios       #
#                                                       #
#########################################################

# 2. Crie um script que gere um relatório de algumas informações de máquina atual:
# - Nome da Máquina
# - Data e hora atual
# - Desde quando a máquina está ativa
# - Versão do Kernel
# - Quantidade de CPU/Cores
# - Modelo da CPU
# - Total de Memória RAM Disponível
# - Partições

echo "==========================================================================="
echo -n "Relatório da máquina: "; hostname 
echo -n "Data/Hora: "; date +%d/%m/%y," às "%H:%M:%S
echo "==========================================================================="
echo -n "Máquina ativa há: "; uptime -p | sed 's/up //' 
echo -n "Versão do Kernel: "; uname -r
echo -n "Quantidade de CPU: "; cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l
echo -n "Quantidade de Cores: "; cat /proc/cpuinfo | egrep "core id|physical id" | tr -d "\n" | sed 's/physical/\\nphysical/g' | grep -v ^$ | sort | uniq | wc -l 
echo -n "Modelo da CPU"; cat /proc/cpuinfo | egrep "model name" | sed 's/model name//' | tr "    " " "
echo -n "Memória Total: "; grep MemTotal /proc/meminfo | sed 's/MemTotal:    //' | tr "   " " "
echo "Partições: "; pydf

