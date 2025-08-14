# Exercício 20: CTE Recursiva para Hierarquias

## 📝 Pergunta

Crie uma análise hierárquica dos valores de venda usando CTE recursiva. Agrupe as vendas em faixas de valor e mostre a estrutura hierárquica:

1. **Nível 1**: Por faixa de valor (0-100, 101-500, 501-1000, 1001+)
2. **Nível 2**: Por UF dentro de cada faixa
3. **Nível 3**: Por rede dentro de cada UF e faixa

Mostre: `nivel`, `categoria`, `subcategoria`, `qtd_vendas`, `total_vendas` e `nivel_hierarquia`.

## 🎯 Objetivo

Praticar:
- CTE recursiva
- Análise hierárquica
- CASE WHEN para categorização
- Estruturas de dados complexas

## 💡 Dicas

- Use CASE WHEN para criar faixas de valor
- CTE recursiva: WITH RECURSIVE nome AS (consulta_base UNION consulta_recursiva)
- Pode simplificar usando UNION ALL de múltiplas consultas agrupadas
- CONCAT para criar hierarquia visual

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Estrutura hierárquica clara
- [ ] Categorização por faixas de valor
- [ ] Agrupamentos por UF e rede
- [ ] Cálculos agregados corretos
- [ ] Apresentação organizada

