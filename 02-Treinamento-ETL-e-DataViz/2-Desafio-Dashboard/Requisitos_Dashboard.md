# Requisitos do Dashboard Executivo - DecisionsCard

## 🎯 Contexto do Projeto

A diretoria da DecisionsCard precisa de um dashboard executivo para acompanhar a performance do negócio e tomar decisões estratégicas baseadas em dados. O dashboard deve ser atualizado mensalmente e ser acessível via web.

## 👥 Personas (Usuários-Alvo)

### Diretor Comercial
- **Necessidade:** Acompanhar vendas por canal e região
- **Frequência de uso:** Semanal
- **Nível técnico:** Baixo

### Diretor Financeiro  
- **Necessidade:** Monitorar inadimplência e fluxo de caixa
- **Frequência de uso:** Diário
- **Nível técnico:** Médio

### Gerente de Risco
- **Necessidade:** Analisar perfil de clientes e performance de crédito
- **Frequência de uso:** Diário
- **Nível técnico:** Alto

## 📊 KPIs Obrigatórios

### Indicadores Financeiros
1. **Valor Total de Vendas (R$)** - Soma de todas as vendas ativas
2. **Receita Líquida Mensal (R$)** - Vendas menos estornos e cancelamentos
3. **Ticket Médio (R$)** - Valor médio por transação
4. **Volume de Transações (#)** - Quantidade total de vendas

### Indicadores de Clientes
5. **Clientes Ativos (#)** - Clientes com pelo menos uma transação nos últimos 90 dias
6. **Novos Clientes Mensais (#)** - Clientes cadastrados no mês
7. **Taxa de Retenção (%)** - Clientes que fizeram compras em meses consecutivos

### Indicadores de Risco
8. **Taxa de Inadimplência (%)** - % de clientes em cobrança vs total de clientes
9. **Valor em Cobrança (R$)** - Soma dos valores em processo de cobrança
10. **Taxa de Recuperação (%)** - % de acordos quitados vs total de acordos

## 🎛️ Filtros Interativos Obrigatórios

### Temporais
- **Período:** Seletor de ano/mês (últimos 24 meses)
- **Comparação:** Opção de comparar com período anterior

### Geográficos
- **Estado (UF):** Filtro múltiplo por estado do cliente
- **Região:** Agrupamento por regiões (Norte, Nordeste, etc.)

### Segmentação
- **Rede Parceira:** Filtro por nome fantasia da rede
- **Perfil do Cliente:** Faixa etária, escolaridade, estado civil
- **Tipo de Transação:** À vista vs parcelado

## 📈 Visualizações Obrigatórias

### 1. Painel de KPIs (Topo da página)
- Cards com os 10 indicadores principais
- Comparação com período anterior (% de variação)
- Indicadores visuais de performance (verde/vermelho)

### 2. Evolução Temporal das Vendas
- **Tipo:** Gráfico de linha
- **Período:** Últimos 12 meses
- **Métricas:** Valor de vendas e quantidade de transações
- **Interação:** Drill-down por mês

### 3. Performance por Rede Parceira
- **Tipo:** Gráfico de barras horizontais
- **Dados:** Top 10 redes por valor de vendas
- **Métricas:** Valor total, quantidade, ticket médio
- **Interação:** Filtro por período

### 4. Distribuição Geográfica
- **Tipo:** Mapa do Brasil ou gráfico de barras por UF
- **Métrica:** Valor de vendas por estado
- **Cores:** Gradiente baseado no volume
- **Interação:** Clique para filtrar por estado

### 5. Análise de Inadimplência
- **Tipo:** Gráfico de área empilhada
- **Dados:** Evolução da inadimplência vs recuperação
- **Período:** Últimos 12 meses
- **Métricas:** Valor em cobrança, valor recuperado

### 6. Perfil dos Clientes
- **Tipo:** Gráficos de pizza ou treemap
- **Segmentações:** Por escolaridade, faixa etária, estado civil
- **Métrica:** Distribuição percentual
- **Interação:** Filtros cruzados

### 7. Tabela Detalhada (Rodapé)
- **Dados:** Últimas 50 transações
- **Campos:** Data, cliente, rede, valor, status
- **Funcionalidades:** Ordenação, busca, paginação
- **Interação:** Responde aos filtros globais

## 🎨 Requisitos de Design

### Layout
- **Responsivo:** Deve funcionar em desktop e tablet
- **Cores:** Paleta corporativa da DecisionsCard (azul/branco/cinza)
- **Tipografia:** Fonte legível, hierarquia clara

### Usabilidade
- **Tempo de carregamento:** Máximo 5 segundos
- **Navegação:** Intuitiva, sem necessidade de treinamento
- **Acessibilidade:** Contraste adequado, textos alternativos

### Performance
- **Dados:** Máximo 1 milhão de registros por consulta
- **Refresh:** Atualização automática ou manual
- **Cache:** Implementar cache quando possível

## 📋 Critérios de Aceitação

### Funcionalidades Básicas
- [ ] Todos os 10 KPIs são calculados corretamente
- [ ] Filtros funcionam e afetam todas as visualizações
- [ ] Dados são consistentes entre diferentes gráficos
- [ ] Dashboard carrega em menos de 5 segundos

### Funcionalidades Avançadas
- [ ] Comparação temporal funciona corretamente
- [ ] Drill-down e drill-up funcionam onde aplicável
- [ ] Exportação de dados (Excel/PDF) disponível
- [ ] Tooltips informativos em todos os gráficos

### Qualidade dos Dados
- [ ] Totais batem com consultas diretas no banco
- [ ] Não há valores nulos ou inconsistentes
- [ ] Datas são tratadas corretamente (fusos, formatos)
- [ ] Cálculos percentuais são precisos

## 🚀 Entregáveis

1. **Dashboard Funcional**
   - Arquivo da ferramenta de BI (.pbix, .qvf, etc.)
   - Versão publicada online (se possível)

2. **Documentação**
   - Manual do usuário (2-3 páginas)
   - Dicionário de métricas e cálculos
   - Guia de troubleshooting

3. **Screenshots**
   - Capturas de tela de todas as visualizações
   - Demonstração dos filtros em ação
   - Exemplos de diferentes cenários de uso

## 💡 Dicas de Implementação

### Começe Simples
1. Implemente primeiro os KPIs básicos
2. Adicione uma visualização por vez
3. Teste com dados limitados inicialmente

### Otimização
- Use agregações pré-calculadas quando possível
- Implemente filtros no nível da fonte de dados
- Considere criar views materializadas para consultas complexas

### Validação
- Compare totais com relatórios existentes
- Teste cenários extremos (datas futuras, valores nulos)
- Valide cálculos percentuais manualmente

## 🎯 Bonus Points

Funcionalidades extras que impressionarão:

- **Alertas automáticos:** Notificações quando KPIs saem do normal
- **Análise preditiva:** Projeções baseadas em tendências históricas
- **Comentários:** Possibilidade de adicionar anotações aos dados
- **Mobile-first:** Versão otimizada para smartphones
- **Tempo real:** Atualização automática dos dados

---

**Lembre-se:** Este dashboard será usado por executivos para tomar decisões importantes. Priorize clareza, precisão e facilidade de uso sobre complexidade técnica.

