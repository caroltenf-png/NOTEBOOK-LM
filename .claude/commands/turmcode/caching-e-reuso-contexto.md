---
description: Estabelecer uma pratica de "memoria persistida" em arquivos `.md` versionados, para que conhecimento adquirido em uma sessao cara (ex: onboarding, auditoria, mapeamento de fluxo...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Caching e Reuso de Contexto Entre Sessoes -->

Quero estabelecer uma pratica de cache persistente de contexto neste projeto. Meu objetivo e que conhecimento caro gerado em uma sessao vire ativo reutilizavel.

## Etapa 1 — Estrutura

Crie (se nao existir) a pasta `docs/claude/` com os seguintes arquivos-indice vazios (ou preservando o que ja existe):

- `docs/claude/README.md` — indice descritivo de todos os arquivos de contexto
- `docs/claude/arquitetura.md` — visao de alto nivel (quando gerada)
- `docs/claude/fluxos.md` — fluxos de negocio mapeados
- `docs/claude/decisoes.md` — decisoes tecnicas e porque (ADRs leves)
- `docs/claude/glossario.md` — termos de dominio usados no codigo
- `docs/claude/dependencias.md` — o que cada dependencia externa faz e onde e usada

## Etapa 2 — Regras de persistencia

Daqui em diante, adotamos estas regras:

### Regra A — Ao mapear um fluxo

Se eu pedir "mapeie o fluxo de [X]", voce mapeia e DEPOIS adiciona uma secao em `docs/claude/fluxos.md` seguindo o template:

$ARGUMENTS
