select  * from employees;

/*Ejercicio
Utilizando la base de datos HR, crea una función que cuenta los empleados pertenecientes al departamento _department_id que se envía como parámetro*/
create or replace function get_empleados_count(numDepartamento int)
returns int
language plpgsql
as $$
declare 
	get_empleados_count integer;
begin
	select count(*)
	into get_empleados_count
	from employees
	where department_id = numDepartamento;
return get_empleados_count	;
end;$$;
select get_empleados_count(60);

/*Ejercicio
Habiendo creado correctamente la función get_empleados_count(), ¿cómo mostrarías la cantidad de empleados que tienen asociado el department_id 30 y 90?*/
DROP FUNCTION get_empleados_count();

select * from employees;
create or replace function get_empleados_count(
	out dep_30 int,
	out dep_90 int)
language plpgsql
as $$
begin
	select count(*)
	into dep_30
	from employees
	where department_id = 30;

	select count(*)
	into dep_90
	from employees
	where department_id = 90;
end;$$;


/*Ejercicio
Habiendo creado correctamente la función get_empleados_count(), ¿cómo mostrarías el número de empleados asociado a cada department_id?

Ordena el resultado descendentemente por el número de empleados.*/
select department_id, get_empleados_count(department_id) as "n_empleados"
from employees e 
group by department_id
order by count(get_empleados_count(department_id)) desc;


/*Ejercicio
Utilizando la base de datos HR, crea la función antiguedada la que le enviamos un nombre y unos apellidos y nos devuelve los años de antigüedad que ese empleado lleva en la empresa

Para resolver esa función, deberás utilizar las funciones EXTRACT() y AGE() cuyas referencias puedes encontrar aquí*/
select extract(year from age(hire_date)) from employees;
create or replace function antiguedad(
	nombre varchar,
	apellidos varchar
)
returns integer
language plpgsql
as $$
declare
	obtenerAntiguedad integer;
begin
	select extract(year from age(hire_date))
	into obtenerAntiguedad
	from employees
	where nombre = first_name and apellidos = last_name
	;
return obtenerAntiguedad; 
end;$$;

select e.first_name, e.last_name, antiguedad(e.first_name, e.last_name) from employees e;

select department_id, get_empleados_count(department_id) as "n_empleados"
from employees e 
group by department_id
order by count(get_empleados_count(department_id)) desc;



SELECT department_id, get_empleados_count(department_id) as n_empleados FROM EMPLOYEES E
GROUP BY department_id
ORDER BY n_empleados DESC;
