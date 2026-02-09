alter table ciclista
rename column fecha_nacimiento to fecha_nac;

drop table if exists ciclista;
drop table if exists equipo;
drop table if exists pertenece;

create table ciclista(
	ficha integer not null,
	fecha_nac date not null,
	nombre varchar(50) not null,
	pais varchar(30) default 'ESPAÑA' not null,
	anyo_retiro integer,
	anyo_prof integer not null,
	constraint p_ciclista
	primary key (ficha),
	constraint anyo_ciclistas
	check(anyo_prof > 2015)
);

create table equipo (
	nombre varchar(50) not null,
	anyo_apar integer not null,
	anyo_des integer,
	constraint p_pertenece
	primary key (nombre)
);

create table pertenece(
	anyo integer not null,
	ficha integer not null,
	nombre varchar(50) not null,
	constraint f_ciclista
	foreign key(ficha)
	references ciclista(ficha),
	constraint f_equipo
	foreign key (nombre)
	references equipo(nombre),
	constraint p_equipo
	primary key (anyo, ficha, nombre)
);


INSERT INTO ciclista (ficha,fecha_nac,nombre)
	VALUES (1,'2001-10-02','Pepe');
INSERT INTO ciclista (ficha,fecha_nac,nombre,anyo_retiro,anyo_prof)
	VALUES (2,'2000-01-12','Juana',2019,2018);
INSERT INTO ciclista (ficha,fecha_nac,nombre,pais,anyo_retiro,anyo_prof)
	VALUES (3,'1999-03-22','Juan','Italia',NULL,2020);
INSERT INTO ciclista (ficha,fecha_nac,nombre,pais,anyo_retiro,anyo_prof, pertenece)
	VALUES (4,'1999-03-22','Juan','Italia',NULL,2020, 2018);
INSERT INTO equipo (nombre,anyo_apar)
	VALUES ('Itinere',2022);
INSERT INTO ciclista (ficha,fecha_nac,nombre,pais,anyo_retiro,anyo_prof, equipo)
	VALUES (5,'1999-03-22','Juan','Italia',NULL,2020, 2018, 'Itinere');
INSERT INTO equipo (nombre,anyo_apar,anyo_des)
	VALUES ('Encuentro',2018,2021);
INSERT INTO equipo (nombre,anyo_apar)
	VALUES ('ImaginaUnaEmpresaDiferenteImaginaUnaEmpresaDiferenteImaginaUnaEmpresaDiferenteImaginaUnaEmpresaDiferente',2019);
INSERT INTO equipo (nombre,anyo_apar)
	VALUES ('InnovaFest',2021);
INSERT INTO equipo (nombre)
	VALUES ('ImaginaUnaEmpresaDiferente');
INSERT INTO equipo (nombre,anyo_apar)
	VALUES ('InnovaFest',2022);
INSERT INTO pertenece (ficha,nombre)
	VALUES (1,'Itinere');
INSERT INTO pertenece (ficha,nombre,anyo)
	VALUES (2,'Itineres',2022);
INSERT INTO pertenece (ficha,nombre,anyo)
	VALUES (21,'Itinere',2022);
INSERT INTO pertenece (ficha,nombre,anyo)
	VALUES (3,'Itinere',2022);
INSERT INTO pertenece (ficha,nombre,anyo)
	VALUES (3,'Itinere',2022);
INSERT INTO ciclista (ficha,fecha_nac,nombre,pais,anyo_retiro,anyo_prof, pertenece)
	VALUES (6,'1999-03-22','Juan','Italia',NULL,2020, 2018);
INSERT INTO ciclista (ficha,fecha_nac,nombre,pais,anyo_retiro,anyo_prof, equipo)
	VALUES (7,'1999-03-22','Juan','Italia',NULL,2020, 'Itinere');

select ficha, pais, anyo_prof  from CICLISTA
union
select anyo_apar, nombre, anyo_des from equipo
union
select ficha , nombre, anyo from pertenece
order by 1,2;

