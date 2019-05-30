/**
 * Algoritmo criptográfico simples para exemplificação
 *
 */ 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *criptografa(int chave, char *msg, unsigned int tamanho)
{
  unsigned int i;
  char *mensagem = (char *) malloc(sizeof(char)*(tamanho+1));

  if (mensagem == NULL)
  {
        perror("Nao foi possivel alocar memoria!");
        exit(EXIT_FAILURE);
  }

  for (i=0; i<tamanho; i++)
      mensagem[i] = msg[i]+chave;

  mensagem[i]='\0';
  return mensagem;
}

int main(int argc, char *argv[])
{
  int chave;
  unsigned int tamanho;
  char op;
  char *mensagem;

  if (argc<3)
  {
      fprintf(stderr, "Uso: %s [c|d] <chave> <mensagem>\nonde \n\tc:criptografa\n\td:descriptografa\n", argv[0]);
      exit(EXIT_FAILURE);
  }

  op = argv[1][0];
  chave = atoi(argv[2]);

  if ((tamanho = strlen(argv[3]))<1)
  {
      fprintf(stderr, "A mensagem deve ter pelo menos um caractere.\n");
      exit(EXIT_FAILURE);
  }


  if (op == 'c')
  {
      mensagem = criptografa(chave, argv[3], tamanho);
      fprintf(stdout,"Mensagem criptografada: %s\n", mensagem);
      free(mensagem);
      exit(EXIT_SUCCESS);
  }
  else if (op == 'd')
  {
      mensagem = criptografa(-chave, argv[3], tamanho);
      fprintf(stdout,"Mensagem descriptografada: %s\n", mensagem);
      free(mensagem);
      exit(EXIT_SUCCESS);
  }
  else
  {
      fprintf(stderr, "Operacao \'%c\' invalida\n",op);
      exit(EXIT_FAILURE);
  }

  exit(EXIT_SUCCESS);
}
