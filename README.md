# Criptografia
Este repositório traz alguns algoritmos bem simples de criptografia, suas implementações e algumas funções auxiliares.

## Criptografia por chave simétrica
No diretório ``criptografiaSimples`` está o algoritmo de criptografia por substituição monoalfabética, i. e., calcula-se o próximo símbolo (letra) a partir de um deslocamento especificado pela chave.

Para compilar o arquivo, faça:
```bash
gcc criptoSimples.c -o criptoSimples.o
```

A execução também é simples:
```bash
./criptoSimples.o [c|d] <chave> <mensagem>
onde
        c:criptografa
        d:descriptografa
```

Por exemplo:
```bash
./criptoSimples.o d 3 def
```

Resultará em:
```
Mensagem descriptografada: abc

```
## Criptografia por chave assimétrica
Para exemplificar esse caso, vamos utilizar o algoritmo RSA. Para isso, é preciso antes, mudar para o diretório ``RSA``. Nesse diretório há quatro arquivos principais:
- O arquivo ``calculaRSA.c``, que se trata de um programa em C para calcular o parâmetro ``d``, dados os valores primos ``p``, ``q``, o valor ``e`` escolhido e os limites inferior e superior para a busca do valor de ``d``.
- O arquivo ``criptaRSA.bc`` é o principal script que implementa tanto a função para criptografar, quanto a função para descriptografar. Como ambas as funções envolvem apenas operações matemáticas com números inteiros grandes, optou-se por utilizar um script para o programa ``bc`` (um pequeno programa para operações matemáticas do Linux), ao invés de implementar essas funções direto em C.
- O arquivo ``criptografaNumerosRSA.sh`` contém um script em shell (bash) para criptografar mensagens. Esse script faz simplesmente uma avaliação/interpretação dos parâmetros para passar para o script ``criptaRSA.bc`` valor a valor da mensagem.
- O arquivo ``descriptografaNumerosRSA.sh`` contém um script em shell (bash) para criptografar mensagens. Esse script faz simplesmente uma avaliação/interpretação dos parâmetros para passar para o script ``criptaRSA.bc`` valor a valor  da mensagem.

No caso dos scripts, não é necessário compilar nada. Para o programa ``calculaRSA.c``, a compilação deve ser feita da seguinte forma:
```bash
gcc calculaRSA.c -o calculaRSA.o
```

Para executar o programa, faça:
```bash
./calculaRSA.o <valor p> <valor q> <valor e> <limite inferior busca> <limite superior busca>
```

Por exemplo:
```bash
./calculaRSA.o 7 13 5 10 50
```

A resposta do programa são os valores de ``p``, ``q``, ``n``, ``z`` e ``e``, dentro dos limites inferior e superior da busca.

Para criptografar uma mensagem, utilize:
```bash
./criptografaNumerosRSA.sh -v "sequencia de valores entre aspas"  -c <chave> -n <valor de n>
```

Por exemplo:
```bash
./criptografaNumerosRSA.sh -v "6 9 13" -c 5 -n 21
```

De forma análoga, para descriptografar uma mensagem, utilize:
```bash
./descriptografaNumerosRSA.sh -v "sequencia de valores entre aspas"  -c <chave> -n <valor de n>
```

Por exemplo:
```bash
./descriptografaNumerosRSA.sh -v "19 2 3" -c 17 -n 21
```
