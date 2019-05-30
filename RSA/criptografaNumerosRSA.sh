#!/bin/bash
# Script para aplicar a criptografia  RSA em cada valor de uma sequência de valores.
#
# Prof. Andre Leon S. Gradvohl, Dr.
# gradvohl@ft.unicamp.br
# Ultima atualizacao: qui 23 mai 2019 14:53:36 -03
#
if [[ $# -ne 6 ]]; then
  echo "Numero de parametros invalidos."
  echo -e "Uso:\n\t $0 -v \"sequencia de valores entre aspas\"  -c <chave> -n <valor de n>"
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
    STRING="$2"
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
    echo -e "Uso:\n\t $0 -v \"sequencia de valores entre aspas\"  -c <chave> -n <valor de n>\n"
    exit 1
    ;;
  esac
done
echo -ne "Valores:   "
#
# Separando os valores da String
#
for i in ${STRING}; do
  echo -ne "$i "
done
#
# Salta uma linha
#
echo " "
#
# Aplicando a criptografia em cada caractere.
#
echo -ne "Respostas: "
for VAL in ${STRING}; do
  RESULT=`echo -ne "$VAL ${CHAVE} ${N}"  | bc -q criptaRSA.bc`
  echo -ne "${RESULT} "
done
#
# Fim
#
echo " "
exit 0
