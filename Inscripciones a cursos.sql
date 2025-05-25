CREATE TABLE estudiantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  edad INT
);

CREATE TABLE cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  duracion VARCHAR(50)
);

CREATE TABLE inscripciones (
  id_estudiante INT,
  id_curso INT,
  PRIMARY KEY (id_estudiante, id_curso),
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id) ON DELETE CASCADE,
  FOREIGN KEY (id_curso) REFERENCES cursos(id) ON DELETE CASCADE
);

INSERT INTO estudiantes (nombre, edad) VALUES
('Vicente', 19),
('María', 21),
('Carlos', 20),
('Ana', 22),
('Luis', 18);

INSERT INTO cursos (nombre, duracion) VALUES
('Programación Básica', '3 meses'),
('Base de Datos', '2 meses'),
('Desarrollo Web', '4 meses'),
('Algoritmos', '3 meses');

INSERT INTO inscripciones (id_estudiante, id_curso) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3),
(4, 4);

SELECT e.nombre AS estudiante, c.nombre AS curso
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.id_estudiante
LEFT JOIN cursos c ON i.id_curso = c.id
ORDER BY e.nombre;

SELECT e.nombre AS estudiante
FROM estudiantes e
JOIN inscripciones i ON e.id = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id
WHERE c.nombre = 'Base de Datos';

SELECT c.nombre AS curso
FROM cursos c
JOIN inscripciones i ON c.id = i.id_curso
JOIN estudiantes e ON i.id_estudiante = e.id
WHERE e.nombre = 'Vicente';

SELECT c.nombre AS curso, COUNT(i.id_estudiante) AS numero_estudiantes
FROM cursos c
LEFT JOIN inscripciones i ON c.id = i.id_curso
GROUP BY c.nombre;

SELECT e.nombre AS estudiante
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.id_estudiante
WHERE i.id_estudiante IS NULL;
