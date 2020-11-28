create table Consulta(
	id bigint not null auto_increment,
	nomepaciente varchar(256) not null,
	loginpaciente varchar(20) not null,
	nomemedico varchar(256) not null,
	loginmedico varchar(20),
 	datahora varchar(20) not null,
	PRIMARY KEY (id),
	FOREIGN KEY (nomepaciente) REFERENCES Paciente(nome),
	FOREIGN KEY (loginpaciente) REFERENCES Paciente(login),
	FOREIGN KEY (nomemedico) REFERENCES Medico(nome),
	FOREIGN KEY (loginmedico) REFERENCES Medico(login)
	
	
	
	);

insert into Consulta(nomepaciente, loginpaciente, nomemedico, loginmedico, datahora) values ('Angela', 'paciente4', 'Ricardo', 'medico1', '28/11/2020 14:30');
insert into Consulta(nomepaciente, loginpaciente, nomemedico, loginmedico, datahora) values ('Angela', 'paciente4', 'Ricardo', 'medico1', '04/12/2020 14:30');