# Exercício 16: Subconsulta Simples

## 📝 Pergunta

Encontre todos os clientes que fizeram compras acima da média geral. Mostre `id_cliente`, `nm_cliente`, `vl_venda` e `dt_venda`. 

Use uma subconsulta para calcular a média de todas as vendas ativas e filtre apenas as vendas que superam essa média. Ordene por valor da venda decrescente.

## 🎯 Objetivo

Praticar:
- Subconsulta no WHERE
- Comparação com valores agregados
- Identificação de outliers
- Análise acima da média

## 💡 Dicas

- Subconsulta: `(SELECT AVG(vl_venda) FROM decisionscard.t_venda WHERE fl_status_venda = 'A')`
- Use WHERE vl_venda > (subconsulta)
- JOIN entre vendas e clientes para nome
- Considere apenas vendas ativas

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Subconsulta calcula média corretamente
- [ ] Filtra vendas acima da média
- [ ] JOIN entre vendas e clientes
- [ ] Considera apenas vendas ativas
- [ ] Ordenação por valor decrescente

