drop table if exists jugadores;
drop table if exists equipos;

create table jugadores(
	id_jugador char(8) not null,
	nombre_jugador varchar(35) not null,
	apellidos_jugador varchar(35) not null ,
	constraint p_jugadores 
	primary key(id_jugador)
);

create table equipos (
	id_equipo char(3) not null,
	nombre_equipo varchar(50) not null,
	id_jugador char(8),
	constraint p_equipos
	primary key(id_equipo),
	constraint f_id_jugador
	foreign key(id_jugador)
	references jugadores(id_jugador)
);

SELECT 
    c.table_name,
    c.column_name,
    c.data_type,
    c.numeric_scale,
    case when character_maximum_length is not null
            then character_maximum_length
            else numeric_precision end as max_length,
    c.is_nullable,
    CASE WHEN kcu.column_name IS NOT NULL THEN 'YES' ELSE 'NO' END AS is_primary_key
FROM 
    information_schema.columns c
LEFT JOIN
    information_schema.key_column_usage kcu 
    ON c.table_name = kcu.table_name
    AND c.column_name = kcu.column_name
    AND kcu.constraint_name in (
        SELECT constraint_name 
        FROM information_schema.table_constraints 
        WHERE table_name  in ('equipos', 'jugadores') AND constraint_type = 'PRIMARY KEY'
    )
WHERE 
    c.table_name in ('equipos', 'jugadores')
ORDER BY 
    c.column_name, c.table_name;