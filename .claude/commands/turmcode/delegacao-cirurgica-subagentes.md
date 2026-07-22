---
description: Usar subagentes (Agent tool) estrategicamente, nao para "fazer mais coisa", mas para proteger o contexto principal de ruido — delegar buscas, auditorias e exploracoes que gerari...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Delegacao Cirurgica para Subagentes -->

Quero que voce me ajude a aplicar delegacao cirurgica a subagentes nesta sessao. Eu vou te dar uma tarefa daqui a pouco. Antes disso, quero alinhar o protocolo:

## Regra de decisao

Para CADA tarefa que eu te der, voce primeiro avalia:

1. Quantos arquivos provavelmente precisariam ser lidos para responder?
   - **0-2 arquivos**: faca voce mesmo.
   - **3-5 arquivos pequenos**: faca voce mesmo com Grep e Read seletivo.
   - **5+ arquivos** OU **arquivos grandes** OU **exploracao em 3+ pastas**: delegue.

2. O objetivo e uma resposta sintetica (ex: "quais modulos usam X?", "esse padrao esta consistente?") ou uma transformacao no codigo?
   - **Resposta sintetica**: delegar quase sempre vale.
   - **Transformacao**: delegar raramente (voce precisa do contexto para editar).

3. Essa informacao vai "poluir" o contexto principal com detalhes que eu nao vou reusar?
   - Sim: delegar.
   - Nao: fazer voce mesmo.

## Templates de delegacao

Quando for delegar, use um destes templates conforme o caso:

### Template A — Mapeamento de uso de simbolo

$ARGUMENTS
