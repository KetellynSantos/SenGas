create database sengas;

use sengas;

create table empresa (
	id_empresa_cliente int auto_increment primary key,
    razao_social varchar(100),
    cnpj char(14),
    data_firma_contrato date,
    status_contrato tinyint

	constraint chkStatusContrato check (status_contrato in (0, 1))
);

create table usuario (
	id_usuario int auto_increment primary key,
    nome varchar(100),
    email varchar(150) unique not null,
    senha varchar(255) not null,
	nivel_acesso tinyint,
    
    constraint chkNivelAcesso check (nivel_acesso in (1, 2, 3))
);

create table endereco (
	id_endereco int auto_increment primary key,
    cep char(8) not null,
    rua varchar(150),
    numero varchar(12),
    bairro varchar(150),
    cidade varchar(150),
    estado char(2)
);

create table filial (
	id_filial int auto_increment primary key,
    nome varchar(100)
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

insert into empresa (razao_social, cnpj, data_firma_contrato, status_contrato) values
	('VazGaz', '32763001261331', '2022-07-13', 1),
	('FloatGas', '82958550072352', '2021-09-18', 1),
	('VZGas', '34778576757706', '2021-09-03', 1);

insert into usuario (nome, email, senha, nivel_acesso) values
	('Bianca', 'Iwata', 'bianca@vazgaz', 1),
	('Clara', 'Garcia', 'clara@vazgaz', 2),
	('Igor', 'Dias', 'igor@vazgaz', 3),
	('Marlon', 'Souza', 'marlon@floatgas', 3),
	('Mateus', 'Queiroz', 'mateus@floatgas', 2),
	('Ricardo', 'Perdigão', 'ricardo@vzgaz', 1),
	('Victor', 'Lima', 'victor@vzgaz', 2);

insert into filial (nome) values
	('Fontinhas-da Penha'),
	('Martins LTDA'),
	('Castanho, Gomes e Paes'),
	('de Oliveira Comércio'),
	('Castanho S.A.'),
	('Vidal-Velasques');

insert into endereco (cep, rua, numero, bairro, cidade, estado) values
	('69302711', 'Avenida Marcos', '084', 'Candiba', 'Taquarivaí', 'SC'),
	('45328373', 'Viela Benício', '085', 'Queluz', 'Tabocas do Brejo Velho', 'MS'),
	('10843152', 'Marginal Sophia Alves', '284', 'Matias Olímpio', 'Caçador', 'SE'),
	('74704448', 'Avenida Helena', '335', 'Capim Branco', 'Araguacema', 'MS');
    
insert into setor (nome, descricao) values
	('Captação', 'Coleta de resíduos orgânicos que servirão de matéria prima para produção'),
	('Extração', 'Extração da matéria prima para o biodigestor'),
	('Armazenagem', 'Armazena temporariamente o gás em tanques'),
	('Purificação', 'Purificação do biogás para transformação em biometano');
    
insert into sensor (nome) values 
	('MQ201-1'),
	('MQ202-1'),
	('MQ203-2'),
	('MQ204-3'),
	('MQ205-3'),
	('MQ206-3'),
	('MQ207-4');
    
insert into registro_monitoramento (valor, data_hora_registro) values
	(85.75, '2025-08-30 11:30:25'),
	(5.32, '2025-08-29 22:54:44'),
	(1.12, '2025-08-23 14:27:44'),
	(64.01, '2025-08-21 23:59:24'),
	(28.82, '2025-08-20 00:50:54'),
	(41.32, '2025-08-07 00:24:44'),
	(21.20, '2025-08-22 14:19:30'),
	(75.50, '2025-08-04 01:18:39'),
	(89.02, '2025-08-20 10:02:00'),
	(44.14, '2025-08-04 06:55:48'),
	(6.83, '2025-08-12 18:00:13'),
	(81.46, '2025-08-26 04:59:09'),
	(27.32, '2025-08-04 09:51:54'),
	(27.56, '2025-08-21 06:40:44'),
	(71.52, '2025-08-13 19:31:22'),
	(14.28, '2025-08-25 00:16:24'),
	(9.24, '2025-08-10 19:05:22'),
	(12.23, '2025-08-14 10:41:16'),
	(53.46, '2025-08-21 14:14:53'),
	(77.65, '2025-08-22 19:34:49');

insert into registro_vazamento (data_hora_inicio, data_hora_fim) values
	('2025-08-18 18:47:40', '2025-08-18 20:46:40'),
	('2025-08-09 16:00:40', '2025-08-09 17:41:40'),
	('2025-08-12 08:34:40', '2025-08-12 08:42:40'),
	('2025-08-22 03:13:40', '2025-08-22 04:37:40'),
	('2025-08-10 10:49:40', '2025-08-10 11:05:40'),
	('2025-08-21 19:31:40', '2025-08-21 19:35:40'),
	('2025-08-12 20:17:40', '2025-08-12 21:00:40'),
	('2025-08-09 17:57:40', '2025-08-09 18:13:40'),
	('2025-08-06 19:18:40', '2025-08-06 20:17:40'),
	('2025-08-12 17:48:40', '2025-08-12 18:06:40');

select 
	concat(razao_social, ' - ', cnpj) as 'Razão Social e CNPJ',
    case
		when status_contrato = 1 then 'Ativo'
        else 'Inativo'
    end
    as 'Situação contrato'
from empresa;

select * from registro_monitoramento 
	order by data_hora_registro desc;

