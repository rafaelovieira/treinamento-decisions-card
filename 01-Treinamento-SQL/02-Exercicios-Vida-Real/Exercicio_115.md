# Exercício 115: Quantidade de Cartões por Tipo de Bloqueio

## 📝 Pergunta

Analise os cartões bloqueados por tipo de bloqueio. Mostre:

- `ds_tipo_bloqueio_cartao` (descrição do tipo de bloqueio)
- `quantidade_cartoes` (número de cartões com este tipo de bloqueio)
- `percentual_total_bloqueios` (% sobre total de bloqueios)

Considere apenas bloqueios ativos (`fl_ativo = 'S'`) e faça JOIN com a tabela de tipos de bloqueio para obter a descrição. Ordene por quantidade decrescente.

## 🎯 Objetivo

Demanda de risco para entender os principais motivos de bloqueio de cartões e otimizar políticas.

## 💡 Contexto de Negócio

Identificar os tipos de bloqueio mais frequentes ajuda a melhorar processos e reduzir bloqueios desnecessários.

---

## ✍️ Sua Resposta

```sql

WITH tabela AS (
	SELECT 
		tcar.id_cartao,
		tbc.id_tipo_bloqueio_cartao,
		ttbc.ds_tipo_bloqueio_cartao 
	FROM decisionscard.t_cobranca tcob
	JOIN decisionscard.t_cartao tcar ON tcob.id_cliente = tcar.id_cliente 
	JOIN decisionscard.t_bloqueio_cartao tbc ON tcar.id_cartao = tbc.id_cartao 
	JOIN decisionscard.t_tipo_bloqueio_cartao ttbc ON ttbc.id_tipo_bloqueio_cartao = tbc.id_tipo_bloqueio_cartao 
	WHERE fl_ativo = 'S'
)
SELECT 
	ds_tipo_bloqueio_cartao,
	COUNT(id_tipo_bloqueio_cartao) AS quantidade_cartoes,
	ROUND(COUNT(id_tipo_bloqueio_cartao)::NUMERIC / (SELECT COUNT(id_tipo_bloqueio_cartao) FROM tabela a) * 100, 2) AS percentual_total_bloqueios
FROM tabela
GROUP BY ds_tipo_bloqueio_cartao
ORDER BY quantidade_cartoes DESC;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] JOIN com tabela de tipos de bloqueio
- [ ] Filtra apenas bloqueios ativos
- [ ] Calcula quantidade por tipo
- [ ] Calcula percentual sobre total de bloqueios

