drop table if exists entrenadores;
drop table if exists equipos;
drop table if exists temporadas;
drop table if exists entrena;

create table entrenadores(
	id_entrenador char(5) not null,
	nombre_entrenador varchar(50) not null,
	constraint p_entrenadores
	primary key (id_entrenador)
);

create table equipos (
	id_equipo char(3) not null,
	nombre_equipo varchar(50) not null,
	constraint p_equipos
	primary key(id_equipo)
);

create table temporadas(
	id_temporada char(7) not null,
	año numeric(4) not null,
  	constraint pk_temporadas primary key(id_temporada)
);

create table entrena (
	id_temporada char(7) not null,	
	id_entrenador char(5) not null,
	id_equipo char(3) not null,
    
	constraint f_entrenadores
	foreign key(id_entrenador)
	references entrenadores(id_entrenador),
	
  
  	constraint f_equipos
  	foreign key(id_equipo)
  	references equipos(id_equipo),
  	
  	constraint f_temporadas
  	foreign key(id_temporada)
  	references temporadas(id_temporada),
        
	constraint p_temporadas
	primary key(id_entrenador, id_temporada, id_equipo)
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
    c.table_name in ('equipos', 'entrenadores', 'temporadas', 'entrena')
ORDER BY 
    c.column_name, c.table_name;
