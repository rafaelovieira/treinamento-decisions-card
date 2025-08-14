# Estrutura do Projeto - DecisionsCard Training

## 📁 Organização dos Arquivos

```
decisionscard-training/
│
├── README.md                           # Página principal do treinamento
├── .gitignore                          # Arquivos a serem ignorados pelo Git
├── ESTRUTURA_DO_PROJETO.md            # Este arquivo (resumo da estrutura)
│
├── 00-Recursos/                        # 📚 Materiais de apoio e referência
│   ├── DDL_Schema_DecisionsCard.sql    # Script completo do banco de dados
│   ├── Historia_do_Fluxo_de_Dados.md  # Contexto de negócio e fluxo dos dados
│   └── Modelo_de_Dados.png             # Diagrama ER do modelo operacional
│
├── 01-Treinamento-SQL/                 # 🔍 Exercícios práticos de SQL
│   ├── 00_Instrucoes_e_Setup.md       # Como configurar DBeaver e metodologia
│   ├── 00_LISTA_DE_EXERCICIOS.md      # Índice com todos os exercícios
│   ├── Exercicio_01.md                # Listagem básica de clientes
│   ├── Exercicio_02.md                # Filtros simples em redes parceiras
│   ├── Exercicio_03.md                # Contagem de cartões ativos
│   ├── Exercicio_04.md                # Top 5 vendas por valor
│   ├── Exercicio_05.md                # Vendas do último mês
│   ├── Exercicio_06.md                # JOIN simples - clientes e cartões
│   ├── Exercicio_11.md                # Análise de vendas por rede (agregação)
│   └── [Espaço para mais exercícios]  # Estrutura pronta para expansão
│
└── 02-Treinamento-ETL-e-DataViz/       # 📊 Projeto final de BI
    ├── 0-Instrucoes.md                 # Roadmap e metodologia do projeto final
    ├── 1-Modelo-Dimensional-Proposto.png # Diagrama Star Schema sugerido
    └── 2-Desafio-Dashboard/
        └── Requisitos_Dashboard.md     # Especificações detalhadas do dashboard
```

## 🎯 Objetivos por Seção

### 00-Recursos
- **Propósito:** Material de consulta e referência
- **Uso:** Estudar antes de começar os exercícios
- **Conteúdo:** Contexto de negócio, modelo de dados, scripts

### 01-Treinamento-SQL  
- **Propósito:** Prática progressiva de consultas SQL
- **Metodologia:** Um exercício = um arquivo = um commit
- **Progressão:** Básico → Intermediário → Avançado
- **Total planejado:** 25 exercícios (7 criados como exemplo)

### 02-Treinamento-ETL-e-DataViz
- **Propósito:** Projeto final aplicando conhecimentos
- **Entregáveis:** Modelo dimensional + ETL + Dashboard
- **Ferramentas:** SQL/Python + Power BI/Qlik/Tableau

## 🚀 Como Usar Este Projeto

### Para Instrutores:
1. **Expandir exercícios:** Adicionar mais arquivos `Exercicio_XX.md`
2. **Criar gabaritos:** Adicionar arquivos `Gabarito_XX.sql` (opcional)
3. **Dados de exemplo:** Criar scripts de INSERT para popular as tabelas
4. **Validação:** Criar checklist de avaliação para cada fase

### Para Candidatos:
1. **Clonar repositório:** `git clone <URL>`
2. **Estudar contexto:** Ler `00-Recursos/Historia_do_Fluxo_de_Dados.md`
3. **Configurar ambiente:** Seguir `01-Treinamento-SQL/00_Instrucoes_e_Setup.md`
4. **Resolver exercícios:** Um por vez, com commits granulares
5. **Projeto final:** Implementar ETL e dashboard conforme requisitos

## 📈 Progressão Sugerida

### Semana 1: Fundamentos
- Leitura da história e modelo de dados
- Setup do ambiente (DBeaver)
- Exercícios 1-10 (consultas básicas e JOINs)

### Semana 2: Análises Intermediárias  
- Exercícios 11-20 (agregações, subconsultas, CTEs)
- Revisão e otimização de queries

### Semana 3: Análises Avançadas
- Exercícios 21-25 (window functions, análises complexas)
- Início do projeto de ETL

### Semana 4: Projeto Final
- Desenvolvimento do modelo dimensional
- Implementação do ETL
- Criação do dashboard

## 🔧 Extensões Futuras

### Exercícios SQL Adicionais:
- Window functions avançadas
- Análise de coortes
- Detecção de fraudes
- Otimização de performance
- Stored procedures

### Projetos Avançados:
- ETL em tempo real
- Machine Learning para credit scoring
- API de dados
- Data quality monitoring

## 📝 Notas de Implementação

- **Commits granulares:** Cada exercício resolvido = 1 commit
- **Documentação:** Todos os arquivos têm instruções claras
- **Escalabilidade:** Estrutura permite fácil adição de conteúdo
- **Flexibilidade:** Suporta diferentes ferramentas de BI
- **Realismo:** Baseado em cenários reais de cartão de crédito

---

**Status:** ✅ Estrutura base completa e pronta para uso
**Próximos passos:** Adicionar exercícios SQL restantes e dados de exemplo

