# Exercício 111: Ativação por Safra (1º, 2º, 3º Mês+)

## 📝 Pergunta

Analise a ativação de clientes por safra de cadastro. Para cada mês de cadastro dos últimos 6 meses, mostre:

- `mes_cadastro` (YYYY-MM)
- `total_cadastrados`
- `ativados_mes1` (fizeram primeira compra no 1º mês após cadastro)
- `ativados_mes2` (primeira compra no 2º mês)
- `ativados_mes3_plus` (primeira compra no 3º mês ou depois)
- `taxa_ativacao_mes1` (%)
- `taxa_ativacao_mes2` (%)
- `taxa_ativacao_mes3_plus` (%)
- `taxa_ativacao_total` (% do total que se ativou)

## 🎯 Objetivo

Demanda de CRM para entender o padrão de ativação dos clientes e otimizar campanhas de onboarding.

## 💡 Contexto de Negócio

Entender quando os clientes se ativam após o cadastro permite personalizar campanhas e identificar o momento ideal para ações de retenção.

---

## ✍️ Sua Resposta

```sql

WITH tabela_data AS (
	SELECT 
		id_cliente AS clientes_cadastrados,
		dt_cadastro,
		TO_CHAR(dt_cadastro, 'YYYY-MM') AS mes_cadastro,
		TO_CHAR(dt_cadastro, 'MM') AS mes_cad
	FROM decisionscard.t_cliente
	WHERE dt_cadastro >= (SELECT MAX(dt_cadastro) - INTERVAL '6 MONTH' FROM decisionscard.t_cliente)
), qtd_cadastrados AS (
	SELECT
		mes_cadastro,
		COUNT(clientes_cadastrados) AS total_cadastrados
	FROM tabela_data
	GROUP BY mes_cadastro
), primeira_compra AS (
	SELECT 
		td.clientes_cadastrados,
		td.mes_cadastro,
		td.mes_cad,
		MIN(tv.dt_venda) AS data_prim_compra,
		TO_CHAR(MIN(tv.dt_venda), 'MM') AS mes_com
	FROM tabela_data td
	JOIN decisionscard.t_venda tv ON td.clientes_cadastrados  = tv.id_cliente
	GROUP BY 
	    td.clientes_cadastrados, 
	    td.mes_cadastro, 
	    td.mes_cad
), ativacao AS (
	SELECT
		clientes_cadastrados,
		mes_cadastro,
		mes_cad,
		mes_com,
		CASE 
			WHEN mes_cad = mes_com THEN 1
			WHEN mes_com::INT = (mes_cad::INT + 1) THEN 2
			ELSE 3
		END AS comparacao
	FROM primeira_compra
), mes_1 AS (
	SELECT 
		mes_cadastro,
		COUNT(clientes_cadastrados)	AS ativados_mes1
	FROM ativacao
	WHERE comparacao = 1
	GROUP BY mes_cadastro
	ORDER BY mes_cadastro 
), mes_2 AS (
	SELECT 
		mes_cadastro,
		COUNT(clientes_cadastrados)	AS ativados_mes2
	FROM ativacao
	WHERE comparacao = 2
	GROUP BY mes_cadastro
	ORDER BY mes_cadastro 
), mes_3 AS (
	SELECT 
		mes_cadastro,
		COUNT(clientes_cadastrados)	AS ativados_mes3_plus
	FROM ativacao
	WHERE comparacao = 3
	GROUP BY mes_cadastro
	ORDER BY mes_cadastro
), tabela AS (
	SELECT 
		qc.mes_cadastro,
		COALESCE(qc.total_cadastrados, 0) AS total_cadastrados,
		COALESCE(m1.ativados_mes1, 0) AS ativados_mes1,
		COALESCE(m2.ativados_mes2, 0) AS ativados_mes2,
		COALESCE(m3.ativados_mes3_plus, 0) AS ativados_mes3_plus
	FROM qtd_cadastrados qc 
	LEFT JOIN mes_1 m1 ON qc.mes_cadastro = m1.mes_cadastro
	LEFT JOIN mes_2 m2 ON qc.mes_cadastro = m2.mes_cadastro
	LEFT JOIN mes_3 m3 ON qc.mes_cadastro = m3.mes_cadastro
)
SELECT 
	*,
	COALESCE(ROUND(ativados_mes1::NUMERIC / NULLIF(total_cadastrados, 0) * 100, 2), 0) AS taxa_ativacao_mes1,
	COALESCE(ROUND(ativados_mes2::NUMERIC / NULLIF(total_cadastrados, 0) * 100, 2), 0) AS taxa_ativacao_mes2,
	COALESCE(ROUND(ativados_mes3_plus::NUMERIC / NULLIF(total_cadastrados, 0) * 100, 2), 0) AS taxa_ativacao_mes3_plus,
	COALESCE(ROUND((ativados_mes1 + ativados_mes2 + ativados_mes3_plus)::NUMERIC / NULLIF(total_cadastrados, 0) * 100, 2), 0) AS taxa_ativacao_total
FROM tabela
ORDER BY mes_cadastro;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Identifica primeira compra por cliente
- [ ] Calcula diferença em meses corretamente
- [ ] Categoriza ativação por período
- [ ] Calcula todas as taxas solicitadas

