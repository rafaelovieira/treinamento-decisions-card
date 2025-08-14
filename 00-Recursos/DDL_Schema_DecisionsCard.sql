-- DROP SCHEMA decisionscard;

CREATE SCHEMA decisionscard AUTHORIZATION postgres;

-- DROP SEQUENCE s_dominio;

CREATE SEQUENCE s_dominio
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE s_venda;

CREATE SEQUENCE s_venda
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;-- decisionscard.t_cartao definition

-- Drop table

-- DROP TABLE t_cartao;

CREATE TABLE t_cartao ( id_cartao int4 NOT NULL, id_cliente int4 NOT NULL, fl_status_cartao bpchar(1) NOT NULL, fl_cartao_atual bpchar(1) NOT NULL, fl_titularidade bpchar(1) NOT NULL, nu_cartao varchar(16) NOT NULL, dt_emissao date NULL, CONSTRAINT pk_cartao PRIMARY KEY (id_cartao));


-- decisionscard.t_dominio definition

-- Drop table

-- DROP TABLE t_dominio;

CREATE TABLE t_dominio ( id_dominio int4 NOT NULL, nm_dominio varchar(30) NULL, cd_dominio varchar(30) NULL, vl_dominio varchar(30) NULL, CONSTRAINT pk_dominio PRIMARY KEY (id_dominio));
CREATE UNIQUE INDEX t_dominio_nm_dominio_idx ON decisionscard.t_dominio USING btree (nm_dominio, cd_dominio);


-- decisionscard.t_escolaridade definition

-- Drop table

-- DROP TABLE t_escolaridade;

CREATE TABLE t_escolaridade ( id_escolaridade int4 NOT NULL, ds_escolaridade varchar(50) NULL, CONSTRAINT pk_escolaridade PRIMARY KEY (id_escolaridade));


-- decisionscard.t_estado_civil definition

-- Drop table

-- DROP TABLE t_estado_civil;

CREATE TABLE t_estado_civil ( id_estado_civil int4 NOT NULL, ds_estado_civil varchar(50) NULL, CONSTRAINT pk_estado_civil PRIMARY KEY (id_estado_civil));


-- decisionscard.t_fechamento definition

-- Drop table

-- DROP TABLE t_fechamento;

CREATE TABLE t_fechamento ( id_fechamento int4 NOT NULL, ds_fechamento varchar(40) NULL, nu_dia_corte int4 NULL, nu_dia_vencimento int4 NULL, fl_ultimo_dia_mes varchar(1) NULL, CONSTRAINT t_fechamento_pk PRIMARY KEY (id_fechamento));


-- decisionscard.t_forma_pagamento definition

-- Drop table

-- DROP TABLE t_forma_pagamento;

CREATE TABLE t_forma_pagamento ( id_forma_pagamento int4 NOT NULL, fl_ativo bpchar(1) NOT NULL, qt_parcelas int4 NOT NULL, ds_forma_pagamento varchar(100) NULL, CONSTRAINT pk_forma_pagamento PRIMARY KEY (id_forma_pagamento));


-- decisionscard.t_meta_rede definition

-- Drop table

-- DROP TABLE t_meta_rede;

CREATE TABLE t_meta_rede ( dt_inicio date NULL, dt_fim date NULL, id_rede int4 NULL, vl_meta int4 NULL);


-- decisionscard.t_moradia definition

-- Drop table

-- DROP TABLE t_moradia;

CREATE TABLE t_moradia ( id_moradia int4 NOT NULL, ds_moradia varchar(50) NULL, CONSTRAINT pk_moradia PRIMARY KEY (id_moradia));


-- decisionscard.t_ocupacao definition

-- Drop table

-- DROP TABLE t_ocupacao;

CREATE TABLE t_ocupacao ( id_ocupacao int4 NOT NULL, ds_ocupacao varchar(50) NULL, CONSTRAINT pk_ocupacao PRIMARY KEY (id_ocupacao));


-- decisionscard.t_pagamento_boleto definition

-- Drop table

-- DROP TABLE t_pagamento_boleto;

CREATE TABLE t_pagamento_boleto ( id_pagamento_boleto int4 NULL, id_boleto int4 NULL, id_cliente int4 NULL, id_rede int4 NULL, id_rede_cancelamento int4 NULL, id_usuario int4 NULL, id_usuario_cancelamento int4 NULL, fl_status_pagamento varchar(1) NULL, dt_pagamento timestamp NULL, dt_processamento timestamp NULL, dt_cancelamento timestamp NULL, vl_pagamento numeric(12, 2) NULL);


-- decisionscard.t_profissao definition

-- Drop table

-- DROP TABLE t_profissao;

CREATE TABLE t_profissao ( id_profissao int4 NOT NULL, ds_profissao varchar(255) NULL, CONSTRAINT pk_profissao PRIMARY KEY (id_profissao));


-- decisionscard.t_rede definition

-- Drop table

-- DROP TABLE t_rede;

CREATE TABLE t_rede ( id_rede int4 NOT NULL, nm_fantasia varchar(100) NULL, nm_cidade varchar(100) NULL, cd_uf varchar(2) NULL, CONSTRAINT pk_rede PRIMARY KEY (id_rede));


-- decisionscard.t_tipo_ajuste definition

-- Drop table

-- DROP TABLE t_tipo_ajuste;

CREATE TABLE t_tipo_ajuste ( id_tipo_ajuste int4 NOT NULL, ds_tipo_ajuste varchar(150) NULL, fl_credito_debito varchar NOT NULL, CONSTRAINT pk_tipo_ajuste PRIMARY KEY (id_tipo_ajuste));


-- decisionscard.t_tipo_bloqueio_cartao definition

-- Drop table

-- DROP TABLE t_tipo_bloqueio_cartao;

CREATE TABLE t_tipo_bloqueio_cartao ( id_tipo_bloqueio_cartao int4 NOT NULL, ds_tipo_bloqueio_cartao varchar(40) NULL, CONSTRAINT pk_tipo_bloqueio_cartao PRIMARY KEY (id_tipo_bloqueio_cartao));


-- decisionscard.t_tipo_bloqueio_cliente definition

-- Drop table

-- DROP TABLE t_tipo_bloqueio_cliente;

CREATE TABLE t_tipo_bloqueio_cliente ( id_tipo_bloqueio_cliente int4 NOT NULL, ds_tipo_bloqueio_cliente varchar(40) NULL, CONSTRAINT pk_tipo_bloqueio_cliente PRIMARY KEY (id_tipo_bloqueio_cliente));


-- decisionscard.t_usuario definition

-- Drop table

-- DROP TABLE t_usuario;

CREATE TABLE t_usuario ( id_usuario int4 NOT NULL, fl_status_usuario bpchar(1) NOT NULL, nm_usuario varchar(58) NULL, CONSTRAINT pk_usuario PRIMARY KEY (id_usuario));


-- decisionscard.t_bloqueio_cartao definition

-- Drop table

-- DROP TABLE t_bloqueio_cartao;

CREATE TABLE t_bloqueio_cartao ( id_bloqueio_cartao int4 NOT NULL, id_cartao int4 NOT NULL, id_tipo_bloqueio_cartao int4 NOT NULL, dt_bloqueio date NOT NULL, dt_desbloqueio date NULL, fl_liberado varchar(1) NULL, CONSTRAINT pk_bloqueio_cartao PRIMARY KEY (id_bloqueio_cartao), CONSTRAINT t_bloqueio_cartao_fk FOREIGN KEY (id_cartao) REFERENCES t_cartao(id_cartao), CONSTRAINT t_bloqueio_cartao_tipo_fk FOREIGN KEY (id_tipo_bloqueio_cartao) REFERENCES t_tipo_bloqueio_cartao(id_tipo_bloqueio_cartao));


-- decisionscard.t_cliente definition

-- Drop table

-- DROP TABLE t_cliente;

CREATE TABLE t_cliente ( id_cliente int4 NOT NULL, id_origem_comercial int4 NOT NULL, id_usuario_cadastro int4 NULL, id_escolaridade int4 NULL, id_estado_civil int4 NULL, id_profissao int4 NULL, id_ocupacao int4 NULL, id_moradia int4 NULL, nm_cliente varchar(100) NULL, dt_cadastro timestamp NULL, dt_nascimento date NULL, fl_sexo varchar(1) NULL, ds_email varchar(100) NULL, nm_cidade_natal varchar(100) NULL, cd_uf_natal varchar(2) NULL, nm_cidade varchar(100) NULL, cd_uf varchar(2) NULL, fl_titularidade varchar(1) NULL, fl_tipo_pessoa varchar(1) NULL, fl_status_analise varchar(1) NULL, fl_status_conta varchar(1) NULL, CONSTRAINT pk_cliente PRIMARY KEY (id_cliente), CONSTRAINT t_cliente_escolaridade_fk FOREIGN KEY (id_escolaridade) REFERENCES t_escolaridade(id_escolaridade), CONSTRAINT t_cliente_estado_civil_fk FOREIGN KEY (id_estado_civil) REFERENCES t_estado_civil(id_estado_civil), CONSTRAINT t_cliente_fk FOREIGN KEY (id_usuario_cadastro) REFERENCES t_usuario(id_usuario), CONSTRAINT t_cliente_moradia_fk FOREIGN KEY (id_moradia) REFERENCES t_moradia(id_moradia), CONSTRAINT t_cliente_ocupacao_fk FOREIGN KEY (id_ocupacao) REFERENCES t_ocupacao(id_ocupacao), CONSTRAINT t_cliente_origem_comerial_fk FOREIGN KEY (id_origem_comercial) REFERENCES t_rede(id_rede), CONSTRAINT t_cliente_profissao_fk FOREIGN KEY (id_profissao) REFERENCES t_profissao(id_profissao));


-- decisionscard.t_cobranca definition

-- Drop table

-- DROP TABLE t_cobranca;

CREATE TABLE t_cobranca ( id_cobranca int4 NOT NULL, id_cliente int4 NOT NULL, fl_ativo varchar(1) NULL, fl_status_acordo varchar(1) NOT NULL, dt_entrada date NOT NULL, dt_inicio_atraso date NULL, dt_inicio_juros date NULL, dt_saida date NULL, vl_divida_inicial numeric(10, 2) NULL, CONSTRAINT pk_cobranca PRIMARY KEY (id_cobranca), CONSTRAINT t_cobranca_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente));


-- decisionscard.t_processamento definition

-- Drop table

-- DROP TABLE t_processamento;

CREATE TABLE t_processamento ( id_processamento int4 NOT NULL, id_fechamento int4 NULL, dt_processamento date NOT NULL, dt_vencimento date NULL, qt_faturas int4 NOT NULL, vl_processamento numeric(10, 2) NOT NULL, CONSTRAINT pk_processamento PRIMARY KEY (id_processamento), CONSTRAINT t_processamento_fk FOREIGN KEY (id_fechamento) REFERENCES t_fechamento(id_fechamento));


-- decisionscard.t_venda definition

-- Drop table

-- DROP TABLE t_venda;

CREATE TABLE t_venda ( id_venda int4 NOT NULL, id_cliente int4 NOT NULL, id_cartao int4 NOT NULL, id_forma_pagamento int4 NOT NULL, id_rede int4 NULL, id_rede_cancelamento int4 NULL, id_usuario int4 NOT NULL, id_usuario_cancelamento int4 NULL, dt_venda timestamp NOT NULL, dt_cancelamento timestamp NULL, fl_status_venda bpchar(1) NOT NULL, vl_principal numeric(10, 2) NOT NULL, vl_juros numeric(10, 2) NULL, vl_venda numeric(10, 2) NULL, dt_atualizacao timestamp NULL, CONSTRAINT pk_venda PRIMARY KEY (id_venda), CONSTRAINT t_venda_cartao_fk FOREIGN KEY (id_cartao) REFERENCES t_cartao(id_cartao), CONSTRAINT t_venda_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_venda_forma_pag_fk FOREIGN KEY (id_forma_pagamento) REFERENCES t_forma_pagamento(id_forma_pagamento), CONSTRAINT t_venda_rede_canc_fk FOREIGN KEY (id_rede_cancelamento) REFERENCES t_rede(id_rede), CONSTRAINT t_venda_rede_fk FOREIGN KEY (id_rede) REFERENCES t_rede(id_rede), CONSTRAINT t_venda_usuario_canc_fk FOREIGN KEY (id_usuario_cancelamento) REFERENCES t_usuario(id_usuario), CONSTRAINT t_venda_usuario_fk FOREIGN KEY (id_usuario) REFERENCES t_usuario(id_usuario));
CREATE INDEX t_venda_cliente_data_idx ON decisionscard.t_venda USING btree (id_cliente, dt_venda);
CREATE INDEX t_venda_dt_atualizacao_idx ON decisionscard.t_venda USING btree (dt_atualizacao, id_venda, id_cliente);

-- Table Triggers

create trigger tr_venda_updated_date before
insert
    or
update
    on
    decisionscard.t_venda for each row execute function decisionscard.tr_updated_date();


-- decisionscard.t_acordo definition

-- Drop table

-- DROP TABLE t_acordo;

CREATE TABLE t_acordo ( id_acordo int4 NOT NULL, id_cobranca int4 NOT NULL, id_usuario int4 NOT NULL, id_usuario_cancelamento int4 NULL, fl_status_acordo varchar(1) NOT NULL, dt_acordo date NOT NULL, dt_cancelamento date NULL, qt_parcelas int4 NOT NULL, vl_entrada numeric(10, 2) NOT NULL, vl_acordo numeric(10, 2) NOT NULL, vl_encargo numeric(10, 2) NULL, vl_principal numeric(10, 2) NULL, CONSTRAINT pk_acordo PRIMARY KEY (id_acordo), CONSTRAINT t_acordo_cobranca_fk FOREIGN KEY (id_cobranca) REFERENCES t_cobranca(id_cobranca));

-- Column comments

COMMENT ON COLUMN decisionscard.t_acordo.fl_status_acordo IS 'A - ATIVO | C - CANCELADO | P - PAGO';


-- decisionscard.t_bloqueio_cliente definition

-- Drop table

-- DROP TABLE t_bloqueio_cliente;

CREATE TABLE t_bloqueio_cliente ( id_bloqueio_cliente int4 NOT NULL, id_cliente int4 NOT NULL, id_tipo_bloqueio_cliente int4 NOT NULL, dt_bloqueio date NOT NULL, dt_desbloqueio date NULL, fl_liberado varchar(1) NULL, dt_vencimento_fatura date NULL, CONSTRAINT pk_bloqueio_cliente PRIMARY KEY (id_bloqueio_cliente), CONSTRAINT t_bloqueio_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_bloqueio_cliente_tipo_fk FOREIGN KEY (id_tipo_bloqueio_cliente) REFERENCES t_tipo_bloqueio_cliente(id_tipo_bloqueio_cliente));


-- decisionscard.t_boleto definition

-- Drop table

-- DROP TABLE t_boleto;

CREATE TABLE t_boleto ( id_boleto int4 NOT NULL, id_acordo int4 NOT NULL, fl_status_boleto varchar(1) NOT NULL, fl_tipo_boleto varchar(1) NOT NULL, dt_vencimento date NOT NULL, vl_boleto numeric(10, 2) NOT NULL, vl_encargo numeric(10, 2) NULL, vl_principal numeric(10, 2) NULL, CONSTRAINT pk_boleto PRIMARY KEY (id_boleto), CONSTRAINT t_boleto_acordo_fk FOREIGN KEY (id_acordo) REFERENCES t_acordo(id_acordo));


-- decisionscard.t_fatura definition

-- Drop table

-- DROP TABLE t_fatura;

CREATE TABLE t_fatura ( id_fatura int4 NOT NULL, id_processamento int4 NOT NULL, id_cliente int4 NOT NULL, fl_ativa bpchar(1) NOT NULL, dt_vencimento date NOT NULL, vl_minimo_pagamento numeric(10, 2) NOT NULL, vl_fatura numeric(10, 2) NOT NULL, CONSTRAINT pk_fatura PRIMARY KEY (id_fatura), CONSTRAINT t_fatura_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_fatura_processamento_fk FOREIGN KEY (id_processamento) REFERENCES t_processamento(id_processamento));


-- decisionscard.t_pagamento_fatura definition

-- Drop table

-- DROP TABLE t_pagamento_fatura;

CREATE TABLE t_pagamento_fatura ( id_pagamento_fatura int4 NOT NULL, id_fatura int4 NOT NULL, id_cliente int4 NOT NULL, id_rede int4 NULL, id_rede_cancelamento int4 NULL, id_usuario int4 NOT NULL, id_usuario_cancelamento int4 NULL, fl_status_pagamento varchar(1) NULL, fl_meio_transacao bpchar(1) NOT NULL, dt_pagamento date NOT NULL, dt_processamento timestamp NULL, dt_cancelamento timestamp NULL, vl_pagamento numeric(10, 2) NOT NULL, CONSTRAINT pk_pagamento_fatura PRIMARY KEY (id_pagamento_fatura), CONSTRAINT t_pagamento_fatura_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_pagamento_fatura_fk FOREIGN KEY (id_fatura) REFERENCES t_fatura(id_fatura), CONSTRAINT t_pagamento_fatura_rede_canc_fk FOREIGN KEY (id_rede_cancelamento) REFERENCES t_rede(id_rede), CONSTRAINT t_pagamento_fatura_rede_fk FOREIGN KEY (id_rede) REFERENCES t_rede(id_rede), CONSTRAINT t_pagamento_fatura_usuario_canc_fk FOREIGN KEY (id_usuario_cancelamento) REFERENCES t_usuario(id_usuario), CONSTRAINT t_pagamento_fatura_usuario_fk FOREIGN KEY (id_usuario) REFERENCES t_usuario(id_usuario));
CREATE INDEX t_pagamento_fatura_id_fatura_idx ON decisionscard.t_pagamento_fatura USING btree (id_fatura, fl_status_pagamento, dt_pagamento);


-- decisionscard.t_parcela_venda definition

-- Drop table

-- DROP TABLE t_parcela_venda;

CREATE TABLE t_parcela_venda ( id_parcela_venda int4 NOT NULL, id_venda int4 NOT NULL, id_cliente int4 NOT NULL, id_fatura int4 NULL, fl_faturado bpchar(1) NOT NULL, dt_faturamento date NOT NULL, dt_processamento timestamp NOT NULL, nu_parcela int4 NOT NULL, qt_parcelas int4 NOT NULL, vl_principal numeric(10, 2) NULL, vl_juros numeric(10, 2) NULL, vl_parcela numeric(10, 2) NULL, CONSTRAINT pk_parcela_venda PRIMARY KEY (id_parcela_venda), CONSTRAINT t_parcela_venda_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_parcela_venda_fatura_fk FOREIGN KEY (id_fatura) REFERENCES t_fatura(id_fatura), CONSTRAINT t_parcela_venda_venda_fk FOREIGN KEY (id_venda) REFERENCES t_venda(id_venda));


-- decisionscard.t_rolagem definition

-- Drop table

-- DROP TABLE t_rolagem;

CREATE TABLE t_rolagem ( id_rolagem int4 NOT NULL, id_cliente int4 NOT NULL, id_fatura int4 NULL, fl_faturado bpchar(1) NOT NULL, fl_tipo_rolagem bpchar(1) NOT NULL, dt_faturamento date NOT NULL, dt_processamento timestamp NULL, vl_rolagem numeric(15, 5) NOT NULL, CONSTRAINT pk_rolagem PRIMARY KEY (id_rolagem), CONSTRAINT t_rolagem_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_rolagem_fatura_fk FOREIGN KEY (id_fatura) REFERENCES t_fatura(id_fatura));


-- decisionscard.t_ajuste definition

-- Drop table

-- DROP TABLE t_ajuste;

CREATE TABLE t_ajuste ( id_ajuste int4 NOT NULL, id_cliente int4 NOT NULL, id_tipo_ajuste int4 NOT NULL, id_fatura int4 NULL, id_origem int4 NULL, fl_faturado bpchar(1) NOT NULL, dt_faturamento date NULL, dt_processamento timestamp NULL, vl_ajuste numeric(15, 5) NOT NULL, CONSTRAINT pk_ajuste PRIMARY KEY (id_ajuste), CONSTRAINT t_ajuste_cliente_fk FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente), CONSTRAINT t_ajuste_fatura_fk FOREIGN KEY (id_fatura) REFERENCES t_fatura(id_fatura), CONSTRAINT t_ajuste_tipo_fk FOREIGN KEY (id_tipo_ajuste) REFERENCES t_tipo_ajuste(id_tipo_ajuste));



-- DROP FUNCTION decisionscard.last_day(date);

CREATE OR REPLACE FUNCTION decisionscard.last_day(date)
 RETURNS date
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
        SELECT (date_trunc('MONTH', $1) + INTERVAL '1 MONTH - 1 day')::date;
        $function$
;

-- DROP FUNCTION decisionscard.random_between(int4, int4);

CREATE OR REPLACE FUNCTION decisionscard.random_between(low integer, high integer)
 RETURNS integer
 LANGUAGE plpgsql
 STRICT
AS $function$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$function$
;

-- DROP FUNCTION decisionscard.tr_updated_date();

CREATE OR REPLACE FUNCTION decisionscard.tr_updated_date()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
begin
  if (NEW.dt_atualizacao = CURRENT_DATE) THEN 
    NEW.dt_atualizacao := NULL;
  else 
    NEW.dt_atualizacao := CURRENT_TIMESTAMP-interval '9' day;
  end if;
  RETURN NEW;
END;
$function$
;