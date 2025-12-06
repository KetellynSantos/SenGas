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
nome varchar(100) not null,
email varchar(80) unique not null,
telefone char(11),
senha varchar(255) not null,
fkEmpresaUsuario int,
nivelAcesso VARCHAR(50),
constraint chkNivel check (nivelAcesso IN('cliente', 'admin')),
constraint chkEmpresa_usuario
foreign key (fkEmpresaUsuario)
references empresa (idEmpresa)
);

select * from usuario;
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

CREATE TABLE limite (
idLimite int auto_increment,
fkSensorLimite int,
constraint pk_sensor_Limite
primary key (idLimite, fkSensorLimite),
limiteCliente decimal (5,2),
constraint fk_Sensor_Limite
foreign key(fkSensorLimite)
references sensor(idSensor)
);

CREATE TABLE captura (
idCaptura int auto_increment,
fkSensor int,
constraint pk_Captura_Sensor
primary key (idCaptura, fkSensor),
valor decimal(5,2),
dtRegistro datetime default current_timestamp,
constraint fk_Captura_Sensor
foreign key (fkSensor)
references sensor(idSensor)
);

INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, codigoEmpresa) VALUES
('Vazamento gasoso LTDA','VazGas', '01001001000101', '#23355A' ),
('Gas explosivo SS LTDA', 'XPLOD', '02002002000202', '#32456B' ),
('BioGrass Metano LTDA', 'BioGrass', '03003003000303', '#31366C' );
    
INSERT INTO usuario (nome, telefone, email, senha, nivelAcesso) VALUES
('Ketellyn ', '11154897564', 'ketellyn@biograss.com.br', 'senha123#', 'admin'),
('Breno ', '11256478945','breno@vazgaz.com.br', '@321senha', 'admin'),
('Manuela ', '11256987412', 'manuela@sengas.com.br', '1234', 'admin'),
('Davi', '11546897546', 'davi@sengas.com.br', '123#4', 'admin'),
('Gabriela', '11568974589', 'gabriela@sengas.com.br', '12345', 'admin'),
('Vinicius ', '11456987456', 'vinicius@vazgaz.com.br', '$456senha', 'admin');

INSERT INTO usuario (nome, telefone, email, senha, nivelAcesso) VALUES 
('XPTO', '11154568978', 'xpto@gmail.com', '1234', 'cliente');

INSERT INTO endereco (logradouro, numero, complemento, cidade, uf, cep, fkEmpresaEndereco) VALUES
('Avenida das laranjas', 1000, 'abc', 'São Paulo', 'SP', '01234001', 1),
('Avenida das ameixas', 2000, 'abc', 'Minas Gerais', 'MG', '43210100', 2),
('Avenida dos limões', 3000, 'abc', 'Rio de Janeiro', 'RJ', '34120010', 3);

INSERT INTO setor (titulo, fkEmpresaSetor) VALUES
('Captação', 1),
('Extração', 2),
('Armazenagem', 3);

INSERT INTO sensor (titulo, fkSetorSensor) VALUES
('Sensor fabricaçao', 1),
('Sensor tubulação', 2),
('Sensor armazenagem', 3);

INSERT INTO limite (limiteCliente, fkSensorLimite) VALUES
(30.00, 1),
(60.00, 2), 
(10.00, 3);




select * from usuario;


truncate table usuario;
