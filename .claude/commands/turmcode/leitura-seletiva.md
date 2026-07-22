---
description: Definir uma politica explicita de quando o Claude pode ler um arquivo inteiro, quando deve ler por trechos (offset + limit), e quando deve apenas fazer Grep, para evitar abrir a...
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Leitura Seletiva vs Leitura Completa de Arquivos -->

Nesta sessao, quero que voce adote uma politica rigorosa de leitura seletiva em vez de leitura completa. Siga estas regras:

## Regra 1 — Tabela de decisao de leitura

Antes de cada chamada Read, classifique o arquivo pelo tamanho (use Glob ou Bash `wc -l` antes):

| Linhas | Estrategia |
|---|---|
| 0-200 | Read completo permitido |
| 201-600 | Read completo apenas se voce precisa da estrutura global. Caso contrario, Grep + Read com offset |
| 601-1500 | Sempre Grep primeiro. Read apenas com offset + limit. |
| >1500 | NUNCA Read completo. Apenas Grep e Read com offset + limit 100-150 linhas. |

## Regra 2 — Ordem canonica de leitura

Para localizar algo em arquivo grande:

1. **Grep do termo** com `output_mode: content -C 3`. Se encontrar, anote as linhas.
2. Se o contexto for suficiente (tipicamente e), pare.
3. Se precisar de mais contexto, Read com `offset: <linha - 20>`, `limit: 80`.
4. Nunca de um segundo Read no mesmo arquivo. Ajuste o offset/limit da primeira.

## Regra 3 — Nao leia imports de bibliotecas

Se voce ve `import X from 'alguma-lib'`, NAO va atras do codigo da lib em node_modules. Se precisa saber o que a lib faz, diga o que voce sabe e pergunte se esta certo. Eu confirmo.

## Regra 4 — Arquivos gerados e schemas

Arquivos que terminam em `.d.ts`, `.pb.go`, `.g.dart`, `.generated.ts`, `schema.prisma` (quando gerado), `openapi.yaml`:
- Nunca leia inteiros. Sempre Grep + offset.
- Se for arquivo de tipos gerados, tenta inferir do uso em vez de ler a definicao.

## Regra 5 — Markdown e docs longos

- Se for doc de referencia longa, use Grep por heading (`^## `) para mapear secoes antes de decidir qual parte ler.
- Nao leia doc inteira para pegar uma unica instrucao.

## Regra 6 — Quando eu pedir "explique este arquivo"

Ai voce PODE ler inteiro, mas antes me avise o tamanho e me pergunte: "este arquivo tem N linhas. Voce quer explicacao da estrutura global (posso ler inteiro), ou de uma secao especifica (posso ser mais cirurgico)?"

## Regra 7 — Report de leitura

Toda vez que voce for fazer Read de um arquivo > 500 linhas, anuncie antes: "vou ler linhas X-Y de arquivo.ts porque preciso de Z". Se eu discordar, te corrijo antes de voce gastar os tokens.

## Confirme

Responda "leitura seletiva ativa" e espere minha tarefa.

$ARGUMENTS
