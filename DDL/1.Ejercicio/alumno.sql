drop table if exists alumno;

create table alumno (
	id varchar(9) primary key,
	nombre varchar(20) not null,
	apellido varchar(30) not null, 
	fecha_nacimiento date,
	email varchar(50) unique
)