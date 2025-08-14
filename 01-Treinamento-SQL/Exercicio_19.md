# Exercício 19: Subconsulta Correlacionada

## 📝 Pergunta

Para cada cliente, encontre sua compra de maior valor e mostre: `nm_cliente`, `vl_maior_compra`, `dt_maior_compra`, `nm_fantasia` da rede onde foi feita a maior compra, e `diferenca_media` (diferença entre a maior compra e a média de compras desse cliente).

Use subconsulta correlacionada para encontrar a maior compra de cada cliente.

## 🎯 Objetivo

Praticar:
- Subconsulta correlacionada
- Encontrar registros específicos por grupo
- Cálculos comparativos
- JOINs complexos com subconsultas

## 💡 Dicas

- Subconsulta correlacionada: WHERE vl_venda = (SELECT MAX(vl_venda) FROM t_venda WHERE id_cliente = cliente_principal.id_cliente)
- Use aliases diferentes para tabelas na consulta principal e subconsulta
- Calcule a média na subconsulta para diferença
- Considere apenas vendas ativas

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Subconsulta correlacionada correta
- [ ] Encontra maior compra por cliente
- [ ] JOINs para nome do cliente e rede
- [ ] Calcula diferença com média
- [ ] Considera apenas vendas ativas

