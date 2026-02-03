/* *Img de diagrama en la misma carpeta*
 * A partir del diagrama conceptual que se adjunta, crea las tablas resultantes del modelo,
 *  teniendo en cuenta que los contenidos de los atributos serán::
cPartido: número entero
siglas: hasta 30 caracteres
denominacion: hasta 100 caracteres
votos: número entero
escanyos: número entero
dni: hasta 10 caracteres
nombre: hasta 30 caracteres
apellidos: hasta 50 caracteres
posicionLista: número entero
Como puedes observar, esa relación no puede generar valores NULL, ya que la participación de ambos conjuntos de entidades es total.

Además, deberás incorporar las siguientes restricciones:

Las claves primarias y ajenas de las tablas. El nombre de las claves ajenas será el mismo que el que tienen en la tabla a la que referencian.
El valor por defecto de la columna posicionLista es el 1
Todos los datos son obligatorios excepto las columnas votos y escanyos.
El valor de cPartido deberá ser siempre mayor que 150000.

 * */

create table partidos(
	cPartido integer not null,
	siglas varchar(30),
	denominacion varchar(100) not null,
	votos integer,
	escanyos integer,
	constraint p_partidos
	primary key (cPartido),
	constraint cPartido_condition
	check(cPartido > 150000)
);

create table candidato (
	dni varchar(10) not null,
	nombre varchar(30) not null,
	apellidos varchar(50) not null,
	posicionLista integer default 1 not null,
	cPartido integer not null,
	constraint p_candidato
	primary key (dni),
	constraint f_key
	foreign key (cPartido)
	references partidos(cPartido)
);

INSERT INTO partidos (cPartido,siglas,denominacion,votos,escanyos)
	VALUES (150001,'c3','CIFP Carlos III',1000,2);
INSERT INTO partidos (cPartido,siglas,denominacion,votos,escanyos)
	VALUES (150001,null, null,1000,2);
INSERT INTO partidos (cPartido,siglas,denominacion,votos,escanyos)
	VALUES (150001,'c3','CIFP Carlos III',null,null);
INSERT INTO partidos (cPartido,siglas,denominacion,votos,escanyos)
	VALUES (150001,'c3','CIFP Carlos III',1000,2);
INSERT INTO partidos (cPartido,siglas,denominacion,votos,escanyos)
	VALUES (150002,'PS','Partido de las soluciones',500,1);
INSERT INTO candidato (dni,nombre,apellidos,cpartido)
	VALUES ('12345678A','Pepe','García',150000);
INSERT INTO candidato (dni,nombre,apellidos,cpartido)
	VALUES ('12345678B',null,null,150001);
INSERT INTO candidato (dni,nombre,apellidos,cpartido)
	VALUES ('12345678C','Pepa','García',150001);
INSERT INTO candidato (dni,nombre,apellidos,posicionLista,cpartido)
	VALUES ('12345678D','Juan','Fernández',2,150001);

select cPartido,siglas,denominacion,escanyos from partidos
union
select cpartido, dni,nombre,posicionLista from candidato order by 1, 2;


