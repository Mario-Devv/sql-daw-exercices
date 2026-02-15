drop table if exists medico;
drop table if exists paciente;
drop table if exists consulta;
drop table if exists salas;
drop table if exists ingresa;

create table medico (
	num_colegiado integer primary key,
	nombre varchar(20),
	apellido varchar(30),
	especialidad varchar(20),
	telefono varchar(15)
);

create table paciente (
	num_ss integer primary key,
	nombre varchar(20),
	apellidos varchar(30),
	fecha_nacimiento date,
	calle varchar(20),
	piso varchar(5),
	cod_postal integer,
	ciudad varchar(15),
	telefono varchar(15)
);

create table consulta (
	fecha_hora timestamp,
	diagnostico varchar(100),
	tratamiento varchar (50),
	
	num_colegiado integer,
	num_ss integer,
	
	constraint fk_medico
	foreign key (num_colegiado)
	references medico(num_colegiado)
	on delete cascade
	on update cascade,
	
	constraint fk_paciente
	foreign key (num_ss)
	references paciente(num_ss)
	on delete cascade 
	on update cascade,
	
	constraint pk_consulta
	primary key(fecha_hora, num_ss, num_colegiado)
);

create table salas (
	num_sala integer primary key,
	planta integer,
	num_camas integer
);

create table ingresa (
	fecha_ingreso date,
	fecha_alta date,
	
	num_ss integer,
	num_sala integer,
	
	constraint fk_paciente_ingresa
	foreign key (num_ss)
	references paciente(num_ss)
	on delete cascade
	on update cascade,
	
	constraint fk_salas_ingresa
	foreign key (num_sala)
	references salas(num_sala)
	on delete cascade 
	on update cascade,
	
	constraint fk_ingresa 
	primary key(fecha_ingreso, num_ss)
);

