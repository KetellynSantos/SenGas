-- Criação do Banco de dados Sengas -- -- -- -- Criação do Banco de dados Sengas -- -- -- -- Criação do Banco de dados Sengas
DROP DATABASE sengas;
CREATE DATABASE sengas;
USE sengas;

-- Criação de tabelas -- -- -- -- Criação de tabelas -- -- -- -- Criação de tabelas -- -- -- -- Criação de tabelas -- -- -- -- Criação de tabelas
CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(80) NOT NULL,
cnpj CHAR(14) UNIQUE NOT NULL,
codigoEmpresa VARCHAR(10) UNIQUE
);

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
codigoEmpresa VARCHAR(10),
FOREIGN KEY (codigoEmpresa) REFERENCES empresa(codigoEmpresa),
nome VARCHAR(100) NOT NULL,
email VARCHAR(80) UNIQUE NOT NULL,
telefone CHAR(11),
senha VARCHAR(255) NOT NULL,
nivelAcesso VARCHAR(7),
CONSTRAINT chkNivel CHECK (nivelAcesso IN('cliente', 'admin'))
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50),
limite DECIMAL(5,2),
setor VARCHAR(50),
fkEmpresa int, 
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE captura (
idCaptura INT PRIMARY KEY AUTO_INCREMENT,
fkSensor int,
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor),
valor DECIMAL(5,2),
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserts para as tabelas -- -- -- -- Inserts para as tabelas -- -- -- -- Inserts para as tabelas -- -- -- -- Inserts para as tabelas

-- Inserts Das empresas;
INSERT INTO empresa (razaoSocial, cnpj, codigoEmpresa) VALUES 
    ('Sengas', '32467724000136', '13CD91'),
    ('Wayne Tech', '81737019000117', '14DE92'),
    ('LexCorp Industries', '12184134000199', '14DB14'),
    ('Daily Planet', '61391062000166', '145BED'),
    ('Star Labs', '51792738000170', 'EDC614'),
    ('Kord Industries', '44343560000114', '12EBFD');

-- Inset Administradores do sistema;
INSERT INTO usuario (codigoEmpresa, nome, email, telefone, senha, nivelAcesso) VALUES
    ('13CD91', 'Vinicius Francelino', 'vinicius@sengas.com.br', '83927164520', '123@ViniciusFrancelino', 'admin'),
    ('13CD91', 'Davi Jeronimo', 'davi@sengas.com.br', '99271645830', '123@DaviJeronimo', 'admin'),
    ('13CD91', 'Manuela Prado', 'manuela@sengas.com.br', '91234875620', '123@ManuelaPrado', 'admin'),
    ('13CD91', 'Gabriela Santana', 'gabriela@sengas.com.br', '99912345876', '123@GabrielaSantana', 'admin'),
    ('13CD91', 'Ketelyn Santos', 'ketelyn@sengas.com.br', '98765432109', '123@KetelynSantos', 'admin'),
    ('13CD91', 'Breno Alves', 'breno@sengas.com.br', '98123456789', '123@BrenoAlves', 'admin');

-- Insert de Cliente da Sengas;
INSERT INTO usuario (codigoEmpresa, nome, email, telefone, senha, nivelAcesso) VALUES
    ('14DE92', 'Bruce Wayne', 'bruce@waynetech.com', '12345678910', '@Wayne', 'cliente'),
    ('14DE92', 'Alfred Penyworth', 'alfred@waynetech.com', '10987654321', '@Alfred', 'cliente'),
    ('14DB14', 'Alexander Luthor', 'Alexander@lexcorp.com', '12378945610', 'LexCorp@', 'cliente'),
    ('14DB14', 'Lyonel Luthor', 'lyonel@lexcorp.com', '28473652910', '123Lyonel', 'cliente'),
    ('145BED', 'Louis Lane', 'louis@dailyplanet.com', '46852145971', 'lutando@', 'cliente'),
    ('145BED', 'Clark Kent', 'clark@dailyplanet.com', '69514387102', '123#', 'cliente'),
    ('EDC614', 'Cisco Ramom', 'cisco@starlabs.com', '37593826371', 'flash123', 'cliente'),
    ('EDC614', 'Caitlin Snow', 'caitlin@starlabs.com', '37203945738', 'star1234', 'cliente'),
    ('12EBFD', 'Ted Kord', 'ted@kordindustries.com', '46372819203', 'ford321', 'cliente'),
    ('12EBFD', 'Victoria Kord', 'victoria@kordindustries.com', '26153689026', 'kord123', 'cliente');


-- Inserts Dos sensores de cada empresa
INSERT INTO sensor (titulo, limite, setor, fkEmpresa) VALUES
('Sensor Central SG-1', 10.50, 'Armazenamento', 1),
('Sensor Linha SG-2', 6.00, 'Estocagem', 1),
('Sensor Wayne Alpha', 15.00, 'Laboratório', 2),
('Sensor Wayne Beta', 11.50, 'Subnível 1', 2),
('Sensor Lex Ultra', 3.00, 'Pesquisa', 3),
('Sensor Lex Prime', 10.50, 'Armazenamento', 3),-- View para testando
('Sensor Planet A', 5.00, 'Sala de Impressão', 4),
('Sensor Planet B', 15.50, 'Subsolo', 4),
('Sensor Star Quantum', 25.75, 'Laboratório Criogênico', 5),
('Sensor Star Fusion', 12.90, 'Estocagem de Equipamentos', 5),
('Sensor Kord Blue-1', 10.40, 'Armazenamento', 6),
('Sensor Kord Blue-2', 3.00, 'Setor Técnico', 6);

INSERT INTO captura (fkSensor, valor, dtRegistro) VALUES
(1, '12.5', '2025-01-10 08:10:15'),
(1, '14.2', '2025-01-10 08:20:20'),
(1, '15.8', '2025-01-10 08:30:18'),
(1, '13.9', '2025-01-10 08:40:10'),
(1, '16.3', '2025-01-10 08:50:05'),
(2, '18.1', '2025-01-11 09:05:11'),
(2, '19.4', '2025-01-11 09:15:30'),
(2, '20.2', '2025-01-11 09:25:02'),
(2, '17.9', '2025-01-11 09:35:41'),
(2, '21.0', '2025-01-11 09:45:55'),
(3, '10.7', '2025-01-12 10:00:11'),
(3, '12.3', '2025-01-12 10:10:15'),
(3, '11.9', '2025-01-12 10:20:05'),
(3, '13.0', '2025-01-12 10:30:21'),
(3, '12.8', '2025-01-12 10:40:33'),
(4, '14.4', '2025-01-13 11:00:01'),
(4, '15.7', '2025-01-13 11:10:25'),
(4, '16.0', '2025-01-13 11:20:42'),
(4, '15.1', '2025-01-13 11:31:10'),
(4, '17.3', '2025-01-13 11:41:55'),
(5, '9.9', '2025-01-14 12:00:00'),
(5, '10.5', '2025-01-14 12:10:13'),
(5, '11.2', '2025-01-14 12:20:56'),
(5, '10.9', '2025-01-14 12:30:12'),
(5, '12.1', '2025-01-14 12:40:44'),
(6, '11.4', '2025-01-15 13:15:20'),
(6, '12.7', '2025-01-15 13:25:30'),
(6, '13.6', '2025-01-15 13:35:05'),
(6, '12.9', '2025-01-15 13:45:27'),
(6, '14.1', '2025-01-15 13:55:18'),
(7, '16.8', '2025-01-16 14:00:10'),
(7, '17.4', '2025-01-16 14:10:18'),
(7, '18.2', '2025-01-16 14:20:40'),
(7, '17.9', '2025-01-16 14:30:11'),
(7, '19.0', '2025-01-16 14:40:55'),
(8, '20.7', '2025-01-17 15:05:10'),
(8, '21.3', '2025-01-17 15:15:41'),
(8, '22.1', '2025-01-17 15:25:50'),
(8, '21.9', '2025-01-17 15:35:22'),
(8, '23.0', '2025-01-17 15:45:30'),
(9, '8.4', '2025-01-18 16:00:00'),
(9, '9.1', '2025-01-18 16:10:12'),
(9, '9.7', '2025-01-18 16:20:25'),
(9, '10.2', '2025-01-18 16:30:40'),
(9, '10.9', '2025-01-18 16:40:55'),
(10, '12.0', '2025-01-19 17:00:13'),
(10, '12.8', '2025-01-19 17:10:26'),
(10, '13.4', '2025-01-19 17:20:42'),
(10, '14.1', '2025-01-19 17:31:10'),
(10, '14.8', '2025-01-19 17:41:19'),
(11, '15.4', '2025-01-20 18:00:00'),
(11, '16.2', '2025-01-20 18:10:30'),
(11, '17.0', '2025-01-20 18:21:10'),
(11, '17.6', '2025-01-20 18:31:44'),
(11, '18.3', '2025-01-20 18:42:15'),
(12, '13.1', '2025-01-21 19:00:05'),
(12, '13.8', '2025-01-21 19:10:14'),
(12, '14.5', '2025-01-21 19:20:33'),
(12, '15.2', '2025-01-21 19:30:59'),
(12, '15.9', '2025-01-21 19:41:20');


-- Selects das tabelas -- Selects das tabelas -- Selects das tabelas -- Selects das tabelas -- Selects das tabelas 

-- Select para Empresa -- Select para Empresa -- Select para Empresa -- Select para Empresa -- Select para Empresa;
SELECT * FROM empresa;

-- Select para Usuario -- Select para Usuario -- Select para Usuario -- Select para Usuario -- Select para Usuario;
SELECT * FROM usuario;

-- Select para Sensor -- Select para Sensor -- Select para Sensor -- Select para Sensor -- Select para Sensor;
SELECT * FROM sensor;

-- Select para Captura -- Select para Captura -- Select para Captura -- Select para Captura -- Select para Captura;
SELECT * FROM captura;

-- View- Traz dados das empresas, sensor, informações referente a captura e etc.
CREATE VIEW vw_capturas_com_limite AS
SELECT 
    s.idSensor,
    s.titulo AS nomeSensor,
    e.razaoSocial AS empresa,
    c.valor AS valorCaptado,
    s.limite AS limite,
    c.dtRegistro AS 'Data do registro',
    CASE
        WHEN c.valor > s.limite THEN 'ALERTA'
        ELSE 'OK'
    END AS statusLeitura
FROM sensor s
JOIN empresa e ON e.idEmpresa = s.fkEmpresa
JOIN captura c ON c.fkSensor = s.idSensor;

select * from vw_capturas_com_limite;

-- conta quantas capturas foram realizadas
CREATE VIEW vw_capturas_com_limite_quantidade AS
SELECT count(*) FROM vw_capturas_com_limite;

select * from vw_capturas_com_limite_quantidade;

