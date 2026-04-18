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

select * from employees;
drop function get_subordinados_departamento(numeric)

/*Crea la función get_subordinados_departamento(), que recibe, como parámetro, un identificador de departamento y devuelve el número de subordinados que hay en ese departamento. Es decir:

Si el departamento no tiene ningún empleado asociado, la función devolverá el texto 'Sin empleados'.
Si el departamento únicamente tiene un empleado asociado, ese tendrá que ser el jefe, por lo que la función devolverá el texto 'Solo el jefe'.
Si el departamento tiene más de un empleado asociado, la función devolvera la cantidad de empleados asociados a la que se le descontará el jefe.
*/

create or replace function get_subordinados_departamento(
	id_departamento numeric 
)
returns text
language plpgsql
as $$
declare
	numero_subordinados integer;
begin
	select count(*) into numero_subordinados
	from employees
	where department_id = id_departamento;

	if numero_subordinados = 0 then
		return 'Sin empleados';
	elseif numero_subordinados = 1 then
		return 'Solo el jefe';
	else
		return (numero_subordinados - 1)::text;
	end if;

end;
$$;
select department_name,  get_subordinados_departamento(department_id)
from departments
order by department_name;


select d.department_id,
e.first_name,
d.department_name, 
max(extract('YEAR' from age(e.hire_date)))
from employees e
join departments d on d.department_id = e.department_id
where e.employee_id not in (
select manager_id from departments 
where department_id = e.department_id)
group by d.department_id, d.department_name, e.first_name, e.hire_date
having extract('YEAR' from e.hire_date) > max(extract('YEAR' from age(e.hire_date)))
order by d.department_name;



select *
from departments;

select *
from employees;

DROP FUNCTION sustituto_por_antiguedad(numeric);
create or replace function sustituto_por_antiguedad(
id_departamento numeric)
returns text
language plpgsql
as $$
declare
	v_sustituto_por_antiguedad text;
begin
	select e.employee_id ||' - '||e.last_name|| ', '||	e.first_name
	into v_sustituto_por_antiguedad
	from employees e
	join departments d on d.department_id = e.department_id
	where e.employee_id not in (
		select d2.manager_id from departments d2
		where d2.department_id = id_departamento) 
	and e.hire_date in(
		select min(e2.hire_date) from employees e2
		where e2.department_id = id_departamento
		and e2.employee_id not in(
			select d3.manager_id from departments d3
			where d3.department_id = id_departamento
		)
	)
	and e.department_id = id_departamento;

	if v_sustituto_por_antiguedad is null then
	return 'Sin sustituto';
	else
	return v_sustituto_por_antiguedad;
	end if;
end;
$$;

select department_id, department_name,  sustituto_por_antiguedad(department_id)
from departments
where department_id < 120
order by department_name;

