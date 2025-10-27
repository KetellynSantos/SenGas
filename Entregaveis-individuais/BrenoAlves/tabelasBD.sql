-- Nesta versão, corrigimos os tipos de entidades, divididos em fortes e fracas.

create database sengas;
use sengas;

create table empresa (
    idEmpresa int primary key auto_increment,
    razaoSocial varchar(80) not null,
    nomeFantasia varchar(80) not null,
    cnpj char(14) unique not null,
    codigoEmpresa varchar(10)
);

create table usuario (
    idUsuario int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(80) unique not null,
    telefoneCelular char(11),
    senha varchar(255) not null,
    nivelAcesso tinyint,
	fkEmpresaUsuario int,
    constraint chkNivel check (nivelAcesso >= 1 and nivelAcesso <= 5),
    constraint chkEmpresaUsuario
     foreign key (fkEmpresaUsuario)
        references empresa (idEmpresa)
);

create table endereco (
  idEndereco int primary key auto_increment,
  logradouro varchar(130) not null, 
  numero varchar(10) not null,
  complemento varchar(130),
  cidade varchar(100) not null,
  uf char(2) not null,
  cep char(8) not null,
   fkEmpresaEndereco int,
   constraint chkEnderecoEmpresa
		foreign key (fkEmpresaEndereco)
			references empresa(idEmpresa)
);
  
create table setor (
  idSetor int primary key auto_increment,
  titulo varchar(50),
    fkEmpresaSetor int,
  constraint chkEmpresaSetor
	foreign key (fkEmpresaSetor)
		references empresa(idEmpresa)
);

create table sensor (
  idSensor int primary key auto_increment,
  titulo varchar(50), 
  fkSetorSensor int, 
  constraint chkSensorSetor
	foreign key (fkSetorSensor)
		references setor(idSetor)
);

create table limite (
idLimite int auto_increment,
fkSensorLimite int,
constraint pkSensorLimite
	primary key (idLimite, fkSensorLimite),
limiteCliente decimal (5,2),
constraint chkSensorLimite
	foreign key(fkSensorLimite)
		references Sensor(idSensor)
);

create table captura (
  idCaptura int auto_increment,
  fkSensorCaptura int,
  constraint pkCapturaSensor
  primary key (idCaptura, fkSensorCaptura),
  valor decimal(5,2), -- mudamos o valor decimal 
  dtRegistro datetime default current_timestamp,
  constraint chkCapturaSensor
	foreign key (fkSensorCaptura)
		references sensor(idSensor)
);

	insert into empresa (razaoSocial, nomeFantasia, cnpj, codigoEmpresa) values -- Removido o campo de contratoativo neste insert
	('Vazamento gasoso LTDA','VazGas', '01001001000101', '#23355A' ),
	('Gas explosivo SS LTDA', 'XPLOD', '02002002000202', '#32456B' ),
	('BioGrass Metano LTDA', 'BioGrass', '03003003000303', '#31366C' );
    
    select * from empresa;
    
	insert into usuario (nome, telefoneCelular, nivelAcesso, email, senha, fkEmpresaUsuario) values
	('Ketellyn Leticia', '11290020002', 2, 'ketellyn@biograss.com.br', 'senha123#', 1),
    ('Breno Alves', '11190010001', 2, 'breno@vazgaz.com.br', '@321senha', 2),
	('Vinicius Antonio', '11190030003', 1, 'vinicius@vazgaz.com.br', '$456senha', 3);
    
    select * from usuario;
    
	insert into endereco (logradouro, numero, complemento, cidade, uf, cep, fkEmpresaEndereco) values
	('Avenida das laranjas', 1000, 'abc', 'São Paulo', 'SP', '01234001', 1),
	('Avenida das ameixas', 2000, 'abc', 'Minas Gerais', 'MG', '43210100', 2),
	('Avenida dos limões', 3000, 'abc', 'Rio de Janeiro', 'RJ', '34120010', 3);
    
    select * from endereco;
    
	insert into setor (titulo, fkEmpresaSetor) values
	('Captação', 1),
	('Extração', 2),
	('Armazenagem', 3);
    
    select * from setor;

	insert into sensor (titulo, fkSetorSensor) values
	('Sensor fabricaçao', 1),
	('Sensor tubulação', 2),
	('Sensor armazenagem', 3);
    
    select * from sensor;
    
	insert into captura (valor, fkSensorCaptura) values
	(10.07, 1),
	(99.05, 2),
	(24.62, 3);
    
    select * from captura;
    
	insert into limite (limiteCliente, fkSensorLimite) values
	(30.00, 1),
	(60.00, 2), 
	(10.00, 3);

	select * from limite;

-- select's com join, feitos especificamente para testes (verificar se os dados estavam aparecendo corretamente nas ligações das tabelas)

	select * from empresa join usuario on idEmpresa = fkEmpresaUsuario; -- Empresa com Usuario
	select * from empresa join endereco on idEmpresa = fkEmpresaEndereco; -- Empresa com Endereço
	select * from empresa join setor on idEmpresa = fkEmpresaSetor; -- Empresa com setor
	select * from setor join sensor on idSetor = fkSetorSensor; -- Setor com Sensor
	select * from sensor join captura on idSensor = fkSensorCaptura; -- Sensor com Captura
	select * from sensor join limite on idSensor = fkSensorLimite; -- Sensor com Limite
    

--  SELECT CONCAT COM CASE PARA LIMITE DO SENSOR
-- foi tirada a parte da tabela excluida filial e adicionado uma condição para ter um alerta quando o sensor captar algo acima do limite imposto.
    
    select 
    us.nome as ' Dados do funcionário (nome completo)',
    concat(us.telefoneCelular, ' ', us.email) as 'Dados para contato (telefone e e-mail)',
    us.nivelAcesso as 'Nível de acesso',
    e.nomeFantasia as 'Nome Fantasia',
    concat(e.razaoSocial, ' ', cnpj) as 'Razão social e CNPJ',
    concat(a.logradouro,
            ', ',
            a.numero,
            ' - ',
            a.cidade,
            ' - ',
            a.uf,
            ' - ',
            a.cep) as 'Endereço completo',
    a.complemento as Complemento,
    c.valor as 'Valor registrado',
    l.limiteCliente as 'Limite definido',
       case
        when c.valor > l.limiteCliente then 'ALERTA!'
        else 'DENTRO DOS CONFORMES'
    end as 'STATUS',
    c.dtRegistro as 'Data do registro',
    s.titulo as 'Setor',
    sn.titulo as 'Modelo do Sensor',
    c.dtRegistro as 'Data e horario da detecção'
from
    usuario as us
        join
    empresa as e on us.fkEmpresaUsuario = e.idEmpresa
        join
    endereco as a on a.fkEmpresaEndereco = e.idEmpresa
        join
    setor as s on fkEmpresaSetor = e.idEmpresa
        join
    sensor as sn on sn.fkSetorSensor = s.idSetor 
        join
    captura as c on c.fkSensorCaptura = sn.idSensor
        join
    limite as l on l.fkSensorLimite = sn.idSensor ;
    
    