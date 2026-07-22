---
description: Gerar testes unitarios que testam COMPORTAMENTO, nao implementacao — testes que sobrevivem a refatoracoes, pegam regressoes reais e nao dao falsa sensacao de cobertura.
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Testes Unitarios que Realmente Testam -->

Quero testes unitarios para [FUNCAO/CLASSE/MODULO] que sigam principios rigidos de teste de COMPORTAMENTO, nao de implementacao.

## Principios nao negociaveis

### 1. Teste o QUE, nao o COMO

Assertoes devem verificar outputs, estados observaveis, efeitos visiveis. NAO devem verificar que tal metodo interno foi chamado, quantas vezes, em que ordem — a menos que o "chamar" seja o efeito observavel unico do sistema (ex: notificar, logar, emitir evento).

### 2. Um teste, uma ideia

Cada teste tem 1 objetivo declarado no nome: `should_[comportamento]_when_[condicao]` ou equivalente. Nada de "test_1" ou "testUserService". Se um teste testa 3 coisas, divida em 3.

### 3. Arrange-Act-Assert visivel

Estrutura clara: preparar, executar, verificar. Nao misture.

### 4. Dados minimos

Use apenas os dados necessarios para o teste. Nao configure 10 campos se o teste so importa 2. Dados irrelevantes confundem leitura.

### 5. Nao mocke o que voce esta testando

Se voce esta testando `UserService.create()`, nao mocke `UserService`. Mocke apenas as dependencias externas (banco, API, disco, tempo, random).

### 6. Mocks sao contratos

Ao mockar, escreva o mock como se fosse uma implementacao pequena de verdade. Nao retorne valores magicos que nunca aconteceriam na realidade. Mocks mentirosos sao pior que nada.

### 7. Cobrir ramos, nao linhas

Para cada `if`, garanta teste para o caso verdadeiro E falso. Para cada catch, garanta teste que dispara o erro. Para cada retorno early, cobertura.

### 8. Edge cases explicitos

Para cada entrada, considere:
- Vazio / null / undefined / zero
- Tamanho 1, tamanho muito grande
- Valores em boundary (0, -1, max+1)
- Caracteres especiais (unicode, quebra de linha, aspas)
- Concorrencia / reentrada (se aplicavel)

Liste os edge cases que voce vai testar antes de escrever. Se algum nao se aplica, diga por que.

### 9. Testes devem ser rapidos e independentes

Nenhum teste depende de outro. Nenhum teste depende de ordem. Nenhum teste depende de estado externo (tempo atual, network, filesystem real).

### 10. Falhas devem ser diagnosticas

Mensagem de falha deve dizer O QUE estava errado e idealmente o que era esperado. Evite `expect(result).toBeTruthy()` quando `expect(result).toBe(42)` seria mais util.

## Protocolo

### Etapa 1 — Leitura

Leia o codigo a ser testado. Identifique:
- Parametros de entrada
- Dependencias externas
- Retornos possiveis
- Efeitos colaterais
- Condicoes de erro

### Etapa 2 — Lista de comportamentos a testar

Escreva uma lista de COMPORTAMENTOS que merecem teste. Cada um e uma frase completa. Exemplo: "deve retornar erro quando o usuario ja existe".

Me mostre a lista antes de escrever qualquer linha de codigo.

### Etapa 3 — Edge cases

Para cada comportamento, identifique 1-3 edge cases relevantes. Adicione a lista.

### Etapa 4 — Escrever os testes

Apos minha aprovacao, escreva os testes seguindo os principios acima. Use o framework JA presente no projeto (leia a config existente para descobrir).

### Etapa 5 — Rodar e verificar

Rode os testes. Se algum falha no primeiro run porque voce errou a assertiva, ajuste. Se falha porque o codigo-fonte tem bug, PARE e me diga — nao ajuste o teste para passar.

### Etapa 6 — Revisao

Ao entregar, me mostre:
- Quantos testes
- Quantos comportamentos cobertos
- Quais edge cases cobertos
- Sugestao de 1-2 cenarios que voce NAO cobriu e por que

## O codigo a testar

[Indique o arquivo/funcao/classe. Pode colar o codigo se for pequeno.]

## Confirme

Responda "lendo o codigo" e comece pela Etapa 1.

$ARGUMENTS
