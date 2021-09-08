#!/usr/bin/env bash

# Mike Edwards
# ------------------------------------------------- ------
# Script: cpf.sh
# ------------------------------------------------- ------
# Descrição: CPF generator
# ------------------------------------------------- ------
# Versão: 0.1
# ------------------------------------------------- ------
# Autor: Mike Edwards
# ------------------------------------------------- ------
# Date: 08/08/21
# ------------------------------------------------- ------
# Lincese: MIT lincese
# ------------------------------------------------- ------
# Use: bash A1.sh
# ------------------------------------------------- ------
# Mike Edwards

end="\033[m"
blue="\033[1;34m"
cyan="\033[1;36m"

function cpf()
{
    soma=0
    for i in {10..2}; do
        numero=$(($RANDOM%9))
	      cpf=$cpf$numero
	      soma=$(($soma+($numero*$i)))
    done

    resto=$(($soma%11))

    if [[ $resto -lt 2 ]]; then
        digito=0
    
    else
        digito=$((11-$resto))
    fi

    cpf=$cpf$digito
    soma=0

    for i in {11..2}; do
	      indice=$((($i-11)*-1))
	      soma=$(($soma+(${cpf:$indice:1}*$i)))
    done

    resto=$(($soma%11))

    if [[ $resto -lt 2 ]]; then
	      digito1=0

    else 
	      digito1=$((11-$resto))
    fi

    cpf=$cpf$digito1
    clear
    printf "\n${blue}CPF GAREDO: ${cyan}$cpf ${end}\n"
}
cpf



