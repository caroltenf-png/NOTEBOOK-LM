---
description: Obter um diagnostico arquitetural honesto de um projeto que ja existe ha anos, apontando os principais pontos fracos estruturais, divida tecnica concentrada e acoplamentos perig...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Auditoria Arquitetural de Projeto Legado -->

Quero uma auditoria arquitetural honesta deste projeto. Nao quero elogios. Nao quero generalidades de livro. Quero que voce me aponte onde mora a dor real.

## Protocolo

### Etapa 1 — Reconhecimento (nao escreva analise ainda)

1. Liste a topologia ate 2 niveis.
2. Identifique: linguagem(s), framework(s), idade aproximada (git log inicial), tamanho em linhas (use `find src -name "*.ts" | xargs wc -l` ou equivalente).
3. Me diga em 5 linhas o que e o projeto.

### Etapa 2 — Os 10 arquivos "quentes"

Use git para identificar os 10 arquivos mais modificados no ultimo ano:

$ARGUMENTS
