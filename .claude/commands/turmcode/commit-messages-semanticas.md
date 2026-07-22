---
description: Gerar mensagens de commit que descrevem o PORQUE e a mudanca real, seguindo Conventional Commits (ou o padrao do projeto), e que nao sejam commit messages inuteis tipo "fix" ou...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Commit Messages Semanticamente Corretas -->

Quero gerar uma commit message de qualidade para o estado atual do git. Nao quero "wip" ou "fix stuff".

## Protocolo

### Passo 1 — Investigar

Rode em paralelo (ou sequencia):

1. `git status` — ver arquivos modificados/staged
2. `git diff --staged` — se ha coisas staged, olhe primeiro
3. `git diff` — para nao staged, se nao houver staged
4. `git log --oneline -10` — para ver o padrao de commit do projeto

### Passo 2 — Detectar padrao do projeto

Baseado nos ultimos 10 commits, identifique:

- O projeto usa Conventional Commits (`feat:`, `fix:`, `chore:`)?
- O projeto usa gitmoji (`✨`, `🐛`)?
- O projeto usa prefixo de issue (`JIRA-123`)?
- O projeto usa ingles ou portugues?
- O projeto usa titulo curto ou titulo + body?

Adote o padrao existente. NUNCA imponha um novo.

### Passo 3 — Analisar a mudanca

Agrupe o diff por "tema". Se ha mudancas heterogeneas que deveriam ser commits separados, pare e me avise: "detectei N temas diferentes, sugiro dividir em N commits. Quer que eu proponha a divisao?"

Para cada tema (ou para o tema unico):

- Qual a intencao? (feat/fix/refactor/chore/docs/test/perf/style)
- Qual o escopo? (area afetada)
- O que MUDOU em termos de comportamento ou estrutura?
- POR QUE mudou? (tente inferir do diff; se nao conseguir, pergunta-me)

### Passo 4 — Redigir

Use este formato base (adaptando ao padrao do projeto):

$ARGUMENTS
