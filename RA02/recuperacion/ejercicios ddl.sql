drop table if exists bloquepisos;

begin;
/*Crear una tabla BLOQUEPISOS, y define su clave principal (con restricción de columna y otra
opción con restricción de tabla), con los siguientes datos:
a. Calle: de longitud 30
b. Número: longitud 3
c. Piso: longitud 2
d. Puerta: longitud 1
e. Código postal: longitud 5
f. Metros: longitud 5
g. Comentarios: longitud 60
h. Código de la zona: longitud 2
i. DNI del propietario: longitud 10*/
create table bloquepisos(
	calle varchar(30),
	numero numeric(3),
	piso numeric(2),
	puerta char(1),
	cod_postal numeric(5),
	metros numeric(5),
	comentarios varchar(60),
	cod_zona numeric(2),
	dni_propietario varchar(10),
	
	constraint pk_bloquepisos
	primary key(dni_propietario, cod_zona, cod_postal)
);

create table bloquepisos01(
	calle varchar(30) primary key,
	numero numeric(3),
	piso numeric(2),
	puerta char(1),
	cod_postal numeric(5),
	metros numeric(5),
	comentarios varchar(60),
	cod_zona numeric(2),
	dni_propietario varchar(10)
	);

rollback;

begin;

create table provincias (
	cod_provincia numeric(5),
	nombre_provincia varchar(20),
	
	constraint pk_provincias
	primary key (cod_provincia)
);
create table personas (
	dni char(10) not null,
	nombre varchar(15),
	direccion varchar(20),
	poblacion varchar(15),
	cod_provincia numeric(5),
	
	constraint pk_personas
	primary key(dni),
	
	constraint fk_personas_provincias
	foreign key (cod_provincia) references provincias(cod_provincia)
	);


rollback;

begin;
/*Crea la tabla EJEMPLO3 con las columnas DNI, NOMBRE y USUARIO. Asigna por defecto a la
columna NOMBRE el literal 'No definido'.*/

create table ejemplo3(
	dni char(10),
	nombre varchar(20) default 'No definido',
	usuario varchar(15)
);

rollback;

begin;
/*Crea la tabla EJEMPLO3 con las columnas DNI, NOMBRE y USUARIO. Asigna por defecto a la
columna NOMBRE el literal 'No definido'.*/

create table ejemplo4(
	dni char(10) not null primary key,
	nombre varchar(20) not null check(nombre = UPPER(nombre)),
	edad int check(edad between 5 and 20),
	curso int check(curso in(1, 2, 3))
	);

rollback;

begin;
/*5. Borra la tabla PROVINCIAS. ¿Qué sucede?*/
create table provincias (
	cod_provincia numeric(5),
	nombre_provincia varchar(20),
	
	constraint pk_provincias
	primary key (cod_provincia)
);
create table personas (
	dni char(10) not null,
	nombre varchar(15),
	direccion varchar(20),
	cod_provincia numeric(5),
	
	poblacion varchar(15),
	constraint pk_personas
	primary key(dni),
	
	constraint fk_personas_provincias
	foreign key (cod_provincia) references provincias(cod_provincia)
	);

drop table provincias;

rollback;

begin;
create table fabricantes(
	cod_fabricante numeric(3),
	nombre varchar(15),
	pais varchar(15),
	
	constraint pk_fabricantes
	primary key (cod_fabricante),
	
	constraint onlyMayus
);

create table articulos(
	articulos varchar(20),
	cod_fabricante numeric(3),
	peso numeric(3),
	categoria varchar(10),
	precio_venta numeric(6,2),
	precio_costo numeric(6,2),
	existencias numeric(5)
	)



rollback;

