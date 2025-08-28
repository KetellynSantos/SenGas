create database sengas;
use sengas;

create table cliente (
  idCliente int primary key auto_increment,
  razaoSocial varchar(80),
  cnpj char(14),
  dtFirma date,
  contratoAtivo tinyint
);

create table funcionario (
  idFuncionario int primary key auto_increment,
  nome varchar(30),
  sobrenome varchar (30),
  email varchar(80) unique,
  telefone char(11),
  nivelAcesso int,
  constraint chkNivel check(nivelAcesso >=1 and nivelAcesso <= 3)
);

create table endereco (
idEndereco int primary key auto_increment,
rua varchar(130),
cep char(8),
numero int,
complemento varchar(130)
);

create table fabrica (
  idFabrica int primary key auto_increment,
  titulo varchar(50)
);

create table setor (
  idSetor int primary key auto_increment,
  titulo varchar(50)
);

create table sensor (
  idSensor int primary key auto_increment,
  titulo varchar(50)
);

create table captura (
  idCaptura int primary key auto_increment,
  valor decimal(5,2),
  dtRegistro datetime default current_timestamp
);