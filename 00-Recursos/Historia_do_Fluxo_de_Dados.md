# A Jornada do Cliente na DecisionsCard: Uma História Contada pelos Dados

Para entender profundamente nosso modelo de dados, é fundamental compreender a jornada do cliente e como cada interação é refletida em nosso banco de dados.

Esta é a história de **Ana**, uma jovem profissional que decide solicitar um cartão de crédito da DecisionsCard, e de como suas interações com a empresa são registradas e gerenciadas pelo nosso sistema.

---

## Capítulo 1: O Cadastro e a Análise de Crédito

Tudo começa quando Ana, interessada em um novo cartão, visita uma loja da **Rede Varejista X** (`t_rede`), uma parceira da DecisionsCard. Lá, um atendente (`t_usuario`) a auxilia no preenchimento da proposta.

### 1.1 Coleta de Dados
O atendente insere os dados de Ana no sistema, criando um novo registro na tabela `t_cliente`. São coletadas informações essenciais como nome, data de nascimento, e-mail, e também dados socioeconômicos:

- Sua escolaridade (`t_escolaridade`)
- Seu estado civil (`t_estado_civil`) 
- Sua profissão (`t_profissao`) e ocupação atual (`t_ocupacao`)
- Seu tipo de moradia (`t_moradia`)
- A `id_origem_comercial` é preenchida com o ID da Rede Varejista X, indicando onde o cadastro foi feito
- O `fl_status_analise` é marcado como 'P' (Pendente)

### 1.2 Análise e Aprovação
O sistema da DecisionsCard, possivelmente integrado a um motor de crédito, analisa o perfil de Ana. Com base em suas informações, a análise é concluída e o `fl_status_analise` em `t_cliente` é atualizado para 'A' (Aprovado). O `fl_status_conta` também é atualizado para 'A' (Ativa).

### 1.3 Emissão do Cartão
Com a conta aprovada, um cartão é gerado para Ana. Um novo registro é criado na tabela `t_cartao`, contendo:

- O número do cartão (`nu_cartao`), a data de emissão (`dt_emissao`) e o status 'A' (Ativo) em `fl_status_cartao`
- A `id_cliente` faz a ligação direta com o cadastro de Ana
- O `fl_titularidade` é marcado como 'T' (Titular)

---

## Capítulo 2: A Vida Financeira Ativa

Ana recebe seu cartão e começa a usá-lo em seu dia a dia.

### 2.1 Realizando uma Compra
Ana vai a um restaurante e paga a conta com seu cartão. Essa transação gera um registro na tabela `t_venda`:

- A venda é associada ao `id_cliente` de Ana e ao seu `id_cartao`
- A `id_rede` identifica o restaurante onde a compra foi feita
- O `id_forma_pagamento` indica se a compra foi à vista ou parcelada
- O `vl_venda` registra o valor total da transação
- O `fl_status_venda` é definido como 'A' (Ativa)

### 2.2 Geração das Parcelas
Como a compra foi parcelada em 3 vezes, o sistema automaticamente cria três registros na tabela `t_parcela_venda`, um para cada mês. Cada parcela tem seu valor (`vl_parcela`) e uma data de faturamento prevista (`dt_faturamento`). Inicialmente, o campo `fl_faturado` é 'N' (Não).

---

## Capítulo 3: O Ciclo de Faturamento

O tempo passa e chega o dia do fechamento da fatura de Ana.

### 3.1 Processamento da Fatura
Um processo automático (batch) é executado. Ele cria um registro em `t_processamento`, que define o período de faturamento. Em seguida, o sistema:

- Busca todas as `t_parcela_venda` de Ana com `dt_faturamento` dentro daquele ciclo
- Busca possíveis `t_ajuste` (débitos ou créditos manuais) ou `t_rolagem` (saldos de faturas anteriores não pagos integralmente)
- Agrupa tudo e cria um registro na tabela `t_fatura`, associado ao `id_cliente` de Ana e ao `id_processamento` do ciclo
- A fatura contém o valor total (`vl_fatura`), o pagamento mínimo (`vl_minimo_pagamento`) e a data de vencimento (`dt_vencimento`)
- As parcelas, ajustes e rolagens utilizadas recebem o `id_fatura` correspondente e seu status `fl_faturado` é atualizado para 'S' (Sim)

### 3.2 Pagamento da Fatura
Ana recebe sua fatura e efetua o pagamento total antes do vencimento. Esse evento é registrado na tabela `t_pagamento_fatura`, com o `fl_status_pagamento` como 'A' (Ativo) e o valor pago (`vl_pagamento`).

---

## Capítulo 4: Inadimplência e Cobrança

Meses depois, Ana passa por dificuldades financeiras e não consegue pagar uma de suas faturas.

### 4.1 Início da Inadimplência
Após o vencimento da fatura sem o pagamento mínimo, o sistema identifica a inadimplência:

- O cliente pode ser bloqueado. Um registro é criado em `t_bloqueio_cliente`, com o `id_tipo_bloqueio_cliente` indicando "Inadimplência"
- O cartão também pode ser bloqueado através de um registro em `t_bloqueio_cartao`

### 4.2 Entrada na Cobrança
A dívida de Ana é movida para a área de cobrança. Um registro é criado na tabela `t_cobranca`:

- `id_cliente` identifica Ana
- `dt_entrada` marca o início do processo de cobrança
- `dt_inicio_atraso` e `dt_inicio_juros` registram as datas para cálculo de encargos
- `vl_divida_inicial` contém o valor original da dívida

### 4.3 Negociação e Acordo
A equipe de cobrança (`t_usuario`) entra em contato com Ana e propõe uma renegociação. Ana aceita:

- Um registro é criado na tabela `t_acordo`, vinculado à `id_cobranca`
- Ele detalha o novo valor total (`vl_acordo`), a quantidade de parcelas (`qt_parcelas`) e o valor da entrada
- O `fl_status_acordo` em `t_cobranca` e `t_acordo` é definido como 'A' (Ativo)

### 4.4 Geração e Pagamento dos Boletos
Com base no acordo, o sistema gera os boletos mensais, criando registros na tabela `t_boleto`. Cada boleto tem seu valor e data de vencimento:

- Quando Ana paga um boleto, um registro é feito em `t_pagamento_boleto`
- O `fl_status_boleto` do boleto correspondente é atualizado para 'P' (Pago)

### 4.5 Conclusão do Acordo
Após Ana pagar a última parcela:

- O `fl_status_acordo` é atualizado para 'P' (Pago)
- O `fl_ativo` em `t_cobranca` se torna 'N' (Não)
- A `dt_saida` é preenchida
- O `id_bloqueio_cliente` é liberado
- Ana pode, eventualmente, voltar a usar os serviços da DecisionsCard

---

## Observações sobre a Arquitetura de Dados

### Pontos Fortes do Modelo

- **Robustez:** O modelo cobre todas as etapas do ciclo de vida de um produto de cartão de crédito
- **Separação Lógica:** A distinção entre `t_venda` e `t_parcela_venda` é uma excelente prática para gerenciar compras parceladas
- **Auditoria:** Campos como `id_usuario`, `id_rede` e timestamps permitem rastreabilidade completa
- **Flexibilidade:** A tabela `t_ajuste` oferece flexibilidade operacional para lançamentos manuais
- **Padronização:** Uso de tabelas de domínio (`t_escolaridade`, `t_estado_civil`, etc.) facilita manutenção e relatórios

### Fluxos de Dados Principais

1. **Fluxo de Aquisição:** Cliente → Análise → Cartão → Ativação
2. **Fluxo Transacional:** Venda → Parcelas → Faturamento → Pagamento
3. **Fluxo de Cobrança:** Inadimplência → Cobrança → Acordo → Quitação

Esta compreensão é fundamental para realizar consultas eficazes e propor soluções analíticas adequadas ao negócio.

