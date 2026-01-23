delete from alumno
where dni = '2237835J';

select * from alumno;

delete from alumno
where extract(year from fecha_nacimiento)<2000;