---
description: Forcar o Claude a produzir um plano de implementacao por escrito, revisavel, com passos ordenados, arquivos afetados e pontos de decisao, antes de escrever qualquer linha de cod...
argument-hint: <cole aqui seu contexto/entrada>
---

<!-- TurmCode / 47 Prompts Avancados — Plano de Implementacao Antes de Codar -->

Vou te pedir uma feature. Antes de escrever qualquer linha de codigo, eu quero um PLANO DE IMPLEMENTACAO formal, que eu vou revisar e aprovar.

## Formato do plano

### 1. Resumo da feature (1 paragrafo)

O que a feature faz, em linguagem de produto. Sem detalhes tecnicos.

### 2. Escopo declarado

- **Dentro:** bullets curtos do que sera feito.
- **Fora:** bullets curtos do que NAO sera feito nesta tarefa, apesar de estar relacionado.

### 3. Contexto tecnico atual

Antes de propor mudancas, mostre que voce entende onde vai mexer:

- Que camadas/modulos ja existem e serao tocados?
- Que padroes ja existem no projeto que voce vai respeitar?
- Que dependencias externas entram em jogo?

Cite arquivos (caminho:linha) como evidencia de que voce investigou.

### 4. Plano de implementacao em passos numerados

Cada passo deve conter:

- **O que fazer** — acao concreta (criar X, modificar Y, adicionar Z).
- **Onde** — caminho de arquivo exato.
- **Por que** — justificativa tecnica em 1 linha.
- **Dependencias** — quais passos anteriores precisam estar prontos.
- **Verificacao** — o que confirma que o passo esta ok (comando, teste, check manual).

### 5. Arquivos a criar

Lista com caminhos completos. Para cada, descreva propositadamente: o que vai dentro, em 2 linhas.

### 6. Arquivos a modificar

Lista com caminhos. Para cada, descreva em 2 linhas o que vai mudar (funcao X adiciona comportamento Y, etc).

### 7. Arquivos a NAO tocar (mas que talvez eu ache que voce deveria)

Se ha arquivos que pareceriam candidatos a mudanca mas que voce escolheu NAO tocar, liste com motivo. Isso explicita decisoes.

### 8. Migracao de dados / schema

Se envolve banco: descreva migracao, reversibilidade, impacto em tabelas existentes, indices necessarios. Se nao envolve, escreva "nao aplicavel".

### 9. Pontos de decisao abertos

Coisas que voce PRECISA de mim para decidir. Cada um com:
- Pergunta clara
- Opcoes A, B, C
- Sua recomendacao + 1 frase de por que.

### 10. Riscos e mitigacoes

Top 3 riscos. Cada um com: descricao + probabilidade (baixa/media/alta) + mitigacao proposta.

### 11. Criterio de "terminado"

Um ou mais criterios objetivos que provam que a feature esta pronta.

### 12. Estimativa rough

Nao estimativa de tempo — estimativa de tamanho. Ex: "20-30 linhas em 3 arquivos + 1 teste".

## Regras rigidas

- O plano deve caber em 2 paginas (max ~150 linhas).
- Nao proponha abstracoes novas sem justificativa. (Leia o Prompt 16 - Anti Over-Engineering, se nao fez ainda.)
- Se a feature for grande demais para um PR, divida em fases e proponha a Fase 1 neste plano.
- Use os padroes JA EXISTENTES no projeto. Nao invente estilo novo.

## Apos o plano

Aguarde minha revisao. Eu vou:

- Aprovar inteiro
- Pedir ajustes pontuais
- Voltar perguntas em "Pontos de decisao abertos"

So comece a codar apos meu "aprovado, pode executar".

## Descricao da feature

$ARGUMENTS

## Confirme

Responda "vou investigar antes de planejar" e faca a investigacao. Depois devolva o plano.
