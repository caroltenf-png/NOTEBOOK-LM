---
description: Antes de tocar em codigo ou rodar comandos, forcar o Claude a passar por um checklist formal de 10 perguntas que exposa premissas erradas, falta de informacao ou armadilhas obvias.
argument-hint: <cole aqui seu contexto/entrada>
---

<!-- TurmCode / 47 Prompts Avancados — Checklist Pre-Execucao de Tarefa Critica -->

Antes de executar esta tarefa, eu quero que voce passe pelo Checklist de Pre-Execucao Critica. Responda UMA pergunta de cada vez, na ordem, com respostas curtas e verdadeiras. Se nao souber, diga "nao sei" e aponte como descobrir.

NAO toque em codigo antes de completar o checklist inteiro e eu aprovar.

## Descricao da tarefa

$ARGUMENTS

## Checklist

### 1. Entendimento

**"Em uma frase, o que voce entendeu que precisa fazer?"**
Sua resposta:

### 2. Estado atual

**"Qual e o estado atual do sistema/codigo antes da mudanca? Descreva em 3 linhas."**
Sua resposta:

### 3. Estado desejado

**"Qual e o estado desejado apos a mudanca? Descreva em 3 linhas."**
Sua resposta:

### 4. Premissas

**"Liste as 5 maiores premissas que voce esta assumindo para esta tarefa (coisas que voce acredita serem verdade mas nao confirmou). Cada uma marcada como [confirmada] ou [nao confirmada]."**
Sua resposta:

### 5. Impacto

**"Quem/o que sera afetado por essa mudanca? (usuarios, servicos, APIs externas, bancos, jobs agendados, outros times)"**
Sua resposta:

### 6. Reversibilidade

**"Se der errado, como reverter? Em 3 passos. Se nao e reversivel, explique por que."**
Sua resposta:

### 7. Dependencias

**"Esta tarefa depende de outra coisa estar pronta (config, variavel de ambiente, migracao, servico rodando)? Liste."**
Sua resposta:

### 8. Riscos nao obvios

**"Aponte 3 riscos que NAO sao obvios. Coisas que poderiam dar errado e surpreender."**
Sua resposta:

### 9. Criterio de sucesso verificavel

**"Qual comando/teste/verificacao eu posso rodar para provar que a tarefa foi feita corretamente? (precisa ser concreto)"**
Sua resposta:

### 10. O que esta faltando

**"O que voce precisa de mim antes de comecar, para evitar chutar? (pode ser: acesso a tal coisa, confirmacao de tal premissa, versao de tal lib, etc)"**
Sua resposta:

## Regras

- Nao escreva codigo antes do checklist completo.
- Nao "pulem" perguntas. Se uma pergunta for irrelevante, escreva "nao se aplica" e diga por que.
- Nao afirme coisas que voce nao verificou. Use [nao confirmada] na premissa.
- Se voce tiver "nao sei" em mais de 2 perguntas, PARE e me devolva a bola: "preciso de mais informacao antes de prosseguir."

Apos o checklist, aguarde meu GO. So depois voce comeca.
