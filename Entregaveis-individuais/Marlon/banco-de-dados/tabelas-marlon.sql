create database projeto_pi;

use projeto_pi;

create table role (
	id_role int auto_increment primary key,
    nome varchar(50) unique not null,
    descricao varchar(255)
);

create table usuario (
	id_usuario int auto_increment primary key,
    id_role int not null,
    nome varchar(100),
    email varchar(150) unique not null,
    senha varchar(255) not null,
    
    foreign key (id_role) references role (id_role)
);

create table setor (
	id_setor int auto_increment primary key,
    nome varchar(100),
    descricao varchar(255)
);

create table sensor (
	id_sensor int auto_increment primary key,
    id_setor int not null,
    nome varchar(100) not null,
    status boolean,
    
    foreign key (id_setor) references setor (id_setor)
);

create table registro_vazamento (
	id_registro_vazamento int auto_increment primary key,
    id_sensor int not null,
    data_hora_inicio datetime default current_timestamp,
    data_hora_fim datetime,

    foreign key (id_sensor) references sensor (id_sensor)
);