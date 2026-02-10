drop table if exists enfrenta;
drop table if exists equipos;
DROP TABLE equipos CASCADE;


create table equipos(
	id_equipo char(3) not null,
	nombre varchar (50) not null,
	ciudad varchar (35) not null,
	
	constraint pk_equipos primary key(id_equipo)

);

create table enfrenta (
	fecha date not null,
	id_equipo_local char(3) not null,
	id_equipo_visitante char(3) not null,
	
	constraint fk_equipo1
   	foreign key (id_equipo_local)
	references equipos(id_equipo),

	constraint fk_equipo2
   	foreign key (id_equipo_visitante)
	references equipos(id_equipo),
		
	constraint pk_partido
	primary key(fecha, id_equipo_local, id_equipo_visitante)
);

SELECT 
    c.table_name,
    c.column_name,
    c.data_type,
    c.is_nullable
FROM 
    information_schema.columns c
LEFT JOIN
    information_schema.key_column_usage kcu 
    ON c.table_name = kcu.table_name
    AND c.column_name = kcu.column_name
WHERE 
    c.table_name in ('equipos', 'enfrenta')
ORDER BY 
    c.column_name, c.table_name;