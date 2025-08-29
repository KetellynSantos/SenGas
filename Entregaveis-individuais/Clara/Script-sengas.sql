CREATE DATABASE sengás;

USE sengás;

CREATE TABLE cdtFuncionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR (30),
cargo VARCHAR (20),
setor VARCHAR (20),
dtCadastro DATETIME,
tipoAcesso  VARCHAR (10),
CONSTRAINT chk_tipoAcesso CHECK (tipoAcesso IN ('Visualização','Analista', 'Gerencia'))
);

INSERT INTO ctdFuncionario VALUES 
('solita.uorak@sengas.com', '','','',''),
('','','','',''),
('','','','',''),
('','','','','');

DROP TABLE cdtFuncionario;

CREATE TABLE rgtSensores VALUES ( 
idSensor INT PRIMARY KEY AUTO_INCREMENT,  
Localidade VARCHAR (30),
Densidade DECIMAL (6,2),
dtRegistro DATETIME
);