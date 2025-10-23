-- Segunda Versão do banco de dados
USE sengas;

	
CREATE TABLE empresa (
  idEmpresa int primary key auto_increment,
  razaoSocial varchar(80) not null,
  nomeFantasia varchar(80) not null,
  cnpj char(14) unique not null,
  codigoEmpresa varchar(10)
);


-- quem acessa ferramenta
CREATE TABLE usuario (
  idUsuario int primary key auto_increment,
  nome varchar(30) not null,
  sobrenome varchar(120) not null,
  email varchar(80) unique not null,
  telefone char(11) not null,
  senha varchar(255) not null,  
  nivelAcesso tinyint,-- cliente que decide
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
  fkEmpresa int,
   constraint fk_Endereco_Empresa
		foreign key (fkEmpresa)
			references empresa(idEmpresa)
  );


CREATE TABLE setor (
  idSetor int primary key auto_increment,
  titulo varchar(50),
  fkEmpresa int,
  constraint fk_Setor_Empresa
	foreign key (fkEmpresa)
		references empresa(idEmpresa)
);

CREATE TABLE sensor (
  idSensor int primary key auto_increment,
  titulo varchar(50),
  fkSetor int,
  constraint fk_Sensor_Setor
	foreign key (fkSetor)
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
limiteCliente decimal (3,2),
fkcapturaLimite int,
constraint chkcaplimite
foreign key(fkcapturaLimite)
references captura(idCaptura)
);


 
    
INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, contratoAtivo) VALUES
	('Vazamento gasoso LTDA','VazGas', '01001001000101', 1),
	('Gas explosivo SS LTDA', 'XPLOD', '02002002000202', 0),
	('BioGrass Metano LTDA', 'BioGrass', '03003003000303', 1);
    
    select * from empresa;
    
    INSERT INTO endereco (logradouro, numero, complemento, cidade, uf, cep, fkEmpresa) VALUES
	('Avenida das laranjas', 1000, 'abc', 'São Paulo', 'SP', '01234001', 1),
	('Avenida das ameixas', 2000, 'abc', 'Minas Gerais', 'MG', '43210100', 2),
	('Avenida dos limões', 3000, 'abc', 'Rio de Janeiro', 'RJ', '34120010', 3);
    
    select * from endereco;
    
    
    select * from filial;
    

INSERT INTO setor (titulo, fkEmpresa) VALUES
	('Captação', 1),
	('Extração', 2),
	('Armazenagem', 3);
    
    select * from setor;


INSERT INTO usuario (nome, sobrenome, telefone, nivelAcesso, email, senha, fkEmpresa) VALUES
	('Victor', 'Silva', '11290020002', 2, 'victor@biograss.com.br', 'domingofeira', 1),
    ('Igor', 'Dias', '11190010001', 2, 'igor@vazgaz.com.br', 'segundafeira', 2),
	('Bianca', 'Iwata', '11190030003', 1, 'bianca@vazgaz.com.br', 'tercafeira', 3);
    
    select * from usuario;


INSERT INTO sensor (titulo, fkSetor) VALUES
	('Sensor fabricaçao', 1),
	('Sensor tubulação', 2),
	('Sensor armazenagem', 3);
    
    select * from sensor;
    
INSERT INTO captura (valor, fkSensor) VALUES
	(10.07, 1),
	(99.05, 2),
	(24.62, 3);
    
    select * from captura;
    
INSERT INTO limite (limiteCliente) VALUES
(30),
(60), 
(10);

select * from limite;




    
select * from empresa; -- valores
select * from endereco; -- valores
select * from setor;
select * from sensor;
select * from usuario;
select * from captura;


select * from empresa JOIN endereco ON idEmpresa = fkEmpresa
JOIN filial ON idEndereco = fkEndereco
JOIN setor ON idFilial = fkFilial
JOIN sensor ON idSetor = fkSetor
JOIN captura ON idSensor = fkSensor;

select 
	e.razaoSocial AS 'nome';
    

--  SELECT CONCAT COM CASE PARA LIMITE DO SENSOR
SELECT 
    CONCAT(us.nome, ' ', us.sobrenome, ' ') AS ' Dados do funcionário (nome completo)',
    CONCAT(us.telefone, ' ', us.email) AS 'Dados de acesso (telefone e e-mail)',
    us.nivelAcesso AS 'Nível de acesso',
    e.nomeFantasia AS 'Nome Fantasia',
    CONCAT(e.razaoSocial, ' ', cnpj) AS 'Razão social e CNPJ',
CASE
	WHEN contratoAtivo = 0 THEN 'Inativo'
	ELSE 'Ativo'
    END AS 'Situação de Contrato',
    CONCAT(a.logradouro,
            ', ',
            a.numero,
            ' - ',
            a.cidade,
            ' - ',
            a.uf,
            ' - ',
            a.cep) AS 'Endereço completo',
            CASE 
            WHEN 
    a.complemento AS Complemento,
    c.valor AS 'Valor registrado',
    c.dtRegistro AS 'Data do registro',
    s.titulo AS ' Setor',
    sn.titulo AS 'Modelo do Sensor',
    c.dtRegistro AS 'Data e horario da detecção'
FROM
    usuario AS us
	JOIN empresa AS e ON e.idEmpresa = us.fkEmpresa
	JOIN endereco AS a ON e.idEmpresa = a.fkEmpresa
	JOIN filial AS f ON a.idEndereco = f.fkEndereco
	JOIN sensor AS sn ON s.idSetor = sn.fkSetor
	JOIN captura AS c ON sn.idSensor = c.fkSensor;
    
    SELECT 
    CONCAT(us.nome, ' ', us.sobrenome, ' ') AS ' Dados do funcionário (nome completo)',
    CONCAT(us.telefone, ' ', us.email) AS 'Dados de acesso (telefone e e-mail)',
    us.nivelAcesso AS 'Nível de acesso',
    e.nomeFantasia AS 'Nome Fantasia',
    CONCAT(e.razaoSocial, ' ', cnpj) AS 'Razão social e CNPJ',
CASE
	WHEN contratoAtivo = 0 THEN 'Inativo'
	ELSE 'Ativo'
    END AS 'Situação de Contrato',
    CONCAT(a.logradouro,
            ', ',
            a.numero,
            ' - ',
            a.cidade,
            ' - ',
            a.uf,
            ' - ',
            a.cep) AS 'Endereço completo',
    a.complemento AS Complemento,
    c.valor AS 'Valor registrado',
    c.dtRegistro AS 'Data do registro',
    s.titulo AS ' Setor',
    sn.titulo AS 'Modelo do Sensor',
    c.dtRegistro AS 'Data e horario da detecção'
FROM
    usuario AS us
	JOIN empresa AS e ON e.idEmpresa = us.fkEmpresa
	JOIN endereco AS a ON e.idEmpresa = a.fkEmpresa
	JOIN filial AS f ON a.idEndereco = f.fkEndereco
	JOIN sensor AS sn ON s.idSetor = sn.fkSetor
	JOIN captura AS c ON sn.idSensor = c.fkSensor;