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
	check(nombre = upper(nombre) and pais = upper(pais))
);

create table articulos(
	articulos varchar(20),
	cod_fabricante numeric(3),
	peso numeric(3),
	categoria varchar(10) check(categoria in('Primera', 'Segunda', 'Tercera')),
	precio_venta numeric(6,2),
	precio_costo numeric(6,2),
	existencias numeric(5),
	
	constraint pk_articulos
	primary key (articulos, cod_fabricante, peso, categoria),
	
	constraint fk_articulos_fabricantes
	foreign key (cod_fabricante) references fabricantes(cod_fabricante),
	
	constraint biggerCero
	check(precio_venta > 0 and precio_costo > 0 and existencias > 0)

	);



rollback;

begin;
/*7. Añade a la tabla ejemplo4: sexo con la restricción NOT NULL, e importe.*/
create table ejemplo4(
	dni char(10) not null primary key,
	nombre varchar(20) not null check(nombre = UPPER(nombre)),
	edad int check(edad between 5 and 20),
	curso int check(curso in(1, 2, 3))
	);

alter table ejemplo4
add sexo boolean not null;

alter table ejemplo4
add importe numeric (6,2) not null;

select * from ejemplo4;

rollback;

begin;
/*8. Crea la tabla TIENDAS sin restricciones (nif, nombre, dirección, población, provincia,
codpostal). Añade las siguientes restricciones:
a. La clave primaria es NIF
b. Provincia ha de almacenarse en mayúscula
c. Cambia la longitud de nombre a 30 y no nulo.*/
create table tiendas(
	nif char(4),
	nombre varchar(15),
	direccion varchar(20),
	poblacion varchar(20),
	provincia varchar(10),
	cod_postal numeric(5)
);

alter table tiendas
add primary key (nif);

alter table tiendas
add check(provincia = upper(provincia));

alter table tiendas
alter nombre type varchar(30);
alter table tiendas
alter nombre set not null;


select * from tiendas;
rollback;

begin;


rollback;

