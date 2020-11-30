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
	id bigint not null auto_increment,
	nomepaciente varchar(256) not null,
	loginpaciente varchar(20) not null,
	cpfpaciente varchar(15) not null,
	nomemedico varchar(256) not null,
	loginmedico varchar(20),
 	datahora varchar(20) not null,
	PRIMARY KEY (id),
	FOREIGN KEY (nomepaciente) REFERENCES Paciente(nome),
	FOREIGN KEY (cpfpaciente) REFERENCES Paciente(cpf),
	FOREIGN KEY (nomemedico) REFERENCES Medico(nome),
	FOREIGN KEY (loginmedico) REFERENCES Medico(login)
	
	
	
	);

insert into Usuario(nome, login, senha, papel) values ('Administrador',
'admin', 'admin', 'ADMIN');
insert into Usuario(nome, login, senha, papel) values ('Jose', 'paciente1',
'paciente1', 'PACIENTE');
insert into Usuario(nome, login, senha, papel) values ('Maria', 'paciente2',
'paciente2', 'PACIENTE');
insert into Usuario(nome, login, senha, papel) values ('Miguel', 'paciente3',
'paciente3', 'PACIENTE');
insert into Usuario(nome, login, senha, papel) values ('Angela', 'paciente4',
'paciente4', 'PACIENTE');


insert into Usuario(nome, login, senha, papel) values ('Ricardo', 'medico1',
'medico1', 'MEDICO');
insert into Usuario(nome, login, senha, papel) values ('Diego', 'medico2',
'medico2', 'MEDICO');
insert into Usuario(nome, login, senha, papel) values ('Elisangela', 'medico3',
'medico3', 'MEDICO');
insert into Usuario(nome, login, senha, papel) values ('Bruna', 'medico4',
'medico4', 'MEDICO');

insert into Medico(nome, login, senha, especialidade, crm) values ('Ricardo', 'medico1',
'medico1', 'Clinico Geral', '45635875373');
insert into Medico(nome, login, senha, especialidade, crm) values ('Diego', 'medico2',
'medico2', 'Gastro', '45655875373');
insert into Medico(nome, login, senha, especialidade, crm) values ('Elisangela', 'medico3',
'medico3', 'Otorrino', '32235875373');
insert into Medico(nome, login, senha, especialidade, crm) values ('Bruna', 'medico4',
'medico4', 'Oftamologista', '00635875374');


insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Jose', 'paciente1',
'paciente1', '05935875370', '323249787', 'Masculino', '10/01/1989' );
insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Maria', 'paciente2',
'paciente2', '15935875371', '323259786', 'Feminino', '06/02/1994' );
insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Miguel', 'paciente3',
'paciente3', '25935875372', '323359785', 'Masculino', '09/06/1990' );
insert into Paciente(nome, login, senha, cpf, telefone, sexo, nascimento) values ('Angela', 'paciente4',
'paciente4', '35935875373', '323360787', 'Feminino', '12/10/2001');



insert into Consulta(nomepaciente, loginpaciente, cpfpaciente, nomemedico, loginmedico, datahora) values ('Angela', 'paciente4', '35935875373', 'Ricardo', 'medico1', '28/11/2020 14:30');
insert into Consulta(nomepaciente, loginpaciente, cpfpaciente, nomemedico, loginmedico, datahora) values ('Angela', 'paciente4', '35935875373', 'Ricardo', 'medico1', '04/12/2020 14:30');