/*Presenta los apellidos y oficios de los empleados que tienen el mismo trabajo que Jiménez. 
Pista, hay 3. */


select apellido, oficio from emple
where oficio = (
	select e2.oficio from emple e2
	where e2.apellido = 'JIMENEZ'
);

/*Obtén los datos de los empleados cuyo director (columna DIR de la tabla EMPLE) sea 
CEREZO (lo cumple 1 registro). */
select * from emple
where dir = (
	select e2.emp_no from emple e2
	where e2.apellido = 'CEREZO' 
);

/*Obtén los datos de los empleados cuyo director (columna DIR de la tabla EMPLE) sea 
CEREZO (lo cumple 1 registro). */
select * from emple
where dept_no = (
	select dept_no from departamentos
	where dnombre = 'VENTAS'
);

/*Muestra los datos (apellidos, oficio, salario y fecha de alta) de aquellos empleados que 
desempeñen el mismo oficio que Jiménez o que tengan un salario mayor  o igual que 
Fernández.(6) Es lo mismo pero con dos criterios (una condición o la otra)*/
select * from emple;

select apellido, oficio, salario, fecha_alta
from emple e 
where e.oficio = (
	select e2.oficio from emple e2
	where e2.apellido = 'JIMENEZ'
) or e.salario >= (
	select e3.salario from emple e3
	where e3.apellido = 'JIMENEZ'
)

/*Obtén el apellido y el salario de los empleados que superen todos los salarios  de los 
empleados del departamento 20.(2) */


