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



