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
select * from employees;
SELECT LAST_NAME, EMAIL FROM employees WHERE EMAIL BETWEEN 'A' AND 'B' ORDER BY EMAIL;

update employees
set last_name = 'Toro',
 email = 'ATORO'
where last_name like '%Bull%'

rollback;




