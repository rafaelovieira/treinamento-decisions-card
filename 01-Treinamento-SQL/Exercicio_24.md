# Exercício 24: Análise de Sazonalidade

## 📝 Pergunta

Analise a sazonalidade das vendas por mês do ano. Para cada mês (1-12), calcule:

- `mes` (1-12)
- `nome_mes` (Janeiro, Fevereiro, etc.)
- `vendas_2023` (se houver dados)
- `vendas_2022` (se houver dados)  
- `vendas_2021` (se houver dados)
- `media_mensal` (média dos anos disponíveis)
- `indice_sazonalidade` (média do mês / média geral anual)
- `classificacao_mes` ("Alto", "Médio", "Baixo" baseado no índice)

Considere apenas vendas ativas e ordene por mês.

## 🎯 Objetivo

Praticar:
- Análise temporal por múltiplos anos
- PIVOT manual com CASE WHEN
- Cálculos de índices sazonais
- Classificação baseada em métricas

## 💡 Dicas

- EXTRACT(MONTH FROM dt_venda) para mês
- TO_CHAR(DATE '2023-01-01' + (mes-1) * INTERVAL '1 month', 'Month') para nome
- CASE WHEN EXTRACT(YEAR FROM dt_venda) = 2023 THEN vl_venda END para pivot
- Índice > 1.1 = "Alto", < 0.9 = "Baixo", senão "Médio"

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Agrupamento por mês do ano
- [ ] PIVOT manual por ano
- [ ] Cálculo de índice sazonal
- [ ] Classificação dos meses
- [ ] Nomes dos meses corretos

