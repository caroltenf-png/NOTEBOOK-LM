---
description: Gerar um `CLAUDE.md` realmente util na raiz do projeto, que sirva como memoria persistente e reduza drasticamente a necessidade de repetir instrucoes em toda sessao.
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Criar CLAUDE.md Perfeito para o Projeto -->

Quero que voce crie (ou refaca) o arquivo CLAUDE.md deste projeto.

Antes de escrever qualquer coisa, faca esta investigacao obrigatoria:

1. Liste a arvore de diretorios ate 2 niveis de profundidade (ignorando node_modules, .git, dist, build, .next, vendor).
2. Leia os seguintes arquivos se existirem: package.json, pyproject.toml, Cargo.toml, go.mod, Makefile, docker-compose.yml, .env.example, README.md, CONTRIBUTING.md.
3. Identifique: linguagem principal, framework, gerenciador de pacotes, ferramenta de build, runner de testes, ferramenta de lint/format, convencao de commit (rode `git log --oneline -20` para observar).
4. Verifique se ja existe um CLAUDE.md. Se existir, leia inteiro antes de sugerir substituicao.

Depois de investigar, escreva um CLAUDE.md com estas secoes, nesta ordem, SEM inventar nada que voce nao tenha observado:

### Visao Geral
- 2 a 4 linhas descrevendo o que o projeto faz, em termos de produto/negocio. Nao descreva arquitetura aqui.

### Stack e Ferramentas
- Linguagem(ns) + versao quando definida.
- Framework principal.
- Runner de testes + comando exato.
- Lint/format + comando exato.
- Build + comando exato.
- Dev server + comando exato.
- Qualquer ferramenta nao obvia (ex: pnpm + turbo, bazel, nx, rush).

### Como Rodar Localmente
- Passos numerados, comandos reais. Nada generico.

### Estrutura de Pastas Relevante
- Apenas pastas que o Claude precisa conhecer para navegar. Com 1 linha de descricao por pasta.
- NAO inclua pastas obvias pelo nome (src, tests, public). Inclua so as que tem significado nao obvio no projeto.

### Convencoes do Projeto
- Padrao de import (alias, relativo, absoluto).
- Estilo de componente/modulo se houver preferencia marcante.
- Padrao de nome de arquivo/classe.
- SOMENTE regras que voce observou no codigo existente. Nao invente.

### Comandos que o Claude DEVE Usar
- Rodar testes: comando exato.
- Rodar lint/format antes de finalizar: comando exato.
- Verificar tipos: comando exato.

### Comandos que o Claude NAO DEVE Rodar Sem Pedir
- Qualquer coisa que toque producao, banco, deploy, envio de emails, chamadas pagas, git push, rm -rf de algo nao obvio.
- Se o projeto tem secrets ou .env, avise.

### Gotchas e Armadilhas
- Coisas contraintuitivas que voce descobriu ao ler o codigo. Ex: "tests/ roda contra banco real, nao mock", "este projeto usa commonjs apesar do TS", "este repo e monorepo com workspaces".

### Links Internos Uteis
- Caminhos de arquivos-chave que servem de referencia para o Claude.

REGRAS RIGIDAS:
- Nada de secao generica. Se nao ha conteudo real, omita a secao.
- Nao inclua lorem ipsum, nao inclua "TODO preencher", nao copie templates.
- Nao escreva regras de estilo de codigo que nao sejam verdadeiras neste projeto.
- Maximo 150 linhas no total. Se passar disso, voce esta escrevendo obvio.
- Tudo em portugues do Brasil, exceto nomes tecnicos.

Apos escrever, me mostre o arquivo e explique em 3 bullets o que voce descobriu do projeto que um novo desenvolvedor nao pegaria rapido.

$ARGUMENTS
