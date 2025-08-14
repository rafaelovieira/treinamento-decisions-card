# Exercício 23: Cálculo de Inadimplência

## 📝 Pergunta

Calcule métricas de inadimplência e cobrança. Mostre:

- `total_clientes_ativos` (com pelo menos 1 compra)
- `clientes_em_cobranca` (com registro ativo em t_cobranca)
- `taxa_inadimplencia` (% de clientes em cobrança)
- `valor_total_dividas` (soma de vl_divida_inicial das cobranças ativas)
- `valor_acordos_ativos` (soma de vl_acordo dos acordos ativos)
- `taxa_acordo` (% de cobranças que viraram acordo)
- `valor_recuperado` (soma de pagamentos de boletos)
- `taxa_recuperacao` (% do valor recuperado sobre total de dívidas)

Considere apenas registros ativos em suas respectivas tabelas.

## 🎯 Objetivo

Praticar:
- Análise de risco e cobrança
- Múltiplas subconsultas
- Cálculos de KPIs financeiros
- JOINs complexos entre tabelas de cobrança

## 💡 Dicas

- Use COUNT(DISTINCT id_cliente) para clientes únicos
- fl_ativo = 'S' para cobranças ativas
- fl_status_acordo = 'A' para acordos ativos
- fl_status_boleto = 'P' para boletos pagos
- Cuidado com divisão por zero nos percentuais

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Todas as métricas calculadas
- [ ] Filtros de status corretos
- [ ] Cálculos percentuais precisos
- [ ] Tratamento de valores nulos
- [ ] Lógica de cobrança correta

