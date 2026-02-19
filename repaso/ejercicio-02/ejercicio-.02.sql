drop table if exists cochera;
drop table if exists tren;
drop table if exists linea;
drop table if exists ubica;
drop table if exists estacion;

create table cochera (
	id_cochera char(3) primary key

);

create table linea(
	id_linea char(5) primary key
);

create table tren (
	id_tren char(3) primary key,
	id_cochera char(3),
	id_linea char(5),
	constraint fk_cochera_tren
	foreign key (id_cochera)
	references cochera(id_cochera),
	
	constraint fk_linea_tren
	foreign key (id_linea)
	references linea(id_linea)
);

create table estacion (
	id_estacion char(5) primary key
);

create table ubica (
	num_orden char(5),
	id_linea char(5),
	id_estacion char(5),
	
	constraint fk_linea_ubica
	foreign key(id_linea)
	references linea(id_linea),
	
	constraint fk_estacion_ubica
	foreign key (id_estacion)
	references estacion(id_estacion),
	
	
	constraint pk_ubica 
	primary key (id_linea, id_estacion)
)