---
description: Impedir que o Claude adicione abstracoes desnecessarias, cria interfaces para 1 implementacao, gere helpers prematuros, introduza design patterns onde um `if` resolveria, ou "de...
argument-hint: <cole aqui seu contexto/entrada>
---

<!-- TurmCode / 47 Prompts Avancados — Anti-Over-Engineering -->

Daqui em diante, nesta sessao, voce vai seguir uma politica estrita anti-over-engineering.

## Os 12 NOES

1. **Nao crie interface/abstract class** se ha apenas 1 implementacao real no momento.
2. **Nao crie padroes de design** (factory, strategy, observer, builder, visitor) sem que haja pelo menos 2 casos de uso concretos JA existentes no projeto.
3. **Nao crie helper/utility** para algo que e chamado 1 ou 2 vezes. Helpers justificam-se em 3+ usos.
4. **Nao adicione camadas** (services, repositories, use cases) se a camada nao vai ter logica propria — isso e so redirecionamento ruidoso.
5. **Nao preveja futuro**. Se nao e requisito agora, nao e requisito. "Depois pode precisar" = nunca precisa. Codigo pode ser evoluido quando necessario.
6. **Nao adicione feature flag** a menos que eu explicitamente peca.
7. **Nao adicione configuracao** para algo que tem valor default razoavel. Torne configuravel so se ha necessidade real de variar.
8. **Nao crie enum/constante para um unico valor**. String literal tambem serve ate ter 2 valores.
9. **Nao adicione logging extensivo "para debug futuro"**. Log apenas nos pontos onde ja havia log ou onde eu pedi.
10. **Nao adicione try/catch** em todas as chamadas. Trate erro onde ha algo significativo a fazer com o erro. Se o tratamento e "logar e seguir", provavelmente nao precisa.
11. **Nao crie tipos utilitarios genericos** (`type Maybe<T>`, `type Result<T, E>`) a menos que o projeto ja use esse estilo em outros lugares.
12. **Nao adicione test double sofisticado**. Stub simples > mock framework, quando possivel.

## Teste que voce deve aplicar antes de escrever

Para cada linha que voce escreve, passe-a pelos 3 testes:

1. **Teste do "quem chama?"** — essa linha/funcao/abstracao tem pelo menos 1 chamador real agora?
2. **Teste do "e se eu tirar?"** — se eu tirar, o codigo ainda funciona? Se sim, por que esta ai?
3. **Teste do "obvio para quem?"** — um desenvolvedor medio, lendo isso pela primeira vez, entende em < 30 segundos? Se nao, simplifique.

## Meta-regra

Se em duvida entre duas solucoes, escolha a MAIS SIMPLES. Sempre. Simplicidade nao e ingenuidade — e disciplina.

## Escapatorias permitidas

Voce pode me propor uma abstracao mais rica SE:

1. Voce me mostra antes e explica o porque em 3 linhas.
2. O porque cita codigo JA existente ou requisito JA explicito.
3. Eu aprovo.

Sem minha aprovacao, vai no simples.

## Descricao da tarefa

$ARGUMENTS

## Confirme

Responda "modo simples ativo" e aguarde a tarefa.
