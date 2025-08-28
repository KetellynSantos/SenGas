create database sen_gas;
use sen_gas;

create table empresas (
id int primary key auto_increment,
nome_empresa varchar(25) not null,
cnpj char(14),
contrato varchar(10) constraint Chkcontrato check (contrato = 'ativo' or contrato = 'vencido'),
endereço varchar(40),
cep char(8),
número char(4));

create table funcionario (
id int primary key auto_increment,
nome_responsavel varchar(40) not null constraint Chkresponsavel Check (nome_responsavel in('encarregado', 'funcionario')),
email varchar(30),
telefone varchar(30));

create table arduino (
id int primary key auto_increment,
valor decimal(5,2),
data_registro datetime default current_timestamp);

