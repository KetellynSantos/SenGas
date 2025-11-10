-- Nesta versão, corrigimos os tipos de entidades, divididos em fortes e fracas.

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
    nivelAcesso tinyint,
    constraint chkNivel check (nivelAcesso >= 1 and nivelAcesso <= 5),
    constraint chkEmpresa_usuario
     foreign key (fkEmpresaUsuario)
        references empresa (idEmpresa)
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
  limite DECIMAL(5,2),
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
  idCaptura int auto_increment,
  fkSensor int,
  constraint pk_Captura_Sensor
  primary key (idCaptura, fkSensor),
  valor decimal(5,2), -- mudamos o valor decimal 
  dtRegistro datetime default current_timestamp,
  constraint fk_Captura_Sensor
	foreign key (fkSensor)
		references sensor(idSensor)
);

CREATE TABLE media (
    media DECIMAL(5,2),
    fkCaptura INT,
    fkSensor INT,
    constraint pkComposta PRIMARY KEY (fkCaptura, fkSensor),
    Foreign Key (fkCaptura) REFERENCES captura(idCaptura),
    Foreign Key (fkSensor) REFERENCES sensor(idSensor)
);
 
    
INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, codigoEmpresa) VALUES -- Removido o campo de contratoativo neste insert
	('Vazamento gasoso LTDA','VazGas', '01001001000101', '#23355A' ),
	('Gas explosivo SS LTDA', 'XPLOD', '02002002000202', '#32456B' ),
	('BioGrass Metano LTDA', 'BioGrass', '03003003000303', '#31366C' );
    
    select * from empresa;
    
     INSERT INTO usuario (nome, telefone, nivelAcesso, email, senha, fkEmpresaUsuario) VALUES
	('Ketellyn Leticia', '11290020002', 2, 'ketellyn@biograss.com.br', 'senha123#', 1),
    ('Breno Alves', '11190010001', 2, 'breno@vazgaz.com.br', '@321senha', 2),
	('Vinicius Antonio', '11190030003', 1, 'vinicius@vazgaz.com.br', '$456senha', 3);
    
    select * from usuario;
    
    
    INSERT INTO endereco (logradouro, numero, complemento, cidade, uf, cep, fkEmpresaEndereco) VALUES
	('Avenida das laranjas', 1000, 'abc', 'São Paulo', 'SP', '01234001', 1),
	('Avenida das ameixas', 2000, 'abc', 'Minas Gerais', 'MG', '43210100', 2),
	('Avenida dos limões', 3000, 'abc', 'Rio de Janeiro', 'RJ', '34120010', 3);
    
    select * from endereco;
    

INSERT INTO setor (titulo, fkEmpresaSetor) VALUES
	('Captação', 1),
	('Extração', 2),
	('Armazenagem', 3);
    
    select * from setor;





INSERT INTO sensor (titulo, fkSetorSensor) VALUES
	('Sensor fabricaçao', 1),
	('Sensor tubulação', 2),
	('Sensor armazenagem', 3);
    
    select * from sensor;
    
INSERT INTO captura (valor, fkSensor) VALUES
	(10.07, 1),
	(99.05, 2),
	(24.62, 3);
    
    select * from captura;
    
INSERT INTO limite (limiteCliente, fkSensorLimite) VALUES
(30.00, 1),
(60.00, 2), 
(10.00, 3);

select * from limite;

-- select's com join, feitos especificamente para testes (verificar se os dados estavam aparecendo corretamente nas ligações das tabelas)
SELECT 
    *
FROM
    usuario
        JOIN
    empresa ON empresa.idEmpresa = usuario.fkEmpresaUsuario
        JOIN
    endereco ON empresa.idEmpresa = endereco.fkEmpresaEndereco
        JOIN
    setor ON setor.fkEmpresaSetor = empresa.idEmpresa
        JOIN
    sensor ON sensor.fkSetorSensor = setor.idSetor
        JOIN
    captura ON captura.fkSensor = sensor.idSensor
        JOIN
    limite ON limite.fkSensorLimite = sensor.idSensor;


    

--  SELECT CONCAT COM CASE PARA LIMITE DO SENSOR
-- foi tirada a parte da tabela excluida filial e adicionado uma condição para ter um alerta quando o sensor captar algo acima do limite imposto.
    
    SELECT 
    us.nome AS ' Dados do funcionário (nome completo)',
    CONCAT(us.telefone, ' ', us.email) AS 'Dados para contato (telefone e e-mail)',
    us.nivelAcesso AS 'Nível de acesso',
    e.nomeFantasia AS 'Nome Fantasia',
    CONCAT(e.razaoSocial, ' ', cnpj) AS 'Razão social e CNPJ',
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
    l.limiteCliente AS 'Limite definido',
       CASE
        WHEN c.valor > l.limiteCliente THEN 'ALERTA!'
        ELSE 'DENTRO DOS CONFORMES'
    END AS 'STATUS',
    c.dtRegistro AS 'Data do registro',
    s.titulo AS 'Setor',
    sn.titulo AS 'Modelo do Sensor',
    c.dtRegistro AS 'Data e horario da detecção'
FROM
    usuario AS us
        JOIN
    empresa AS e ON us.fkEmpresaUsuario = e.idEmpresa
        JOIN
    endereco AS a ON a.fkEmpresaEndereco = e.idEmpresa
        JOIN
    setor AS s ON fkEmpresaSetor = e.idEmpresa
        JOIN
    sensor AS sn ON sn.fkSetorSensor = s.idSetor 
        JOIN
    captura AS c ON c.fkSensor = sn.idSensor
        JOIN
    limite AS l ON l.fkSensorLimite = sn.idSensor ;
    
    