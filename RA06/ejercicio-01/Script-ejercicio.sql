create table partidos(
	cpartidos integer not null,
	siglas varchar(30) not null,
	denominacion varchar(100) not null,
	votos integer,
	encanyos integer,
	constraint p_partidos
	primary key (cpartidos),
	constraint cpartidos_condition
	check(cpartidos > 150000)
);

create table candidato (
	dni varchar(10) not null,
	nombre varchar(30) not null,
	apellido varchar(50) not null,
	posicionLista integer default 1 not null,
	cpartidos integer not null,
	constraint p_candidato
	primary key (dni),
	constraint f_key
	foreign key (cpartidos)
	references partidos(cpartidos)
)