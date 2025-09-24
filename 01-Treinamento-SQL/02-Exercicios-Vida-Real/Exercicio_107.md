# Exercício 107: Distribuição de Contas por Situação

## 📝 Pergunta

Crie um relatório mostrando a quantidade e percentual de contas por situação. Mostre:

- `situacao` (descrição da situação)
- `quantidade` (número de contas)
- `percentual` (% sobre o total)

Considere as situações baseadas no `fl_status_conta` e `fl_status_analise`:
- "Ativa": fl_status_conta = 'A'
- "Inativa": fl_status_conta = 'I' 
- "Pendente Análise": fl_status_analise = 'P'
- "Rejeitada": fl_status_analise = 'R'

Ordene por quantidade decrescente.

## 🎯 Objetivo

Demanda operacional para acompanhar a distribuição da carteira por status e identificar gargalos no processo.

## 💡 Contexto de Negócio

Este relatório ajuda a identificar problemas no funil de aprovação e monitorar a saúde operacional da carteira.

---

## ✍️ Sua Resposta

```sql
-- Escreva sua query aqui


```

---

## 📋 Critérios de Avaliação

- [ ] Query executa sem erros
- [ ] Categoriza situações corretamente
- [ ] Calcula quantidade por situação
- [ ] Calcula percentual sobre total
- [ ] Ordenação por quantidade decrescente

