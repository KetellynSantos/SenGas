CREATE DATABASE sengas;
USE sengas;
CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(200) NOT NULL,
    nomeFantasia VARCHAR (100),
    cnpj VARCHAR (20),
    contAtivo CHAR(3) CONSTRAINT chkAtivo CHECK (contAtivo IN ('Sim', 'Não'))
);
CREATE TABLE setores(
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
    setor VARCHAR(50)
);
CREATE TABLE filial(
	idFilial INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(200) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100) DEFAULT NULL,
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(9) NOT NULL
);
CREATE TABLE funcionario(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (80) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    dtNasc DATE,
    telefone VARCHAR(15),
    nivelAcesso VARCHAR (20) CONSTRAINT chkNivel CHECK (nivelAcesso IN ('Baixo', 'Medio', 'Alto')),
    email VARCHAR (60)NOT NULL UNIQUE,
    login VARCHAR (40) NOT NULL,
    senha VARCHAR (12) NOT NULL,
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE sensor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    idSensor VARCHAR (40),
    dtDeteccao DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, contAtivo) VALUES
	('Vazamento gasoso LTDA','VazGas', '01.001.001/0001-01', 'Sim'),
	('Gas explosivo SS LTDA', 'XPLOD', '02.002.002/0002-02', 'Não'),
	('BioGrass Metano LTDA', 'BioGrass', '03.003.003/0003-03', 'Sim');
INSERT INTO setores (setor) VALUES
	('Captação'),
	('Extração'),
	('Armazenagem'),
	('Purificação');
INSERT INTO filial (logradouro, numero, cidade, uf, cep) VALUES
	('Avenida das laranjas', '1000', 'São Paulo', 'SP', '01234-001'),
	('Avenida das ameixas', '2000', 'Minas Gerais', 'MG', '43210-100'),
	('Avenida dos limões', '3000', 'Rio de Janeiro', 'RJ', '34120-010');
INSERT INTO funcionario (nome, sobrenome, dtNasc, telefone, nivelAcesso, email, login, senha) VALUES
	('Victor', 'Domingo', '2000-02-03', '11-29002-0002', 'Alto', 'victor@vazgaz.com.br', 'victor.domingo', 'domingo'),
    ('Igor', 'Segunda', '1995-01-02', '11-19001-0001', 'Baixo', 'igor@vazgaz.com.br', 'igor.segunda', 'segundafeira'),
	('Bianca', 'Terça', '2001-03-04', '11-19003-0003', 'Medio', 'bianca@vazgaz.com.br', 'bianca.terca', 'tercafeira');
INSERT INTO sensor (idSensor) VALUES
	('Sensor fabriacaçao'),
	('Sensor tubulação'),
	('Sensor armazenagem');
SELECT nomeFantasia AS 'Nome Fantasia', concat(razaoSocial, ' ', cnpj) AS 'Razão social e CNPJ', contAtivo AS 'Contrato Ativo' FROM empresa;
SELECT setor AS Setor FROM setores;
SELECT concat(logradouro, ', ', numero, ' - ', cidade, ' - ' , uf, ' - ', cep) AS 'Endereço completo', complemento AS Complemento FROM filial;
SELECT concat(nome, ' ', sobrenome, ' - ', dtNasc) AS 'Dados do funcionário (Nome completo e data de nascimento)', concat(telefone, ' / ', email, '/ ', login, ' / ', senha) AS 'Dados de acesso (telefne, e-mail, login e senha)', nivelAcesso AS 'Nivel de acesso', dtCadastro AS 'Data de cadastro' FROM funcionario;
SELECT idSensor AS Sensor, dtDeteccao AS 'Data e horario da detecção' FROM sensor;