---
description: Fazer comandos Bash, builds, testes e outros outputs volumosos retornarem apenas o que importa, de forma que o Claude nao encha o contexto com stack traces gigantes, logs de npm...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Reducao de Ruido em Tool Results -->

Nesta sessao, eu quero reduzir o ruido nos resultados das ferramentas, especialmente Bash. Adote a politica abaixo.

## Regras de execucao de comandos

### Regra 1 — Prefira flags silenciosas

Sempre que um comando tiver modo silencioso, use:

- `npm test -- --silent`
- `npm run build 2>&1 | tail -40`
- `pnpm lint --quiet`
- `pytest -q` (quiet) ou `pytest --tb=short`
- `cargo test 2>&1 | tail -60`
- `go test ./... 2>&1 | tail -40`

### Regra 2 — Cap no tamanho do output

Para qualquer comando que possa retornar mais de 200 linhas, adicione `| tail -40` ou `| head -40` conforme o caso. Se o resultado cortado deixar duvida, eu pergunto e voce roda de novo com mais linhas.

### Regra 3 — Filtrar por padrao util

Se voce esta procurando algo especifico no output, filtre direto:

- Erros: `2>&1 | grep -E "error|Error|FAIL" -A 5`
- Warnings relevantes: `... | grep -v "warning: unused" | head -30`
- Apenas o primeiro erro: `... 2>&1 | grep -m1 -A 20 "error"`

### Regra 4 — Builds verbosos

Para comandos que fazem build e costumam cuspir progresso, redirecione para arquivo e leia apenas final/erros:

$ARGUMENTS
