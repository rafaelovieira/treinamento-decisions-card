# Instruções para o Treinamento de ETL e DataViz

Bem-vindo à etapa final do treinamento! 🎉

## 🎯 Objetivo

Nesta fase, você aplicará seu conhecimento do modelo de dados operacional da DecisionsCard para:

1. **Projetar um Modelo Dimensional** otimizado para análise (Star Schema)
2. **Desenvolver um processo de ETL** para transformar dados operacionais em analíticos
3. **Criar um Dashboard** que atenda às necessidades de negócio

## 📋 Pré-requisitos

- Ter completado pelo menos 80% dos exercícios de SQL
- Compreender o fluxo de dados da DecisionsCard (história na pasta `00-Recursos`)
- Ter acesso a uma ferramenta de BI (Power BI, Qlik, Tableau, etc.)

## 🗺️ Roadmap do Projeto

### Fase 1: Análise e Design (30% do tempo)
- Estude o modelo dimensional proposto (`1-Modelo-Dimensional-Proposto.png`)
- Identifique as tabelas Fato e Dimensão necessárias
- Mapeie os relacionamentos entre o modelo operacional e dimensional

### Fase 2: Desenvolvimento ETL (50% do tempo)
- Escolha sua abordagem: SQL puro ou Python + SQL
- Desenvolva scripts para extrair dados do schema `decisionscard`
- Transforme e carregue os dados no modelo dimensional
- Teste e valide a qualidade dos dados

### Fase 3: Visualização (20% do tempo)
- Conecte sua ferramenta de BI ao modelo dimensional
- Implemente os requisitos do dashboard (veja `2-Desafio-Dashboard/`)
- Teste a performance e usabilidade
- Documente suas escolhas de design

## 🛠️ Ferramentas Sugeridas

### Para ETL:
- **SQL puro:** Stored procedures, views, scripts
- **Python:** pandas, sqlalchemy, psycopg2
- **Ferramentas visuais:** Pentaho, Talend (se disponível)

### Para DataViz:
- **Power BI:** Integração nativa com PostgreSQL
- **Qlik Sense:** Excelente para análise exploratória
- **Tableau:** Visualizações avançadas
- **Metabase/Grafana:** Alternativas open-source

## 📊 Entregáveis

1. **Documentação do Modelo Dimensional**
   - Justificativa das escolhas de design
   - Dicionário de dados das tabelas Fato/Dimensão

2. **Scripts de ETL**
   - Código fonte comentado
   - Instruções de execução
   - Logs de validação

3. **Dashboard Funcional**
   - Arquivo da ferramenta de BI (.pbix, .qvf, etc.)
   - Screenshots das principais visualizações
   - Manual do usuário básico

## 🎨 Critérios de Avaliação

### Modelo Dimensional (25%)
- Adequação ao negócio da DecisionsCard
- Otimização para consultas analíticas
- Normalização adequada das dimensões

### Processo ETL (35%)
- Qualidade e eficiência do código
- Tratamento de erros e validações
- Documentação e manutenibilidade

### Dashboard (40%)
- Atendimento aos requisitos de negócio
- Usabilidade e design
- Performance das consultas
- Insights gerados

## 🚀 Próximos Passos

1. **Estude o modelo proposto:** Analise `1-Modelo-Dimensional-Proposto.png`
2. **Leia os requisitos:** Veja `2-Desafio-Dashboard/Requisitos_Dashboard.md`
3. **Escolha suas ferramentas:** Defina stack de ETL e BI
4. **Comece pequeno:** Implemente uma tabela Fato simples primeiro
5. **Itere e melhore:** Adicione complexidade gradualmente

## 💡 Dicas de Sucesso

- **Comece simples:** Um modelo funcional é melhor que um complexo quebrado
- **Valide sempre:** Confira se os totais batem entre origem e destino
- **Pense no usuário:** O dashboard deve ser intuitivo para não-técnicos
- **Documente tudo:** Suas escolhas precisam ser justificáveis
- **Performance importa:** Otimize para consultas rápidas

## 🆘 Suporte

Se encontrar dificuldades:
1. Revise a documentação na pasta `00-Recursos`
2. Consulte os exercícios de SQL já resolvidos
3. Pesquise boas práticas de modelagem dimensional
4. Teste com subconjuntos pequenos de dados primeiro

**Lembre-se:** Este é um projeto real que simula desafios do dia a dia. Não existe uma única resposta certa!

Boa sorte! 🍀

