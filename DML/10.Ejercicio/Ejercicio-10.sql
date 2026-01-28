select * from alumno;

select * from curso;

select * from matricula;


select a.nombre as "Usuario", 
c.nombre as "Curso"
from alumno a
join matricula m on
m.dni_alumno = a.dni
join curso c on
c.id_curso = m.id_curso
where c.nombre = 'Java'
;