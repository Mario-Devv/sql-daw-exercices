create table curso(
	id_curso serial primary key,
	nombre varchar(40) not null,
	nivel integer,
	fecha_creacion date default current_date
	
	constraint nivelConstraint
	check(nivel between 1 and 4)
)