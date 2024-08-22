create schema dimensional;

drop schema dimensional

CREATE TABLE dimensional.dim_localidade (
  [sk_localidade] int PRIMARY KEY,
  [cd_municipio] int,
  [municipio] varchar(100),
  [estado] varchar(50),
  [regiao] varchar(50)
)
GO

CREATE TABLE dimensional.dim_cliente (
  [sk_cliente] int PRIMARY KEY,
  [cd_cliente] int,
  [nome] varchar(50),
  [cpf] char(11),
  [sexo] char(1),
  [dt_nascimento] date
)
GO

CREATE TABLE dimensional.dim_carro (
  [sk_carro] int PRIMARY KEY,
  [placa] char(10),
  [chassi] varchar(30),
  [ano] int,
  [cor] varchar(10),
  [modelo] varchar(200),
  [marca] varchar(200)
)
GO

CREATE TABLE dimensional.dim_tempo (
  [sk_tempo] int PRIMARY KEY,
  [data] date,
  [ano] int,
  [mes] int,
  [nome_mes] varchar(50),
  [dia] int,
  [nome_dia_semana] varchar(50),
  [numero_dia_semana] int
)
GO

CREATE TABLE dimensional.fato_sinistro (
  [fk_tempo] int,
  [fk_localidade] int,
  [fk_carro] int,
  [fk_cliente] int,
  [qtd_sinistro] int
)
GO

drop table [dimensional.dim_carro]
drop table [dimensional.dim_cliente]
drop table [dimensional.dim_localidade]
drop table [dimensional.dim_tempo]
drop table [dimensional.fato_sinistro]

ALTER TABLE dimensional.fato_sinistro ADD FOREIGN KEY (fk_tempo) REFERENCES dimensional.dim_tempo (sk_tempo);
ALTER TABLE dimensional.fato_sinistro ADD FOREIGN KEY (fk_carro) REFERENCES dimensional.dim_carro (sk_carro);
ALTER TABLE dimensional.fato_sinistro ADD FOREIGN KEY (fk_cliente) REFERENCES dimensional.dim_cliente (sk_cliente);
ALTER TABLE dimensional.fato_sinistro ADD FOREIGN KEY (fk_localidade) REFERENCES dimensional.dim_localidade (sk_localidade);

