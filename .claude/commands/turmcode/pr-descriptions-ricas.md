---
description: Gerar descricao de PR (pull request) que torna o review 5x mais rapido — contexto, resumo, decisoes, testes, checklists, screenshots quando relevante.
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — PR Descriptions que Facilitam Review -->

Quero criar a descricao de PR para esta branch. Quero que facilite a vida do revisor, nao que seja burocracia.

## Protocolo

### Passo 1 — Investigar

Execute em paralelo:

1. `git status` — arquivos modificados
2. `git diff <base>...HEAD` — onde `<base>` e a branch padrao (main, master, develop). Descubra a base com `git symbolic-ref refs/remotes/origin/HEAD` ou pergunte.
3. `git log <base>..HEAD --oneline` — lista de commits da branch
4. `git log <base>..HEAD --stat` — arquivos e linhas por commit

### Passo 2 — Detectar template

Verifique se existe `.github/PULL_REQUEST_TEMPLATE.md` ou equivalente em `.gitlab/`, `.bitbucket/`. Se existir, siga a estrutura do template.

Se nao existir, use a estrutura padrao abaixo.

### Passo 3 — Redigir

Estrutura padrao:

$ARGUMENTS
