---
description: Usar subagentes em paralelo para executar tarefas genuinamente independentes com ganho de tempo total, sem cair nas armadilhas classicas: paralelizar o nao paralelizavel, perder...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Uso Correto de Subagentes Paralelos -->

Tenho N tarefas que quero rodar em paralelo usando subagentes. Preciso que voce analise se elas realmente sao paralelizaveis, prepare os prompts, dispare em paralelo, e consolide os resultados.

## Tarefas

[LISTE AS N TAREFAS, UMA POR LINHA. SEJA ESPECIFICO.
1. ...
2. ...
3. ...
4. ...]

## Protocolo

### Etapa 1 — Teste de independencia

Para CADA tarefa, responda:

1. Ela depende do resultado de outra? (Se sim, nao paraleliza)
2. Ela modifica arquivos que outra tambem modificaria? (Se sim, conflito)
3. O resultado dela serve de input para outra? (Se sim, nao paraleliza)
4. E apenas LEITURA/INVESTIGACAO, ou envolve edicao?

Se alguma dependencia existir, reorganize: o que da pra rodar em paralelo vs em sequencia. Me mostre o grafo.

### Etapa 2 — Regra de ouro da paralelizacao

- **Paralelizaveis**: auditorias, mapeamentos, investigacoes independentes, greps em areas diferentes, avaliacao de multiplas alternativas.
- **NAO paralelizaveis**: edicoes que tocam os mesmos arquivos, tarefas sequenciais logicas, tarefas em que uma da contexto para a outra.

Maximo 4 subagentes em paralelo. Nunca mais. Alem disso, o custo cresce e o benefício cai.

### Etapa 3 — Preparar cada prompt de subagente

Para cada tarefa paralelizavel, escreva um prompt completo e AUTO-CONTIDO, que o subagente possa executar sem ver nosso contexto.

Template:

$ARGUMENTS
