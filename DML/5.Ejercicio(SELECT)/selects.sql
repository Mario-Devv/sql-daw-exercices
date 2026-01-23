-- 1️⃣ Muestra nombre, apellido y fecha_nacimiento de los alumnos
-- ordenados por fecha_nacimiento de más antiguo a más reciente.

-- 2️⃣ Muestra todos los cursos con nivel >= 2,
-- ordenados por nivel de mayor a menor.

--1️⃣ 

select nombre, apellido, fecha_nacimiento  
from alumno
order by fecha_nacimiento asc;

--2️⃣
select nombre 
from curso
where nivel >= 2 
order by nivel desc;