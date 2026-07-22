# TurmCode — 47 Prompts Avançados de Claude Code (como slash commands)

Este repositório versiona o pacote **"47 Prompts Avançados de Claude Code"**
convertido de prompts para-copiar-e-colar em **slash commands nativos** do
Claude Code, no namespace `turmcode:`.

- Fonte versionada: [`.claude/commands/turmcode/`](.claude/commands/turmcode/)
- Índice de todos: rode `/turmcode:index`
- 47 comandos + 1 índice + README

## Como usar

Digite `/turmcode:` e use TAB para autocompletar. Onde o material original dizia
`[COLE AQUI ...]`, agora você passa o texto direto após o comando:

```
/turmcode:bug-fix-cirurgico o botão salvar não dispara o submit em telas < 768px
```

Esse texto substitui o `$ARGUMENTS` dentro do prompt.

## Como deixar disponível em TODAS as sessões e QUALQUER repositório

Slash commands em **nível usuário** (`~/.claude/commands/`) ficam disponíveis em
qualquer projeto. Escolha o caminho conforme onde você usa o Claude Code:

### 1. Máquina local (Claude Code CLI/desktop) — persiste para sempre
Rode uma vez:
```bash
bash .claude/install-turmcode-commands.sh
```
Isso copia os comandos para `~/.claude/commands/turmcode/`. Como sua máquina não
é efêmera, eles ficam disponíveis em **todo repositório e toda sessão**,
permanentemente. Alternativa sem clonar o repo: descompacte `turmcode-commands.zip`
dentro de `~/.claude/commands/`.

### 2. Claude Code na web — reinstala a cada sessão via hook
O ambiente web é **efêmero**: `~/.claude` é recriado a cada sessão. Este repo já
inclui um hook `SessionStart` em [`.claude/settings.json`](.claude/settings.json)
que roda o instalador automaticamente ao abrir uma sessão **neste** repositório —
os comandos ficam ativos sem esforço manual.

### 3. Web, em QUALQUER repo — via setup script do ambiente
Para que valham em **qualquer** repositório na web (não só neste), configure o
comando abaixo como *setup script* do seu ambiente Claude Code na web
(Configurações do ambiente → script de inicialização). Assim ele roda no start de
toda sessão, em todo repo:
```bash
# no setup script do ambiente, apontando para um clone deste repo:
bash /caminho/para/este-repo/.claude/install-turmcode-commands.sh
```
Docs: https://code.claude.com/docs/en/claude-code-on-the-web

## Estrutura

| Caminho | O que é |
|---|---|
| `.claude/commands/turmcode/*.md` | Os 47 comandos + `index` + `README` (fonte versionada) |
| `.claude/install-turmcode-commands.sh` | Instalador idempotente para `~/.claude/commands/` |
| `.claude/settings.json` | Hook `SessionStart` que roda o instalador |
| `turmcode-commands.zip` | Pacote pronto para descompactar em `~/.claude/commands/` (artefato, não versionado) |

## Origem
Material "47 Prompts Avançados de Claude Code" (Bravy / TurmCode). A conversão
manteve o conteúdo dos prompts intacto — apenas trocou o fluxo de copiar-e-colar
por invocação nativa e mapeou os marcadores de entrada para `$ARGUMENTS`.
