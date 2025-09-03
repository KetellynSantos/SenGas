DROP DATABASE sengas;
CREATE DATABASE sengas;
USE sengas;

CREATE TABLE empresa (
  idEmpresa int primary key auto_increment,
  razaoSocial varchar(80),
  nomeFantasia varchar(80),
  cnpj char(14),
  dtFirma date,
  contratoAtivo tinyint,
  constraint chkContrato check (contratoAtivo in(0,1))
);

CREATE TABLE usuario (
  idUsuario int primary key auto_increment,
  nome varchar(30) not null,
  sobrenome varchar(120) not null,
  email varchar(80) unique not null,
  telefone char(11) not null,
  senha varchar(255) not null,
  nivelAcesso tinyint,
  constraint chkNivel check(nivelAcesso >=1 and nivelAcesso <=5)
);

CREATE TABLE endereco (
  idEndereco int primary key auto_increment,
  logradouro varchar(130) not null, 
  numero varchar(10) not null,
  complemento varchar(130),
  cidade varchar(100) not null,
  uf char(2) not null,
  cep char(8) not null
);

CREATE TABLE filial (
  idFilial int primary key auto_increment,
  titulo varchar(80)
);

CREATE TABLE setor (
  idSetor int primary key auto_increment,
  titulo varchar(50),
  descricao text
);

CREATE TABLE sensor (
  idSensor int primary key auto_increment,
  titulo varchar(50)
);

CREATE TABLE captura (
  idCaptura int primary key auto_increment,
  valor decimal(5,2),
  dtRegistro datetime default current_timestamp
);

INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, contratoAtivo) VALUES
	('Vazamento gasoso LTDA','VazGas', '01001001000101', 1),
	('Gas explosivo SS LTDA', 'XPLOD', '02002002000202', 0),
	('BioGrass Metano LTDA', 'BioGrass', '03003003000303', 1);

INSERT INTO setor (titulo) VALUES
	('Captação'),
	('Extração'),
	('Armazenagem'),
	('Purificação');

INSERT INTO endereco (logradouro, numero, cidade, uf, cep) VALUES
	('Avenida das laranjas', '1000', 'São Paulo', 'SP', '01234001'),
	('Avenida das ameixas', '2000', 'Minas Gerais', 'MG', '43210100'),
	('Avenida dos limões', '3000', 'Rio de Janeiro', 'RJ', '34120010');

INSERT INTO usuario (nome, sobrenome, telefone, nivelAcesso, email, senha) VALUES
	('Victor', 'Domingo', '11290020002',3, 'victor@vazgaz.com.br', 'domingo'),
    ('Igor', 'Segunda', '11190010001', 2, 'igor@vazgaz.com.br', 'segundafeira'),
	('Bianca', 'Terça', '11190030003', 1, 'bianca@vazgaz.com.br', 'tercafeira');

INSERT INTO sensor (titulo) VALUES
	('Sensor fabriacaçao'),
	('Sensor tubulação'),
	('Sensor armazenagem');

SELECT nomeFantasia AS 'Nome Fantasia', 
  concat(razaoSocial, ' ', cnpj) AS 'Razão social e CNPJ', 
  CASE
    WHEN contratoAtivo = 0 THEN 'Inativo'
    ELSE 'Ativo'
  END AS 'Situação de Contrato'
FROM empresa;

SELECT titulo AS Setor FROM setor;

SELECT concat(logradouro, ', ', numero, ' - ', cidade, ' - ' , uf, ' - ', cep) AS 'Endereço completo',
  complemento AS Complemento 
FROM endereco;

SELECT concat(nome, ' ', sobrenome) AS 'Dados do funcionário (Nome completo)', 
  concat(telefone, ' / ', email, ' / ', senha) AS 'Dados de acesso (telefone, e-mail e senha)', 
  nivelAcesso AS 'Nivel de acesso' 
FROM usuario;

SELECT idSensor AS Sensor, 
  dtRegistro AS 'Data e horario da detecção' 
FROM captura;