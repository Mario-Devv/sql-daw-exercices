-- =============================================
-- TABLAS DEPARTAMENTOS y EMPLE
-- =============================================
CREATE TABLE departamentos (
    dept_no     SMALLINT      PRIMARY KEY,
    dnombre     VARCHAR(20),      -- ampliado por seguridad
    localidad   VARCHAR(15)
);

CREATE TABLE emple (
    emp_no      INTEGER       PRIMARY KEY,
    apellido    VARCHAR(15),      -- ampliado
    oficio      VARCHAR(15),      -- ¡CORREGIDO! (antes era 9)
    dir         INTEGER,
    fecha_alta  DATE,
    salario     NUMERIC(7,2),
    comision    NUMERIC(7,2),
    dept_no     SMALLINT      REFERENCES departamentos(dept_no)
);

-- =============================================
-- TABLAS ALUMNOS / MÓDULOS / NOTAS
-- =============================================
CREATE TABLE alumnos (
    alum_id     SERIAL        PRIMARY KEY,
    nombre      VARCHAR(60)   NOT NULL,
    ciudad      VARCHAR(30)
);

CREATE TABLE modulos (
    mod_id      SERIAL        PRIMARY KEY,
    nombre      VARCHAR(50)   NOT NULL     -- ¡CORREGIDO! (antes 30)
);

CREATE TABLE notas (
    alum_id     INTEGER       REFERENCES alumnos(alum_id),
    mod_id      INTEGER       REFERENCES modulos(mod_id),
    nota        NUMERIC(4,2)  CHECK (nota BETWEEN 0 AND 10),
    PRIMARY KEY (alum_id, mod_id)
);

-- =============================================
-- DATOS DE DEPARTAMENTOS
-- =============================================
INSERT INTO departamentos (dept_no, dnombre, localidad) VALUES
(10, 'CONTABILIDAD', 'SEVILLA'),
(20, 'INVESTIGACION', 'MADRID'),
(30, 'VENTAS',       'BARCELONA'),
(40, 'PRODUCCION',   'MADRID');

-- =============================================
-- DATOS DE EMPLE (ejercicios 1-10)
-- =============================================
INSERT INTO emple (emp_no, apellido, oficio, dir, fecha_alta, salario, comision, dept_no) VALUES
(1001, 'GARCIA',     'PRESIDENTE', NULL,  '2022-11-17', 5000.00, NULL,    10),
(1002, 'MARTINEZ',   'DIRECTOR',   1001, '2023-02-20', 3500.00, NULL,    20),
(1003, 'LOPEZ',      'ANALISTA',   1002, '2023-03-10', 2800.00, NULL,    20),
(1004, 'FERNANDEZ',  'ANALISTA',   1002, '2023-04-05', 2900.00, NULL,    20),
(1005, 'RODRIGUEZ',  'EMPLEADO',   1001, '2023-05-12', 1800.00, NULL,    10),
(1006, 'GOMEZ',      'EMPLEADO',   1001, '2023-06-01', 1700.00, NULL,    10),
(1007, 'PEREZ',      'ANALISTA',   1002, '2023-07-15', 2750.00, NULL,    30),
(1008, 'SANCHEZ',    'VENDEDOR',   1001, '2023-08-20', 1600.00, 300.00,  30),
(1009, 'DIAZ',       'EMPLEADO',   1001, '2023-09-10', 1550.00, NULL,    30),
(1010, 'TORRES',     'EMPLEADO',   1002, '2023-10-05', 1650.00, NULL,    20),
(1011, 'RAMIREZ',    'ANALISTA',   1002, '2024-01-15', 2850.00, NULL,    20),
(1012, 'MORALES',    'EMPLEADO',   1001, '2024-02-28', 1750.00, NULL,    40);

-- =============================================
-- DATOS DE ALUMNOS (ejercicios 11-14)
-- =============================================
INSERT INTO alumnos (nombre, ciudad) VALUES
('Díaz Fernández, María', 'Madrid'),
('López García, Juan',    'Madrid'),
('Rodríguez Pérez, Ana',  'Madrid'),
('Gómez Ruiz, Carlos',    'Barcelona'),
('Fernández Soto, Laura', 'Madrid'),
('Sánchez Morales, Pedro','Valencia'),
('Martínez López, Elena', 'Madrid');

-- =============================================
-- DATOS DE MÓDULOS
-- =============================================
INSERT INTO modulos (nombre) VALUES
('FOL'),
('Programación Orientada a Objetos'),
('Base de Datos'),
('Sistemas Operativos'),
('Redes de Computadores'),
('Desarrollo Web');

-- =============================================
-- DATOS DE NOTAS
-- =============================================
INSERT INTO notas (alum_id, mod_id, nota) VALUES
(1, 1, 7.5),   -- Díaz Fernández, María  → FOL
(1, 2, 8.0),
(1, 3, 6.0),
(2, 1, 4.0),   -- López García, Juan → FOL suspenso
(2, 4, 9.0),
(3, 1, 7.8),   -- Rodríguez Pérez, Ana → FOL
(3, 2, 5.5),
(4, 1, 3.0),   -- Gómez Ruiz, Carlos (Barcelona)
(5, 1, 8.2),   -- Fernández Soto, Laura → FOL
(5, 3, 7.5),
(6, 1, 6.5),
(7, 1, 7.5),   -- Martínez López, Elena → FOL
(7, 5, 4.5),   -- suspenso en Redes
(7, 2, 9.0);