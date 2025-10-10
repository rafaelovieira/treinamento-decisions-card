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
    WHERE 
        tv.id_cliente NOT IN (SELECT id_cliente 
                              FROM decisionscard.t_venda 
                              WHERE dt_venda > (SELECT MAX(dt_venda) - INTERVAL '90 DAYS' FROM decisionscard.t_venda)
                             )
    GROUP BY 
        tv.id_cliente, 
        tc.nm_cliente,
        tr.nm_fantasia,
        tv.id_venda
), ultima_compra AS (
    SELECT 
        id_cliente, 
        MAX(dt_venda) AS dt_ultima_compra
    FROM tabela
    GROUP BY id_cliente
), ultimo_valor AS (
    SELECT 
        uc.dt_ultima_compra,
        tab.vl_venda AS vl_ultima_compra
    FROM ultima_compra uc
    JOIN tabela tab ON uc.dt_ultima_compra = tab.dt_venda 
), nomes AS (
    SELECT 
        tab.nm_cliente,
        tab.nm_fantasia,
        uc.dt_ultima_compra
    FROM ultima_compra uc
    LEFT JOIN tabela tab ON uc.id_cliente = tab.id_cliente 
    GROUP BY 
        uc.dt_ultima_compra,
        tab.nm_cliente,
        tab.nm_fantasia
)
SELECT
    tc.id_cliente,
    n.nm_cliente,
    n.nm_fantasia,
    TO_CHAR(n.dt_ultima_compra, 'YYYY-MM-DD') AS dt_ultima_compra,
    uv.vl_ultima_compra,
    (SELECT MAX(TO_CHAR(dt_venda, 'YYYY-MM-DD')) FROM decisionscard.t_venda)::date - (n.dt_ultima_compra)::date AS dias_desde_ultima_compra
FROM nomes n
JOIN decisionscard.t_cliente tc ON n.nm_cliente = tc.nm_cliente 
JOIN ultimo_valor uv ON n.dt_ultima_compra = uv.dt_ultima_compra 
ORDER BY dias_desde_ultima_compra DESC;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Identifica última compra por cliente
- [ ] Calcula dias desde última compra
- [ ] JOINs com cliente e rede (origem)
- [ ] Filtra clientes inativos há 90+ dias

