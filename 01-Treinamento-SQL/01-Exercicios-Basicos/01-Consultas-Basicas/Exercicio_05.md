# Exercício 5: Vendas do Último Mês

## 📝 Pergunta

Liste todas as vendas (`t_venda`) que foram realizadas nos últimos 30 dias a partir da data atual. Mostre `id_venda`, `id_cliente`, `vl_venda`, `dt_venda` e ordene da mais recente para a mais antiga.

## 🎯 Objetivo

Praticar:
- Filtros com datas
- Função CURRENT_DATE ou NOW()
- Operações aritméticas com datas
- Ordenação por data

## 💡 Dicas

- Use `CURRENT_DATE - INTERVAL '30 days'` para calcular 30 dias atrás
- Para ordenar da mais recente para mais antiga, use `ORDER BY dt_venda DESC`
- O operador `>=` pode ser usado para "maior ou igual que uma data"

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Filtra corretamente vendas dos últimos 30 dias
- [ ] Ordenação por data (mais recente primeiro)
- [ ] Usa funções de data adequadamente
- [ ] Campos corretos são exibidos

