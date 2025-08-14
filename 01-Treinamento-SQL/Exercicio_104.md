# Exercício 104: Contas sem Compras há Mais de 90 Dias

## 📝 Pergunta

Identifique quantas contas não fizeram compras há mais de 90 dias. Considere a maior data de venda existente na base como referência e contas que têm `fl_status_conta = 'A'`.

## 🎯 Objetivo

Demanda da área de retenção para identificar clientes em risco de churn e criar campanhas de reativação.

## 💡 Contexto de Negócio

Clientes inativos por muito tempo têm alta probabilidade de cancelamento. Identificá-los permite ações proativas de retenção.

## 💡 Dica Importante

Como a base não é atualizada há muito tempo, use `(SELECT MAX(dt_venda) FROM decisionscard.t_venda)` como data de referência ao invés de CURRENT_DATE.

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Usa maior data da base como referência
- [ ] Calcula diferença de 90 dias corretamente
- [ ] Considera apenas contas ativas
- [ ] Identifica última compra por cliente

