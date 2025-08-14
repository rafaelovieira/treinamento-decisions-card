# Exercício 13: HAVING para Filtrar Grupos

## 📝 Pergunta

Identifique clientes com alto volume de compras. Mostre `id_cliente`, `nm_cliente`, quantidade de vendas (`qtd_vendas`) e valor total gasto (`total_gasto`). 

Considere apenas clientes que fizeram mais de 10 compras ativas E gastaram mais de R$ 5.000,00 no total. Ordene por valor total gasto decrescente.

## 🎯 Objetivo

Praticar:
- Cláusula HAVING com múltiplas condições
- Identificação de clientes VIP
- Filtros em dados agregados
- Análise de comportamento de compra

## 💡 Dicas

- Use HAVING com AND para múltiplas condições
- COUNT(*) para quantidade de vendas
- SUM(vl_venda) para valor total
- HAVING vem após GROUP BY

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] GROUP BY por cliente
- [ ] HAVING com múltiplas condições (qtd > 10 E valor > 5000)
- [ ] Cálculos agregados corretos
- [ ] JOIN entre vendas e clientes
- [ ] Ordenação por valor decrescente

