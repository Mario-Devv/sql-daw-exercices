select * from emple;

/*1. A partir de la tabla EMPLE, visualiza el sueldo mayor de cada departamento y su número de
departamento.*/
select max(salario) as "Salario maximo", 
dept_no from emple
group by dept_no;

/*2. A partir de la tabla EMPLE, visualiza el total de salarios por departamento y el número de
departamento*/
select sum(salario) as "Total de salarios",
dept_no
from emple
group by dept_no;


/*3. A partir de la tabla EMPLE, visualiza el mayor sueldo en cada oficio.*/
select max(salario) as "Salario máximo", oficio from emple
group by oficio;

/*4. A partir de la tabla EMPLE, visualiza el número de empleados de cada departamento y el
número de departamento.*/
select count(*) from emple
group by dept_no;

/*5. A partir de la tabla EMPLE, visualiza el número de empleados de oficio EMPLEADO de cada
departamento, y el número de departamento.*/
select count(*) as "Nº empleados", dept_no from emple
where oficio = 'EMPLEADO'
group by dept_no;

/*6. A partir de la tabla EMPLE, visualiza el total de salarios por departamento y el número de
departamento de los ANALISTAS.*/
select * from emple;
select sum(salario) from emple
where oficio = 'ANALISTA'
group by dept_no;

/*7. A partir de la tabla EMPLE, visualiza el número de empleados de cada departamento
únicamente de aquellos departamentos que superan los 3 empleados.*/
select * from emple;
select count(*), dept_no from emple
group by dept_no
having count(*) > 3;

/*8. Busca los departamentos que tiene más de dos personas trabajando en la misma profesión*/
select * from emple;

select count(*), oficio, dept_no from emple
group by dept_no, oficio
having count(*) > 2;

/*9. Busca los departamentos (número de departamento) que superan los 1500 euros de sueldo
medio de ANALISTAS.*/
select dept_no as "Nº departamento", 
round(avg(salario)) as "Salario medio" from emple
where oficio = 'ANALISTA'
group by dept_no
having avg(salario) > 1500;

/*10. Selecciona el apellido, oficio y la localidad de los departamentos de aquellos empleados
cuyo oficio sea analista. (2)*/
select e.apellido, e.oficio, d.localidad from emple e
join departamentos d on d.dept_no = e.dept_no
where oficio = 'ANALISTA';

/*11. Visualiza los nombres de alumnos de Madrid que tengan algún módulo suspenso. (1)*/
select a.nombre, m.nombre as "Modulo suspenso" from alumnos a
join notas n on  n.alum_id = a.alum_id
join modulos m on n.mod_id = m.mod_id 
where ciudad = 'Madrid'
and nota < 5;

/*12. Visualiza todos los módulos que contengan al menos tres letras “o” en su interior y tengan
alumnos matriculados de Madrid. (1)*/
select length(m.nombre) - length(replace(lower(m.nombre), 'o', '')) as "Numero de o",
a.nombre, m.nombre
from modulos m
join notas n on n.mod_id = m.mod_id
join alumnos a on a.alum_id = n.alum_id
where ciudad = 'Madrid';

/*13. Visualiza los nombres de alumnos que tengan una nota entre 7 y 8 en el módulo de FOL. (1)*/
select a.nombre, m.nombre as "Asignatura" from alumnos a
join notas n on n.alum_id = a.alum_id
join modulos m on m.mod_id = n.mod_id
where n.nota between 7 and 8 and
m.nombre = 'FOL';

/*14. Muestra los nombres de alumnos que tengan la misma nota que tiene "Díaz Fernández,
María" en “FOL” en algún módulo. (2)*/
select a.nombre from alumnos a
join notas n on n.alum_id = a.alum_id
join modulos m on m.mod_id = n.mod_id
where n.nota in (
	select n.nota from notas n2
	where a.nombre = 'Díaz Fernández, María'
	)