/*
 * Crea la tabla matricula con las siguientes características:

Contiene los campos:

dni_alumno

id_curso

fecha_matricula

dni_alumno referencia a la tabla alumno

id_curso referencia a la tabla curso

La clave primaria es compuesta

Al eliminar un alumno, se eliminan sus matrículas

No se permite eliminar un curso si existen matrículas asociadas
 */

create table matricula (
	dni_alumno varchar(9),
	id_curso integer,
	fecha_matricula date default current_date not null,
	
	primary key(dni_alumno, id_curso),
	
	constraint fk_dni foreign key (dni_alumno) 
	references alumno(dni)
	on delete cascade,
	
	constraint fk_curso foreign key (id_curso) 
	references curso (id_curso)
	on delete restrict
	
)