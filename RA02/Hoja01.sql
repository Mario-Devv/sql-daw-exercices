/*
 * Crear una tabla BLOQUEPISOS, y define su clave principal (con restricción de columna y otra
opción con restricción de tabla), con los siguientes datos:
a.​ Calle: de longitud 30
b.​ Número: longitud 3
c.​ Piso: longitud 2
d.​ Puerta: longitud 1
e.​ Código postal: longitud 5
f.​ Metros: longitud 5
g.​ Comentarios: longitud 60
h.​ Código de la zona: longitud 2
i.​ DNI del propietario: longitud 10*/
create table BLOQUEPISOS(
	calle varchar(30),
	numero numeric(3),
	piso numeric(2),
	puerta char(1),
	cod_postal numeric(5),
	metros decimal(5),
	comentarios varchar(60),
	cod_zona numeric (2),
	dni_propietario char(10),
	
	constraint pk_bloquepisos
	PRIMARY KEY(calle, numero, piso, puerta)
);

/*
 * Crea las tablas PERSONAS (dni, nombre, dirección, población y código de provincia) y
PROVINCIAS (código de provincia y nombre de provincia)
 */

create table provincias(
	cod_provincia char(5) primary key,
	nombre_provincia varchar(25)
);

 create table personas(
 	dni char(10) primary key,
 	nombre varchar(20),
 	direccion varchar(50),
 	poblacion varchar(25),
 	cod_provincia char(5) not null references provincias
 );
 
 /*
  *3 Crea la tabla EJEMPLO3 con las columnas DNI, NOMBRE y USUARIO. Asigna por defecto a la
columna NOMBRE el literal 'No definido'.*/
create table ejemplo3 (
	dni char(10),
	nombre varchar(20) default 'No definido',
	usuario varchar(15)
);

/*4.​ Crea la tabla EJEMPLO4 con las siguientes columnas y restricciones:*/
create table ejemplo4 (
	dni char(10) primary key,
	nombre varchar(20) not null,
	edad int,
	curso int,
	
	constraint range_Edad
	check (edad between 5 and 20),
	
	constraint upNombre
	check(nombre = UPPER(nombre)),
	
	constraint curso
	check(curso in (1,2,3))
);

/*5.​ Borra la tabla PROVINCIAS. ¿Qué sucede?*/
drop table provincias;

/*6.Crea las siguientes tablas:*/
create table fabricantes(
	cod_fabricante numeric(3) primary key,
	nombre varchar(15),
	pais varchar(15),
	
	constraint toUpperCase
	check(nombre = UPPER(nombre) and pais = UPPER(pais))
);

create table articulos(
	articulo varchar(20),
	cod_fabricante numeric(3),
	peso numeric(3),
	categoria varchar(10),
	precio_venta numeric(6,2),
	precio_costo numeric(6,2),
	existencias numeric(5),
	
	constraint PK_art
	primary key (articulo, cod_fabricante, peso, categoria),
	
	constraint FK_art
	foreign key (cod_fabricante) references fabricantes(cod_fabricante),
	
	constraint NoZero
	check(precio_venta > 0 and precio_costo > 0 and peso > 0),
	
	constraint onlythree
	check(categoria in ('Primera', 'Segunda', 'Tercera'))
);

/*7.​ Añade a la tabla ejemplo4: sexo con la restricción NOT NULL, e importe.*/
select * from ejemplo4;

alter table ejemplo4
add sexo char(1) not null check (sexo in ('M', 'F'));

alter table ejemplo4
add importe numeric(5,2) not null;

/*8.​ Crea la tabla TIENDAS sin restricciones (nif, nombre, dirección, población, provincia,
codpostal). Añade las siguientes restricciones:
a.​ La clave primaria es NIF
b.​ Provincia ha de almacenarse en mayúscula
c.​ Cambia la longitud de nombre a 30 y no nulo.*/
create table tiendas(
	nif char(10),
	nombre varchar(15),
	direccion varchar(20),
	poblacion int,
	provincia varchar(15),
	cod_postal numeric(5)
);

alter table tiendas
add primary key(nif);

alter table tiendas
add check(provincia = UPPER(provincia));

alter table tiendas
alter nombre type varchar(30);

alter table tiendas
alter nombre set not null;

/*
 * 9.​ Tenemos creada la siguiente tabla:
CREATE TABLE EMPLEADOS (
Cod_Empleado VARCHAR(5) PRIMARY KEY,
Nombre VARCHAR(10),
Apellidos VARCHAR(25),
Sueldo NUMERIC(2));
●​ Ahora queremos poner una restricción a sueldo para que tome valores entre 1000 y
1200, ¿cómo lo harías?
●​ El apellido debe ser único*/

CREATE TABLE EMPLEADOS (
Cod_Empleado VARCHAR(5) PRIMARY KEY,
Nombre VARCHAR(10),
Apellidos VARCHAR(25),
Sueldo NUMERIC(2));

alter table EMPLEADOS
add check(sueldo between 1000 and 1200);

alter table EMPLEADOS
add unique(apellidos);

/*
 * 10.​Crear las tablas EMPLE y DEPART, sin restricciones
EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALTA, SALARIO, COMISION, DEPT_NO)
DEPART (DEPT_NO, DNOMBRE, LOC)*/

create table EMPLE(
	EMP_NO char(5),
	APELLIDO varchar(20),
	OFICIO varchar(10),
	DIR char(4),
	FECHA_ALTA date,
	SALARIO numeric(8,2),
	COMISION numeric (2,1),
	DEPT_NO numeric(3)
);

create table DEPART(
	DEPT_NO numeric(3),
	DNOMBRE varchar(10),
	LOC varchar(10)
);

/*11.​Añadir a la tabla EMPLE la restricción de que el salario tiene que ser mayor que 0*/
alter table EMPLE
add check(SALARIO > 0);

/*12.​Añadir una restricción unique a apellido.*/
alter table EMPLE
add unique(APELLIDO);

/*13.​Añadir una restricción not null a comisión*/
alter table EMPLE
alter COMISION set not null;

/*14.​Añadir una restricción a código de empleado para que sea clave principal*/
alter table EMPLE
add primary key(EMP_NO);

/*15.​Añadir una restricción a DEPART para que el código sea clave principal*/
alter table DEPART
add primary key(DEPT_NO);

/*16.​Añadir una restricción a empleado para que número de departamento sea clave ajena.*/
alter table EMPLE
add foreign key(DEPT_NO) references DEPART(DEPT_NO);
