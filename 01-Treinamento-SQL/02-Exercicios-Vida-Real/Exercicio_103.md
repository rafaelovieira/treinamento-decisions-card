# Exercício 103: Quantidade de Contas Ativadas

## 📝 Pergunta

Calcule quantas contas foram ativadas (mudaram de status inativo para ativo). Consulte a tabela `t_dominio` para identificar o código de status ativo e considere contas que possuem pelo menos uma venda ativa registrada.

## 🎯 Objetivo

Demanda da área de CRM para medir a efetividade das campanhas de ativação de clientes.

## 💡 Contexto de Negócio

Contas ativadas representam clientes que não apenas se cadastraram, mas efetivamente começaram a usar o produto, indicando sucesso na jornada de onboarding.

---

## ✍️ Sua Resposta

```sql

SELECT COUNT(DISTINCT tv.id_cliente) AS contas_ativadas
FROM decisionscard.t_venda tv 
JOIN decisionscard.t_cliente tc ON tv.id_cliente = tc.id_cliente 
WHERE tc.fl_status_conta = 'A';

```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Consulta a tabela t_dominio para identificar status ativo
- [ ] Filtra contas ativas
- [ ] Verifica existência de vendas
- [ ] Conta clientes únicos
- [ ] JOIN entre clientes e vendas

