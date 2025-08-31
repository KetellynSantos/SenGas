
-- CADASTRO DO FUNCIONÁRIO
CREATE DATABASE sengas;

USE sengas;

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



-- REGISTRO DOS SENSORES
USE sengas;

CREATE TABLE rgtSensores ( 
idSensor INT PRIMARY KEY AUTO_INCREMENT,  
Localidade VARCHAR (40),
Densidade DECIMAL (5,3),
dtRegistro DATETIME
);

INSERT INTO rgtSensores (Localidade, Densidade, dtRegistro) VALUES 
('Saída do reator', 0.350,'2025-08-30 06:45:01'),
('Entrada do centro de tratamento', 0.026,'2025-08-30 12:45:20'),
('Centro de armazenagem', 0.820,'2025-08-30 16:15:44'),
('Centro de digestão', 0.052,'2025-08-30 22:05:11');

DROP TABLE rgtSensores;





-- ANÁLISE DE PERDA
USE sengas;

CREATE TABLE analisePerda (
idPerda INT PRIMARY KEY AUTO_INCREMENT,
Biodigestor VARCHAR (40),
qtdMateriaRcb INT,
qtdGasProd INT,
qtdVazaIdent DECIMAL (4,2),
tempoResidencia INT
);

INSERT INTO analisePerda (Biodigestor, qtdMateriaRcb, qtdGasProd, qtdVazaIdent, tempoResidencia) VALUES 
('Lagoa Coberta (BLC)', 500, 80, 3.75, 25),
('Reator Contínuo de Tanque Agitado (CSTR)', 1200,	190, 2.63, 20),
('Biodigestor Tubular', 800, 115, 3.48,	22),
('Biodigestor de Batch (Batelada)', 300, 45, 3.33, 30),
('Biodigestor de Flux Contínuo', 1500, 220, 2.73, 18);

DROP TABLE analisePerda;
