---
description: Identificar tarefas repetitivas que voce executa manualmente toda vez que o Claude termina uma mudanca (rodar lint, rodar testes, checar typecheck, formatar) e transformar isso...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Configuracao de Hooks para Automacao Repetitiva -->

Quero configurar hooks no `.claude/settings.json` deste projeto para automatizar tarefas repetitivas que hoje eu peco manualmente toda sessao.

Faca esta investigacao antes de sugerir qualquer hook:

1. Leia o `CLAUDE.md`, `package.json`, `Makefile` (ou equivalente) para identificar os comandos de:
   - format (ex: `prettier --write`, `black`, `gofmt`)
   - lint (ex: `eslint`, `ruff`, `golangci-lint`)
   - typecheck (ex: `tsc --noEmit`, `mypy`, `pyright`)
   - test rapido (ex: `pytest -x --ff`, `npm test -- --watchAll=false`)
2. Verifique se `.claude/settings.json` ja tem secao `hooks`. Se tiver, nao sobrescreva: merge.
3. Me pergunte: "quais destas tarefas voce quer que rodem automaticamente apos cada edicao de arquivo?"

Depois, proponha uma configuracao de hooks que inclua (apenas os que eu confirmar):

### Hook `PostToolUse` (apos Edit ou Write em arquivo de codigo)

- Rodar `format` no arquivo modificado (nao no projeto inteiro, por performance).
- Apenas para extensoes relevantes (ex: `.ts`, `.tsx`, `.js`, `.py`).
- Usar padrao glob no matcher para escopar.

### Hook `PostToolUse` (apos grupo de edits)

- Rodar `typecheck` incremental no projeto (apenas se o projeto tem typecheck < 5 segundos).
- Se demorar muito, NAO coloque como hook — vira gargalo. Sugira rodar manualmente no final.

### Hook `Stop` (quando Claude termina resposta)

- Rodar lint no escopo do que foi tocado na sessao.
- Opcional: rodar suite de testes relacionada aos arquivos mudados.

### Hook `PreToolUse` (antes de Bash)

- Opcional: bloquear comandos perigosos com pattern `git push --force*`, `rm -rf /`, etc. (defesa em profundidade mesmo tendo `permissions.deny`).

## Formato do Output

Para cada hook proposto:
- Descreva em 1 frase o que ele faz.
- Mostre o JSON que entraria em `.claude/settings.json`.
- Explique quais sao os custos (tempo de execucao, ruido no output) e quando desligar.

## Regras

- Nao proponha hook que rode suite de testes inteira se voce nao sabe quanto tempo dura. Pergunte antes.
- Nao proponha hook global — tudo escopado a este projeto.
- Hooks devem falhar de forma util: se o format nao existe, o hook nao deve quebrar a sessao.
- Nenhum hook pode fazer `git commit` automatico ou `git push`. Nunca.
- Apos implementar, me mostre exatamente como testar cada hook manualmente.

$ARGUMENTS
