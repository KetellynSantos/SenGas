CREATE DATABASE sengas;
USE sengas;

CREATE TABLE cadastro(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
senha VARCHAR(100) NOT NULL,
dtNasc DATE,
cpf CHAR(11) NOT NULL UNIQUE,
nivel_acesso VARCHAR(7)
	CONSTRAINT chkNivel_acesso
		CHECK (nivel_acesso IN('mínimo', 'parcial', 'total')),
dtCriacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO cadastro (nome, email, senha, dtNasc, cpf, nivel_acesso) VALUES
('Arthur Lima', 'arthur.lima@email.com', 'sEnha@5678', '1985-02-24', '05284589972', 'mínimo'),
('Julia Silva', 'julia123@email.com', 'Wjhasug876bjs!', '2000-08-10', '15984665784', 'parcial'),
('Maria dos Santos', 'mariasantos4@email.com', 'PassWord56%12', '1996-05-10', '45015665290', 'total');

SELECT nome, nivel_acesso FROM cadastro;

CREATE TABLE alerta_sensor(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL, 
localizacao VARCHAR (40) NOT NULL,
nivel VARCHAR (10)
	CONSTRAINT chkNivel
		CHECK (nivel in('baixo', 'médio', 'alto', 'crítico')),
dtHora DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO alerta_sensor (nome, localizacao, nivel) VALUES
('Sensor 1', 'Tubulação - Ala 7', 'baixo'),
('Sensor 14', 'Armazenamento - Ala 3', 'alto'),
('Sensor 5', 'Área de purificação - Ala 3', 'crítico');

SELECT nome, localizacao FROM alerta_sensor
	WHERE nivel = 'crítico';

CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
estado CHAR(2),
cidade VARCHAR(30),
rua VARCHAR(40),
numero INT,
complemento VARCHAR(10)
);

INSERT INTO empresa (nome, estado, cidade, rua, numero, complemento) VALUES
('BioSim', 'SP', 'São Paulo', 'Rua José Almeida', 395, null),
('Verde Energia', 'PR', 'Curitiba', 'Rua Antônio dos Lares', 1200, 'Galpão 1'),
('EcoMetano', 'SP', 'Campinas', 'Rodovia das Indústrias', null, 'Km 102');

SELECT nome,
	IFNULL (complemento,'Sem complemento') AS Complemento
FROM empresa; 
