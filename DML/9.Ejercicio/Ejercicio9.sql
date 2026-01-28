/*
 * EJERCICIO 1 (JOIN básico)

Muestra:

el nombre del alumno

y el nombre del curso
en el que está matriculado.

Condiciones:

Usa JOIN

No uses *

Debe salir una fila por matrícula
 * */

select * from alumno;

select * from curso;

select * from matricula;

select 
a.nombre as "Usuario", 
c.nombre as "Nombre del curso"
from alumno a
join matricula m on
m.dni_alumno = a.dni
join curso c on
c.id_curso = m.id_curso; 

