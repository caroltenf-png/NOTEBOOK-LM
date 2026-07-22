---
description: Lista todos os 47 comandos TurmCode (prompts avancados de Claude Code) por categoria.
---

# Comandos TurmCode disponiveis (`/turmcode:*`)

Sao 47 comandos. Para usar: digite `/turmcode:` e o TAB completa. Muitos aceitam contexto depois do comando (ex.: `/turmcode:bug-fix-cirurgico o botao X nao dispara o evento Y`).

| Comando | O que faz |
|---|---|
| `/turmcode:acoplamento-e-coesao` | Avaliar, com criterios concretos e nao subjetivos, o grau de acoplamento entre modulos ... |
| `/turmcode:analise-stack-trace` | Extrair o maximo de informacao de um stack trace — identificar linha culpada, sinais se... |
| `/turmcode:anti-alucinacao` | Forcar o Claude a verificar a existencia real de simbolos, arquivos, APIs, flags e assi... |
| `/turmcode:anti-context-bloat` | Impedir, durante a propria sessao, que o Claude encha o contexto com leituras desnecess... |
| `/turmcode:anti-over-engineering` | Impedir que o Claude adicione abstracoes desnecessarias, cria interfaces para 1 impleme... |
| `/turmcode:auditoria-arquitetural` | Obter um diagnostico arquitetural honesto de um projeto que ja existe ha anos, apontand... |
| `/turmcode:auditoria-consumo-tokens` | Fazer o Claude olhar seu projeto com olhos de auditor de custo, identificar o que infla... |
| `/turmcode:auditoria-seguranca-owasp` | Rodar uma auditoria pragmatica orientada ao OWASP Top 10 (web) sobre o projeto ou um di... |
| `/turmcode:bug-fix-cirurgico` | Pedir ao Claude que corrija um bug especifico SEM tocar em nada mais — sem refatoracao,... |
| `/turmcode:bug-intermitente` | Estruturar uma caca metodica a um bug que nao reproduz de forma deterministica — o mais... |
| `/turmcode:caca-memory-leak` | Detectar vazamento de memoria em servico de longo prazo (Node.js, Python, Go, etc), ide... |
| `/turmcode:caching-e-reuso-contexto` | Estabelecer uma pratica de "memoria persistida" em arquivos `.md` versionados, para que... |
| `/turmcode:checklist-pre-execucao` | Antes de tocar em codigo ou rodar comandos, forcar o Claude a passar por um checklist f... |
| `/turmcode:cobertura-real-vs-aparente` | Detectar o engano mais comum em projetos com testes: alta cobertura de linhas + baixa c... |
| `/turmcode:code-review-profundo` | Submeter um diff (ou arquivo) a um code review de nivel staff engineer — nao um "LGTM" ... |
| `/turmcode:codigo-morto` | Localizar codigo que foi escrito, ainda esta no repo, mas nao e mais usado — funcoes nu... |
| `/turmcode:commit-messages-semanticas` | Gerar mensagens de commit que descrevem o PORQUE e a mudanca real, seguindo Conventiona... |
| `/turmcode:configuracao-de-hooks` | Identificar tarefas repetitivas que voce executa manualmente toda vez que o Claude term... |
| `/turmcode:criar-claude-md-perfeito` | Gerar um `CLAUDE.md` realmente util na raiz do projeto, que sirva como memoria persiste... |
| `/turmcode:criterios-aceitacao-explicitos` | Transformar qualquer tarefa que voce passa ao Claude em uma tarefa com criterios de ace... |
| `/turmcode:debug-por-root-cause` | Encontrar a causa raiz real de um bug, nao apenas o sintoma observavel, e evitar "conse... |
| `/turmcode:delegacao-cirurgica-subagentes` | Usar subagentes (Agent tool) estrategicamente, nao para "fazer mais coisa", mas para pr... |
| `/turmcode:estrutura-claude-e-settings` | Criar a pasta `.claude/` do projeto com `settings.json`, permissoes de ferramentas e su... |
| `/turmcode:exploracao-codebase-desconhecido` | Guiar o Claude numa exploracao estruturada de um repo que ele (e voce) nao conhece, ent... |
| `/turmcode:investigacao-git-log-blame` | Usar o git como ferramenta de arqueologia — descobrir quem fez, quando, por que, e em q... |
| `/turmcode:leitura-seletiva` | Definir uma politica explicita de quando o Claude pode ler um arquivo inteiro, quando d... |
| `/turmcode:mapeamento-dependencias` | Produzir um inventario real das dependencias externas do projeto (nao apenas `package.j... |
| `/turmcode:me-ensine-este-codigo` | Usar o Claude como tutor para entender de verdade um trecho de codigo, padrao, abstraca... |
| `/turmcode:onboarding-claude-em-projeto-existente` | Fazer o Claude construir, em uma unica sessao, um entendimento real de um codebase que ... |
| `/turmcode:onboarding-relampago` | Conseguir, em 10 minutos, o suficiente para comecar a trabalhar em um repo que voce nun... |
| `/turmcode:pair-programming-iterativo` | Configurar uma dinamica de trabalho em que o Claude atua como parceiro de pair programm... |
| `/turmcode:plano-antes-de-codar` | Forcar o Claude a produzir um plano de implementacao por escrito, revisavel, com passos... |
| `/turmcode:pr-descriptions-ricas` | Gerar descricao de PR (pull request) que torna o review 5x mais rapido — contexto, resu... |
| `/turmcode:prevencao-acoes-destrutivas` | Estabelecer um protocolo explicito para toda acao irreversivel (remover arquivos, dropa... |
| `/turmcode:profiling-performance` | Identificar o gargalo real de performance em uma funcao/rota/tarefa lenta, com medicao ... |
| `/turmcode:rebase-interativo-seguro` | Executar operacoes de reescrita de historia git — squash, reorder, split, fixup — com s... |
| `/turmcode:red-team-seu-codigo` | Mudar a posture do Claude de "construir" para "quebrar" — invoca-lo como adversario ten... |
| `/turmcode:reducao-ruido-tool-results` | Fazer comandos Bash, builds, testes e outros outputs volumosos retornarem apenas o que ... |
| `/turmcode:refatoracao-segura` | Executar uma refatoracao nao-trivial (renomear simbolo amplamente usado, mover modulo, ... |
| `/turmcode:resolucao-merge-conflicts` | Resolver conflitos de merge/rebase entendendo a INTENCAO de cada lado antes de escolher... |
| `/turmcode:scope-limites-e-guardrails` | Comunicar ao Claude, de forma duradoura e versionada, quais pastas/arquivos sao proibid... |
| `/turmcode:segundo-par-de-olhos` | Obter uma avaliacao independente, por um "outro Claude" que nao participou da sessao, s... |
| `/turmcode:smells-e-debito-tecnico` | Mapear code smells e debito tecnico concretos no projeto, com caminho:linha e proposta ... |
| `/turmcode:standup-resumo-sprint` | Gerar, em segundos, um relatorio de "o que voce fez ontem / o que vai fazer hoje" basea... |
| `/turmcode:subagentes-paralelos` | Usar subagentes em paralelo para executar tarefas genuinamente independentes com ganho ... |
| `/turmcode:testes-integracao-sem-mocks-enganosos` | Escrever testes de integracao que efetivamente validem o contato entre camadas/sistemas... |
| `/turmcode:testes-unitarios-de-verdade` | Gerar testes unitarios que testam COMPORTAMENTO, nao implementacao — testes que sobrevi... |

Mostre esta tabela ao usuario, agrupando mentalmente por tema (setup, tokens, assertividade, planejamento, qualidade, git, debug, workflows, produtividade), e pergunte qual ele quer usar.
