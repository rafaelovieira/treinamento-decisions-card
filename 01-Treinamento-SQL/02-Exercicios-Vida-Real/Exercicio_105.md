# Exercício 105: Percentual de Contas Bloqueadas

## 📝 Pergunta

Calcule o percentual de contas bloqueadas em relação ao total de contas cadastradas. Considere como bloqueadas as contas que possuem pelo menos um registro ativo na tabela `t_bloqueio_cliente`. Consulte a tabela `t_dominio` para identificar o código correspondente a bloqueios não liberados.

Mostre o resultado como: `total_contas`, `contas_bloqueadas`, `percentual_bloqueadas`.

## 🎯 Objetivo

Demanda da área de risco para monitorar a saúde da carteira de clientes e identificar tendências de bloqueios.

## 💡 Contexto de Negócio

Alto percentual de bloqueios pode indicar problemas na política de crédito ou deterioração da qualidade da carteira.

---

## ✍️ Sua Resposta

```sql

WITH quantidades AS (
	SELECT
		(SELECT COUNT(id_cliente) FROM decisionscard.t_cliente) AS total_contas,
		(SELECT COUNT(DISTINCT id_cliente) FROM decisionscard.t_bloqueio_cliente WHERE fl_liberado = 'N') AS contas_bloqueadas
)
SELECT 
	total_contas, 
	contas_bloqueadas,
	ROUND(contas_bloqueadas::NUMERIC / total_contas * 100) AS percentual_bloqueadas
FROM quantidades;

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Conta total de contas corretamente
- [ ] Consulta a tabela t_dominio para identificar bloqueios não liberados
- [ ] Identifica contas com bloqueio ativo
- [ ] Calcula percentual corretamente
- [ ] Apresenta os três valores solicitados

