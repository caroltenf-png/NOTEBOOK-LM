---
description: Identificar o gargalo real de performance em uma funcao/rota/tarefa lenta, com medicao concreta (nao intuicao), e propor otimizacoes ordenadas por impacto.
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Profiling de Performance -->

Tenho um problema de performance. Quero investigacao baseada em medicao, nao em palpite.

## Descricao

- **O que esta lento:** [funcao, rota, endpoint, script, etc]
- **Quanto tempo demora hoje:** [medicao real se tiver; se nao, "sensacao" ate conseguirmos medir]
- **Quanto tempo e aceitavel:** [alvo]
- **Contexto:** [producao, carga tipica, pico, desenvolvimento]
- **Dados de entrada tipicos:** [tamanho, caracteristicas]

## Protocolo

### Etapa 1 — Baseline confiavel

Antes de otimizar, MEA. Sem numero, voce nao sabe se melhorou.

Ajude-me a medir:

1. Se e funcao: criar benchmark simples (`console.time`, `time.perf_counter`, `testing.B`, etc).
2. Se e rota: rodar `curl -w` ou `hey`/`wrk` para medir p50, p95, p99.
3. Se e script: rodar 3-5 vezes e tirar media e variance.
4. Se e query de banco: `EXPLAIN ANALYZE` (Postgres) ou equivalente.

Me apresente o baseline. Nao comece otimizar ate tenhamos numero.

### Etapa 2 — Profile de onde o tempo vai

Sem profile, voce otimiza no lugar errado. Dependendo da linguagem:

- **Node.js**: `node --prof`, `clinic.js`, `0x`
- **Python**: `cProfile`, `py-spy`, `scalene`
- **Go**: `pprof`
- **Rust**: `perf`, `cargo-flamegraph`
- **Banco**: EXPLAIN ANALYZE
- **HTTP**: logs de timing, APM, opentelemetry

Se nao ha profiler instalado, ou o projeto e simples demais, use instrumentacao manual:

$ARGUMENTS
