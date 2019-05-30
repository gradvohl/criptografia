/**
 * Algoritmo para calcular os valores de d, baseado nos valores de p, q e e, para o algoritmo RSA.
 *
 * Prof. Andre Leon Sampaio Gradvohl, Dr.
 * Ultima atualizacao: qui 30 mai 2019 16:22:10 -03
 *
 */ 
#include <stdio.h>
#include <stdlib.h>

/* Funcao para o calculo do maximo fator comum.
 * Retorna zero, se nao ha fatores comuns entre n1 e n2.
 */
unsigned int maximoFatorComum(unsigned long long int n1, unsigned long long int n2)
{
  register unsigned int i;

  for (i=2; i<= n1 && i<=n2; i++)
      if (n1%i == 0 && n2%i == 0)
          return i;
  return 0;
}

/**
 * Calcula o valor de D.
 */ 
void calculaD(unsigned long long int e, unsigned long long int z, unsigned int li, unsigned int ls)
{
  register unsigned int i;

  for (i=li; i<=ls; i++)
  {
    if (i==1) continue;

    if ( !((e*i - 1) % z))
        fprintf(stdout,"e = %lld; d = %d\n\t", e, i);
  }

}


int main(int argc, char *argv[])
{
  unsigned long long int p, q, n, z, e, d;
  unsigned int li, ls;

  p=q=n=z=e=d=li=ls=0;

  if (argc<5)
  {
      fprintf(stderr, "Uso:\n\t%s <valor p> <valor q> <valor e> <limite inferior busca> <limite superior busca>\n\n", argv[0]);
      exit(EXIT_FAILURE);
  }

  p = atoi(argv[1]);

  q = atoi(argv[2]);

  e = atoi(argv[3]);

  li = atoi(argv[4]);

  ls = atoi(argv[5]);

  n = p*q; 
  z = (p-1)*(q-1);

  if (e>=n)
  {
      fprintf(stderr, "O valor de e(%llu) deve ser menor que n(%llu)!\n", e, n);
      exit(EXIT_FAILURE);
  }

  if (maximoFatorComum(e, z))
  { 
      fprintf(stderr, "Os valores e(%llu) e z(%llu) devem ser primos entre si!\n", e, z);
      exit(EXIT_FAILURE);
  }

  fprintf(stdout,"Valores:\n\tp = %llu; q = %llu;\n\tn = %llu x %llu = %llu\n", p, q, p, q, n);
  fprintf(stdout,"\tz = (%llu - 1) x (%llu -1) = %llu\n", p, q, z);

  fprintf(stdout,"\nPossiveis valores para e e d entre (%d e %d):\n\t", li, ls);
  calculaD(e, z, li, ls);

  printf("\n");

  exit(EXIT_SUCCESS);
}
