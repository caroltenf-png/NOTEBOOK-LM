---
description: Pedir ao Claude que corrija um bug especifico SEM tocar em nada mais — sem refatoracao, sem limpeza, sem "melhoria aproveitando a visita". So o fix, minimo, auditavel.
argument-hint: <cole aqui seu contexto/entrada>
---

<!-- TurmCode / 47 Prompts Avancados — Bug Fix Cirurgico (Zero Scope Creep) -->

Tenho um bug para corrigir. Quero um fix CIRURGICO. Regras absolutas:

## Regras rigidas do fix

1. **Uma mudanca, um objetivo**: voce so pode mexer no que e estritamente necessario para corrigir o bug descrito. Nada alem disso.

2. **Nada de refatoracao**: nao renomeie variaveis, nao mova funcoes, nao reorganize imports, nao extraia helpers, nao "melhore" nomes, nao mude estilo.

3. **Nada de limpeza**: nao remova imports nao usados, nao remova codigo morto, nao corrija typos em comentarios alheios, nao atualize docstrings que nao sao do trecho afetado.

4. **Nada de upgrade de dependencias**: nao atualize versoes, nao adicione biblioteca nova.

5. **Nada de cascata**: se voce ve OUTROS bugs similares enquanto investiga, NAO corrija. Apenas registre no relatorio final como "observado mas nao corrigido".

6. **Minimo de linhas possiveis**: se da para corrigir mudando 3 linhas, nao mude 10. Se da para corrigir em 1 arquivo, nao mude 2.

## Protocolo obrigatorio

### Passo 1 — Entender o bug

Me confirme de volta:
- O que o codigo faz HOJE (comportamento atual errado)
- O que o codigo DEVERIA fazer
- Onde provavelmente esta o bug (arquivo:linha)

Se voce nao tem certeza do que deveria acontecer, NAO chute. Me pergunte.

### Passo 2 — Localizar a causa raiz

Use Grep para localizar. Abra apenas o arquivo suspeito, e apenas o trecho relevante (offset + limit). Explique em 3-5 linhas qual e a causa.

### Passo 3 — Propor o fix minimo

ANTES de aplicar, me mostre o diff proposto em formato de trecho (old/new), apenas o trecho afetado. Espere eu aprovar.

### Passo 4 — Aplicar

Apos aprovacao, aplique com Edit. Se houver teste existente que cubra o caso, rode o teste. Se nao houver, me pergunte se devo adicionar UM teste minimo (nao uma suite nova).

### Passo 5 — Relatorio

Ao terminar, me de:
- O que foi mudado (arquivo:linhas)
- Por que isso resolve o bug
- O que voce NAO mudou apesar de ter visto (registro de auto-controle)
- Sugestao (opcional): "vale abrir outro PR para X" se voce viu algo relevante

## Descricao do bug

$ARGUMENTS

## Confirme

Antes de comecar, responda apenas: "entendi. posso investigar?" — e aguarde meu OK.
