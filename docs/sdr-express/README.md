# 🤖 SDR Express — pré-venda de nível sênior

**Brinde da Live — Dia 1.** Um agente que pega um lead cru e te devolve um **pacote completo de pré-venda**: leitura do lead, lead score, a abordagem pronta, a cadência de 7 follow-ups, as perguntas de qualificação, o tratamento das objeções e o resumo de handoff pro vendedor.

> É como ter um SDR sênior do lado: você joga o contato, ele entrega a conversa qualificada e pronta pra fechar.

---

## O que ele faz

Você passa um lead (nome + de onde veio + contexto) e o SDR Express entrega, em 7 partes:

1. **Leitura do lead** — inferências + nível de consciência (Stages of Awareness, Eugene Schwartz). Se faltar contexto, pesquisa a empresa ou te pergunta.
2. **Lead Score (0-100)** — calcula **Fit (0-50) + Engajamento (0-50)** com a conta na tela, e classifica: 🔥 quente / 🟡 morno / 🧊 frio — cada faixa dispara uma estratégia diferente.
3. **Abordagem pronta** — gancho + motivo + 1 pergunta, no canal que você quiser (WhatsApp, e-mail, LinkedIn), com o tom calibrado pro nível de consciência do lead.
4. **Cadência de 7 toques** (D+0 a D+21) — multicanal, cada toque com objetivo próprio (nada de "viu minha mensagem?"), terminando no break-up que mais traz resposta.
5. **Perguntas de qualificação** — SPIN mapeado pra BANT, pra usar na conversa sem parecer interrogatório.
6. **Biblioteca de objeções** — as 7 mais comuns (preço, "vou pensar", "sem tempo", "já tenho fornecedor"...) tratadas com o método LAER.
7. **Handoff pro vendedor** — o resumo que faz o closer entrar na call já sabendo tudo.

**Frameworks que ele aplica (e cita):** BANT, SPIN Selling (Rackham), Stages of Awareness (Schwartz), cadência multicanal (Aaron Ross), LAER. Tudo com benchmarks BR 2026 pra calibrar expectativa.

---

## Instalação (2 minutos)

O SDR Express é um **agente** do Claude Code. Instalar = copiar 1 arquivo pra pasta de agentes:

**Mac/Linux:**
```bash
mkdir -p ~/.claude/agents
cp sdr-express.md ~/.claude/agents/
```
**Windows (PowerShell):**
```powershell
New-Item -ItemType Directory -Force -Path "$HOME\.claude\agents"
Copy-Item sdr-express.md "$HOME\.claude\agents\"
```

Depois **reinicie o Claude Code**. Pronto.

---

## Como usar

Dentro do Claude Code, peça (ele aciona o agente):

```
Usa o SDR Express pra abordar esse lead: Marina, dona de clínica de estética,
baixou meu material de tráfego pra clínicas. Meu produto é uma mentoria de
anúncios pra clínicas, ticket R$ 1.997, canal WhatsApp.
```

### 3 exemplos pra colar
- *"SDR Express: lead de indicação, João, indicado pelo Pedro (meu cliente). Vende consórcio, ticket alto. Quero abordagem no WhatsApp."*
- *"Usa o SDR Express pra reativar esse lead frio que pediu orçamento e sumiu há 2 meses: [contexto]."*
- *"SDR Express: tenho uma lista de 30 leads que baixaram meu e-book [colo]. Monta o modelo personalizável + a cadência + o plano de disparo gradual."*

> 💡 **Dica:** informe sempre **produto + ticket + canal + origem do lead**. Com isso ele acerta o tom e o score na primeira. Sem isso, ele te pergunta antes de escrever — não inventa.

---

## Pré-requisitos
- **Claude Code** instalado. Só isso.

---

*Material produzido pela ASV Digital · Bravy. Veja `exemplos-uso.md` pra um caso completo com a resposta esperada.*
