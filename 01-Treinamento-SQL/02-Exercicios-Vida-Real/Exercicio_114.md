# Exercício 114: Quantidade de Cartões por Situação

## 📝 Pergunta

Analise a distribuição de cartões por situação. Mostre:

- `situacao` (descrição da situação)
- `quantidade` (número de cartões)
- `percentual` (% sobre o total)

Considere as situações baseadas no `fl_status_cartao`:
- "Ativo": fl_status_cartao = 'A'
- "Inativo": fl_status_cartao = 'I'
- "Bloqueado": fl_status_cartao = 'B'
- "Cancelado": fl_status_cartao = 'C'

Ordene por quantidade decrescente.

## 🎯 Objetivo

Demanda operacional para monitorar a situação da carteira de cartões e identificar problemas.

## 💡 Contexto de Negócio

A distribuição por status ajuda a identificar problemas operacionais e monitorar a saúde da carteira de cartões.

---

## ✍️ Sua Resposta

```sql

SELECT
	td.vl_dominio AS situacao,
	COUNT(tc.id_cartao) AS quantidade,
	ROUND(COUNT(tc.id_cartao)::NUMERIC / (SELECT COUNT(id_cartao) FROM decisionscard.t_cartao) * 100, 2) AS percentual
FROM decisionscard.t_cartao tc
LEFT JOIN decisionscard.t_dominio td ON tc.fl_status_cartao = td.cd_dominio
WHERE td.nm_dominio = 'FL_STATUS_CARTAO'
GROUP BY td.vl_dominio 
ORDER BY quantidade DESC;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Categoriza todas as situações
- [ ] Calcula quantidade por situação
- [ ] Calcula percentual sobre total
- [ ] Ordenação por quantidade decrescente

