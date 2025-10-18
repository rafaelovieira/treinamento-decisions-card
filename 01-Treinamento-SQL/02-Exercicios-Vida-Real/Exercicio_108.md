# Exercício 108: Distribuição de Contas por Origem Comercial

## 📝 Pergunta

Analise a distribuição de contas por origem comercial. Mostre:

- `nm_fantasia` (nome da rede/origem)
- `quantidade_contas` (número de contas originadas)
- `percentual_total` (% sobre total de contas)
- `contas_ativas` (quantas estão ativas)
- `taxa_ativacao` (% de ativas sobre total da origem)

Considere apenas origens que geraram pelo menos 10 contas. Ordene por quantidade decrescente.

## 🎯 Objetivo

Demanda comercial para avaliar a performance dos canais de aquisição e otimizar investimentos em parcerias.

## 💡 Contexto de Negócio

Identificar quais origens comerciais geram mais clientes e qual a qualidade desses clientes (taxa de ativação) é crucial para estratégia comercial.

---

## ✍️ Sua Resposta

```sql

WITH origem AS (
	SELECT 
		tc.id_cliente, 
		tr.id_rede, 
		tr.nm_fantasia
	FROM decisionscard.t_cliente tc
	JOIN decisionscard.t_rede tr ON tc.id_origem_comercial = tr.id_rede 
), qtd_contas AS (
	SELECT 
		id_origem_comercial, 
		COUNT(id_origem_comercial) AS quantidade_contas 
	FROM decisionscard.t_cliente 
	GROUP BY id_origem_comercial
	HAVING COUNT(id_origem_comercial) >= 10
), qtd_ativas AS (
	SELECT 
		id_origem_comercial, 
		COUNT(id_origem_comercial) AS contas_ativas
	FROM decisionscard.t_cliente
	WHERE fl_status_conta = 'A'
	GROUP BY id_origem_comercial 
)
SELECT 
	o.nm_fantasia,
	qc.quantidade_contas,
	ROUND(CAST(qc.quantidade_contas AS NUMERIC) / (SELECT COUNT(id_origem_comercial) FROM decisionscard.t_cliente) * 100, 2) AS percentual_total,
	qa.contas_ativas,
	ROUND(CAST(qa.contas_ativas AS NUMERIC) / qc.quantidade_contas * 100, 2) AS taxa_ativacao
FROM origem o
JOIN qtd_contas qc ON o.id_rede = qc.id_origem_comercial 
JOIN qtd_ativas qa ON qc.id_origem_comercial = qa.id_origem_comercial 
GROUP BY 
    nm_fantasia, 
    qc.quantidade_contas, 
    qa.contas_ativas 
ORDER BY qc.quantidade_contas DESC;


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] JOIN entre cliente e rede (origem)
- [ ] Calcula métricas por origem
- [ ] Filtra origens com 10+ contas
- [ ] Calcula taxa de ativação corretamente

