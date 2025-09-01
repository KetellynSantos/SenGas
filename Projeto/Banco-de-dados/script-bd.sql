CREATE DATABASE sengas;
USE sengas;

CREATE TABLE empresa (
  idEmpresa int primary key auto_increment,
  razaoSocial varchar(80),
  cnpj char(14),
  dtFirma date,
  contratoAtivo tinyint
);

CREATE TABLE usuario (
  idUsuario int primary key auto_increment,
  nome varchar(30),
  sobrenome varchar(30),
  email varchar(80) unique,
  telefone char(11),
  senha varchar(255),
  nivelAcesso tinyint,
  constraint chkNivel check(nivelAcesso >=1 and nivelAcesso <=3)
);

CREATE TABLE endereco (
  idEndereco int primary key auto_increment,
  rua varchar(130),
  numero int,
  complemento varchar(130),
  cidade varchar(100),
  uf char(2),
  cep char(8) not null
);

CREATE TABLE fabrica (
  idFabrica int primary key auto_increment,
  titulo varchar(50)
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