create database sengas;
use sengas;

create table cliente(
idCliente int primary key auto_increment,
nome varchar(50),
cnpj varchar(20),
contrato tinyint
);
 
 create table usuario(
 idUsuario int primary key auto_increment,
 nome varchar(40),
 email varchar(50),
 senha varchar(40),
 permissao int,
 constraint chkSetor 
 check (setor in (1, 2, 3))
 );
 
create table sensor(
idSensor int primary key auto_increment,
localizacao varchar(20),
valor decimal(3, 2),
constraint chkLocal
check (localizacao in('Produção','Armazenamento'))
);


