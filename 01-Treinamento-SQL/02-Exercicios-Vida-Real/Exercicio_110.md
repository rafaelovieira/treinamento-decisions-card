# Exercício 110: Evolução Mensal de Contas Cadastradas + Acumulado

## 📝 Pergunta

Crie um relatório da evolução mensal de contas cadastradas nos últimos 12 meses. Mostre:

- `ano_mes` (formato YYYY-MM)
- `contas_mes` (cadastradas no mês)
- `contas_acumulado` (total acumulado até o mês)
- `crescimento_mensal` (% vs mês anterior)
- `media_movel_3m` (média móvel dos últimos 3 meses)

Use a maior data de cadastro da base como referência. Ordene por ano e mês.

## 🎯 Objetivo

Demanda executiva para acompanhar o crescimento da base e identificar tendências mensais.

## 💡 Contexto de Negócio

O acompanhamento mensal com acumulado e média móvel permite identificar tendências e sazonalidades no crescimento da base.

---

## ✍️ Sua Resposta

```sql

WITH tabela_data AS (
	SELECT 
		id_cliente,
		dt_cadastro,
		TO_CHAR(dt_cadastro, 'YYYY-MM') AS ano_mes
	FROM decisionscard.t_cliente
	WHERE dt_cadastro >= (SELECT MAX(dt_cadastro) - INTERVAL '12 MONTH' FROM decisionscard.t_cliente)
), quantidade_contas AS (
	SELECT
		ano_mes,
		COUNT(id_cliente) AS contas_mes,
		SUM(COUNT(id_cliente)) OVER(ORDER BY ano_mes) AS contas_acumulado
	FROM tabela_data
	GROUP BY ano_mes
	ORDER BY ano_mes
)
SELECT 
	ano_mes,
	contas_mes,
	contas_acumulado,
	CASE 
		WHEN LAG(contas_mes) OVER(ORDER BY ano_mes) IS NULL THEN 0
		ELSE ROUND(CAST(contas_mes AS NUMERIC) / (LAG(contas_mes) OVER(ORDER BY ano_mes)) * 100, 2)
	END AS crescimento_mensal,
	ROUND(AVG(contas_mes) OVER(ORDER BY ano_mes ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS media_movel_3m
FROM quantidade_contas;


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Agrupamento mensal correto
- [ ] Cálculo de acumulado (SUM OVER)
- [ ] Crescimento mensal calculado
- [ ] Média móvel de 3 meses

