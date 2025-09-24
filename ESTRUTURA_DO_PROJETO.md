# Estrutura do Projeto - DecisionsCard Training

## Visão Geral

Este documento descreve a organização completa do projeto de treinamento DecisionsCard, incluindo a estrutura de pastas, arquivos e a finalidade de cada componente.

## Estrutura de Diretórios

```
decisionscard-training/
├── README.md                           # Introdução e guia inicial
├── ESTRUTURA_DO_PROJETO.md            # Este arquivo
├── LICENSE                            # Licença do projeto
│
├── 00-Recursos/                       # Materiais de apoio e referência
│   ├── DDL_Schema_DecisionsCard.sql   # Script de criação do schema
│   ├── Modelo_de_Dados.png           # Diagrama ER do modelo operacional
│   └── Historia_do_Fluxo_de_Dados.md # Contexto de negócio
│
├── 01-Treinamento-SQL/               # Módulo de exercícios SQL
│   ├── 00_Instrucoes_e_Setup.md     # Configuração do ambiente
│   ├── 00_LISTA_DE_EXERCICIOS.md    # Lista completa de exercícios
│   │
│   ├── 01-Exercicios-Basicos/        # Exercícios 1-25 (progressivos)
│   │   ├── 01-Consultas-Basicas/     # Exercícios 1-5
│   │   │   ├── Exercicio_01.md
│   │   │   ├── Exercicio_02.md
│   │   │   ├── Exercicio_03.md
│   │   │   ├── Exercicio_04.md
│   │   │   └── Exercicio_05.md
│   │   │
│   │   ├── 02-Joins-e-Relacionamentos/ # Exercícios 6-10
│   │   │   ├── Exercicio_06.md
│   │   │   ├── Exercicio_07.md
│   │   │   ├── Exercicio_08.md
│   │   │   ├── Exercicio_09.md
│   │   │   └── Exercicio_10.md
│   │   │
│   │   ├── 03-Agregacoes-e-Agrupamentos/ # Exercícios 11-15
│   │   │   ├── Exercicio_11.md
│   │   │   ├── Exercicio_12.md
│   │   │   ├── Exercicio_13.md
│   │   │   ├── Exercicio_14.md
│   │   │   └── Exercicio_15.md
│   │   │
│   │   ├── 04-Subconsultas-e-CTEs/   # Exercícios 16-20
│   │   │   ├── Exercicio_16.md
│   │   │   ├── Exercicio_17.md
│   │   │   ├── Exercicio_18.md
│   │   │   ├── Exercicio_19.md
│   │   │   └── Exercicio_20.md
│   │   │
│   │   └── 05-Analises-Avancadas/    # Exercícios 21-25
│   │       ├── Exercicio_21.md
│   │       ├── Exercicio_22.md
│   │       ├── Exercicio_23.md
│   │       ├── Exercicio_24.md
│   │       └── Exercicio_25.md
│   │
│   └── 02-Exercicios-Vida-Real/      # Exercícios 100+ (demandas reais)
│       ├── Exercicio_100.md
│       ├── Exercicio_102.md
│       ├── Exercicio_103.md
│       ├── Exercicio_104.md
│       ├── Exercicio_105.md
│       ├── Exercicio_106.md
│       ├── Exercicio_107.md
│       ├── Exercicio_108.md
│       ├── Exercicio_109.md
│       ├── Exercicio_110.md
│       ├── Exercicio_111.md
│       ├── Exercicio_112.md
│       ├── Exercicio_113.md
│       ├── Exercicio_114.md
│       ├── Exercicio_115.md
│       ├── Exercicio_116.md
│       └── Exercicio_117.md
│
└── 02-Treinamento-ETL-e-DataViz/     # Módulo de Business Intelligence
    ├── 00-Instrucoes-Gerais.md      # Visão geral e instruções
    │
    ├── 01-Modelo-Dimensional/        # Documentação do modelo Star Schema
    │   └── Dicionario-Dados-Dimensional.md
    │
    ├── 02-ETL/                       # Processo de ETL
    │   ├── Instrucoes-ETL.md         # Guia de implementação
    │   └── Scripts-SQL/              # Scripts de transformação
    │       ├── 01_create_dim_tempo.sql
    │       ├── 02_load_dim_tempo.sql
    │       └── ... (outros scripts)
    │
    ├── 03-Qlik-Sense/               # Implementação específica Qlik
    │   └── Instrucoes-Qlik.md
    │
    ├── 04-Power-BI/                 # Implementação específica Power BI
    │   └── Instrucoes-PowerBI.md
    │
    └── 05-Dashboard-Requirements/    # Especificações dos dashboards
        └── KPIs-Definidos.md
```

## Descrição dos Componentes

### Arquivos Raiz

**README.md:** Documento principal que apresenta o projeto, explica a metodologia e fornece instruções iniciais para começar o treinamento.

**ESTRUTURA_DO_PROJETO.md:** Este arquivo, que documenta a organização completa do projeto.

**LICENSE:** Licença Creative Commons BY-SA 4.0 que rege o uso e distribuição do projeto.

### 00-Recursos

Esta pasta contém materiais de apoio essenciais para compreender o contexto e estrutura dos dados.

**DDL_Schema_DecisionsCard.sql:** Script completo para criação do schema operacional no PostgreSQL, incluindo todas as tabelas, relacionamentos e constraints.

**Modelo_de_Dados.png:** Diagrama entidade-relacionamento visual que mostra a estrutura do modelo operacional e os relacionamentos entre as tabelas.

**Historia_do_Fluxo_de_Dados.md:** Documento que explica o contexto de negócio da DecisionsCard, o fluxo de dados e as regras de negócio aplicadas.

### 01-Treinamento-SQL

Módulo dedicado ao aprendizado prático de SQL através de exercícios progressivos.

#### Arquivos de Coordenação

**00_Instrucoes_e_Setup.md:** Guia completo para configuração do ambiente de desenvolvimento, incluindo instalação do DBeaver, configuração da conexão com PostgreSQL e metodologia de resolução dos exercícios.

**00_LISTA_DE_EXERCICIOS.md:** Índice completo de todos os exercícios disponíveis, organizados por categoria, com links diretos e descrição dos objetivos de aprendizado.

#### 01-Exercicios-Basicos

Exercícios numerados de 1 a 25, organizados em 5 categorias por nível de complexidade crescente.

**01-Consultas-Basicas (1-5):** Exercícios introdutórios focados em SELECT básico, filtros simples, ordenação e limitação de resultados.

**02-Joins-e-Relacionamentos (6-10):** Exercícios sobre diferentes tipos de JOIN, relacionamentos entre tabelas e consultas com múltiplas tabelas.

**03-Agregacoes-e-Agrupamentos (11-15):** Exercícios sobre funções de agregação, GROUP BY, HAVING e análises estatísticas básicas.

**04-Subconsultas-e-CTEs (16-20):** Exercícios avançados sobre subconsultas, EXISTS, CTEs (Common Table Expressions) e consultas correlacionadas.

**05-Analises-Avancadas (21-25):** Exercícios sobre Window Functions, análises de coorte, cálculos complexos e queries para dashboards executivos.

#### 02-Exercicios-Vida-Real

Exercícios numerados a partir de 100, baseados em demandas reais de negócio que um analista de dados enfrentaria no dia a dia.

Estes exercícios simulam solicitações típicas das áreas de negócio, como cálculo de KPIs, análises de performance, relatórios gerenciais e estudos de comportamento de clientes.

### 02-Treinamento-ETL-e-DataViz

Módulo avançado que cobre todo o ciclo de Business Intelligence, desde a modelagem dimensional até a criação de dashboards.

#### 00-Instrucoes-Gerais.md

Documento principal que apresenta o projeto de BI, explica a metodologia, define os objetivos e fornece o roadmap de implementação. Inclui orientações para escolha entre Qlik Sense e Power BI.

#### 01-Modelo-Dimensional

Documentação completa do modelo dimensional proposto.

**Dicionario-Dados-Dimensional.md:** Especificação técnica detalhada de todas as tabelas dimensão e fato, incluindo campos, tipos de dados, transformações aplicadas e relacionamentos.

#### 02-ETL

Processo de Extract, Transform, Load para converter dados operacionais em modelo dimensional.

**Instrucoes-ETL.md:** Guia completo de implementação do processo ETL, incluindo estratégias, ordem de execução, tratamento de erros e validações.

**Scripts-SQL/:** Coleção de scripts SQL para criação e carga das tabelas dimensionais e fato, organizados em ordem de execução.

#### 03-Qlik-Sense

Implementação específica para a plataforma Qlik Sense.

**Instrucoes-Qlik.md:** Guia detalhado para implementação no Qlik Sense, incluindo configuração de conexões, scripts de transformação, criação de KPIs e desenvolvimento de dashboards.

#### 04-Power-BI

Implementação específica para a plataforma Power BI.

**Instrucoes-PowerBI.md:** Guia detalhado para implementação no Power BI, incluindo queries M, medidas DAX, configuração de relacionamentos e criação de relatórios.

#### 05-Dashboard-Requirements

Especificações detalhadas dos dashboards a serem implementados.

**KPIs-Definidos.md:** Documentação completa de todos os KPIs, métricas e visualizações organizados por área de análise (Clientes, Vendas, Parcelas), incluindo fórmulas, formatos e contexto de negócio.

## Fluxo de Aprendizado

### Fase 1: Fundamentos (00-Recursos + 01-Treinamento-SQL)

1. Estude o contexto de negócio na pasta 00-Recursos
2. Configure o ambiente seguindo as instruções
3. Complete os exercícios básicos de SQL (1-25) em ordem
4. Resolva os exercícios da vida real (100+) para aplicar conhecimentos

### Fase 2: Business Intelligence (02-Treinamento-ETL-e-DataViz)

1. Estude o modelo dimensional proposto
2. Escolha sua plataforma de BI (Qlik Sense ou Power BI)
3. Implemente o processo ETL
4. Desenvolva os dashboards conforme especificações
5. Valide e teste todas as funcionalidades

## Metodologia de Commits

### Estrutura Recomendada

- **Exercícios SQL:** Um commit por exercício resolvido
- **ETL:** Commits por etapa (criação de tabelas, carga de dimensões, etc.)
- **Dashboards:** Commits por pasta/área de análise implementada

### Padrão de Mensagens

```
feat: resolve exercício X - [descrição breve]
feat: implementa DimCliente no modelo dimensional
feat: cria dashboard de análise de vendas
fix: corrige validação de dados na FatoVendas
docs: atualiza documentação do processo ETL
```

## Recursos de Apoio

### Validação de Progresso

Cada módulo inclui mecanismos de validação:
- **SQL:** Critérios de avaliação em cada exercício
- **ETL:** Scripts de validação de dados
- **Dashboards:** Checklist de funcionalidades

### Documentação Técnica

Todos os componentes incluem documentação técnica detalhada para facilitar a implementação e manutenção.

### Flexibilidade de Implementação

O projeto suporta diferentes abordagens e ferramentas, permitindo adaptação conforme o ambiente e preferências do usuário.

## Próximos Passos

1. **Inicie pela leitura do README.md**
2. **Estude os recursos na pasta 00-Recursos**
3. **Configure seu ambiente de desenvolvimento**
4. **Comece os exercícios SQL básicos**
5. **Avance gradualmente para exercícios mais complexos**
6. **Implemente o projeto de BI completo**

Este projeto foi desenvolvido para proporcionar uma experiência de aprendizado completa e prática em análise de dados e Business Intelligence.
