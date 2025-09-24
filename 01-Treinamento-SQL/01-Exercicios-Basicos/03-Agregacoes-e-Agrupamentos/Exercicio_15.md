# Exercício 15: Análise de Performance por Rede

## 📝 Pergunta

Crie um ranking das redes parceiras por performance. Mostre: posição no ranking (`ranking`), nome fantasia (`nm_fantasia`), cidade (`nm_cidade`), UF (`cd_uf`), quantidade de vendas (`qtd_vendas`), valor total (`total_vendas`), ticket médio (`ticket_medio`) e participação percentual no total geral (`participacao_pct`).

Considere apenas vendas ativas e ordene por valor total decrescente.

## 🎯 Objetivo

Praticar:
- Window functions (ROW_NUMBER, SUM)
- Cálculo de percentuais sobre total
- Ranking e análise comparativa
- Métricas de performance

## 💡 Dicas

- ROW_NUMBER() OVER (ORDER BY total_vendas DESC) para ranking
- SUM(total_vendas) OVER() para total geral
- Participação = (total_vendas / total_geral) * 100
- Use subquery ou CTE para organizar melhor

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Window function para ranking
- [ ] Cálculo de participação percentual
- [ ] Métricas agregadas corretas
- [ ] JOIN entre vendas e redes
- [ ] Ordenação por valor decrescente

