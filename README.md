## Car Racing - Simulando com matrizes

Jogos antigos de minigame e até atuais simulam determinadas caracteristicas de uma maneira bem simples.
Nos jogos de corrida antigos, a sensação de velocidade era basicamente o cenario sendo desenhado de cima para baixo
dando a sensação q o carro se movia, mas na verdade era a pista(cenario) que movia.

---

Faça um jogo simples simulando essa caracteristica de mover o cenario de cima para baixo, utilizando matriz.
Não permita que o carro passe dos limites da pista e o carro sempre deve ficar na ultima linha da matriz, sendo permitido ele
ir para a Direita e Esquerda dentro do limite de coluna da matriz. Utilize uma matriz 10 linhas e 3 colunas para isso.
utilize uma matriz para a camera com o tamanho 10x3 e outra matriz para o cenario com 20 linhas e 3 colunas, o tamanho da linha
da matriz cenario determina o tamanho da pista.

Dica:
antes de executar as interações carrega a parte de baixo linha 9  da matriz cenario na matrix camera, 

---
Comandos
- 0 ficar parado no meio e mover
- 1 ir para a direita e mover
- 2 ir para a esquerda e mover

Caracteres
- [.] vazio
- [|] meio da pista
- [_] linha de chegada

Entrada
- [comando][quant] o comando descrito acima, e a quantidade de vezes que você deseja executar o comando.

Saida
- deve imprimir a pista depois que executar o comando de entrada.

---
## Testes
```
Entrada:[comando][quant]
0 10
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.^.

0 11
___
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.^.

0 20
...
...
...
...
...
...
...
...
...
_^_ //linha de chegada

1 11
___
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.|^

1 11
___
.|.
.|.
.|.
.|.
.|.
.|.
.|.
.|.
^|.
```
