# Exercício 18: CTE (Common Table Expression)

## 📝 Pergunta

Use uma CTE para criar um relatório de clientes com suas estatísticas de compra. A CTE deve calcular para cada cliente: quantidade de vendas, valor total gasto, valor médio por compra e data da última compra.

Em seguida, use a CTE para mostrar apenas clientes com mais de 3 compras, exibindo: `nm_cliente`, `qtd_compras`, `total_gasto`, `valor_medio`, `ultima_compra` e classificação (`classificacao`) onde:
- "VIP" se total_gasto > 10000
- "Premium" se total_gasto > 5000  
- "Regular" caso contrário

Ordene por total gasto decrescente.

## 🎯 Objetivo

Praticar:
- CTE (WITH clause)
- Cálculos agregados em CTE
- CASE WHEN para classificação
- Reutilização de consulta complexa

## 💡 Dicas

- Estrutura: WITH nome_cte AS (SELECT...) SELECT FROM nome_cte
- Use MAX(dt_venda) para última compra
- CASE WHEN para classificação em cascata
- Filtre na consulta principal, não na CTE

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] CTE estruturada corretamente
- [ ] Cálculos agregados na CTE
- [ ] CASE WHEN para classificação
- [ ] Filtro de clientes com mais de 3 compras
- [ ] Ordenação por total gasto

