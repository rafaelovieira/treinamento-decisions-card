# Exercício 112: Ranking dos Clientes por Quantidade/Valor de Compras

## 📝 Pergunta

Crie um ranking dos top 50 clientes por valor de compras. Mostre:

- `posicao` (ranking)
- `id_cliente`
- `nm_cliente`
- `qtd_compras` (número de vendas ativas)
- `valor_total` (soma das vendas)
- `ticket_medio` (valor médio por compra)
- `primeira_compra` (data da primeira compra)
- `ultima_compra` (data da última compra)
- `dias_cliente` (dias entre primeira e última compra)
- `frequencia_compra` (compras por mês em média)

Considere apenas vendas ativas e ordene por valor total decrescente.

## 🎯 Objetivo

Demanda comercial para identificar clientes VIP e personalizar estratégias de relacionamento.

## 💡 Contexto de Negócio

Conhecer os melhores clientes permite criar programas de fidelidade e ações comerciais direcionadas para maximizar o lifetime value.

---

## ✍️ Sua Resposta

```sql
SELECT 
	ROW_NUMBER() OVER(ORDER BY SUM(tv.vl_venda) DESC) AS posicao,
	tc.id_cliente,
	tc.nm_cliente,
	COUNT(tv.id_venda) AS qtd_compras,
	SUM(tv.vl_venda) AS valor_total,
	ROUND(SUM(tv.vl_venda) / COUNT(tv.id_venda), 2) AS ticket_medio,
	MIN(TO_CHAR(tv.dt_venda, 'YYYY-MM-DD')) AS primeira_compra,
	MAX(TO_CHAR(tv.dt_venda, 'YYYY-MM-DD')) AS ultima_compra,
	MAX(TO_CHAR(tv.dt_venda, 'YYYY-MM-DD'))::date - MIN(TO_CHAR(tv.dt_venda, 'YYYY-MM-DD'))::date AS dias_cliente,
	ROUND(COUNT(tv.id_venda)::NUMERIC / ((MAX(TO_CHAR(tv.dt_venda, 'YYYY-MM-DD'))::date - MIN(TO_CHAR(tv.dt_venda, 'YYYY-MM-DD'))::date) / 30), 2) AS frequencia_compra
FROM decisionscard.t_cliente tc
JOIN decisionscard.t_venda tv ON tc.id_cliente = tv.id_cliente 
WHERE tv.fl_status_venda = 'A'
GROUP BY tc.id_cliente 
ORDER BY valor_total DESC
LIMIT 50;


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Ranking correto (ROW_NUMBER)
- [ ] Todas as métricas calculadas
- [ ] Cálculo de frequência de compra
- [ ] Limitação aos top 50

