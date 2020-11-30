create database Consultorio;
use Consultorio;

create table Usuario(
	nome varchar(256) not null,
	login varchar(20) not null unique,
	senha varchar(64) not null,
	papel varchar(10),
	primary key (login)
	
	);

create table Medico(
	especialidade varchar(30),
	nome varchar(256) not null,
	login varchar(20) not null unique,
	senha varchar(64) not null,
	crm varchar(20) not null,
	primary key (login),
	FOREIGN KEY (nome) REFERENCES Usuario(nome),
	FOREIGN KEY (login) REFERENCES Usuario(login),
	FOREIGN KEY (senha) REFERENCES Usuario(senha)
	
	
	);
	
	
create table Paciente(
	nome varchar(256) not null,
	login varchar(20) not null unique,
	senha varchar(64) not null,
	cpf varchar(15) not null,
	telefone varchar(10) not null,
	sexo varchar(15) not null,
	nascimento varchar(10) not null,
	primary key (login),
	FOREIGN KEY (nome) REFERENCES Usuario(nome),
	FOREIGN KEY (login) REFERENCES Usuario(login),
	FOREIGN KEY (senha) REFERENCES Usuario(senha)
	
	
	);
	
create table Consulta(
	
	nomepaciente varchar(256) not null,
	loginpaciente varchar(20) not null,
	cpfpaciente varchar(15) not null,
	nomemedico varchar(256) not null,
	loginmedico varchar(20),
 	datahora varchar(20) not null,
	PRIMARY KEY (loginpaciente, datahora),
	FOREIGN KEY (nomepaciente) REFERENCES Paciente(nome),
	FOREIGN KEY (cpfpaciente) REFERENCES Paciente(cpf),
	FOREIGN KEY (nomemedico) REFERENCES Medico(nome),
	FOREIGN KEY (loginmedico) REFERENCES Medico(login)
	
	
	
	);

insert into Usuario(nome, login, senha, papel) values ('Administrador',
'admin', 'admin', 'ADMIN');
insert into Usuario(nome, login, senha, papel) values ('Jose', 'jose@email',
'senha', 'PACIENTE');
insert into Usuario(nome, login, senha, papel) values ('Maria', 'maria@email',
'senha', 'PACIENTE');
insert into Usuario(nome, login, senha, papel) values ('Miguel', 'miguel@email',
'senha', 'PACIENTE');
insert into Usuario(nome, login, senha, papel) values ('Angela', 'angela@email',
'senha', 'PACIENTE');


insert into Usuario(nome, login, senha, papel) values ('Ricardo', 'ricardo@email',
'senha', 'MEDICO');
insert into Usuario(nome, login, senha, papel) values ('Diego', 'diego@email',
'senha', 'MEDICO');
insert into Usuario(nome, login, senha, papel) values ('Elisangela', 'elisangela@email',
'senha', 'MEDICO');
insert into Usuario(nome, login, senha, papel) values ('Bruna', 'bruna@email',
'senha', 'MEDICO');

insert into Medico(nome, login, senha, especialidade, crm) values ('Ricardo', 'ricardo@email',
'senha', 'Clinico Geral', '45635875373');
insert into Medico(nome, login, senha, especialidade, crm) values ('Diego', 'diego@email',
'senha', 'Gastro', '45655875373');
insert into Medico(nome, login, senha, especialidade, crm) values ('Elisangela', 'elisangela@email',
'senha', 'Otorrino', '32235875373');
insert into Medico(nome, login, senha, especialidade, crm) values ('Bruna', 'bruna@email',
'senha', 'Oftamologista', '00635875374');


insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Jose', 'jose@email',
'senha', '05935875370', '323249787', 'Masculino', '10/01/1989' );
insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Maria', 'maria@email',
'senha', '15935875371', '323259786', 'Feminino', '06/02/1994' );
insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Miguel', 'miguel@email',
'senha', '25935875372', '323359785', 'Masculino', '09/06/1990' );
insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Angela', 'angela@email',
'senha', '35935875373', '323360787', 'Feminino', '12/10/2001');



insert into Consulta(nomepaciente, loginpaciente, cpfpaciente, nomemedico, datahora) values ('Angela', 'angela@email', '35935875373', 'ricardo@email', '28/11/2020 14:30');
insert into Consulta(nomepaciente, loginpaciente, cpfpaciente, nomemedico, datahora) values ('Angela', 'angela@email', '35935875373', 'ricardo@email', '04/12/2020 14:30');