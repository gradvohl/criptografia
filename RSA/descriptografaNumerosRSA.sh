#!/bin/bash
# Script para descriptografar uma sequência de valores 
# de acordo com o algoritmo RSA.
#
# Prof. Andre Leon S. Gradvohl, Dr.
# gradvohl@ft.unicamp.br
#
# Ultima atualizacao: qui 23 mai 2019 14:56:00 -03
#
if [[ $# -ne 6 ]]; then
  echo "Numero de parametros invalidos."
  echo -e "Uso:\n\t $0 -v \"sequencia de numeros entre aspas\"  -c <chave> -n <valor de n>"
  exit 1
fi
#
# Parsing dos parametros de entrada.
#
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -c|--chave)
    CHAVE="$2"
    shift # past argument
    shift # past value
    ;;
    -v|--valores)
    VALORES="$2"
    shift # past argument
    shift # past value
    ;;
    -n|--valorN)
    N="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    echo -e "Opcao $1 invalida. Tente novamente.\n"
    echo -e "Uso:\n\t $0 -v \"sequencia de numeros entre aspas\"  -c <chave> -n <valor de n>"
    exit 1
    ;;
  esac
done
#
# Separando os valores da sequencia de valores.
#
for i in ${VALORES}; do
  echo -ne " $i "       
done
#
# Salta uma linha
#
echo " "
#
# Aplicando a criptografia em cada caractere.
#
for i in ${VALORES}; do
  RESULT=`echo -ne "$i  ${CHAVE} ${N}"  | bc -q criptaRSA.bc`
  echo -ne " ${RESULT} "
done
#
# Fim
#
echo " "
exit 0
