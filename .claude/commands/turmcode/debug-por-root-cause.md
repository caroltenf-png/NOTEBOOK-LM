---
description: Encontrar a causa raiz real de um bug, nao apenas o sintoma observavel, e evitar "consertos" que mascaram o problema enquanto ele ressurge em outro lugar.
argument-hint: <cole aqui seu contexto/entrada>
---

<!-- TurmCode / 47 Prompts Avancados — Debug por Root Cause (Nao por Sintoma) -->

Tenho um bug. Quero resolve-lo pela CAUSA RAIZ, nao pelo sintoma. Siga o protocolo dos 5 Por Ques adaptado a software.

## Descricao do bug

$ARGUMENTS

## Protocolo

### Etapa 1 — Confirmar o sintoma

Antes de buscar causa, confirme:

1. Voce reproduziu o bug? (ou tem evidencia clara)
2. O bug e deterministico (sempre acontece) ou intermitente?
3. Qual o comportamento atual X esperado, em 1 frase cada?

### Etapa 2 — Mapear o caminho do sintoma

Siga o sintoma para dentro do codigo:

1. Onde o sintoma aparece? (arquivo:linha exato ou o mais proximo)
2. Qual a funcao que "imprime" o sintoma (erro, log, resposta HTTP)?
3. Vai para tras: quem chamou essa funcao, e por que, e com que dados?

Use Grep para seguir chamadores. Abra so trechos relevantes.

### Etapa 3 — Os 5 Por Ques

Faca uma cadeia de "por que?" ate achar a raiz. Exemplo:

- "Por que o sistema retornou 500 ao criar pedido?"
- "Porque a funcao validateCart recebeu um item com price null."
- "Por que o item tinha price null?"
- "Porque o fetch do produto retornou null em um campo que o codigo assumiu nao ser null."
- "Por que a API retornou null para um campo nao opcional?"
- "Porque um produto antigo no banco nao tem price populado."
- "Por que ha produtos sem price no banco?"
- "Porque a migracao X de 2 meses atras nao retrocompatibilizou linhas pre-existentes." — ROOT CAUSE.

A solucao de sintoma seria: "tratar null em validateCart".
A solucao de root cause: "corrigir os dados no banco + validar na criacao para nao deixar acontecer de novo".

Faca essa cadeia por escrito. Me mostre a cadeia inteira.

### Etapa 4 — Classificar a causa raiz

A causa raiz cai em qual destas categorias?

- **Bug de codigo** (logica errada, edge case)
- **Bug de dados** (dados inconsistentes no banco)
- **Bug de infraestrutura** (timeout, rede, config)
- **Bug de design** (escolha arquitetural errada)
- **Bug de premissa** (desenvolvedor presumiu algo que nao e verdade)
- **Bug de processo** (deploy sem migracao, feature flag incorreta)

Cada categoria tem solucoes diferentes.

### Etapa 5 — Impacto atual

Antes de corrigir:

1. Quantos usuarios/requests estao afetados agora?
2. Ha workaround temporario?
3. O bug esta em producao? Criticidade?

### Etapa 6 — Propor fix na camada certa

Apresente:

- **Fix de sintoma** (rapido, contornar) — se aplicavel, como emergencia
- **Fix de causa raiz** (correto, mais custoso) — o que voce recomenda fazer

E um plano para corrigir dados corrompidos, se houver.

### Etapa 7 — Impedir regressao

Para impedir que o bug volte:

- Teste que reproduza o caso (regressivo)
- Validacao adicional (se bug veio de dado invalido)
- Check no schema/constraint no banco (se possivel)
- Log adicional para detectar recorrencia

Descreva cada prevencao.

### Etapa 8 — Aguardar aprovacao

Me apresente o plano completo e aguarde OK antes de tocar em codigo.

## Regras rigidas

- NAO aplique fix antes de terminar a cadeia de "por que".
- NAO declare causa raiz se voce nao consegue responder ao ultimo "por que?" sem chutar.
- NAO misture fix de sintoma com fix de causa raiz sem declarar.
- Se voce chega a uma hipotese de causa raiz mas nao tem evidencia, diga "hipotese nao confirmada" e peca para eu validar.

## Comeca

Rode Etapa 1 e me devolva confirmacoes.
