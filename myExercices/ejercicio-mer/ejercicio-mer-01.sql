drop table if exists alquila;

create table pelicula (
	cod_pelicula serial primary key,
	titulo varchar(50),
	director varchar(20),
	anyo_estreno date,
	genero char(1),
	constraint genero_options
	check(genero in ('M', 'F'))
);

create table socio (
	num_socio serial primary key,
	nombre varchar(20),
	apellidos varchar(30),
	fecha_alta date
);

create table alquila (
	cod_pelicula serial,
	num_socio serial,
	fecha_alquiler date,
	fecha_devolucion date,
	
	constraint fk_pelicula
	foreign key (cod_pelicula)
	references pelicula(cod_pelicula),
	
	constraint fk_socio
	foreign key (num_socio)
	references socio(num_socio),
	
	constraint pk_alquila
	primary key(fecha_alquiler, fecha_devolucion)
);