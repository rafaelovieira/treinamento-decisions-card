# Exercício 8: LEFT JOIN para Dados Opcionais

## 📝 Pergunta

Liste todos os clientes, mostrando `id_cliente`, `nm_cliente`, `dt_cadastro` e, quando houver, o número do cartão (`nu_cartao`) e status do cartão (`fl_status_cartao`). Use LEFT JOIN para incluir clientes mesmo que não tenham cartão emitido. Ordene pelo nome do cliente.

## 🎯 Objetivo

Praticar:
- LEFT JOIN para incluir registros mesmo sem correspondência
- Diferença entre INNER JOIN e LEFT JOIN
- Tratamento de dados opcionais
- Análise de clientes com e sem cartão

## 💡 Dicas

- LEFT JOIN mantém todos os registros da tabela à esquerda (`t_cliente`)
- Clientes sem cartão terão valores NULL nos campos do cartão
- Use `t_cliente` como tabela principal (à esquerda)

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Usa LEFT JOIN corretamente
- [ ] Inclui todos os clientes (com e sem cartão)
- [ ] Campos corretos são exibidos
- [ ] Ordenação por nome do cliente

