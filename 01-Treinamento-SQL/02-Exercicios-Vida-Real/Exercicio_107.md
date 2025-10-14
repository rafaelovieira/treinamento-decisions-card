# Exercício 107: Distribuição de Contas por Situação

## 📝 Pergunta

Crie um relatório mostrando a quantidade e percentual de contas por situação. Mostre:

- `situacao` (descrição da situação)
- `quantidade` (número de contas)
- `percentual` (% sobre o total)

Considere as situações baseadas no `fl_status_conta` e `fl_status_analise`:
- "Ativa": fl_status_conta = 'A'
- "Inativa": fl_status_conta = 'I' 
- "Pendente Análise": fl_status_analise = 'P'
- "Rejeitada": fl_status_analise = 'R'

Ordene por quantidade decrescente.

## 🎯 Objetivo

Demanda operacional para acompanhar a distribuição da carteira por status e identificar gargalos no processo.

## 💡 Contexto de Negócio

Este relatório ajuda a identificar problemas no funil de aprovação e monitorar a saúde operacional da carteira.

---

## ✍️ Sua Resposta

```sql

WITH status AS (
	SELECT 
		id_cliente,
		CASE
			WHEN fl_status_analise = 'P' THEN 'Pendente Análise'
			WHEN fl_status_analise = 'R' THEN 'Rejeitada'		
		END AS situacao
	FROM decisionscard.t_cliente	
	UNION ALL 
	SELECT
		id_cliente,
		CASE
			WHEN fl_status_conta = 'A' THEN 'Ativa'
			WHEN fl_status_conta = 'I' THEN 'Inativa'
		END AS situacao
	FROM decisionscard.t_cliente
), tabela AS (
	SELECT DISTINCT situacao
	FROM status
	WHERE situacao IS NOT NULL
	UNION ALL 
	SELECT 'Pendente Análise'
), contagem AS (
	SELECT 
	    situacao, 
	    COUNT(id_cliente) AS quantidade
	FROM status 
	WHERE situacao IS NOT NULL
	GROUP BY situacao
), tabela_contagem AS (
	SELECT 
	    t.situacao AS situacao, 
	    COALESCE(c.quantidade, 0) AS quantidade
	FROM tabela t
	LEFT JOIN contagem c ON t.situacao = c.situacao 
	ORDER BY 
	    quantidade DESC, 
	    situacao
)
SELECT 
	situacao, 
	quantidade,
	ROUND(quantidade / (SELECT SUM(quantidade) FROM tabela_contagem) * 100, 2) AS percentual
FROM tabela_contagem
GROUP BY 
    situacao, 
    quantidade
ORDER BY quantidade DESC;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Categoriza situações corretamente
- [ ] Calcula quantidade por situação
- [ ] Calcula percentual sobre total
- [ ] Ordenação por quantidade decrescente

