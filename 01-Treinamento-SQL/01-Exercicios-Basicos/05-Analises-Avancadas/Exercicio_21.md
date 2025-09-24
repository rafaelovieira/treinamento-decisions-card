# Exercício 21: Window Functions (ROW_NUMBER, RANK)

## 📝 Pergunta

Crie um ranking de clientes por valor total de compras, mostrando: `posicao_sequencial` (ROW_NUMBER), `posicao_ranking` (RANK), `posicao_densa` (DENSE_RANK), `nm_cliente`, `total_compras`, `qtd_vendas` e `percentil` (PERCENT_RANK).

Adicione também a diferença percentual entre o valor do cliente atual e o cliente imediatamente superior no ranking (`diferenca_superior`).

Considere apenas clientes com pelo menos 2 compras ativas e ordene por valor total decrescente.

## 🎯 Objetivo

Praticar:
- Window functions (ROW_NUMBER, RANK, DENSE_RANK)
- PERCENT_RANK para percentis
- LAG para comparações
- Análise de posicionamento

## 💡 Dicas

- ROW_NUMBER() sempre sequencial (1,2,3,4...)
- RANK() com empates (1,2,2,4...)
- DENSE_RANK() sem lacunas (1,2,2,3...)
- LAG(total_compras) OVER (ORDER BY total_compras DESC) para valor anterior

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Todas as window functions corretas
- [ ] LAG para diferença com superior
- [ ] PERCENT_RANK calculado
- [ ] Filtro de clientes com 2+ compras
- [ ] Ordenação por valor decrescente

