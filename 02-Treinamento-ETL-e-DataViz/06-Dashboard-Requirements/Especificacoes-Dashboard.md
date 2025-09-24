# Especificações de Dashboard - DecisionsCard

## Introdução

Este documento define os requisitos conceituais para os dashboards do projeto DecisionsCard, organizados em três áreas principais de análise. As especificações focam em **o que** deve ser implementado, deixando **como** implementar como desafio de aprendizado para o aluno.

## Estrutura Geral dos Dashboards

### Organização por Áreas de Negócio

O projeto deve ser organizado em três áreas principais que refletem diferentes perspectivas de análise do negócio da DecisionsCard:

**Área 1 - Análise de Clientes:** Foco no comportamento, perfil e evolução da base de clientes.

**Área 2 - Análise de Vendas:** Foco na performance comercial, transações e resultados de vendas.

**Área 3 - Análise de Parcelas:** Foco na gestão financeira, cobrança e recebimentos.

### Princípios de Design

#### Usabilidade
Os dashboards devem ser intuitivos para usuários de negócio sem conhecimento técnico, priorizando clareza e facilidade de navegação.

#### Consistência
Mantenha padrões visuais consistentes entre todas as áreas, incluindo cores, fontes, espaçamento e tipos de gráfico.

#### Performance
Garanta que todas as visualizações carreguem rapidamente e respondam de forma ágil às interações do usuário.

#### Responsividade
Considere diferentes tamanhos de tela e dispositivos, garantindo que os dashboards sejam utilizáveis em desktop, tablet e mobile.

## Área 1 - Análise de Clientes

### Objetivo da Área
Fornecer insights sobre a base de clientes da DecisionsCard, incluindo crescimento, ativação, perfil demográfico e comportamento de compra.

### KPIs Principais

#### Quantidade de Clientes Cadastrados
**Definição:** Total de clientes registrados na base de dados.

**Propósito:** Medir o crescimento da base de clientes e efetividade das campanhas de aquisição.

**Formato de Apresentação:** Número inteiro com separadores de milhares.

**Contexto de Negócio:** Indica o tamanho total da base de clientes e serve como denominador para cálculos de percentuais.

#### Quantidade de Clientes Ativados
**Definição:** Clientes que realizaram pelo menos uma compra (possuem pelo menos uma venda).

**Propósito:** Medir quantos clientes efetivamente utilizam o produto/serviço.

**Formato de Apresentação:** Número inteiro com separadores de milhares.

**Contexto de Negócio:** Diferencia clientes que apenas se cadastraram daqueles que efetivamente transacionaram.

#### Taxa de Ativação de Clientes
**Definição:** Percentual de clientes ativados em relação ao total de cadastrados.

**Cálculo Conceitual:** (Clientes Ativados ÷ Clientes Cadastrados) × 100

**Propósito:** Medir a efetividade do processo de onboarding e ativação.

**Formato de Apresentação:** Percentual com duas casas decimais.

**Contexto de Negócio:** Indica a qualidade da base de clientes e eficiência do funil de conversão.

### Análises Temporais

#### Evolução dos Clientes Cadastrados
**Tipo de Visualização:** Gráfico de linha ou área.

**Dimensão Temporal:** Análise por ano e mês/ano.

**Métrica:** Quantidade acumulada de clientes cadastrados.

**Interatividade:** Permitir seleção de período e drill-down temporal.

**Insights Esperados:** Identificar tendências de crescimento, sazonalidade e impacto de campanhas.

#### Evolução da Taxa de Ativação
**Tipo de Visualização:** Gráfico de linha.

**Dimensão Temporal:** Análise mensal ou trimestral.

**Métrica:** Taxa de ativação por período.

**Contexto:** Mostrar se a qualidade da aquisição está melhorando ou piorando ao longo do tempo.

### Análises de Segmentação

#### Top Clientes por Valor
**Tipo de Visualização:** Gráfico de barras horizontais ou ranking.

**Critério:** Top 10 ou Top 20 clientes por valor total de compras.

**Métricas Complementares:** Valor total, quantidade de transações, ticket médio.

**Propósito:** Identificar clientes mais valiosos para estratégias de retenção.

#### Distribuição por Origem Comercial
**Tipo de Visualização:** Gráfico de pizza ou barras.

**Dimensão:** Canal de aquisição/origem comercial.

**Métrica:** Quantidade e percentual de clientes por origem.

**Propósito:** Entender efetividade dos diferentes canais de aquisição.

#### Perfil Demográfico
**Dimensões de Análise:** Gênero, faixa etária, localização (UF).

**Tipos de Visualização:** Gráficos de barras, mapas, tabelas.

**Propósito:** Compreender o perfil da base de clientes para estratégias de marketing.

### Filtros e Interatividade

#### Filtros Temporais
Permitir filtrar análises por período específico (data início/fim, ano, mês, trimestre).

#### Filtros Demográficos
Possibilitar segmentação por gênero, faixa etária, localização.

#### Filtros de Status
Permitir análise separada de clientes ativos, inativos, ou ambos.

## Área 2 - Análise de Vendas

### Objetivo da Área
Fornecer insights sobre a performance comercial da DecisionsCard, incluindo volume de vendas, ticket médio, performance por loja e análise de cancelamentos.

### KPIs Principais

#### Quantidade Total de Vendas
**Definição:** Total de transações realizadas no período.

**Propósito:** Medir o volume de atividade comercial.

**Formato de Apresentação:** Número inteiro com separadores de milhares.

**Contexto de Negócio:** Indica o nível de atividade da plataforma.

#### Quantidade de Vendas Ativas
**Definição:** Vendas que não foram canceladas (status ativo = Sim).

**Propósito:** Medir vendas efetivamente válidas.

**Formato de Apresentação:** Número inteiro com separadores de milhares.

**Contexto de Negócio:** Diferencia vendas válidas de canceladas para análises precisas.

#### Taxa de Cancelamento
**Definição:** Percentual de vendas canceladas em relação ao total.

**Cálculo Conceitual:** (Vendas Canceladas ÷ Total de Vendas) × 100

**Propósito:** Monitorar qualidade do processo de vendas e possíveis problemas.

**Formato de Apresentação:** Percentual com duas casas decimais.

#### Ticket Médio
**Definição:** Valor médio por transação.

**Cálculo Conceitual:** Valor Total de Vendas ÷ Quantidade de Vendas

**Propósito:** Medir o valor médio das transações.

**Formato de Apresentação:** Valor monetário (R$ 0,00).

#### Valor Total de Vendas
**Definição:** Soma de todos os valores de vendas (principal + juros).

**Propósito:** Medir o volume financeiro total.

**Formato de Apresentação:** Valor monetário com separadores de milhares.

### Análises Temporais

#### Evolução das Vendas
**Tipo de Visualização:** Gráfico combinado (barras + linha).

**Dimensão Temporal:** Análise por ano, mês/ano e data.

**Métricas:** Quantidade de vendas (barras) e valor total (linha).

**Interatividade:** Drill-down temporal e seleção de período.

**Insights Esperados:** Identificar tendências, sazonalidade e padrões de crescimento.

#### Comparações Temporais
**Análises Sugeridas:** Mês atual vs mês anterior, ano atual vs ano anterior.

**Métricas:** Crescimento percentual em quantidade e valor.

**Propósito:** Identificar tendências de crescimento ou declínio.

### Análises de Performance

#### Top Lojas por Performance
**Tipo de Visualização:** Gráfico de barras horizontais.

**Critério:** Top 10 lojas por valor total de vendas.

**Métricas Complementares:** Quantidade de vendas, ticket médio, taxa de cancelamento.

**Propósito:** Identificar lojas parceiras mais performáticas.

#### Análise por Forma de Pagamento
**Tipo de Visualização:** Gráfico de pizza ou barras.

**Dimensão:** Método de pagamento.

**Métricas:** Valor total e quantidade por forma de pagamento.

**Propósito:** Entender preferências de pagamento dos clientes.

### Análises de Qualidade

#### Monitoramento de Cancelamentos
**Visualizações:** Gráficos de tendência da taxa de cancelamento.

**Segmentações:** Por loja, período, forma de pagamento.

**Propósito:** Identificar problemas de qualidade ou padrões de cancelamento.

#### Distribuição de Ticket
**Tipo de Visualização:** Histograma ou gráfico de distribuição.

**Propósito:** Entender distribuição de valores de venda.

**Insights:** Identificar concentração de valores e outliers.

## Área 3 - Análise de Parcelas

### Objetivo da Área
Fornecer insights sobre a gestão financeira das parcelas, incluindo valores de principal e juros, competências de cobrança e análise de recebimentos.

### KPIs Principais

#### Total de Valor Principal
**Definição:** Soma de todos os valores principais das parcelas.

**Propósito:** Medir o volume financeiro principal (sem juros).

**Formato de Apresentação:** Valor monetário com separadores de milhares.

**Contexto de Negócio:** Representa o valor base das transações parceladas.

#### Total de Valor de Juros
**Definição:** Soma de todos os valores de juros das parcelas.

**Propósito:** Medir a receita adicional gerada por juros.

**Formato de Apresentação:** Valor monetário com separadores de milhares.

**Contexto de Negócio:** Indica receita financeira adicional ou custo de inadimplência.

#### Percentual de Parcelas com Juros
**Definição:** Proporção de parcelas que possuem valor de juros maior que zero.

**Cálculo Conceitual:** (Parcelas com Juros > 0 ÷ Total de Parcelas) × 100

**Propósito:** Indicar nível de inadimplência ou financiamento.

**Formato de Apresentação:** Percentual com duas casas decimais.

#### Ticket Médio das Parcelas
**Definição:** Valor médio por parcela (principal + juros).

**Propósito:** Entender valor médio das parcelas.

**Formato de Apresentação:** Valor monetário (R$ 0,00).

### Análises por Competência

#### Evolução por Competência de Cobrança
**Tipo de Visualização:** Gráfico de área empilhada.

**Dimensão Temporal:** Competência de cobrança (ano/mês).

**Métricas:** Valor principal (área inferior) e valor juros (área superior).

**Propósito:** Visualizar evolução dos recebimentos ao longo do tempo.

**Insights Esperados:** Identificar padrões sazonais e tendências de cobrança.

#### Análise de Vencimentos
**Dimensão Temporal:** Data de vencimento das parcelas.

**Métricas:** Valor total por período de vencimento.

**Propósito:** Planejar fluxo de caixa e gestão de cobrança.

### Análises Detalhadas

#### Matriz Competência vs Número da Parcela
**Tipo de Visualização:** Matriz ou heatmap.

**Dimensões:** Competência de cobrança (linhas) e número da parcela (colunas).

**Métrica:** Valor total das parcelas.

**Propósito:** Análise detalhada da distribuição de parcelas por período.

**Insights:** Identificar padrões de parcelamento e concentrações.

#### Distribuição por Número de Parcelas
**Tipo de Visualização:** Gráfico de barras.

**Dimensão:** Quantidade de parcelas (1x, 2x, 3x, etc.).

**Métricas:** Valor total e quantidade de vendas por número de parcelas.

**Propósito:** Entender preferências de parcelamento dos clientes.

### Análises de Inadimplência

#### Monitoramento de Atrasos
**Conceito:** Parcelas vencidas que ainda não foram pagas.

**Métricas:** Valor em atraso, quantidade de parcelas em atraso.

**Segmentações:** Por período de atraso, cliente, loja.

#### Análise de Recuperação
**Conceito:** Parcelas que estavam em atraso e foram pagas.

**Métricas:** Taxa de recuperação, tempo médio de recuperação.

**Propósito:** Avaliar efetividade da cobrança.

## Especificações Técnicas Gerais

### Filtros Globais

#### Filtros Temporais
**Período:** Seletor de data início/fim para análises customizadas.

**Ano:** Lista de anos disponíveis nos dados.

**Mês:** Seletor de mês específico.

**Trimestre:** Agrupamento trimestral (Q1, Q2, Q3, Q4).

#### Filtros Dimensionais
**Loja/Rede:** Seletor múltiplo de lojas parceiras.

**UF:** Filtro por unidade federativa.

**Status:** Filtro por status ativo/inativo/cancelado.

**Origem Comercial:** Filtro por canal de aquisição.

#### Filtros Avançados
**Faixa de Valor:** Slider para definir valor mínimo/máximo.

**Tipo de Cliente:** Segmentação por novo/recorrente.

**Forma de Pagamento:** Seleção múltipla de métodos de pagamento.

### Padrões de Formatação

#### Formatação Numérica
**Moeda:** R$ #.##0,00 (padrão brasileiro).

**Percentual:** 0,00% (duas casas decimais).

**Números Inteiros:** #.##0 (separador de milhares).

**Números Decimais:** #.##0,00 (duas casas decimais).

#### Formatação de Datas
**Data Completa:** DD/MM/AAAA.

**Mês/Ano:** MM/AAAA ou MMM/AAAA.

**Ano:** AAAA.

#### Cores e Temas
**Cores Primárias:** Azul (#34495e) para elementos principais.

**Cores Secundárias:** Roxo (#9b59b6) para destaques.

**Cores de Apoio:** Verde (#1abc9c), Amarelo (#f1c40f).

**Cores de Alerta:** Vermelho (#e74c3c) para valores negativos ou alertas.

**Fundo:** Branco ou cinza claro (#f8f9fa).

### Responsividade

#### Layout Desktop
**Estrutura:** Layout em 3 colunas para aproveitar espaço horizontal.

**KPIs:** Linha superior com cartões de métricas principais.

**Gráficos:** Distribuição equilibrada entre gráficos principais e complementares.

#### Layout Tablet
**Estrutura:** Layout em 2 colunas com reorganização de elementos.

**Priorização:** Elementos mais importantes mantêm destaque.

#### Layout Mobile
**Estrutura:** Layout em 1 coluna com scroll vertical.

**Simplificação:** Redução de elementos para focar no essencial.

## Validações e Qualidade

### Validações Automáticas

#### Consistência de Dados
Implementar validações que garantam que:
- Soma de parcelas seja igual ao valor da venda original
- Clientes ativados não excedam total de cadastrados
- Percentuais estejam sempre entre 0% e 100%
- Datas sejam válidas e consistentes

#### Integridade Referencial
Verificar que:
- Todas as vendas tenham cliente correspondente
- Todas as parcelas tenham venda correspondente
- Relacionamentos entre dimensões e fatos estejam corretos

### Indicadores de Qualidade

#### Completude de Dados
**Métrica:** Percentual de campos preenchidos vs campos obrigatórios.

**Exibição:** Indicador visual de qualidade dos dados.

**Propósito:** Alertar sobre possíveis problemas de qualidade.

#### Atualidade dos Dados
**Métrica:** Data e hora da última atualização.

**Exibição:** Timestamp visível em local apropriado.

**Propósito:** Informar usuários sobre atualidade das informações.

### Alertas e Notificações

#### Alertas de Performance
**Queda Significativa:** Redução maior que 20% em KPIs principais.

**Picos Anômalos:** Aumento maior que 200% em período curto.

**Dados Desatualizados:** Última atualização há mais de 24 horas.

#### Alertas de Qualidade
**Dados Inconsistentes:** Violações de regras de negócio.

**Valores Extremos:** Outliers que podem indicar problemas.

**Relacionamentos Quebrados:** Dados órfãos ou relacionamentos inválidos.

## Próximos Passos para Implementação

### Fase de Planejamento
1. **Analise os requisitos** detalhadamente para sua plataforma escolhida
2. **Defina a arquitetura** de páginas/dashboards
3. **Planeje a navegação** entre diferentes áreas
4. **Desenhe wireframes** dos layouts principais

### Fase de Desenvolvimento
1. **Implemente KPIs básicos** começando pelos mais simples
2. **Crie visualizações principais** para cada área
3. **Configure filtros** e interatividade
4. **Aplique formatação** e temas consistentes

### Fase de Validação
1. **Teste funcionalidades** com dados reais
2. **Valide cálculos** comparando com fonte original
3. **Teste usabilidade** com cenários de negócio
4. **Otimize performance** conforme necessário

### Fase de Refinamento
1. **Colete feedback** de usuários potenciais
2. **Ajuste visualizações** baseado no feedback
3. **Documente decisões** de design tomadas
4. **Prepare apresentação** do projeto final

Lembre-se: estas especificações definem **o que** deve ser implementado. O **como** implementar é seu desafio de aprendizado, utilizando as orientações específicas da sua plataforma escolhida (Qlik Sense ou Power BI).
