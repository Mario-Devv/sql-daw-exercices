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

select * from get_empleados_count();