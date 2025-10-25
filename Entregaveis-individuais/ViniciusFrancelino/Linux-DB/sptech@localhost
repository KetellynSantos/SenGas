CREATE DATABASE sengas;
USE sengas;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
razaoSocial varchar(80) not null,
nomeFantasia varchar(80) not null,
cnpj char(14) unique not null,
codigoEmpresa varchar(10)
);

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
nome varchar(30) not null,
sobrenome varchar(120) not null,
email varchar(80) unique not null,
telefone char(11) not null,
senha varchar(255) not null,
nivelAcesso tinyint,
constraint chkNivel check(nivelAcesso >=1 and nivelAcesso <=5),
fkEmpresa int,
constraint fk_Usuario_Empresa
foreign key (fkEmpresa)
references empresa(idEmpresa)
);

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
logradouro varchar(130) not null, 
numero varchar(10) not null,
complemento varchar(130),
cidade varchar(100) not null,
uf char(2) not null,
cep char(8) not null,
fkEmpresaEndereco int,
constraint fk_Endereco_Empresa
foreign key (fkEmpresaEndereco)
references empresa(idEmpresa)
  );

CREATE TABLE setor (
idSetor int primary key auto_increment,
titulo varchar(50),
fkEmpresaSetor int,
constraint fk_Setor_Empresa
foreign key (fkEmpresaSetor)
references empresa(idEmpresa)
);

CREATE TABLE sensor (
idSensor int primary key auto_increment,
titulo varchar(50), 
fkSetorSensor int,
constraint fk_Sensor_Setor
foreign key (fkSetorSensor)
references setor(idSetor)
);

CREATE TABLE captura (
idCaptura int primary key auto_increment,
valor decimal(5,2),
dtRegistro datetime default current_timestamp,
fkSensor int,
constraint fk_Captura_Sensor
foreign key (fkSensor)
references sensor(idSensor)
);

CREATE TABLE limite (
idLimite int primary key auto_increment,
limiteCliente decimal (5,2),
fkcapturaLimite int,
constraint chkcaplimite
foreign key(fkcapturaLimite)
references captura(idCaptura)
);
    
INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, codigoEmpresa) VALUES
('Vazamento gasoso LTDA','VazGas', '01001001000101', '#23355A' ),
('Gas explosivo SS LTDA', 'XPLOD', '02002002000202', '#32456B' ),
('BioGrass Metano LTDA', 'BioGrass', '03003003000303', '#31366C' );

    INSERT INTO endereco (logradouro, numero, complemento, cidade, uf, cep, fkEmpresaEndereco) VALUES
('Avenida das laranjas', 1000, 'abc', 'São Paulo', 'SP', '01234001', 1),
('Avenida das ameixas', 2000, 'abc', 'Minas Gerais', 'MG', '43210100', 2),
('Avenida dos limões', 3000, 'abc', 'Rio de Janeiro', 'RJ', '34120010', 3);

INSERT INTO setor (titulo, fkEmpresaSetor) VALUES
('Captação', 1),
('Extração', 2),
('Armazenagem', 3);

INSERT INTO usuario (nome, sobrenome, telefone, nivelAcesso, email, senha, fkEmpresa) VALUES
('Victor', 'Silva', '11290020002', 2, 'victor@biograss.com.br', 'domingofeira', 1),
('Igor', 'Dias', '11190010001', 2, 'igor@vazgaz.com.br', 'segundafeira', 2),
('Bianca', 'Iwata', '11190030003', 1, 'bianca@vazgaz.com.br', 'tercafeira', 3);

INSERT INTO sensor (titulo, fkSetorSensor) VALUES
('Sensor fabricaçao', 1),
('Sensor tubulação', 2),
('Sensor armazenagem', 3);
    
INSERT INTO captura (valor, fkSensor) VALUES
(10.07, 1),
(99.05, 2),
(24.62, 3);
    
INSERT INTO limite (limiteCliente, fkcapturaLimite) VALUES
(30.00, 1),
(60.00, 2), 
(10.00, 3);
