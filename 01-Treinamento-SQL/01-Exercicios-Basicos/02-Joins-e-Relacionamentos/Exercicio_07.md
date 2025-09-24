# Exercício 7: JOIN Múltiplo com Vendas

## 📝 Pergunta

Liste todas as vendas realizadas, mostrando o nome do cliente (`nm_cliente`), o nome fantasia da rede (`nm_fantasia`), o valor da venda (`vl_venda`) e a data da venda (`dt_venda`). Considere apenas vendas com status ativo (`fl_status_venda = 'A'`) e ordene por data da venda (mais recente primeiro).

## 🎯 Objetivo

Praticar:
- JOIN entre três tabelas (`t_venda`, `t_cliente`, `t_rede`)
- Filtros em consultas com múltiplas tabelas
- Ordenação por data decrescente
- Relacionamentos complexos

## 💡 Dicas

- Use INNER JOIN para conectar as três tabelas
- `t_venda` se relaciona com `t_cliente` através de `id_cliente`
- `t_venda` se relaciona com `t_rede` através de `id_rede`
- Para ordenar da mais recente para mais antiga: `ORDER BY dt_venda DESC`

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Usa INNER JOIN corretamente entre as três tabelas
- [ ] Filtra apenas vendas ativas
- [ ] Campos corretos de todas as tabelas
- [ ] Ordenação por data decrescente

