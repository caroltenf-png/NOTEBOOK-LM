---
description: Guiar o Claude numa exploracao estruturada de um repo que ele (e voce) nao conhece, entregando um mapa mental usavel, em vez de "abrir arquivos aleatorios na esperanca de entend...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Exploracao Sistematica de Codebase Desconhecido -->

Este codebase e desconhecido para voce (e para mim). Vou pedir para voce fazer uma exploracao sistematica e me entregar um mapa mental util, em tempo curto, sem ler tudo.

## Ordem de exploracao (nao pule)

### Passo 1 — Meta arquivos primeiro

Leia, nesta ordem, se existirem:

1. `README.md` (raiz)
2. `CONTRIBUTING.md`
3. `CHANGELOG.md` (ou `CHANGES.md`) — ultimo ano
4. `package.json` / `pyproject.toml` / `Cargo.toml` / `go.mod`
5. `Makefile`, `justfile`, ou `scripts/` (ver nomes)
6. Arquivos em `docs/` — SO os nomes, sem abrir ainda

Em 5 linhas, me diga o que voce aprendeu: nome do projeto, proposito, linguagem, framework principal.

### Passo 2 — Topologia

Liste a arvore de diretorios ate 2 niveis, ignorando node_modules, .git, dist, build, vendor, target. Para cada pasta de primeiro nivel, de 1 linha descrevendo o que parece conter (baseado em nomes, nao conteudo).

### Passo 3 — Localizar o entry point

Encontre e nomeie:

- Entry point principal do runtime (ex: `src/index.ts`, `cmd/main.go`)
- Entry point de teste (ex: `tests/`, `*_test.py`)
- Entry point de build/deploy (ex: `Dockerfile`, `.github/workflows/*.yml`)

Leia so o entry point principal. Em 5 linhas: o que ele faz no primeiro nivel?

### Passo 4 — Dominios principais

A partir da topologia e do entry point, proponha uma lista dos 3-5 dominios logicos do sistema. Ex: "auth", "billing", "notifications", "reporting". Para cada dominio, aponte a pasta onde ele parece viver.

### Passo 5 — Mergulho raso em 1 dominio

Eu vou escolher UM dominio (ou vou pedir para voce escolher o mais central). Para esse dominio:

1. Liste os arquivos.
2. Leia o arquivo que parece ser o "principal" (maior, com nome generico tipo `service.ts`, `index.ts`).
3. Descreva em 10 linhas: quais sao as funcoes publicas, o que elas parecem fazer, com que outros dominios esse dominio conversa.

NAO va mais fundo do que isso. A ideia e mapa, nao leitura completa.

### Passo 6 — Lacunas

Liste 5 perguntas que voce tem sobre o projeto e que precisaria me perguntar (ou perguntar a um dono do projeto). Ex: "por que existem duas implementacoes de X?", "onde esta o handler de webhook?"

### Passo 7 — Output: MAPA.md

Reuna tudo em um arquivo `docs/claude/MAPA.md` (cria a pasta se precisar) com as secoes:

1. Projeto — 1 paragrafo
2. Stack
3. Topologia
4. Entry points
5. Dominios
6. Dominio explorado (o que eu/voce escolheu)
7. Lacunas e perguntas

O arquivo deve ter no maximo 200 linhas.

## Regras

- Maximo 10 Reads no total.
- Cada Read em arquivo > 500 linhas deve usar offset + limit.
- Grep e seu amigo. Use agressivamente antes de Read.
- Nao va mais fundo em dominios fora do escolhido.
- Nao tente "entender tudo". Voce nao vai. E tudo bem.

## Confirme

Responda "ok, comecando pelo Passo 1" e execute os passos em ordem.

$ARGUMENTS
