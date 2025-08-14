# Exercício 17: EXISTS e NOT EXISTS

## 📝 Pergunta

Identifique clientes que nunca fizeram uma compra. Mostre `id_cliente`, `nm_cliente`, `dt_cadastro` e `cd_uf`. 

Use NOT EXISTS para encontrar clientes que não têm nenhum registro na tabela de vendas. Ordene por data de cadastro (mais antigo primeiro) para priorizar clientes há mais tempo sem comprar.

## 🎯 Objetivo

Praticar:
- Operador NOT EXISTS
- Identificação de registros sem correspondência
- Análise de clientes inativos
- Subconsulta correlacionada

## 💡 Dicas

- NOT EXISTS é mais eficiente que LEFT JOIN + IS NULL para este caso
- Subconsulta correlacionada: WHERE t_venda.id_cliente = t_cliente.id_cliente
- Considere apenas vendas ativas na subconsulta
- Útil para campanhas de reativação

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Usa NOT EXISTS corretamente
- [ ] Subconsulta correlacionada
- [ ] Identifica clientes sem vendas
- [ ] Campos corretos exibidos
- [ ] Ordenação por data de cadastro

