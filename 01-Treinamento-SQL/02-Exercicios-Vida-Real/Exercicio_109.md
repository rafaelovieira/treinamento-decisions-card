# Exercício 109: Evolução das Contas Cadastradas x Ativadas por Trimestre

## 📝 Pergunta

Analise a evolução trimestral das contas cadastradas versus ativadas. Para cada trimestre dos últimos 2 anos (baseado na maior data de cadastro), mostre:

- `ano` 
- `trimestre` (1, 2, 3, 4)
- `periodo` (ex: "2023-T1")
- `contas_cadastradas` (cadastradas no trimestre)
- `contas_ativadas` (que fizeram primeira compra no trimestre)
- `taxa_ativacao` (% ativadas sobre cadastradas)
- `crescimento_cadastro` (% crescimento vs trimestre anterior)

Ordene por ano e trimestre.

## 🎯 Objetivo

Demanda estratégica para acompanhar tendências de crescimento e efetividade das campanhas de ativação.

## 💡 Contexto de Negócio

A evolução trimestral permite identificar sazonalidades e avaliar o impacto de mudanças na estratégia comercial.

---

## ✍️ Sua Resposta

```sql

WITH cadastradas AS (
	SELECT 
		id_cliente,
		dt_cadastro, 
		EXTRACT(YEAR FROM dt_cadastro) AS ano,
		EXTRACT(MONTH FROM dt_cadastro) AS mes,
		CASE
			WHEN EXTRACT(MONTH FROM dt_cadastro) BETWEEN 1 AND 3 THEN 1
			WHEN EXTRACT(MONTH FROM dt_cadastro) BETWEEN 4 AND 6 THEN 2
			WHEN EXTRACT(MONTH FROM dt_cadastro) BETWEEN 7 AND 9 THEN 3
			WHEN EXTRACT(MONTH FROM dt_cadastro) BETWEEN 10 AND 12 THEN 4
		END AS trimestre	
	FROM decisionscard.t_cliente
	WHERE dt_cadastro >= (SELECT MAX(dt_cadastro) - INTERVAL '2 year' FROM decisionscard.t_cliente)
), primeira_compra AS (
	SELECT 
		tv.id_cliente,
		MIN(tv.dt_venda) AS data_primeira_compra
	FROM decisionscard.t_venda tv
	JOIN decisionscard.t_cliente tc ON tv.id_cliente = tc.id_cliente
	WHERE tc.dt_cadastro >= (SELECT MAX(dt_cadastro) - INTERVAL '2 year' FROM decisionscard.t_cliente)
	GROUP BY tv.id_cliente
), ativadas AS (
	SELECT 
		id_cliente,
		data_primeira_compra,
		EXTRACT(YEAR FROM data_primeira_compra) AS ano,
		EXTRACT(MONTH FROM data_primeira_compra) AS mes,
		CASE
			WHEN EXTRACT(MONTH FROM data_primeira_compra) BETWEEN 1 AND 3 THEN 1
			WHEN EXTRACT(MONTH FROM data_primeira_compra) BETWEEN 4 AND 6 THEN 2
			WHEN EXTRACT(MONTH FROM data_primeira_compra) BETWEEN 7 AND 9 THEN 3
			WHEN EXTRACT(MONTH FROM data_primeira_compra) BETWEEN 10 AND 12 THEN 4
		END AS trimestre
	FROM primeira_compra
), contagem_cadastradas AS (
	SELECT 
		ano,
		trimestre,
		CONCAT(ano, '-T', trimestre) AS periodo,
		COUNT(trimestre) AS contas_cadastradas
	FROM cadastradas
	GROUP BY 
	    ano, 
	    trimestre
), contagem_ativadas AS (
	SELECT 
		ano,
		trimestre,
		CONCAT(ano, '-T', trimestre) AS periodo,
		COUNT(trimestre) AS contas_ativadas
	FROM ativadas
	GROUP BY 
	    ano, 
	    trimestre
), tabela_ativacao AS (
	SELECT
		cc.ano,
		cc.trimestre,
		cc.periodo,
		cc.contas_cadastradas,
		ca.contas_ativadas,
		ROUND(ca.contas_ativadas::NUMERIC / cc.contas_cadastradas * 100, 2) AS taxa_ativacao
	FROM contagem_cadastradas cc
	JOIN contagem_ativadas ca ON cc.periodo = ca.periodo
)
SELECT 
	*,
	CASE
		WHEN LAG(contas_cadastradas) OVER(ORDER BY periodo) IS NULL THEN 0
		ELSE ROUND((contas_cadastradas::NUMERIC / (LAG(contas_cadastradas) OVER(ORDER BY periodo)) - 1) * 100, 2) 
	END AS taxa_crescimento
FROM tabela_ativacao;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Agrupamento por trimestre correto
- [ ] Identifica primeira compra por cliente
- [ ] Calcula taxa de ativação
- [ ] Calcula crescimento vs período anterior

