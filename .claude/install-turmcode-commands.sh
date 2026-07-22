#!/usr/bin/env bash
# Instala os slash commands TurmCode em nivel usuario (~/.claude/commands/turmcode),
# tornando-os disponiveis em QUALQUER repositorio nesta maquina/sessao.
#
# Uso:
#   bash .claude/install-turmcode-commands.sh
#
# Idempotente: pode rodar quantas vezes quiser. Sempre reflete a fonte versionada
# em .claude/commands/turmcode deste repositorio.
set -euo pipefail

# Diretorio deste script -> raiz do repo (um nivel acima de .claude/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="${SCRIPT_DIR}/commands/turmcode"
DST="${HOME}/.claude/commands/turmcode"

if [ ! -d "$SRC" ]; then
  echo "[turmcode] fonte nao encontrada em $SRC — nada a instalar." >&2
  exit 0
fi

mkdir -p "$DST"
cp -f "$SRC"/*.md "$DST"/ 2>/dev/null || true

count="$(find "$DST" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')"
echo "[turmcode] ${count} comandos instalados em ${DST} (use /turmcode:index)"
