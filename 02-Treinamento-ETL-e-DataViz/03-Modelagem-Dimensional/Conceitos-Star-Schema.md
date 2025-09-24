# Conceitos de Modelagem Dimensional - Star Schema

## Introdução

A modelagem dimensional é uma técnica de design de banco de dados otimizada para consultas analíticas e relatórios de Business Intelligence. Neste projeto, você aplicará os conceitos de Star Schema para transformar o modelo operacional normalizado da DecisionsCard em um modelo analítico eficiente.

## Fundamentos da Modelagem Dimensional

### O que é Modelagem Dimensional?

A modelagem dimensional é uma abordagem de design que organiza dados em estruturas simples e intuitivas, facilitando consultas analíticas e navegação pelos dados. Diferente da modelagem relacional tradicional, que prioriza a normalização, a modelagem dimensional prioriza a performance e usabilidade para análises.

### Benefícios da Modelagem Dimensional

**Performance:** Consultas analíticas executam mais rapidamente devido à estrutura desnormalizada.

**Simplicidade:** Estrutura intuitiva que facilita o entendimento por usuários de negócio.

**Flexibilidade:** Permite análises multidimensionais e drill-down/drill-up.

**Escalabilidade:** Suporta grandes volumes de dados com performance consistente.

**Histórico:** Preserva dados históricos para análises temporais.

## Componentes do Star Schema

### Tabelas Fato (Fact Tables)

As tabelas fato são o coração do modelo dimensional, contendo as métricas quantitativas do negócio.

#### Características das Tabelas Fato
- **Métricas numéricas:** Valores que podem ser somados, contados ou calculados
- **Chaves estrangeiras:** Referências para as tabelas dimensão
- **Granularidade:** Nível de detalhe dos dados (transação, dia, mês)
- **Aditividade:** Capacidade de somar métricas através de dimensões

#### Tipos de Métricas
**Aditivas:** Podem ser somadas através de todas as dimensões (vendas, quantidade)

**Semi-aditivas:** Podem ser somadas através de algumas dimensões (saldos, estoques)

**Não-aditivas:** Não podem ser somadas (percentuais, taxas, médias)

### Tabelas Dimensão (Dimension Tables)

As tabelas dimensão contêm os atributos descritivos que fornecem contexto para as métricas das tabelas fato.

#### Características das Tabelas Dimensão
- **Atributos descritivos:** Textos, datas, códigos que descrevem o negócio
- **Chave primária:** Surrogate key para relacionamento com fatos
- **Desnormalização:** Múltiplos níveis hierárquicos em uma única tabela
- **Slowly Changing Dimensions:** Tratamento de mudanças históricas

#### Tipos de Atributos
**Identificadores:** Códigos únicos e chaves naturais

**Descritivos:** Nomes, descrições, categorias

**Hierárquicos:** Atributos que formam hierarquias naturais

**Calculados:** Campos derivados de outros atributos

## Projeto DecisionsCard - Modelo Conceitual

### Análise do Negócio

A DecisionsCard é uma plataforma de cartão de crédito que conecta clientes, lojas parceiras e usuários do sistema. O modelo dimensional deve suportar análises sobre:

- **Performance de vendas** por período, loja, cliente
- **Comportamento de clientes** e padrões de compra
- **Gestão de parcelas** e cobrança
- **Análise de usuários** e operações do sistema

### Identificação de Processos de Negócio

#### Processo Principal: Vendas
- **Granularidade:** Uma linha por venda
- **Métricas:** Valor principal, valor juros, valor total, quantidade parcelas
- **Dimensões:** Cliente, Loja, Usuário, Tempo, Forma Pagamento

#### Processo Secundário: Parcelas
- **Granularidade:** Uma linha por parcela
- **Métricas:** Valor principal, valor juros, valor total
- **Dimensões:** Cliente, Tempo Vencimento, Tempo Cobrança

### Dimensões Conceituais

#### DimCliente - Dimensão de Clientes
**Propósito:** Análise por perfil e comportamento de clientes

**Atributos principais:**
- Identificação (ID, nome completo)
- Dados pessoais (gênero, data nascimento)
- Contato (email padronizado)
- Origem comercial
- Status da conta

**Transformações conceituais:**
- Concatenar primeiro e último nome
- Padronizar email em minúsculo
- Traduzir códigos de gênero para texto legível
- Calcular idade a partir da data de nascimento

**Hierarquias naturais:**
- Origem Comercial → Cliente
- Gênero → Cliente
- Faixa Etária → Cliente

#### DimLoja - Dimensão de Lojas/Redes
**Propósito:** Análise por performance de lojas parceiras

**Atributos principais:**
- Identificação (ID, nome fantasia, razão social)
- Localização (cidade, UF)
- Data de cadastro

**Transformações conceituais:**
- Padronizar nomes comerciais
- Converter cidades para maiúsculo
- Criar campos de região se necessário

**Hierarquias naturais:**
- UF → Cidade → Loja
- Região → UF → Cidade → Loja

#### DimUsuario - Dimensão de Usuários
**Propósito:** Análise por operador/usuário do sistema

**Atributos principais:**
- Identificação (ID, nome)
- Contato (email corporativo)
- Status ativo
- Data de cadastro

**Transformações conceituais:**
- Alterar domínio de email corporativo
- Padronizar nomes para apresentação
- Tratar status como texto legível

#### DimTempo - Dimensão Temporal
**Propósito:** Análise temporal e sazonalidade

**Atributos principais:**
- Data completa
- Componentes (ano, mês, dia, trimestre, semestre)
- Nomes (nome do mês, dia da semana)
- Indicadores (fim de semana, feriado)

**Hierarquias naturais:**
- Ano → Semestre → Trimestre → Mês → Data
- Ano → Semana → Data

#### DimFormaPagamento - Dimensão de Pagamento
**Propósito:** Análise por método de pagamento

**Atributos principais:**
- Código da forma
- Descrição
- Tipo de pagamento (à vista, parcelado)
- Características específicas

### Tabelas Fato Conceituais

#### FatoVendas - Fato Principal
**Granularidade:** Uma linha por venda realizada

**Métricas:**
- Valor principal (valor base da venda)
- Valor juros (juros aplicados)
- Valor total (principal + juros)
- Quantidade de parcelas

**Dimensões relacionadas:**
- DimCliente (quem comprou)
- DimLoja (onde comprou)
- DimUsuario (quem processou)
- DimTempo (quando vendeu)
- DimFormaPagamento (como pagou)

**Atributos degenerados:**
- ID da venda (chave natural)
- Status ativo (Sim/Não)
- Data/hora específica da venda

#### FatoParcelas - Fato Secundário
**Granularidade:** Uma linha por parcela de venda

**Métricas:**
- Valor principal da parcela
- Valor juros da parcela
- Valor total da parcela

**Dimensões relacionadas:**
- DimCliente (cliente da parcela)
- DimTempo Vencimento (quando vence)
- DimTempo Cobrança (competência de cobrança)
- Relacionamento com FatoVendas

**Atributos degenerados:**
- ID da parcela
- Número da parcela
- Status de pagamento

## Conceitos Avançados

### Surrogate Keys

#### O que são Surrogate Keys?
Chaves artificiais geradas pelo sistema de Data Warehouse, independentes das chaves naturais do sistema operacional.

#### Benefícios
- **Performance:** Chaves numéricas inteiras são mais eficientes
- **Flexibilidade:** Permitem mudanças no sistema operacional
- **Histórico:** Facilitam o controle de versões históricas
- **Integração:** Simplificam integração de múltiplas fontes

#### Implementação Conceitual
- Use sequências numéricas simples (1, 2, 3...)
- Mantenha mapeamento com chaves naturais
- Considere chaves especiais para casos especiais (-1 para "Não Informado")

### Slowly Changing Dimensions (SCD)

#### Tipo 1 - Sobrescrever
- **Conceito:** Substitui valor antigo pelo novo
- **Uso:** Correções de dados, informações que não precisam de histórico
- **Exemplo:** Correção de nome mal digitado

#### Tipo 2 - Versionar
- **Conceito:** Cria nova versão do registro mantendo histórico
- **Uso:** Mudanças que precisam preservar histórico
- **Exemplo:** Cliente muda de endereço

#### Tipo 3 - Adicionar Coluna
- **Conceito:** Adiciona coluna para valor anterior
- **Uso:** Mudanças pontuais com histórico limitado
- **Exemplo:** Reorganização de territórios de venda

### Tratamento de Dados Especiais

#### Valores Nulos e Desconhecidos
- **Estratégia:** Substitua por valores padrão significativos
- **Exemplos:** "Não Informado", "Não Aplicável", "Desconhecido"
- **Consistência:** Use padrões consistentes em todo o modelo

#### Registros Órfãos
- **Problema:** Fatos sem dimensão correspondente
- **Solução:** Crie registros especiais nas dimensões
- **Exemplo:** Cliente "Não Identificado" para vendas sem cliente

#### Dados Futuros
- **Problema:** Datas futuras em dados históricos
- **Solução:** Valide e trate conforme regra de negócio
- **Exemplo:** Vendas com data futura podem ser erro de sistema

## Boas Práticas de Design

### Nomenclatura e Padrões

#### Convenções de Nomes
- **Dimensões:** Prefixo "Dim" (DimCliente, DimTempo)
- **Fatos:** Prefixo "Fato" (FatoVendas, FatoParcelas)
- **Chaves:** Padrão "sk_" para surrogate keys
- **Campos:** Nomes descritivos e consistentes

#### Estrutura de Campos
- **Surrogate Keys:** Sempre como chave primária
- **Chaves Naturais:** Mantidas para rastreabilidade
- **Datas:** Formato consistente e timezone apropriado
- **Textos:** Padronização de case e caracteres especiais

### Performance e Otimização

#### Índices
- **Surrogate Keys:** Índices primários automáticos
- **Chaves Estrangeiras:** Índices para joins eficientes
- **Campos de Filtro:** Índices em campos frequentemente filtrados
- **Campos de Ordenação:** Índices para ordenações comuns

#### Particionamento
- **Por Data:** Particione tabelas fato por período
- **Por Dimensão:** Considere particionamento por dimensões grandes
- **Estratégia:** Alinhe com padrões de consulta

#### Agregações
- **Pré-cálculo:** Considere tabelas agregadas para consultas frequentes
- **Níveis:** Agregações por dia, mês, ano conforme necessário
- **Manutenção:** Planeje atualização das agregações

### Validação e Qualidade

#### Validações de Design
- **Relacionamentos:** Verifique integridade referencial
- **Granularidade:** Confirme nível de detalhe apropriado
- **Completude:** Garanta que todas as métricas importantes estão capturadas
- **Usabilidade:** Teste com usuários finais

#### Validações de Dados
- **Contagens:** Compare totais entre origem e destino
- **Valores:** Valide ranges e formatos de dados
- **Relacionamentos:** Teste joins e navegação
- **Performance:** Monitore tempo de consultas

## Implementação Conceitual

### Estratégia de Desenvolvimento

#### Abordagem Incremental
1. **Comece simples:** Implemente uma dimensão e um fato básicos
2. **Valide:** Teste e confirme funcionamento antes de expandir
3. **Expanda:** Adicione complexidade gradualmente
4. **Refine:** Otimize performance e usabilidade

#### Priorização
1. **DimTempo:** Fundamental para análises temporais
2. **DimCliente:** Dimensão principal do negócio
3. **FatoVendas:** Processo principal de negócio
4. **Outras dimensões:** Conforme importância
5. **Fatos secundários:** Após validação do modelo principal

### Considerações por Plataforma

#### Qlik Sense
- **Associações automáticas:** Aproveite capacidade de auto-join
- **QVDs:** Use para otimização de performance
- **Calendário:** Implemente dimensão tempo robusta
- **Set Analysis:** Planeje para análises complexas

#### Power BI
- **Relacionamentos:** Configure explicitamente no modelo
- **DAX:** Planeje medidas calculadas
- **Hierarquias:** Implemente para navegação drill-down
- **Performance:** Considere DirectQuery vs Import

## Próximos Passos

### Planejamento
1. **Analise requisitos** de negócio específicos
2. **Mapeie dados fonte** para estrutura dimensional
3. **Defina transformações** necessárias
4. **Planeje implementação** incremental

### Implementação
1. **Escolha sua plataforma** (Qlik Sense ou Power BI)
2. **Implemente DimTempo** como base
3. **Crie dimensões principais** com transformações
4. **Implemente tabelas fato** com relacionamentos
5. **Valide e teste** cada etapa

### Validação
1. **Teste relacionamentos** entre tabelas
2. **Valide transformações** aplicadas
3. **Confirme performance** de consultas
4. **Teste usabilidade** com cenários reais

Lembre-se: a modelagem dimensional é um processo iterativo. Comece com o essencial e refine conforme aprende mais sobre os dados e necessidades do negócio.
