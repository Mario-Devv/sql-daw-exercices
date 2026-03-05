begin;

insert into departments(
department_id, department_name, manager_id, location_id)
values(	280, 'Web Development', 103, 1700);

select * from departments where department_id = 280;

insert into employees(
	employee_id, first_name, last_name, email, phone_number,
	hire_date, job_id, salary, commission_pct, manager_id,
	department_id
)values(220, 'Mario', 'Oltra', 'mario@mario.com', '555555555',
	'2026-02-22 00:00:00.000', 'IT_PROG', 1000, 0.1, 103, 280
);

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, EMPLOYEE_ID, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, EMPLOYEES.MANAGER_ID FROM DEPARTMENTS JOIN EMPLOYEES USING (DEPARTMENT_ID)WHERE EMPLOYEES.MANAGER_ID = 103;


rollback;


begin;
/*
 * Ejercicio:
La siguiente sentencia generará el error anterior, repárala para que la inserción se pueda completar sin error.

INSERT INTO locations (LOCATION_ID, STREET_ADDRESS)
VALUES (3300, 'C/Carlos III, 3', 'Cartagena');

Añade lo mínimo necesario para que la sentencia se ejecute correctamente.*/
select * from locations;
INSERT INTO locations (LOCATION_ID, STREET_ADDRESS, CITY)
VALUES (3300, 'C/Carlos III, 3', 'Cartagena');

rollback;

begin;
/*
 * Ejercicio:
A la siguiente sentencia le falta algún atributo obligatorio

INSERT INTO job_history(EMPLOYEE_ID, START_DATE, END_DATE, DEPARTMENT_ID)
VALUES (120, CURRENT_DATE - 730, CURRENT_DATE, 20);
Añade el atributo que falta para que la sentencia se 
ejecute correctamente. El valor del atributo puede ser 
cualquiera que cumpla con la restricción de integridad 
establecida sobre ese atributo.*/

select * from job_history jh;
select * from jobs;
INSERT INTO job_history(EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,DEPARTMENT_ID)
VALUES (120, CURRENT_DATE - 730, CURRENT_DATE, 'SA_REP',20);

rollback;
/*
 * Ejercicio
Modifica el departamento cuyo nombre es 'IT' poniendo como nuevo 
MANAGER_ID al empleado con identificador 104*/
begin;
select * from employees e;
select * from departments d;

update departments d
set manager_id = 104
where d.department_name = 'IT'

rollback;

begin;
/*
 *Ejercicio
Utiliza la aritmética de fechas para actualizar las fechas de contratación (HIRE_DATE)  
de los empleados del departamento cuyo identificador es 60, incrementándolas en un intervalo de 12 años. */
select * from employees e ;

update employees
set hire_date = hire_date + interval '12 years'
where department_id = 60;

rollback;

begin;
/*
 * Ejercicio
Modifica el LAST_NAME del empleado que consta con el apellido 'Bull' por 'Toro'. 
También deberá modificarse el EMAIL, cambiando de 'ABULL' a 'ATORO'.*/
select * from employees;
SELECT LAST_NAME, EMAIL FROM employees WHERE EMAIL BETWEEN 'A' AND 'B' ORDER BY EMAIL;

update employees
set last_name = 'Toro',
 email = 'ATORO'
where last_name like '%Bull%'

rollback;

begin;
/*
 * Ejercicio
Elimina todos los departamentos que 
no tienen ningún MANAGER_ID asignado.*/
select * from departments d;

delete from departments
where manager_id is null;

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 100 AND 150 ORDER BY DEPARTMENT_ID;

rollback;

begin;
/*
 * El empleado 114 ha cesado en su puesto, por lo 
 * que todos aquellos que lo tenían como superior jerárquico, 
 * se quedan sin ninún superior jerárquico hasta que se 
 * les asigne uno.

Por lo tanto, elimina el valor del atributo MANAGER_ID 
de aquellos que tuvieran como superior 
jerárquico al empleado 114.
*/
select * from employees
where employee_id = 114;

select * from employees 
where manager_id = 100;

update employees 
set manager_id = null
where manager_id = 114;

SELECT * FROM employees WHERE EMPLOYEE_ID BETWEEN 114 AND 120 ORDER BY LAST_NAME;

rollback;

begin;
/*
 * Ejercicio
Elimina el trabajo 'ST_MAN'. En el caso de que exista 
algún empleado que actualmente esté realizando ese 
trabajo o que, según la tabla job_history, lo 
haya realizado en alguna ocasión, asígnale previamente 
el trabajo con 'ST_CLERK'.
*/
select * from jobs j;
select * from employees
where job_id = 'ST_CLERK'
;

delete from jobs
where job_id = 'ST_MAN';

update employees
set job_id = 'ST_CLERK'
where job_id = 'ST_MAN'

rollback;

begin;
/*
 * Ejercicio
Vamos a crear departamentos diferentes para los gestores. Para ello, insertaremos, en la tabla departments, 
un registro por cada uno de los tipos de trabajo cuyo identificador finalice por '_MAN', con los siguientes datos:

DEPARTMENT_ID: el que resulta de incrementar en 300 el DEPARTMENT_ID del empleado que se va a nombrar como manager del departamento.
DEPARTMENT_NAME: el JOB_TITLE del tipo de trabajo que se está insertando.
MANAGER_ID: el menor identificador de empleado de entre los que tienen el tipo de trabajo que se está insertando.
LOCATION_ID: el valor constante 1700
 * */
select * from departments;
select * from employees;
select * from jobs; 

insert into departments (department_id, department_name, manager_id, location_id)
select e.department_id + 300, j.job_title, min(e.employee_id), 1700
from employees e 
join jobs j on j.job_id = e.job_id
where j.job_id like '%_MAN'
group by e.department_id, j.job_title 
;

select * from departments;

rollback;

begin;

insert into employees(employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id, commission_pct, manager_id)
values(
	220,
	'Bustamante',
	'Lopez',
	'bustaquinqui@quinqui.com',
	current_date + interval '0 hours',
	(select job_id from jobs where job_id = 'IT_PROG'),
	(select min_salary from jobs where job_id = 'IT_PROG'),
	(select department_id from departments where department_name = 'IT'),
	(select max(commission_pct) from employees),
	(select manager_id from departments where department_name  = 'IT')
);

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, EMPLOYEE_ID, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, EMPLOYEES.MANAGER_ID
FROM DEPARTMENTS JOIN EMPLOYEES USING (DEPARTMENT_ID)
WHERE EMPLOYEES.MANAGER_ID = 103;

rollback;

begin;
/*
 * Ejercicio
Se debe trasladar el departamento cuyo nombre es 'IT' a la única dirección que consta en China
*/

/*select * from departments;
select* from countries;
select * from locations l;*/


update departments
set location_id = (select l.location_id from locations l  join countries c on l.country_id  = c.country_id
where c.country_name = 'China'
)where department_name = 'IT';

SELECT * FROM departments WHERE DEPARTMENT_ID BETWEEN 40 AND 70 ORDER BY DEPARTMENT_ID;

rollback;

begin;
/*
  
 * Ejercicio
Alexander Hunold se va a jubilar, por lo que se nombrará, 
como jefe de su departamento, al subordinado directo de éste que mayor antigüedad tenga en la empresa.*/

update departments
set manager_id = (select employee_id from employees where 
				  job_id = 'IT_PROG' and 
				  not employee_id = 103 
				  order by hire_date limit 1
		)
where department_name = 'IT'
;

SELECT * FROM departments WHERE MANAGER_ID IS NOT NULL ORDER BY DEPARTMENT_ID;


rollback;

begin;
/*
 * 
Ejercicio
Elimina todos los departamentos en los que no hay asignado ningún empleado.

Nota: Debes tener en cuenta los posibles valores NULL.*/

select * from departments;
select * from employees;

select * from departments d 
where d.department_id not in(
	select e.department_id  from employees e
	where e.department_id is not null
	);

delete from departments
where department_id not in(
	select department_id from employees
	where department_id is not null 
);

SELECT DEPARTMENT_ID FROM departments ORDER BY DEPARTMENT_ID;

rollback;

begin;

select * from departments d ;
select *from employees where hire_date <= current_date - interval  '30 years';
SELECT * FROM employees WHERE manager_id IS NOT NULL;

update departments
set manager_id = null
where manager_id in (
select employee_id from employees
where hire_date <= current_date - interval '30 years'
);

update employees
set manager_id = null
where manager_id in (
	select employee_id from employees
	where hire_date <= current_date -interval '30 years'
);


delete from job_history
where employee_id in (select employee_id from employees
where hire_date <= current_date - interval '30 years'
);

delete from employees
where hire_date <=current_date -interval '30 years';

SELECT EMPLOYEE_ID, 'old' AS origin FROM EMPLOYEES WHERE EXTRACT(year FROM AGE(CURRENT_DATE, HIRE_DATE)) >= 28

UNION

SELECT MANAGER_ID, 'departments' FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL

UNION

SELECT EMPLOYEE_ID, 'job_history' FROM JOB_HISTORY

UNION

SELECT DISTINCT MANAGER_ID, 'managers' FROM EMPLOYEES ORDER BY origin, employee_id;


rollback;









