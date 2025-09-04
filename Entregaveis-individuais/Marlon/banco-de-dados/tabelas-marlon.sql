create database sengas;

use sengas;

create table usuario (
	id_usuario int auto_increment primary key,
    nome varchar(100),
    email varchar(150) unique not null,
    senha varchar(255) not null,
	nivel_acesso tinyint,
    
    constraint chkNivelAcesso check (nivel_acesso in (1, 2, 3))
);

create table empresa_cliente (
	id_empresa_cliente int auto_increment primary key,
    razao_social varchar(100),
    cnpj char(14),
    data_firma_contrato date,
    status_contrato tinyint

	constraint chkStatusContrato check (status_contrato in (0, 1))
);

create table filial (
	id_filial int auto_increment primary key,
    nome varchar(100)
);

create table endereco_filial (
	id_endereco int auto_increment primary key,
    cep char(8) not null,
    rua varchar(150),
    numero varchar(12),
    bairro varchar(150),
    cidade varchar(150),
    estado char(2)
);

create table setor (
	id_setor int auto_increment primary key,
    nome varchar(100),
    descricao varchar(255)
);

create table sensor (
	id_sensor int auto_increment primary key,
    nome varchar(100)
);

create table registro_monitoramento (
	id_registro_monitoramento int auto_increment primary key,
	valor decimal(5, 2),
    data_hora_registro datetime default current_timestamp
);

create table registro_vazamento (
	id_registro_vazamento int auto_increment primary key,
    data_hora_inicio datetime default current_timestamp,
    data_hora_fim datetime
);
    