# Instruções para o Treinamento SQL e Setup do Ambiente

## 1. Configuração do Ambiente de Consulta (DBeaver)

Para interagir com o banco de dados da DecisionsCard, você precisará de uma ferramenta de consulta SQL, também conhecida como IDE de banco de dados. Recomendamos o uso do **DBeaver**, que é gratuito, poderoso e compatível com diversos sistemas.

### Instalação do DBeaver

1. **Baixe e instale o DBeaver:** [https://dbeaver.io/download/](https://dbeaver.io/download/)
2. **Crie uma nova conexão:**
   - Abra o DBeaver e clique no ícone de "Nova Conexão" (um plugue com um sinal de mais)
   - Selecione **PostgreSQL** e clique em "Próximo"
   - Na aba "Principal", preencha as credenciais de acesso que foram fornecidas a você:
     - **Host:** `[Endereço do servidor fornecido]`
     - **Porta:** `5432` (padrão)
     - **Base de Dados:** `decisionscard_training`
     - **Usuário:** `[Usuário fornecido]`
     - **Senha:** `[Senha fornecida]`
   - Clique em **"Testar conexão..."** para garantir que tudo está correto
   - Se o teste for bem-sucedido, clique em "Finalizar"

### Verificação da Conexão

Após conectar, você deve ver o schema `decisionscard` com todas as tabelas do modelo. Teste executando uma query simples:

```sql
SELECT COUNT(*) FROM decisionscard.t_cliente;
```

## 2. Como Realizar os Exercícios

### Metodologia

1. **Visão Geral:** Consulte o arquivo [`00_LISTA_DE_EXERCICIOS.md`](./00_LISTA_DE_EXERCICIOS.md) para ver todos os exercícios disponíveis
2. **Resolução Individual:** Abra cada arquivo `Exercicio_XX.md` para resolver
3. **Escrita da Query:** Dentro de cada arquivo, você encontrará um bloco de código SQL onde deve escrever sua resposta
4. **Commit Granular:** Após resolver cada exercício, faça um commit específico para aquele arquivo

### Exemplo de Workflow

```bash
# 1. Abrir o exercício
# Edite o arquivo Exercicio_01.md e escreva sua query

# 2. Testar no DBeaver
# Execute sua query para verificar se está correta

# 3. Fazer commit da resposta
git add Exercicio_01.md
git commit -m "Resolve exercício 1: Listagem de clientes"

# 4. Prosseguir para o próximo
# Repita o processo para Exercicio_02.md, etc.
```

### Dicas Importantes

- **Teste sempre:** Execute suas queries no DBeaver antes de fazer commit
- **Use o schema:** Todas as tabelas estão no schema `decisionscard`, então use `decisionscard.nome_da_tabela`
- **Consulte a documentação:** Use os arquivos na pasta `00-Recursos` como referência
- **Seja progressivo:** Os exercícios aumentam em complexidade, então resolva em ordem

## 3. Estrutura do Schema

O banco de dados `decisionscard_training` contém o schema `decisionscard` com as seguintes categorias de tabelas:

### Tabelas de Clientes e Produtos
- `t_cliente` - Dados dos clientes
- `t_cartao` - Cartões emitidos
- `t_bloqueio_cliente`, `t_bloqueio_cartao` - Controle de bloqueios

### Tabelas Transacionais
- `t_venda` - Transações de venda
- `t_parcela_venda` - Parcelas das vendas
- `t_fatura` - Faturas geradas
- `t_pagamento_fatura` - Pagamentos das faturas

### Tabelas de Cobrança
- `t_cobranca` - Processos de cobrança
- `t_acordo` - Acordos de pagamento
- `t_boleto` - Boletos gerados
- `t_pagamento_boleto` - Pagamentos dos boletos

### Tabelas de Apoio
- `t_rede` - Redes parceiras
- `t_usuario` - Usuários do sistema
- `t_processamento` - Controle de processamentos
- Diversas tabelas de domínio (`t_escolaridade`, `t_estado_civil`, etc.)

## 4. Próximos Passos

Após configurar seu ambiente:

1. Leia a [`Historia_do_Fluxo_de_Dados.md`](../00-Recursos/Historia_do_Fluxo_de_Dados.md) na pasta `00-Recursos` para entender o contexto
2. Analise o diagrama [`Modelo_de_Dados.png`](../00-Recursos/Modelo_de_Dados.png) para visualizar os relacionamentos
3. Comece pelos exercícios em [`00_LISTA_DE_EXERCICIOS.md`](./00_LISTA_DE_EXERCICIOS.md)

**Lembre-se:** O objetivo é aprender. Tente resolver os desafios antes de buscar ajuda externa!

Bom treinamento! 🚀

