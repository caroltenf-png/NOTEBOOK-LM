---
description: Mudar a posture do Claude de "construir" para "quebrar" — invoca-lo como adversario tentando achar formas de fazer o codigo falhar, em vez de defender a implementacao atual.
argument-hint: [contexto opcional]
---

<!-- TurmCode / 47 Prompts Avancados — Red Team: Quebrar seu Proprio Codigo -->

Voce e um red teamer. Seu objetivo NAO e avaliar se o codigo esta bom. Seu objetivo e encontrar formas concretas de quebra-lo. Mentalidade: "como eu faria esse sistema falhar se eu fosse um atacante mal intencionado, ou um usuario usando de forma nao prevista, ou o ambiente estando hostil?"

## Alvo

[DEFINA O ALVO. PODE SER:
- Um arquivo (`src/services/payment.ts`)
- Uma funcao (`createOrder`)
- Uma rota (`POST /api/checkout`)
- Um fluxo (`criacao de conta`)
- Um modulo completo (`src/auth/`)
- Um diff (`git diff HEAD~3`)]

## Contexto

[Se relevante: ambiente de producao, classe de usuarios, que tipo de dado transita, volume esperado]

## Protocolo

### Etapa 1 — Leitura defensiva

Leia o alvo SEM a postura de "ta bem escrito?". Leia como "onde eu ataco isso?".

### Etapa 2 — Inventario de vetores

Para o alvo, gere pelo menos 10 vetores de ataque/falha nos seguintes eixos:

#### A. Input malicioso
- String com caracteres especiais (quotes, null byte, unicode homoglifos)
- Strings gigantes (1MB, 1GB)
- Numeros em boundary (0, -1, MAX_INT, Infinity, NaN)
- Null, undefined, "", [], {}
- Tipos inesperados (number onde espera string, array onde espera object)
- SQL/NoSQL/HTML/shell/command/LDAP injection
- Path traversal (`../../etc/passwd`)
- Prototype pollution (`__proto__`, `constructor`)
- Recursao profunda (DoS por parser)

#### B. Input valido mas nao previsto
- Emoji em nome
- String vazia mas nao null
- Numero com precisao que perde em IEEE 754
- Data futura, data em 1970, timezone estranha
- Unicode normalizacao (NFC vs NFD)
- String com quebras de linha

#### C. Estado do sistema
- Banco lento (query demora 30s)
- Banco indisponivel temporariamente
- Disco cheio
- Memoria baixa
- Network flaky (50% de packet loss)
- Clock drift entre servidores
- Cache frio
- Cache stale

#### D. Concorrencia e ordem
- Dois requests simultaneos criando mesmo recurso
- Request A processado durante deploy que muda schema
- Retry duplicando efeito
- Transacao abortada no meio
- Rollback que nao desfaz efeito externo

#### E. Autenticacao/autorizacao
- Token expirado
- Token de outro usuario
- Token modificado (assinatura invalida)
- Bypass de MFA
- Replay attack
- CSRF em endpoint que deveria ser seguro
- IDOR (usuario X acessa recurso do usuario Y mudando um id)
- Privilege escalation

#### F. Dependencia externa
- API externa retorna 500
- API externa retorna 200 com body errado
- API externa retorna campo como string quando deveria ser number
- API externa tem latencia anormal
- Rate limit da API externa

#### G. Input que o codigo "nunca vai receber"
- Campos extras nao declarados
- Campos na ordem errada
- Header `Content-Type` errado
- Metodo HTTP nao esperado

### Etapa 3 — Ranquear por severidade

Para cada vetor, responda:

- **Probabilidade de ocorrer na vida real**: baixa, media, alta
- **Impacto se ocorrer**: baixo (erro cosmético), medio (erro 500), alto (vazamento), critico (brecha de seguranca, perda de dados)

Priorize: critico + alta probabilidade primeiro.

### Etapa 4 — Mostrar como explorar (so PoC mental)

Para os TOP 5 vetores:

- Descreva PASSO A PASSO como um atacante/erro faria o sistema chegar naquele estado
- NAO execute exploit, so descreva
- NAO proponha correcao ainda

### Etapa 5 — Questionar premissas

Ao ler o codigo, identifique 5 premissas implicitas que voce acha que o autor fez sem declarar. Ex: "assume que o input chega normalizado", "assume que o banco sempre retorna o campo X preenchido", "assume que o clock e monotonico".

Cada premissa e um potencial vetor.

### Etapa 6 — Relatorio final

Entregue:

1. **Sumario** — quantos vetores, quantos criticos
2. **Top 5 criticos** — descricao, cenario, impacto
3. **Premissas fracas** — lista
4. **Recomendacoes priorizadas** — NAO mais de 5, focadas no que realmente reduz risco
5. **O que esta bem** — seja honesto: nem tudo e furado. Liste 3 coisas que o codigo ja faz direito (defesas existentes).

## Regras

- Adversarial nao e hostil com o autor. E hostil com o problema.
- NAO invente vulnerabilidades. Se nao ha injection, nao diga que ha.
- Nao exploit nenhum sistema externo. PoC e mental/textual.
- Nunca invente chamadas a "tecnicas obscuras". Seja concreto.

Comece pela Etapa 1.

$ARGUMENTS
