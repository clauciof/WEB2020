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
	primary key (login),
	FOREIGN KEY (nome) REFERENCES Usuario(nome),
	FOREIGN KEY (login) REFERENCES Usuario(login),
	FOREIGN KEY (senha) REFERENCES Usuario(senha)
	
	
	);
	
	
create table Paciente(
	nome varchar(256) not null,
	login varchar(20) not null unique,
	senha varchar(64) not null,
	primary key (login),
	FOREIGN KEY (nome) REFERENCES Usuario(nome),
	FOREIGN KEY (login) REFERENCES Usuario(login),
	FOREIGN KEY (senha) REFERENCES Usuario(senha)
	
	
	);
	
create table Consulta(
	id bigint not null auto_increment,
	nome_paciente varchar(256) not null,
	login_paciente varchar(20) not null,
	nome_medico varchar(256) not null,
	login_medico varchar(20) not null,
	primary key (id),
	FOREIGN KEY (nome_paciente) REFERENCES Paciente(nome),
	FOREIGN KEY (login_paciente) REFERENCES Paciente(login),
	FOREIGN KEY (nome_medico) REFERENCES Medico(nome),
	FOREIGN KEY (login_medico) REFERENCES Medico(login)
	
	
	
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

insert into Medico(nome, login, senha, especialidade) values ('Ricardo', 'medico1',
'medico1', 'Clinico Geral');
insert into Medico(nome, login, senha, especialidade) values ('Diego', 'medico2',
'medico2', 'Gastro');
insert into Medico(nome, login, senha, especialidade) values ('Elisangela', 'medico3',
'medico3', 'Otorrino');
insert into Medico(nome, login, senha, especialidade) values ('Bruna', 'medico4',
'medico4', 'Oftamologista');


insert into Paciente(nome, login, senha) values ('Jose', 'paciente1',
'paciente1');
insert into Paciente(nome, login, senha) values ('Maria', 'paciente2',
'paciente2');
insert into Paciente(nome, login, senha) values ('Miguel', 'paciente3',
'paciente3');
insert into Paciente(nome, login, senha) values ('Angela', 'paciente4',
'paciente4');