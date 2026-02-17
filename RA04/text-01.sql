drop table if exists aeropuertos;

create table aeropuertos (
	cod_aeropuerto char(3),
	nombre varchar(50),
	ciudad varchar(50),
	pais char(3),
	orden integer
);

insert into aeropuertos (cod_aeropuerto, nombre, ciudad, pais, orden)
values('TXF', 'Tenerife Aeropuerto del Norte-Sur', 'Santa Cruz de Tenerife', 'ES', 49),
('TFS', 'Tenerife Sur', 'Tenerife Sur', 'ES', 43),
('TFN', 'Tenerife Norte-Ciudad de La Laguna', 'Tenerife Norte-Ciudad de La Laguna', 'ES', 42);

SELECT * FROM aeropuertos WHERE cod_aeropuerto like 'T%'
ORDER BY cod_aeropuerto;