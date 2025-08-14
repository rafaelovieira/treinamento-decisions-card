# Exercício 10: JOIN Complexo com Múltiplas Tabelas

## 📝 Pergunta

Crie um relatório completo de vendas mostrando: nome do cliente (`nm_cliente`), nome fantasia da rede (`nm_fantasia`), cidade da rede (`nm_cidade`), UF da rede (`cd_uf`), valor da venda (`vl_venda`), descrição da forma de pagamento (`ds_forma_pagamento`) e data da venda (`dt_venda`). 

Considere apenas vendas ativas dos últimos 6 meses a partir da maior data de venda existente na base. Ordene por valor decrescente.

## 🎯 Objetivo

Praticar:
- JOIN entre 4 tabelas (`t_venda`, `t_cliente`, `t_rede`, `t_forma_pagamento`)
- Filtros temporais baseados na maior data existente
- Consulta complexa com múltiplos relacionamentos
- Relatório gerencial completo

## 💡 Dicas

- Use `(SELECT MAX(dt_venda) FROM decisionscard.t_venda)` para a data máxima
- Subtraia 6 meses: `INTERVAL '6 months'`
- Conecte todas as tabelas pelos campos de relacionamento apropriados
- Qualifique todos os campos com alias das tabelas

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] JOINs corretos entre as 4 tabelas
- [ ] Filtra vendas dos últimos 6 meses
- [ ] Usa subconsulta para data máxima
- [ ] Campos de todas as tabelas
- [ ] Ordenação por valor decrescente

