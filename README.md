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
Para que valham em **qualquer** repositório na web (não só neste), cole o script
abaixo no campo **Setup script** do seu ambiente Claude Code na web. Ele roda como
root antes do Claude iniciar, clona este repo público (branch com os comandos) e
instala em `~/.claude/commands/turmcode/`. Depois o filesystem é *snapshotado*, então
os comandos ficam disponíveis em toda sessão e todo repo daquele ambiente.

```bash
#!/bin/bash
# TurmCode — instala os 47 slash commands em nivel usuario (qualquer repo)
set +e
REPO="https://github.com/caroltenf-png/NOTEBOOK-LM.git"
BRANCH="claude/verificacao-configuracao-l6qvyt"   # trocar p/ a branch default apos merge
TMP="$(mktemp -d)"
git clone --depth 1 --branch "$BRANCH" "$REPO" "$TMP/nlm" 2>/dev/null
if [ -d "$TMP/nlm/.claude/commands/turmcode" ]; then
  mkdir -p "$HOME/.claude/commands/turmcode"
  cp -f "$TMP/nlm/.claude/commands/turmcode/"*.md "$HOME/.claude/commands/turmcode/"
  echo "[turmcode] $(ls "$HOME"/.claude/commands/turmcode/*.md | wc -l) comandos instalados"
fi
rm -rf "$TMP"
true   # nunca falha o start da sessao
```

Onde configurar (UI): clique no **ícone de nuvem** com o nome do ambiente atual →
passe o mouse sobre o ambiente → clique no **ícone de engrenagem** → cole no campo
**Setup script** → salve. (Não há página separada de "Environments".)
Requer **Network access = Trusted** (padrão), que já permite o GitHub.
Após dar merge dos comandos na branch default, troque `BRANCH` acima e o clone fica
ainda mais simples. Docs: https://code.claude.com/docs/en/claude-code-on-the-web#setup-scripts

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
