select * from alumnos;

/* * Enunciado
Muestra el DNI y el nombre completo (apenom) de los alumnos de la tabla
alumnos cuya ciudad (pobla) sea Madrid, usando LIKE (que funcione aunque haya
mayúsculas/minúsculas distintas).*/
select dni, apenom as "Nombre" from alumnos
where pobla ilike 'Madrid';


select * from emple;

/*Enunciado
Muestra el número de departamento y el salario medio de los empleados
(emple) para aquellos departamentos cuyo salario medio sea superior a 2500.*/
select dept_no, avg(salario) from emple
group by emp_no
having avg(salario) > 2500;

/*Enunciado
Calcula cuántos empleados tiene como máximo un departamento (es decir, el
valor máximo del número de empleados por departamento).*/
select * from emple;

select max(total) from (
	select count(*) as "total"
	from emple
	group by dept_no
);


/*Calcula cuántos empleados tiene como máximo un departamento (es decir, el
número máximo de empleados que hay en un mismo departamento) usando una
composición de funciones MAX(COUNT(*)).
Además, en la consulta interna debes contar los empleados por departamento
haciendo un JOIN entre las tablas emple y depart.*/
select max(total) from (
	select count(*) as "total"
	from emple e
	join depart d on e.dept_no = d.dept_no  
	group by d.dept_no
);

/*Enunciado
Muestra el nombre del centro y, si existe, los apellidos del empleado de la tabla
personal. Queremos todos los centros aunque no tengan personal asociado.*/
select c.nombre, p.apellidos from centros c 
left join personal p on c.cod_centro = p.cod_centro;

/*Enunciado
Muestra el nombre del banco, el nombre de la sucursal y el número de cuenta
de todas las cuentas (cuentas), uniendo las tablas bancos, sucursales y cuentas.*/
select b.nombre_banc, s.nombre_suc, c.nombre_cta from bancos b
join sucursales s on b.cod_banco = s.cod_banco
join cuentas c on c.cod_sucur = s.cod_sucur;


/*Enunciado
Muestra el apellido y el salario de los empleados (emple) que trabajan en
departamentos situados en Madrid, usando una subconsulta con IN sobre la
tabla depart.*/
select apellido, salario from emple
where dept_no in(
	select dept_no from depart
	where loc = 'MADRID'
);

/*Enunciado
Muestra el código y el nombre de los bancos (bancos) que tienen al menos una
sucursal en la provincia de GUADALAJARA, usando EXISTS con la tabla
sucursales.*/

select cod_banco, nombre_banc from bancos b
where exists(
	select 1 from sucursales s
	where b.cod_banco = s.cod_banco  
	and s.prov_suc = 'GUADALAJARA'
);



