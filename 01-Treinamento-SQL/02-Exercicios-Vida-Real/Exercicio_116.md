# Exercício 116: Analítico das Contas sem Compras há Mais de 90 Dias

## 📝 Pergunta

Crie um relatório analítico (TABELÃO) das contas que não fazem compras há mais de 90 dias. Mostre:

- `id_cliente` (ID do cliente)
- `nm_cliente` (Nome do cliente)
- `nm_fantasia` (Origem comercial - nome da rede)
- `dt_ultima_compra` (Data da última compra)
- `vl_ultima_compra` (Valor da última compra)
- `dias_desde_ultima_compra` (Dias desde a última compra)

Use a maior data de venda da base como referência. Considere apenas clientes com contas ativas. Ordene por dias desde última compra (decrescente).

## 🎯 Objetivo

Demanda da área de retenção para criar campanhas direcionadas de reativação de clientes inativos.

## 💡 Contexto de Negócio

Este relatório permite ações de CRM personalizadas baseadas no perfil do cliente e tempo de inatividade.

---

## ✍️ Sua Resposta

```sql

WITH tabela AS (
    SELECT 
        tv.id_cliente,
        tc.nm_cliente,
        tr.nm_fantasia,
        tv.id_venda,
        tv.dt_venda,
        tv.vl_venda
    FROM decisionscard.t_venda tv
    JOIN decisionscard.t_cliente tc ON tv.id_cliente = tc.id_cliente
    JOIN decisionscard.t_rede tr ON tc.id_origem_comercial = tr.id_rede
    WHERE NOT EXISTS (SELECT id_cliente 
		              FROM decisionscard.t_venda tv
		              WHERE 
		                  dt_venda::DATE >= (SELECT MAX(dt_venda)::DATE - INTERVAL '90 days' FROM decisionscard.t_venda) 
		                  AND tc.id_cliente = tv.id_cliente
		             )
), ultima_compra AS (
    SELECT 
        id_cliente, 
        MAX(id_venda) AS id_ultima_compra
    FROM tabela
    GROUP BY id_cliente
), ultimo_valor AS (
    SELECT 
        uc.id_ultima_compra,
        tab.dt_venda,
        tab.vl_venda AS vl_ultima_compra
    FROM ultima_compra uc
    JOIN tabela tab ON uc.id_ultima_compra = tab.id_venda 
), nomes AS (
    SELECT 
        uc.id_cliente,
        tab.nm_cliente,
        tab.nm_fantasia,
        uc.id_ultima_compra
    FROM ultima_compra uc
    LEFT JOIN tabela tab ON uc.id_cliente = tab.id_cliente 
    GROUP BY 
        uc.id_cliente,
        uc.id_ultima_compra,
        tab.nm_cliente,
        tab.nm_fantasia
)
SELECT
    n.id_cliente,
    n.nm_cliente,
    n.nm_fantasia,
    uv.dt_venda::DATE AS dt_ultima_compra,
    uv.vl_ultima_compra,
    (SELECT MAX(TO_CHAR(dt_venda, 'YYYY-MM-DD')) FROM decisionscard.t_venda)::DATE - (uv.dt_venda)::DATE AS dias_desde_ultima_compra
FROM nomes n
JOIN ultimo_valor uv ON n.id_ultima_compra =  uv.id_ultima_compra 
ORDER BY dias_desde_ultima_compra DESC;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Identifica última compra por cliente
- [ ] Calcula dias desde última compra
- [ ] JOINs com cliente e rede (origem)
- [ ] Filtra clientes inativos há 90+ dias

