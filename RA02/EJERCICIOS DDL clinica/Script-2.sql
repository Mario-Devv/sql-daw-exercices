create table mascotas(
	cod_mascota numeric(5) primary key,
	nombre varchar(20),
	especie varchar(15),
	raza varchar(15),
	fecha_nacimiento date,
	peso numeric(5,2),
	observaciones varchar(100),
	dni_propietario varchar(10),
	cod_veterinario numeric(4)
);

create table mascotasC(
	cod_mascota numeric(5),
	nombre varchar(20),
	especie varchar(15),
	raza varchar(15),
	fecha_nacimiento date,
	peso numeric(5,2),
	observaciones varchar(100),
	dni_propietario varchar(10),
	cod_veterinario numeric(4),
	
	constraint pk_mascotasC
	primary key (cod_mascota)
);

create table propietarios