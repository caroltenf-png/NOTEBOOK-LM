---
description: Fazer o Claude olhar seu projeto com olhos de auditor de custo, identificar o que infla o contexto em cada sessao, e propor 5 mudancas concretas que reduzam consumo sem perder q...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Auditoria de Consumo de Tokens do Projeto -->

Voce vai fazer uma auditoria de consumo de tokens deste projeto, como se eu estivesse pagando uma consultoria para reduzir meu custo mensal com Claude Code em 30-50%.

Siga este protocolo:

## Etapa 1 — Contexto Automatico

1. Leia o `CLAUDE.md`. Me diga: quantas linhas, quantos caracteres, e estime os tokens (1 token ~= 4 caracteres em portugues).
2. Liste arquivos na raiz que podem ser carregados automaticamente (README, docs, etc).
3. Identifique o conteudo que TODA sessao carrega sem voce perceber.

## Etapa 2 — Arquivos Pesados

Rode esta investigacao:

1. Liste os 20 arquivos de codigo (nao binarios) com mais linhas no projeto.
2. Classifique cada um como:
   - **Saudavel**: arquivo grande mas coeso (ex: tipos gerados, schema consolidado).
   - **Bomba**: arquivo grande por ser monolito que deveria estar dividido.
   - **Entulho**: arquivo grande por ser dump, log, fixture gigante, ou snapshot sem valor.

3. Para cada "bomba", sugira uma divisao concreta (qual parte sai para qual arquivo).
4. Para cada "entulho", sugira mover para fora do repo, para `.gitignore`, ou para `docs/archive/`.

## Etapa 3 — Arquivos Gerados no Git

1. Procure por sinais de arquivos gerados commitados: `*.d.ts` gigantes, `generated/`, `dist/`, `build/`, `*.pb.go`, snapshots enormes.
2. Para cada um, verifique se esta em `.gitignore`. Se nao esta, avalie se faz sentido estar.
3. Se faz sentido commitar, avalie se faz sentido estar "visivel" para o Claude — pode adicionar ao `.claude/ignore` (se suportado) ou documentar no CLAUDE.md que o Claude nao deve abrir.

## Etapa 4 — Dump no Repo

Procure por padroes de "dump":

- Arquivos JSON/CSV > 1MB no repo
- Arquivos `.log`, `.sql` gigantes
- Fixtures de teste com centenas de milhares de linhas
- Exports acidentais

Liste os encontrados com tamanho e sugestao (ignorar, mover, descartar).

## Etapa 5 — CLAUDE.md

Abra o `CLAUDE.md`. Avalie:

- Linhas obvias que poderiam ser inferidas do codigo (remova)
- Repetidas informacoes da stack ja visiveis em package.json (remova)
- Secoes com "TODO preencher" (remova)
- Paragrafos longos que poderiam virar listas de 1 linha (reescreva)

Proponha uma versao enxuta com menos linhas, mantendo 100% do valor.

## Etapa 6 — Relatorio Final

Entregue um relatorio com:

1. **Top 5 maiores ganhos** (ordenados por impacto estimado em tokens poupados por sessao).
2. Para cada ganho: acao concreta + estimativa de tokens economizados + esforco (baixo/medio/alto).
3. **Ganho total estimado** se todas as acoes forem implementadas.

## Regras

- Nao sugira "use um modelo mais barato". O foco e o contexto.
- Nao sugira quebrar o projeto ou reescrever codigo por performance. Foco em peso morto, nao em refactor.
- Nada de sugestao generica como "escreva prompts melhores". Seja concreto sobre arquivos e pastas.
- Portugues do Brasil.

$ARGUMENTS
