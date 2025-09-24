# Fundamentos de ETL - Extract, Transform, Load

## Introdução

ETL (Extract, Transform, Load) é o processo fundamental para mover dados de sistemas operacionais para ambientes analíticos. Neste projeto, você aplicará conceitos de ETL para transformar os dados operacionais da DecisionsCard em um modelo dimensional otimizado para análises de negócio.

## Conceitos Fundamentais

### O que é ETL?

ETL é um processo de integração de dados que envolve três etapas principais:

**Extract (Extração):** Coleta de dados de uma ou múltiplas fontes de dados operacionais.

**Transform (Transformação):** Aplicação de regras de negócio, limpeza, padronização e enriquecimento dos dados.

**Load (Carga):** Inserção dos dados transformados no sistema de destino (Data Warehouse, Data Mart).

### Por que ETL é Importante?

**Qualidade dos Dados:** Garante que os dados analíticos sejam consistentes, limpos e confiáveis.

**Performance:** Otimiza a estrutura de dados para consultas analíticas rápidas.

**Integração:** Combina dados de múltiplas fontes em uma visão unificada.

**Histórico:** Preserva dados históricos para análises temporais.

## Estratégias de ETL

### Carga Completa vs Incremental

#### Carga Completa (Full Load)
- **Conceito:** Reprocessa todos os dados a cada execução
- **Vantagens:** Simplicidade, garantia de consistência
- **Desvantagens:** Tempo de processamento, uso de recursos
- **Quando usar:** Volumes pequenos, dados que mudam frequentemente

#### Carga Incremental (Delta Load)
- **Conceito:** Processa apenas dados novos ou modificados
- **Vantagens:** Performance, eficiência de recursos
- **Desvantagens:** Complexidade, controle de mudanças
- **Quando usar:** Volumes grandes, dados com baixa frequência de mudança

### Estratégias de Identificação de Mudanças

#### Timestamp-based
- Use campos de data/hora de modificação
- Identifique registros alterados desde a última execução
- Simples de implementar quando disponível

#### Change Data Capture (CDC)
- Monitore logs de transação do banco
- Capture mudanças em tempo real
- Mais complexo, mas muito eficiente

#### Snapshot Comparison
- Compare estado atual com snapshot anterior
- Identifique diferenças entre versões
- Útil quando não há campos de controle

## Processo Extract (Extração)

### Conexão com Fontes de Dados

#### PostgreSQL - DecisionsCard
Para este projeto, você extrairá dados do schema `decisionscard` que contém:
- Tabelas operacionais normalizadas
- Relacionamentos bem definidos
- Dados transacionais em tempo real

#### Considerações de Extração
**Performance:** Evite consultas que impactem o sistema operacional durante horários de pico.

**Segurança:** Use credenciais apropriadas com permissões mínimas necessárias.

**Conectividade:** Considere timeouts e reconexões automáticas.

**Logs:** Mantenha registro das extrações para auditoria.

### Identificação de Tabelas Fonte

Para o projeto DecisionsCard, as principais tabelas fonte são:

#### Tabelas de Dimensão
- `t_cliente` → DimCliente
- `t_rede` → DimLoja  
- `t_usuario` → DimUsuario
- `t_forma_pagamento` → DimFormaPagamento

#### Tabelas de Fato
- `t_venda` → FatoVendas
- `t_parcela_venda` → FatoParcelas

#### Tabelas de Apoio
- `t_dominio` → Traduções e códigos
- Outras tabelas conforme necessário

## Processo Transform (Transformação)

### Tipos de Transformações

#### Limpeza de Dados
**Tratamento de Nulos:** Substitua valores nulos por padrões apropriados ou sinalize como "Não Informado".

**Padronização:** Converta dados para formatos consistentes (datas, textos, números).

**Validação:** Verifique se os dados atendem às regras de negócio definidas.

**Deduplicação:** Remova ou trate registros duplicados.

#### Transformações de Formato
**Conversão de Tipos:** Ajuste tipos de dados conforme necessário (texto para número, string para data).

**Formatação de Texto:** Aplique maiúscula, minúscula, capitalização conforme padrões.

**Formatação de Datas:** Padronize formatos de data e hora.

**Formatação Numérica:** Ajuste precisão decimal e formatos monetários.

#### Enriquecimento de Dados
**Campos Calculados:** Crie novos campos baseados em cálculos ou lógica de negócio.

**Concatenação:** Combine múltiplos campos em um único campo.

**Lookup/Join:** Enriqueça dados com informações de outras tabelas.

**Derivação:** Crie campos derivados (idade a partir de data nascimento).

#### Agregação
**Sumarização:** Calcule totais, médias, contagens por agrupamentos.

**Rollup:** Crie diferentes níveis de agregação (dia, mês, ano).

**Snapshot:** Capture estado dos dados em pontos específicos no tempo.

### Transformações Específicas do Projeto

#### DimCliente - Transformações Requeridas

**Nome Completo:**
- Concatene campos `first_name` e `last_name`
- Trate casos onde um dos campos é nulo
- Considere espaçamento adequado

**Email Padronizado:**
- Converta todo o campo email para minúsculo
- Valide formato de email se necessário
- Trate emails inválidos ou nulos

**Gênero Traduzido:**
- Traduza códigos: M → Masculino, F → Feminino, O → Outros
- Considere casos não mapeados
- Use estrutura condicional apropriada

**Datas Padronizadas:**
- Garanta formato consistente para datas
- Trate datas inválidas ou futuras
- Considere fuso horário se aplicável

#### DimLoja - Transformações Requeridas

**Nome Comercial:**
- Padronize nomes fantasia para apresentação
- Aplique capitalização adequada
- Trate abreviações e caracteres especiais

**Localização:**
- Converta nomes de cidades para maiúsculo
- Padronize códigos de UF
- Valide dados geográficos

#### DimUsuario - Transformações Requeridas

**Email Corporativo:**
- Substitua domínio @decisions por @primeiroprojeto
- Mantenha estrutura do email
- Valide resultado da transformação

**Nome de Usuário:**
- Padronize formato de apresentação
- Trate caracteres especiais
- Considere unicidade

#### FatoVendas - Transformações Requeridas

**Valores Monetários:**
- Trate valores nulos como zero ou valor padrão
- Calcule valor total (principal + juros)
- Valide consistência de valores

**Status Legível:**
- Converta flags S/N para Sim/Não
- Use descrições mais amigáveis
- Mantenha consistência

**Relacionamentos:**
- Estabeleça chaves estrangeiras para dimensões
- Valide integridade referencial
- Trate registros órfãos

## Processo Load (Carga)

### Estratégias de Carga

#### Ordem de Carga
1. **Dimensões primeiro:** Carregue todas as dimensões antes das tabelas fato
2. **Dependências:** Respeite dependências entre dimensões
3. **Validação:** Valide cada etapa antes de prosseguir

#### Tratamento de Erros
**Logs Detalhados:** Registre todas as operações e erros encontrados.

**Rollback:** Tenha estratégia para reverter cargas com problemas.

**Notificação:** Implemente alertas para falhas críticas.

**Recuperação:** Planeje como retomar cargas interrompidas.

### Validação de Dados

#### Validações de Integridade
- Verifique se todas as chaves estrangeiras têm correspondência
- Valide se contagens de registros estão consistentes
- Confirme se valores agregados batem com a origem

#### Validações de Negócio
- Teste se as transformações foram aplicadas corretamente
- Verifique se os dados fazem sentido do ponto de vista de negócio
- Valide se os relacionamentos estão funcionando

#### Validações de Performance
- Monitore tempo de execução de cada etapa
- Verifique uso de recursos (CPU, memória, I/O)
- Teste performance de consultas no modelo final

## Boas Práticas de ETL

### Design e Arquitetura

**Modularidade:** Divida o processo em etapas independentes e reutilizáveis.

**Idempotência:** Garanta que executar o processo múltiplas vezes produza o mesmo resultado.

**Escalabilidade:** Projete para crescimento futuro de volume de dados.

**Manutenibilidade:** Use código limpo e documentação adequada.

### Monitoramento e Controle

**Logs Estruturados:** Use formato consistente para logs e métricas.

**Alertas Proativos:** Configure alertas para situações anômalas.

**Métricas de Qualidade:** Monitore indicadores de qualidade dos dados.

**Auditoria:** Mantenha trilha de auditoria para todas as transformações.

### Segurança e Compliance

**Dados Sensíveis:** Trate adequadamente informações pessoais e sensíveis.

**Criptografia:** Use criptografia para dados em trânsito e em repouso.

**Acesso Controlado:** Implemente controles de acesso apropriados.

**Retenção:** Defina políticas de retenção de dados.

## Ferramentas e Tecnologias

### Qlik Sense - Abordagem QVD

#### Conceitos QVD
**QVD (Qlik View Data):** Formato nativo otimizado para leitura rápida.

**Camadas de ETL:** Use QVDs como camada intermediária entre fonte e aplicação.

**Incrementalidade:** QVDs facilitam cargas incrementais eficientes.

#### Estratégia Recomendada
1. **Extract:** Conecte às tabelas fonte e salve em QVDs "raw"
2. **Transform:** Carregue QVDs raw, aplique transformações e salve QVDs "clean"
3. **Load:** Carregue QVDs clean no modelo dimensional da aplicação

### Power BI - Múltiplas Abordagens

#### Power Query
- Transformações durante a importação
- Interface visual para ETL
- Linguagem M para transformações avançadas

#### Dataflows
- ETL centralizado e reutilizável
- Compartilhamento entre múltiplos relatórios
- Armazenamento em Azure Data Lake

#### DirectQuery
- Transformações em tempo real
- Menor latência de dados
- Maior carga no sistema fonte

#### Modelo Composto
- Combinação de importação e DirectQuery
- Flexibilidade para diferentes necessidades
- Otimização de performance

## Desafios Comuns e Soluções

### Problemas de Performance
**Sintoma:** ETL muito lento
**Soluções:** Otimize consultas, use índices, processe em paralelo, considere hardware

### Problemas de Qualidade
**Sintoma:** Dados inconsistentes ou incorretos
**Soluções:** Implemente validações, melhore limpeza, documente regras de negócio

### Problemas de Escalabilidade
**Sintoma:** Processo não suporta crescimento de dados
**Soluções:** Redesenhe arquitetura, use processamento distribuído, otimize algoritmos

### Problemas de Manutenção
**Sintoma:** Difícil de modificar ou debugar
**Soluções:** Melhore documentação, modularize código, implemente testes

## Próximos Passos

1. **Estude sua plataforma escolhida** (Qlik Sense ou Power BI)
2. **Planeje sua arquitetura de ETL** considerando os conceitos apresentados
3. **Implemente incrementalmente** começando com uma dimensão simples
4. **Valide cada etapa** antes de prosseguir
5. **Documente suas escolhas** e aprendizados
6. **Otimize performance** conforme necessário

Lembre-se: ETL é tanto arte quanto ciência. Use estes conceitos como base, mas adapte às necessidades específicas do seu projeto e ambiente.
