/*SCRIPT HOJA01*/

DROP TABLE IF EXISTS ALUM cascade;
DROP TABLE IF EXISTS cascade;
DROP TABLE IF EXISTS cascade;

CREATE TABLE ALUM (
 NOMBRE    VARCHAR(20),
 EDAD      NUMERIC(2),
 LOCALIDAD VARCHAR(15)
) ;

CREATE TABLE  NUEVOS(
 NOMBRE    VARCHAR(20),
 EDAD      NUMERIC(2),
 LOCALIDAD VARCHAR(15)
) ;

CREATE TABLE ANTIGUOS(
 NOMBRE    VARCHAR(20),
 EDAD      NUMERIC(2),
 LOCALIDAD VARCHAR(15)
) ;

INSERT INTO ALUM VALUES('JUAN', 18, 'COSLADA');
INSERT INTO ALUM VALUES('PEDRO', 19, 'COSLADA');
INSERT INTO ALUM VALUES('ANA', 17, 'ALCALÁ');
INSERT INTO ALUM VALUES('LUISA', 18, 'TORREJÓN');
INSERT INTO ALUM VALUES('MARÍA', 20, 'MADRID');
INSERT INTO ALUM VALUES('ERNESTO', 21, 'MADRID');
INSERT INTO ALUM VALUES('RAQUEL', 19, 'TOLEDO');

INSERT INTO NUEVOS VALUES('JUAN', 18, 'COSLADA');
INSERT INTO NUEVOS VALUES('MAITE', 15, 'ALCALÁ');
INSERT INTO NUEVOS VALUES('SOFÍA', 14, 'ALCALÁ');
INSERT INTO NUEVOS VALUES('ANA', 17, 'ALCALA');
INSERT INTO NUEVOS VALUES('ERNESTO', 21, 'MADRID');

INSERT INTO ANTIGUOS VALUES('MARÍA', 20, 'MADRID');
INSERT INTO ANTIGUOS VALUES('ERNESTO', 21, 'MADRID');
INSERT INTO ANTIGUOS VALUES('ANDRÉS', 26, 'LAS ROZAS');
INSERT INTO ANTIGUOS VALUES('IRENE', 24, 'LAS ROZAS');


DROP TABLE IF EXISTS PERSONAL cascade; 

CREATE TABLE PERSONAL (
 COD_CENTRO NUMERIC(4),
 DNI        NUMERIC(10),
 APELLIDOS  VARCHAR(30),
 FUNCION    VARCHAR(15),
 SALARIO    NUMERIC (10) 
);

INSERT INTO PERSONAL VALUES (10,1112345,'Martínez Salas, Fernando', 'PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (10,4123005,'Bueno Zarco, Elisa', 'PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (10,4122025,'Montes García, M.Pilar', 'PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (15,1112395,'Rivera Silvestre, Ana','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (15,9800990, 'Ramos Ruiz, Luis','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (15,8660990, 'De Lucas Fdez, M.Angel','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (22,7650000, 'Ruiz Lafuente, Manuel','PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (45,43526789, 'Serrano Laguía, María','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (10,4480099,'Ruano Cerezo, Manuel', 'ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (15,1002345,'Albarrán Serrano, Alicia', 'ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (15,7002660,'Muñoz Rey, Felicia', 'ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (22,5502678,'Marín Marín, Pedro', 'ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (22,6600980, 'Peinado Gil, Elena', 'CONSERJE', 175000);
INSERT INTO PERSONAL VALUES (45,4163222, 'Sarro Molina, Carmen', 'CONSERJE', 175000);

DROP TABLE IF EXISTS PROFESORES cascade; 

CREATE TABLE PROFESORES (
 COD_CENTRO   NUMERIC(4),
 DNI          NUMERIC(10),
 APELLIDOS    VARCHAR(30),
 ESPECIALIDAD VARCHAR(16) 
) ;


INSERT INTO PROFESORES VALUES (10,1112345,'Martínez Salas, Fernando', 'INFORMÁTICA');
INSERT INTO PROFESORES VALUES (10,4123005,'Bueno Zarco, Elisa', 'MATEMÁTICAS');
INSERT INTO PROFESORES VALUES (10,4122025,'Montes García, M.Pilar', 'MATEMÁTICAS');
INSERT INTO PROFESORES VALUES (15,9800990, 'Ramos Ruiz, Luis', 'LENGUA');
INSERT INTO PROFESORES VALUES (15,1112395,'Rivera Silvestre, Ana', 'DIBUJO');
INSERT INTO PROFESORES VALUES (15,8660990, 'De Lucas Fdez, M.Angel', 'LENGUA');
INSERT INTO PROFESORES VALUES (22,7650000, 'Ruiz Lafuente, Manuel', 'MATEMÁTICAS');
INSERT INTO PROFESORES VALUES (45,43526789, 'Serrano Laguía, María', 'INFORMÁTICA');

DROP TABLE IF EXISTS CENTROS cascade; 

CREATE TABLE CENTROS (
 COD_CENTRO   NUMERIC(4),
 TIPO_CENTRO  CHAR(1),
 NOMBRE       VARCHAR(30),
 DIRECCION    VARCHAR(26),
 TELEFONO     VARCHAR(10),
 NUM_PLAZAS   NUMERIC(4)
 ) ;


INSERT INTO CENTROS VALUES (10,'S','IES El Quijote', 'Avda. Los Molinos 25', '965-887654',538);
INSERT INTO CENTROS VALUES (15,'P','CP Los Danzantes', 'C/Las Musas s/n','985-112322',250);
INSERT INTO CENTROS VALUES (22,'S', 'IES Planeta Tierra', 'C/Mina 45', '925-443400',300);
INSERT INTO CENTROS VALUES (45,'P', 'CP Manuel Hidalgo', 'C/Granada 5', '926-202310',220);
INSERT INTO CENTROS VALUES (50,'S', 'IES Antoñete', 'C/Los Toreros 21', '989-406090',310);

DROP TABLE IF EXISTS DEPART CASCADE;

CREATE TABLE DEPART (
 DEPT_NO  numeric(2),
 DNOMBRE  varchar(14), 
 LOC      varchar(14) 
) ;

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');

DROP TABLE IF EXISTS EMPLE;

CREATE TABLE EMPLE (
 EMP_NO    numeric(4),
 APELLIDO  varchar(10),
 OFICIO    varchar(10),
 DIR       numeric(4),
 FECHA_ALT DATE,
 SALARIO   numeric(7),
 COMISION  numeric(7),
 DEPT_NO   numeric(2)
);

INSERT INTO EMPLE VALUES (7369, 'SANCHEZ', 'EMPLEADO', 7902, '17/12/1990', 1040, NULL, 20);
INSERT INTO EMPLE VALUES (7499, 'ARROYO', 'VENDEDOR', 7698, '20/02/1990', 1500, 390, 30);
INSERT INTO EMPLE VALUES (7521, 'SALA', 'VENDEDOR', 7698, '22/02/1991', 1625, 650, 30);
INSERT INTO EMPLE VALUES (7566, 'JIMENEZ', 'DIRECTOR', 7839, '02/04/1991', 2900, NULL, 20);
INSERT INTO EMPLE VALUES (7654, 'MARTIN', 'VENDEDOR', 7698, '29/09/1991', 1600, 1020, 30);
INSERT INTO EMPLE VALUES (7698, 'NEGRO', 'DIRECTOR', 7839, '01/05/1991', 3005, NULL, 30);
INSERT INTO EMPLE VALUES (7782, 'CEREZO', 'DIRECTOR', 7839, '09/06/1991', 2885, NULL, 10);
INSERT INTO EMPLE VALUES (7788, 'GIL', 'ANALISTA', 7566, '09/11/1991', 3000, NULL, 20);
INSERT INTO EMPLE VALUES (7839, 'REY', 'PRESIDENTE', NULL, '17/11/1991', 4100, NULL, 10);
INSERT INTO EMPLE VALUES (7844, 'TOVAR', 'VENDEDOR', 7698, '08/09/1991', 1350, 0, 30);
INSERT INTO EMPLE VALUES (7876, 'ALONSO', 'EMPLEADO', 7788, '23/09/1991', 1430, NULL, 20);
INSERT INTO EMPLE VALUES (7900, 'JIMENO', 'EMPLEADO', 7698, '03/12/1991', 1335, NULL, 30);
INSERT INTO EMPLE VALUES (7902, 'FERNANDEZ', 'ANALISTA', 7566, '03/12/1991', 3000, NULL, 20);
INSERT INTO EMPLE VALUES (7934, 'MUÑOZ', 'EMPLEADO', 7782, '23/01/1992', 1690, NULL, 10);

DROP TABLE IF EXISTS EMPLE30 cascade; 

CREATE TABLE EMPLE30 (
 EMP_NO    NUMERIC(4),
 APELLIDO  VARCHAR(10),
 OFICIO    VARCHAR(10),
 DIR       NUMERIC(4),
 FECHA_ALT DATE,
 SALARIO   NUMERIC(7),
 COMISION  NUMERIC(7),
 DEPT_NO   NUMERIC(2)
) ;


DROP TABLE IF EXISTS NOMBRES cascade; 

CREATE TABLE NOMBRES (
  NOMBRE VARCHAR(15),
  EDAD   NUMERIC(2)
) ;

INSERT INTO NOMBRES VALUES('PEDRO', 17);
INSERT INTO NOMBRES VALUES('JUAN', 17);
INSERT INTO NOMBRES VALUES('MARÍA', 16);
INSERT INTO NOMBRES VALUES('CLARA', 14);
INSERT INTO NOMBRES VALUES(NULL, 15);
INSERT INTO NOMBRES VALUES(NULL, 18);
INSERT INTO NOMBRES VALUES('JESÚS', NULL);

DROP TABLE IF EXISTS FABRICANTES cascade;
DROP TABLE IF EXISTS ARTICULOS cascade; 
DROP TABLE IF EXISTS TIENDAS cascade;  
DROP TABLE PEDIDOS cascade; 
DROP TABLE VENTAS cascade; 

CREATE TABLE FABRICANTES(
COD_FABRICANTE NUMERIC(3),
NOMBRE         VARCHAR(15), 
PAIS           VARCHAR(15)
);

INSERT INTO FABRICANTES VALUES(10, 'CALVO', 'ESPAÑA');
INSERT INTO FABRICANTES VALUES(15, 'LU', 'BELGICA');
INSERT INTO FABRICANTES VALUES(20, 'BARILLA', 'ITALIA');
INSERT INTO FABRICANTES VALUES(25, 'GALLO', 'ESPAÑA');
INSERT INTO FABRICANTES VALUES(30, 'PRESIDENT', 'FRANCIA');

CREATE TABLE ARTICULOS(
ARTICULO       VARCHAR(20),
COD_FABRICANTE NUMERIC(3),
PESO           NUMERIC(3),
CATEGORIA      VARCHAR(10),
PRECIO_VENTA   NUMERIC(6,2),
PRECIO_COSTO   NUMERIC(6,2),
EXISTENCIAS    NUMERIC(5)
);

INSERT INTO ARTICULOS VALUES ('Macarrones',20, 1, 'Primera',1, 0.98,120);
INSERT INTO ARTICULOS VALUES ('Tallarines',20, 2, 'Primera',1.20,1,100);
INSERT INTO ARTICULOS VALUES ('Tallarines',20, 1, 'Segunda',0.99,0.50,100);
INSERT INTO ARTICULOS VALUES ('Macarrones',20, 1, 'Tercera',0.80,0.50,100);
INSERT INTO ARTICULOS VALUES ('Atún',10, 3, 'Primera',2,1.50,220);
INSERT INTO ARTICULOS VALUES ('Atún',10, 3, 'Segunda',1.50,1,220);
INSERT INTO ARTICULOS VALUES ('Atún',10, 3, 'Tercera',1,0.50,220);
INSERT INTO ARTICULOS VALUES ('Sardinillas',10, 1, 'Primera',2.5,2,200);
INSERT INTO ARTICULOS VALUES ('Sardinillas',10, 1, 'Segunda',2,1.6,200);
INSERT INTO ARTICULOS VALUES ('Sardinillas',10, 1, 'Tercera',1,1.5,220);
INSERT INTO ARTICULOS VALUES ('Mejillones',10, 1, 'Tercera',1,0.9,200);
INSERT INTO ARTICULOS VALUES ('Mejillones',10, 1, 'Primera',3,2,300);
INSERT INTO ARTICULOS VALUES ('Macarrones',25, 1, 'Primera',1.5,1,150);
INSERT INTO ARTICULOS VALUES ('Tallarines',25, 1, 'Primera',1,0.90,100);
INSERT INTO ARTICULOS VALUES ('Fideos',25, 1, 'Segunda',0.75,0.50,100);
INSERT INTO ARTICULOS VALUES ('Fideos',25, 1, 'Primera',1,0.80,100);
INSERT INTO ARTICULOS VALUES ('Galletas Cuadradas',15, 1, 'Primera',2,1.8,100);
INSERT INTO ARTICULOS VALUES ('Galletas Cuadradas',15, 1, 'Segunda',1,0.8,100);
INSERT INTO ARTICULOS VALUES ('Galletas Cuadradas',15, 1, 'Tercera',0.50,0.40,100);
INSERT INTO ARTICULOS VALUES ('Barquillos',15, 1, 'Primera',1,0.80,100);
INSERT INTO ARTICULOS VALUES ('Barquillos',15, 1, 'Segunda',1,0.80,100);
INSERT INTO ARTICULOS VALUES ('Canutillos',15, 2, 'Primera',1.7,1.5,110);
INSERT INTO ARTICULOS VALUES ('Canutillos',15, 2, 'Segunda',1.2,1.5,110);
INSERT INTO ARTICULOS VALUES ('Leche entera',30, 1, 'Primera',1.1,1,300);
INSERT INTO ARTICULOS VALUES ('Leche desnat.',30, 1,'Primera',1.2,1,300);
INSERT INTO ARTICULOS VALUES ('Leche semi.',30, 1, 'Primera',1.30,1.10,300);
INSERT INTO ARTICULOS VALUES ('Leche entera',30, 2,'Primera',2.10,2,300);
INSERT INTO ARTICULOS VALUES ('Leche desnat.',30, 2, 'Primera',2.2,2,300);
INSERT INTO ARTICULOS VALUES ('Leche semi.',30, 2,  'Primera',2.3,2.1,300);
INSERT INTO ARTICULOS VALUES ('Mantequilla',30, 1, 'Primera',1.8,2,200);
INSERT INTO ARTICULOS VALUES ('Mantequilla',30, 1, 'Segunda',1.4,2,200);

CREATE TABLE TIENDAS(
NIF       VARCHAR(10),
NOMBRE    VARCHAR(20),
DIRECCION VARCHAR(20),
POBLACION VARCHAR(20),
PROVINCIA VARCHAR(20),
CODPOSTAL NUMERIC(5) 
);

INSERT INTO TIENDAS VALUES('1111-A','Almacenes Pérez', 'C/Toledo, 20', 'Siguenza','GUADALAJARA',19104); 
INSERT INTO TIENDAS VALUES('5555-B','La gacela', 'C/Santander Rios, 45', 'Azuqueca','GUADALAJARA', 19209);
INSERT INTO TIENDAS VALUES('2222-A','Comestibles Rodolfo', 'C/ del Val s/n', 'Alcalá de Henares','MADRID',28804);
INSERT INTO TIENDAS VALUES('4444-A','La Pasta Gansa', 'C/Alcalá, 2', 'Ajalvir','MADRID', 28765);
INSERT INTO TIENDAS VALUES('3333-N','Ultramarinos Montse', 'Avda. Pio 10', 'Toledo','TOLEDO',45100);
INSERT INTO TIENDAS VALUES('4141-B','Todo Toledo', 'C/Avila 24', 'Talavera','TOLEDO',45199);


CREATE TABLE PEDIDOS(
NIF               VARCHAR(10),
ARTICULO          VARCHAR(20),
COD_FABRICANTE    NUMERIC(3),
PESO              NUMERIC(3),
CATEGORIA         VARCHAR(10),
FECHA_PEDIDO      DATE,
UNIDADES_PEDIDAS  NUMERIC(4)
);

INSERT INTO PEDIDOS VALUES ('5555-B','Macarrones',20, 1, 'Primera','18/02/2006', 30);
INSERT INTO PEDIDOS VALUES ('5555-B','Atún',10, 3, 'Primera','21/02/2006', 10);
INSERT INTO PEDIDOS VALUES ('5555-B','Atún',10, 3, 'Segunda','11/03/2006', 4);
INSERT INTO PEDIDOS VALUES ('5555-B','Sardinillas',10, 1, 'Segunda', '11/03/2006', 10);
INSERT INTO PEDIDOS VALUES ('5555-B','Macarrones',25, 1, 'Primera','14/04/2006', 12);
INSERT INTO PEDIDOS VALUES ('5555-B','Fideos',25, 1, 'Primera', '18/05/2006', 24);
INSERT INTO PEDIDOS VALUES ('5555-B','Fideos',25, 1, 'Segunda', '19/05/2006', 20);
INSERT INTO PEDIDOS VALUES ('5555-B','Galletas Cuadradas', 15, 1, 'Segunda', '20/06/2006', 15);
INSERT INTO PEDIDOS VALUES ('1111-A','Barquillos',15, 1, 'Primera', '20/02/2006', 10);
INSERT INTO PEDIDOS VALUES ('1111-A','Canutillos',15, 2, 'Segunda','10/04/2006', 12);
INSERT INTO PEDIDOS VALUES ('1111-A','Leche semi.',30, 1, 'Primera', '24/06/2006', 5);
INSERT INTO PEDIDOS VALUES ('1111-A','Leche semi.',30, 2, 'Primera', '04/07/2006', 11);
INSERT INTO PEDIDOS VALUES ('1111-A','Mantequilla',30, 1, 'Primera', '10/07/2006', 10);
INSERT INTO PEDIDOS VALUES ('4141-B','Macarrones',20, 1, 'Primera', '16/04/2006', 30);
INSERT INTO PEDIDOS VALUES ('4141-B','Atún',10, 3, 'Primera', '21/06/2006', 10);
INSERT INTO PEDIDOS VALUES ('4141-B','Atún',10, 3, 'Segunda', '12/08/2006', 9);
INSERT INTO PEDIDOS VALUES ('2222-A','Sardinillas',10, 1, 'Segunda', '12/08/2006',20);
INSERT INTO PEDIDOS VALUES ('2222-A','Sardinillas',10, 1, 'Tercera', '12/08/2006',22);
INSERT INTO PEDIDOS VALUES ('2222-A','Mejillones',10,1, 'Primera',CURRENT_DATE,1000);
INSERT INTO PEDIDOS VALUES ('3333-N','Macarrones',25, 1, 'Primera','10/11/2006', 8);
INSERT INTO PEDIDOS VALUES ('3333-N','Tallarines',25, 1, 'Primera', '12/11/2006', 9);
INSERT INTO PEDIDOS VALUES ('3333-N','Fideos',25, 1, 'Primera', '15/11/2006', 11);
INSERT INTO PEDIDOS VALUES ('3333-N','Galletas Cuadradas', 15, 1, 'Primera', '20/11/2006', 6);
INSERT INTO PEDIDOS VALUES ('3333-N','Barquillos',15, 1, 'Segunda', '20/11/2006', 40);
INSERT INTO PEDIDOS VALUES ('3333-N','Canutillos',15, 2, 'Segunda', '20/11/2006', 10);


CREATE TABLE VENTAS(
NIF                VARCHAR(10),
ARTICULO           VARCHAR(20),
COD_FABRICANTE     NUMERIC(3),
PESO               NUMERIC(3),
CATEGORIA          VARCHAR(10),
FECHA_VENTA        DATE,
UNIDADES_VENDIDAS  NUMERIC(4)
);


INSERT INTO VENTAS VALUES ('5555-B','Macarrones',20, 1, 'Primera', '19/02/2006', 5);
INSERT INTO VENTAS VALUES ('5555-B','Atún',10, 3, 'Primera', '19/02/2006', 6);
INSERT INTO VENTAS VALUES ('5555-B','Atún',10, 3, 'Segunda', '20/03/2006', 15);
INSERT INTO VENTAS VALUES ('5555-B','Sardinillas',10, 1, 'Segunda', '20/03/2006', 8);
INSERT INTO VENTAS VALUES ('5555-B','Macarrones',25, 1, 'Primera', '17/04/2006', 2);
INSERT INTO VENTAS VALUES ('5555-B','Fideos',25, 1, 'Segunda', '18/05/2006', 14);
INSERT INTO VENTAS VALUES ('5555-B','Leche semi.',30, 1, 'Primera', '24/06/2006', 5);
INSERT INTO VENTAS VALUES ('2222-A','Galletas Cuadradas', 15, 1, 'Segunda', '20/06/2006', 5);
INSERT INTO VENTAS VALUES ('2222-A','Barquillos',15, 1, 'Primera', '20/02/2006', 6);
INSERT INTO VENTAS VALUES ('2222-A','Canutillos',15, 2, 'Segunda', '10/06/2006', 2);
INSERT INTO VENTAS VALUES ('2222-A','Sardinillas',10, 1, 'Segunda', '15/08/2006',5);
INSERT INTO VENTAS VALUES ('2222-A','Sardinillas',10, 1, 'Tercera', '15/08/2006',5);
INSERT INTO VENTAS VALUES ('3333-N','Leche semi.',30, 2, 'Primera', '06/07/2006', 11);
INSERT INTO VENTAS VALUES ('3333-N','Mantequilla',30, 1, 'Primera', '16/07/2006', 10);
INSERT INTO VENTAS VALUES ('3333-N','Macarrones',20, 1, 'Primera', '26/04/2006', 30);
INSERT INTO VENTAS VALUES ('3333-N','Atún',10, 3, 'Primera', '26/04/2006', 10);
INSERT INTO VENTAS VALUES ('3333-N','Barquillos',15, 1, 'Segunda', '25/11/2006',4);
INSERT INTO VENTAS VALUES ('3333-N','Canutillos',15, 2, 'Segunda', '25/11/2006',4);
INSERT INTO VENTAS VALUES ('4141-B','Atún',10, 3, 'Segunda', '12/08/2006', 2);
INSERT INTO VENTAS VALUES ('4141-B','Macarrones',25, 1, 'Primera','10/11/2006',2);
INSERT INTO VENTAS VALUES ('4141-B','Tallarines',25, 1, 'Primera', '11/11/2006',3);
INSERT INTO VENTAS VALUES ('4141-B','Canutillos',15, 2, 'Segunda', '11/11/2006',8);

/*EJERCICIOS */
/*1. Añade un nuevo profesor en el centro o en los centros cuyo número de administrativos
sea 1 en la especialidad de 'IDIOMA', con DNI 8790055 y de nombre 'Clara Salas'.*/
select * from profesores

insert into profesores (cod_centro, especialidad, dni, apellidos)
select cod_centro, 'IDIOMA' as idioma,'8790055' as dni , 'Clara Salas' as nombre  from personal
where funcion = 'ADMINISTRATIVO'
group by cod_centro
having COUNT(funcion) = 1;

/*2. Modifica el número de plazas con un valor igual a la mitad, a aquellos centros con
menos de dos profesores. (TABLA CENTROS)
Hay centros que no tienen profesores asignados y también hay que reducir el número
de plazas*/
begin;
/*
select * from profesores;
*/
update centros
set num_plazas = num_plazas / 2
where cod_centro in(
	select c.cod_centro from centros c
	left join profesores p on p.cod_centro = c.cod_centro
	group by c.cod_centro 
	having count(p.dni) < 2);
select * from centros;
rollback;

/*3. Borra al personal que esté en centros de menos de 300 plazas y con menos de dos
profesores.*/

begin;
/*
select * from centros;
select * from profesores;
 * */

delete from personal
where cod_centro in(
select c.cod_centro from centros c
join personal p on c.cod_centro = p.cod_centro
where c.num_plazas < 300 
and c.cod_centro in (
	select cod_centro from profesores
	group by cod_centro
	having count(cod_centro) < 2
)
);
select * from personal;
rollback;

begin;
/*
select * from personal;*/

delete from profesores
where dni not in(
	select dni from personal 
);

select * from profesores;
rollback;

begin;
/*
select * from personal;
select cod_centro, nombre from centros
where cod_centro not in (
	select cod_centro from personal
);
 * */


delete from centros
where cod_centro not in (
	select cod_centro from personal
);

select * from centros;
rollback;

begin;
/*Da de alta un nuevo artículo de 'Primera' categoría para los fabricantes de 'FRANCIA' y
abastece con cinco unidades de ese artículo a todas las tiendas y en la fecha de hoy.
 * 
 * */
select * from fabricantes;
select * from tiendas;
select * from articulos;

insert into articulos(articulo, cod_fabricante, peso, categoria)
select 'Leche', cod_fabricante, 2, 'Primera' from fabricantes
where pais = 'Francia';

select nif from pedidos;

rollback;

