create table pasajero (
	id_pasajero integer not null,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	constraint p_pasajero
	primary key(id_pasajero)
);

create table billete(
	id_billete integer not null,
	id_pasajero integer not null,
	constraint  p_billete
	primary key(id_billete),
	constraint f_billete
	foreign key (id_pasajero)
	references pasajero(id_pasajero)
);

select kcu.table_name as foreign_table, '->' as rel, rel_tco.table_name as primary_table, string_agg(kcu.column_name, ', ') as fk_columns
from information_schema.table_constraints tco join information_schema.key_column_usage kcu on tco.constraint_schema = kcu.constraint_schema and tco.constraint_name = kcu.constraint_name
    join information_schema.referential_constraints rco on tco.constraint_schema = rco.constraint_schema and tco.constraint_name = rco.constraint_name
    join information_schema.table_constraints rel_tco on rco.unique_constraint_schema = rel_tco.constraint_schema and rco.unique_constraint_name = rel_tco.constraint_name
where tco.constraint_type = 'FOREIGN KEY' and lower(kcu.table_name) IN ('pasajero', 'billete')
group by kcu.table_schema, kcu.table_name, rel_tco.table_name, rel_tco.table_schema, kcu.constraint_name
union
select table_name, column_name, data_type, '' || 
    case when character_maximum_length is not null
        then character_maximum_length
        else numeric_precision
    end as max_length
from information_schema.columns
where lower(table_name) in ('pasajero', 'billete')
order by 1, 2;