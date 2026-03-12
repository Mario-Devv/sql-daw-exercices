/*1. Crea una tabla tabla01 con dos columnas: fecha de tipo date y temperatura de tipo
integer*/

create table tabla01(
	fecha date,
	temperatura int
);

/*2. Crea una tabla table02 con dos columnas: codigo de tipo integer que es la clave
principal y nombre de tipo varchar de 10 caracteres.*/

create table table02(
	codigo int primary key,
	nombre varchar(10)
);

/*3. Crear un usuario GAMER01 con contraseña nintendo*/
create user GAMER01 password 'nintendo';

/*4. Crear GAMER02 con contraseña xbox*/
create user GAMER02 password 'xbox';

/*5. Conceder a gamer01 los privilegios insert y select en tabla01*/
grant select, insert on tabla01 to GAMER01;

/*6. Conceder a gamer02 todos los privilegios sobre tabla01*/
grant all on tabla01 to GAMER02;

/*7. Conceder a gamer01 sobre tabla01 para que pueda actualizar la columna temperatura
de tabla01*/
grant update(temperatura) on tabla01 to GAMER01;

/*8. Conceder a gamer02 insert en tabla02 y que pueda pasar el privilegio a otros usuarios*/
grant insert on table02 to GAMER02 with grant option;

/*9. Crear los usuarios pedro, juan y maria*/
create user pedro;
create user juan;
create user maria;

/*10. Crea un rol jugadores*/
create role jugadores;

/*11. Asignar a jugadores el privilegio de seleccionar, insertar y actualizar filas en la tabla02*/
grant select,insert,update on jugadores to table02

/*12. Asigna el rol de jugadores a pedro, juan y maria*/
grant jugadores to pedro;
grant jugadores to juan;
grant jugadores to maria;

/*13. Retirar los privilegios select y sobre tabla01 de gamer01.*/
revoke select, insert on tabla01 from GAMER01;

/*14. Retirar todos los privilegios concedidos a GAMER01 sobre tabla01*/
revoke all on tabla01 from GAMER01

/*15. Elimina el rol de 'jugadores' a juan.*/
revoke jugadores from juan;