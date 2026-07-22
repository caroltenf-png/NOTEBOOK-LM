---
description: Transformar qualquer tarefa que voce passa ao Claude em uma tarefa com criterios de aceitacao definidos, que o proprio Claude precisa atender (e autoverificar) antes de dizer "p...
argument-hint: <cole aqui seu contexto/entrada>
---

<!-- TurmCode / 47 Prompts Avancados — Criterios de Aceitacao Explicitos -->

Vou pedir uma tarefa. Antes de voce tocar em qualquer arquivo, quero que voce transforme a tarefa em uma lista de CRITERIOS DE ACEITACAO e a use como espinha dorsal do seu trabalho.

## Protocolo

### Etapa 1 — Reformular a tarefa em criterios

Baseado na descricao que eu der, voce vai me devolver:

1. **Resumo da tarefa em 1 frase** (sem jargao).
2. **Lista de criterios de aceitacao** — cada um deve ser:
   - Verificavel objetivamente (voce consegue rodar algo ou ler algo e confirmar)
   - Especifico (nada de "funciona bem")
   - Independente (nao depende de outro criterio para ser testado)
   - Escrito no formato: "Dado [contexto], quando [acao], entao [resultado esperado]."
3. **Criterios negativos (o que NAO deve acontecer)**. Exemplos: "nenhuma rota existente deve quebrar", "tipos exportados de `types/public.ts` nao podem mudar", "sem regressao em testes atuais".

Me apresente essa lista antes de qualquer outra coisa. NAO comece a tarefa ate eu validar os criterios.

### Etapa 2 — Plano alinhado aos criterios

Apos validar, proponha um plano de implementacao curto onde cada passo cite qual(is) criterio(s) ele atende. Se algum criterio nao tem passo, algo esta faltando.

### Etapa 3 — Implementacao

Execute o plano. A cada criterio concluido, marque como "atendido".

### Etapa 4 — Autoverificacao obrigatoria

ANTES de dizer "terminei", passe por CADA criterio e diga, de forma concreta:

- Criterio X: atendido. Verificacao: [comando rodado / arquivo lido / teste que passou / ...]

Se algum criterio nao foi atendido, diga "NAO atendido — motivo: ...". Nao finja. Nao arredonde.

### Etapa 5 — Checklist negativo

Confirme os criterios negativos:

- Nenhuma rota existente quebrou? (rodar `curl` ou teste de integracao, ou pelo menos typecheck)
- Nenhum tipo publico mudou? (git diff em arquivos-chave)
- Suite de testes existente ainda passa? (rodar a suite)

Se algo negativo foi violado, voce NAO terminou. Volte e corrija.

## Regras rigidas

- Nunca declare "pronto" sem passar pela autoverificacao completa.
- Criterios vagos nao contam. Reescreva ate serem concretos.
- Se voce decidir que um criterio nao faz sentido, argumente antes, nao pule.

## Descricao da tarefa

$ARGUMENTS

## Confirme

Responda primeiro: "entendi, vou reformular em criterios". Depois devolva a lista de criterios e aguarde minha validacao.
