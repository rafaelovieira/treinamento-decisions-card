# Exercício 22: Análise de Coorte de Clientes

## 📝 Pergunta

Analise o comportamento de compra dos clientes por coorte de cadastro. Para cada mês de cadastro dos últimos 12 meses (a partir da maior data de cadastro), mostre:

- `mes_cadastro` (YYYY-MM)
- `clientes_cadastrados` (quantidade)
- `clientes_compraram_mes1` (compraram no 1º mês após cadastro)
- `clientes_compraram_mes2` (compraram no 2º mês após cadastro)  
- `clientes_compraram_mes3` (compraram no 3º mês após cadastro)
- `taxa_ativacao_mes1` (% que compraram no 1º mês)
- `taxa_retencao_mes2` (% que compraram no 2º mês)
- `taxa_retencao_mes3` (% que compraram no 3º mês)

## 🎯 Objetivo

Praticar:
- Análise de coorte
- Window functions com PARTITION BY
- Cálculos de retenção
- Análise temporal complexa

## 💡 Dicas

- Use DATE_TRUNC('month', dt_cadastro) para agrupar por mês
- Compare dt_venda com dt_cadastro + INTERVAL para identificar mês da compra
- COUNT(DISTINCT) para clientes únicos
- Cálculos percentuais: (clientes_ativos / clientes_cadastrados) * 100

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Agrupamento por mês de cadastro
- [ ] Cálculo de clientes por período
- [ ] Taxas de ativação e retenção
- [ ] Filtro dos últimos 12 meses
- [ ] Lógica de coorte correta

