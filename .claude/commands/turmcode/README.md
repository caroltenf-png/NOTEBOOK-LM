# TurmCode — 47 Prompts Avançados de Claude Code (como slash commands)

Este pacote de prompts (originalmente para copiar-e-colar) foi convertido em
**slash commands** do Claude Code, no namespace `turmcode:`.

## Como usar
- Digite `/turmcode:` e use TAB para autocompletar.
- Rode `/turmcode:index` para ver a tabela com todos os 47 comandos e o que cada um faz.
- Comandos que pedem entrada aceitam o texto logo após o comando, ex.:
  `/turmcode:bug-fix-cirurgico o botão salvar não dispara o submit em telas < 768px`
  Esse texto substitui o `$ARGUMENTS` dentro do prompt.

## Estrutura
- Cada `.md` = um comando. O corpo é o bloco `## PROMPT` original do pacote.
- O marcador `[COLE AQUI ...]` do material foi convertido em `$ARGUMENTS`.
- O frontmatter `description` vem do campo **Objetivo** de cada prompt.

## Origem
Material "47 Prompts Avançados de Claude Code" (Bravy / TurmCode).
Conversão automatizada mantendo o conteúdo dos prompts intacto.
