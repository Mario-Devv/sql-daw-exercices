DELETE FROM matricula; 
DELETE FROM alumno; 
DELETE FROM curso;

INSERT INTO alumno (dni, nombre, apellido, fecha_nacimiento, email) VALUES 
('11111111A', 'Mario', 'Gomez', '2002-05-10', 'mario@gmail.com'), 
('22222222B', 'Laura', 'Perez', '1999-03-22', 'laura@gmail.com'), 
('33333333C', 'Juan', 'Lopez', '2001-11-15', 'juan@gmail.com'), 
('44444444D', 'Ana', 'Martinez', '1998-07-30', 'ana@gmail.com'); 

INSERT INTO curso (nombre, nivel) VALUES 
('Java', 3), 
('BBDD', 4), 
('Programacion', 1), 
('Sistemas', 3); 

INSERT INTO matricula (dni_alumno, id_curso) VALUES 
('11111111A', 11), 
('11111111A', 12), 
('22222222B', 13), 
('33333333C', 14); 

SELECT * FROM alumno; 
SELECT * FROM curso; 
SELECT * FROM matricula;