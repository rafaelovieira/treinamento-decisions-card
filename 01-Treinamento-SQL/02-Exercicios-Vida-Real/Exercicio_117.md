# Exercício 117: Analítico das Contas em Atraso

## 📝 Pergunta

Crie um relatório analítico das contas em atraso. Mostre:

- `id_cliente` (ID do cliente)
- `nm_cliente` (Nome do cliente)
- `nm_fantasia` (Origem comercial)
- `qtd_bloqueios_atraso` (Quantidade de bloqueios por atraso/cobrança)
- `dt_vencimento_fatura_atraso` (Data de vencimento da fatura em atraso)
- `vl_fatura_atraso` (Valor da fatura em atraso)
- `dt_ultimo_pagamento` (Data do último pagamento)
- `vl_ultimo_pagamento` (Valor do último pagamento)

Considere clientes que estão em cobrança ativa (`t_cobranca` com `fl_ativo = 'S'`) ou têm bloqueios ativos relacionados a atraso. Ordene por valor da fatura em atraso (decrescente).

## 🎯 Objetivo

Demanda da área de cobrança para priorizar ações de recuperação e negociação.

## 💡 Contexto de Negócio

Este relatório permite à equipe de cobrança focar nos casos mais críticos e personalizar abordagens de negociação.

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Identifica clientes em cobrança/atraso
- [ ] JOINs com múltiplas tabelas (cliente, rede, cobrança, fatura, pagamento)
- [ ] Conta bloqueios por atraso
- [ ] Identifica último pagamento por cliente

