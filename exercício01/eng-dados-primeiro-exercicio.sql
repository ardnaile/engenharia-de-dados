CREATE TABLE [dim_localidade] (
  [sk_localidade] int,
  [cd_municipio] int,
  [municipio] varchar(100),
  [estado] varchar(50),
  [regiao] varchar(50)
)
GO

CREATE TABLE [dim_cliente] (
  [sk_cliente] int,
  [cd_cliente] int,
  [nome] varchar(50),
  [cpf] char(11),
  [sexo] char(1),
  [dt_nascimento] date
)
GO

CREATE TABLE [dim_carro] (
  [sk_carro] int,
  [placa] char(10),
  [chassi] varchar(30),
  [ano] int,
  [cor] varchar(10),
  [modelo] varchar(200),
  [marca] varchar(200)
)
GO

CREATE TABLE [dim_tempo] (
  [sk_tempo] int,
  [data] date,
  [ano] int,
  [mes] int,
  [nome_mes] varchar(50),
  [dia] int,
  [nome_dia_semana] varchar(50),
  [numero_dia_semana] int
)
GO

CREATE TABLE [fato_sinistro] (
  [fk_tempo] int,
  [fk_localidade] int,
  [fk_carro] int,
  [fk_cliente] int,
  [qtd_sinistro] int
)
GO

ALTER TABLE [fato_sinistro] ADD FOREIGN KEY ([fk_tempo]) REFERENCES [dim_tempo] ([sk_tempo])
GO

ALTER TABLE [fato_sinistro] ADD FOREIGN KEY ([fk_carro]) REFERENCES [dim_carro] ([sk_carro])
GO

ALTER TABLE [fato_sinistro] ADD FOREIGN KEY ([fk_cliente]) REFERENCES [dim_cliente] ([sk_cliente])
GO

ALTER TABLE [fato_sinistro] ADD FOREIGN KEY ([fk_localidade]) REFERENCES [dim_localidade] ([sk_localidade])
GO
