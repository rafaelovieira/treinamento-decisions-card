# Instruções para o Treinamento de ETL e DataViz

Bem-vindo à etapa final do treinamento! 🎉

## 🎯 Objetivo

Nesta fase, você aplicará seu conhecimento do modelo de dados operacional da DecisionsCard para criar um sistema completo de Business Intelligence. O foco está em **aprender conceitos** e **aplicar boas práticas** de modelagem dimensional, deixando a implementação técnica como seu desafio de aprendizado.

### O que você vai desenvolver:

1. **Modelo Dimensional** seguindo padrões de Star Schema
2. **Processo de ETL** conceitual com transformações de dados
3. **Dashboards interativos** com KPIs de negócio
4. **Implementação prática** na plataforma de sua escolha

## 📋 Pré-requisitos

- Ter completado pelo menos 80% dos exercícios de SQL
- Compreender o fluxo de dados da DecisionsCard ([história na pasta 00-Recursos](../00-Recursos/Historia_do_Fluxo_de_Dados.md))
- Ter acesso a uma ferramenta de BI (Power BI ou Qlik Sense)
- Conhecimento básico de conceitos de Data Warehouse

## 🗺️ Roadmap do Projeto

### Fase 1: Fundamentos Conceituais (25% do tempo)
- Estude os [conceitos de modelagem dimensional](./03-Modelagem-Dimensional/)
- Compreenda os [princípios de ETL](./02-Conceitos-ETL/)
- Analise os requisitos de negócio definidos

### Fase 2: Escolha da Plataforma (10% do tempo)
- **Qlik Sense:** Consulte as [orientações específicas](./04-Qlik-Sense/)
- **Power BI:** Consulte as [orientações específicas](./05-Power-BI/)

### Fase 3: Implementação do Modelo (40% do tempo)
- Crie as dimensões com as transformações conceituais
- Implemente as tabelas fato seguindo o modelo estrela
- Aplique as regras de negócio definidas

### Fase 4: Desenvolvimento dos Dashboards (25% do tempo)
- Implemente os [KPIs definidos](./06-Dashboard-Requirements/)
- Crie as visualizações por área de análise
- Teste e valide as funcionalidades

## 🛠️ Abordagem Pedagógica

### Aprendizado Baseado em Conceitos

**Não fornecemos código pronto.** Em vez disso, oferecemos:
- **Conceitos teóricos** de modelagem dimensional
- **Orientações sobre transformações** sem implementação específica
- **Dicas de funções e métodos** aplicáveis a ambas as plataformas
- **Boas práticas** de mercado

### Metodologia de Descoberta

Você será desafiado a:
- **Pesquisar** as melhores formas de implementar cada transformação
- **Experimentar** diferentes abordagens na sua plataforma
- **Validar** seus resultados através de testes
- **Documentar** suas escolhas e aprendizados

## 🎨 Plataformas Suportadas

### Qlik Sense - Abordagem QVD
O Qlik Sense permite separar claramente os processos de ETL através de arquivos QVD (Qlik View Data), que funcionam como uma camada intermediária otimizada.

**Fluxo conceitual:**
1. **Extração:** Conectar às tabelas operacionais
2. **Transformação:** Aplicar regras de negócio e salvar em QVDs
3. **Carga:** Carregar QVDs no modelo dimensional do aplicativo

### Power BI - Abordagem Integrada
O Power BI oferece múltiplas estratégias para ETL, desde Power Query até Dataflows, permitindo flexibilidade na implementação.

**Opções conceituais:**
1. **Power Query:** Transformações diretas na importação
2. **Dataflows:** ETL centralizado e reutilizável
3. **DirectQuery:** Transformações em tempo real
4. **Modelo Composto:** Combinação de abordagens

## 📊 Modelo Dimensional - Visão Conceitual

### Estrutura Star Schema

O modelo seguirá o padrão **Star Schema** com uma tabela fato central conectada a múltiplas dimensões.

#### Dimensões Conceituais
- **DimCliente:** Dados dos clientes com transformações de padronização
- **DimLoja:** Informações das redes parceiras
- **DimUsuario:** Dados dos usuários do sistema
- **DimTempo:** Dimensão temporal para análises
- **DimFormaPagamento:** Métodos de pagamento

#### Fatos Conceituais
- **FatoVendas:** Transações principais com métricas agregadas
- **FatoParcelas:** Detalhamento das parcelas e cobrança

### Princípios de Design

**Surrogate Keys:** Utilize chaves substitutas para otimização e flexibilidade.

**Slowly Changing Dimensions:** Considere como tratar mudanças históricas nas dimensões.

**Granularidade:** Defina o nível de detalhe apropriado para cada fato.

**Desnormalização:** Aplique desnormalização controlada para performance.

## 🔄 Conceitos de ETL

### Extract (Extração)
- Conecte-se às tabelas operacionais do schema `decisionscard`
- Identifique as fontes de dados necessárias
- Considere estratégias de extração incremental vs completa

### Transform (Transformação)
Aplique as transformações conceituais definidas:
- **Padronização de dados:** Formatos consistentes
- **Limpeza de dados:** Tratamento de nulos e inconsistências
- **Enriquecimento:** Adição de campos calculados
- **Agregação:** Sumarização quando apropriada

### Load (Carga)
- Implemente a carga seguindo dependências (dimensões antes de fatos)
- Considere estratégias de validação de dados
- Planeje para atualizações incrementais

## 🎯 Transformações Requeridas

### DimCliente
**Transformações conceituais a implementar:**
- Criar campo concatenando "first_name" e "last_name"
- Converter campo "email" para minúsculo
- Traduzir códigos de gênero (M→Masculino, F→Feminino, O→Outros)
- Padronizar formatos de data

**Dicas de implementação:**
- Use funções de concatenação da sua plataforma
- Aplique funções de conversão de texto (LOWER, UPPER)
- Utilize estruturas condicionais (IF, CASE) para traduções
- Considere funções de formatação de data

### DimLoja
**Transformações conceituais a implementar:**
- Padronizar nomes comerciais para apresentação
- Converter nomes de cidades para maiúsculo
- Criar campos derivados se necessário

**Dicas de implementação:**
- Use funções de formatação de texto
- Aplique funções de capitalização
- Considere padronização de endereços

### DimUsuario
**Transformações conceituais a implementar:**
- Alterar domínio de email (@decisions para @primeiroprojeto)
- Padronizar nomes para apresentação
- Tratar campos opcionais

**Dicas de implementação:**
- Use funções de substituição de texto (REPLACE, SUBSTITUTE)
- Aplique funções de formatação de nomes
- Trate valores nulos adequadamente

### FatoVendas
**Transformações conceituais a implementar:**
- Tratar valores nulos em campos monetários
- Criar campo soma de valor principal + juros
- Converter timestamps para formatos apropriados
- Alterar campo "ativo" para exibir Sim ou Não
- Estabelecer relacionamentos com dimensões

**Dicas de implementação:**
- Use funções de tratamento de nulos (ISNULL, COALESCE)
- Aplique operações matemáticas para campos calculados
- Utilize funções de conversão de data/hora
- Implemente lógica condicional para campos booleanos

### FatoParcelas
**Transformações conceituais similares:**
- Aplicar tratamentos de valores nulos
- Calcular campos derivados
- Converter formatos de data
- Estabelecer relacionamentos apropriados

## 💡 Dicas de Sucesso

### Planejamento
**Comece pequeno:** Implemente uma dimensão simples primeiro, depois adicione complexidade gradualmente.

**Documente suas escolhas:** Mantenha registro das decisões de design e transformações aplicadas.

**Teste incrementalmente:** Valide cada transformação antes de prosseguir para a próxima.

### Validação
**Confira os totais:** Garanta que os valores agregados batem entre origem e destino.

**Teste relacionamentos:** Verifique se todas as chaves estrangeiras têm correspondência.

**Valide transformações:** Confirme se as regras de negócio foram aplicadas corretamente.

### Performance
**Otimize consultas:** Use índices e estruturas apropriadas para sua plataforma.

**Considere volumes:** Planeje para crescimento futuro dos dados.

**Monitore recursos:** Acompanhe uso de memória e tempo de processamento.

## 🆘 Recursos de Apoio

### Documentação de Referência
- [Conceitos de ETL](./02-Conceitos-ETL/)
- [Modelagem Dimensional](./03-Modelagem-Dimensional/)
- [Orientações Qlik Sense](./04-Qlik-Sense/)
- [Orientações Power BI](./05-Power-BI/)
- [Requisitos de Dashboard](./06-Dashboard-Requirements/)

### Fontes Externas
- Documentação oficial da sua plataforma escolhida
- Comunidades online (Qlik Community, Power BI Community)
- Livros sobre modelagem dimensional (Kimball, Inmon)
- Cursos online sobre ETL e Data Warehousing

### Validação de Aprendizado
- Compare seus resultados com os KPIs esperados
- Teste a usabilidade dos dashboards com usuários fictícios
- Documente os desafios encontrados e soluções aplicadas
- Prepare uma apresentação do seu projeto final

## 🚀 Próximos Passos

1. **Estude os conceitos** nas pastas de documentação
2. **Escolha sua plataforma** (Qlik Sense ou Power BI)
3. **Planeje sua implementação** seguindo as orientações
4. **Implemente incrementalmente** validando cada etapa
5. **Crie os dashboards** conforme requisitos
6. **Teste e refine** sua solução
7. **Documente** seu aprendizado e decisões

## 📋 Entregáveis Esperados

Ao final do projeto, você deve ter:

1. **Modelo dimensional funcional** com todas as transformações aplicadas
2. **Processo de ETL documentado** com suas escolhas técnicas
3. **Dashboards completos** atendendo aos requisitos de negócio
4. **Documentação técnica** explicando sua implementação
5. **Reflexão sobre aprendizado** com desafios e soluções encontradas

**Lembre-se:** O objetivo é aprender fazendo. Não existe uma única resposta certa, mas existem boas práticas que devem ser seguidas!

Boa sorte em sua jornada de aprendizado! 🍀
