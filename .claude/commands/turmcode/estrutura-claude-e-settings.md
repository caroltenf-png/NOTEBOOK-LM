---
description: Criar a pasta `.claude/` do projeto com `settings.json`, permissoes de ferramentas e subpastas de commands/agents/skills corretamente configuradas para o fluxo do seu time.
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Estrutura Ideal de `.claude/` e Settings -->

Quero montar a pasta `.claude/` deste projeto, versionada no git, com configuracao padrao para toda a equipe.

Investigue primeiro:

1. Veja se ja existe `.claude/` na raiz. Se existir, liste o conteudo e leia o `settings.json` atual.
2. Leia o `CLAUDE.md` se existir, para entender comandos que o time usa.
3. Identifique na stack do projeto:
   - Runner de testes e seu comando
   - Lint e format
   - Typecheck
   - Build
   - Comandos de migracao de banco (se houver)

Depois, crie ou atualize os seguintes arquivos:

### `.claude/settings.json`

Monte o settings com:

- `permissions.allow`: lista de comandos que o Claude pode rodar sem pedir autorizacao, limitada ao ESSENCIAL e SEGURO. Exemplos seguros tipicos:
  - `Bash(npm test)`, `Bash(npm run lint)`, `Bash(npm run typecheck)`, `Bash(npm run build)`
  - `Bash(git status)`, `Bash(git diff*)`, `Bash(git log*)`, `Bash(git branch*)`
  - Permissoes equivalentes da stack (pnpm, yarn, pytest, cargo, go test, etc)
- `permissions.deny`: lista de comandos perigosos que o Claude NAO pode executar mesmo se pedir autorizacao. Exemplos:
  - `Bash(rm -rf *)`, `Bash(git push --force*)`, `Bash(git reset --hard*)`
  - Qualquer comando que toque producao, deploy ou banco de producao
- `permissions.ask`: comandos que sempre pedem confirmacao explicita (git push normal, migracoes de banco, envio de email).
- `env`: variaveis de ambiente seguras para a sessao (NAO inclua secrets, apenas flags e caminhos).

### `.claude/commands/` (opcional)

Se identificar 2 ou mais tarefas repetitivas no fluxo do time, crie slash commands .md correspondentes com nome curto e descritivo. Exemplo: `/testar-modulo`, `/gerar-migration`, `/checar-deploy`.

### `.gitignore` — adicionar

- `.claude/local/` (para sobrescritas pessoais de cada dev)
- `.claude/*.log`

E garantir que `.claude/settings.json`, `.claude/commands/` e `.claude/agents/` SEJAM versionados (nao ignore).

REGRAS:
- Nada de permissao generica do tipo `Bash(*)`. Seja explicito.
- Nao inclua comandos que voce nao observou no projeto (nada de chutar).
- Nao crie hooks neste prompt (isso e assunto do Prompt 05).
- Portugues do Brasil nos comentarios.
- Apos criar tudo, liste o que foi criado e explique em 5 linhas por que cada permissao esta no allow (justifique a seguranca).

$ARGUMENTS
