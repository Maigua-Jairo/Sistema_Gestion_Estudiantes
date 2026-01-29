-- Base de datos para el proyecto de 2 bimestre
Create database if not exists sistema_asistencia;
use sistema_asistencia;
-- Proyecto base de datos Camacho, Maigua

-- Tablas
-- Estudiante
Create table if not exists Estudiante(
 id_estudiante int auto_increment primary key,
 nombres varchar(100)not null,
 apellidos varchar(100) not null,
 correo varchar(100) unique,
 estado varchar(20)
);

-- Docente

create table if not exists Docente(
   id_docente int auto_increment primary key,
   nombres varchar(100) not null,
   apellidos varchar(100) not null,
   correo varchar(100) unique
);
-- Materia
create table if not exists materia(
   id_materia int auto_increment primary key,
   nombre varchar(100),
   creditos int not null
);

-- Curso
create table if not exists Curso(
  id_curso int auto_increment primary key,
  nombre varchar(100) not null,
  periodo varchar(50) not null
);

-- Tablas de relaciones
-- ASIGNACION
create table if not exists asignacion(
 id_asignacion int auto_increment primary key,
 id_docente int not null,
 id_materia int not null,
 id_curso int not null,
 periodo varchar(50) not null,
 
 foreign key (id_docente) references Docente(id_docente),
 foreign key (id_materia) references Materia(id_materia),
 foreign key (id_curso) references Curso(id_curso)
);

-- Matricula
create table if not exists Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_materia INT NOT NULL,
    id_curso INT NOT NULL,

    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_materia) REFERENCES Materia(id_materia),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Asistencia
create table if not exists Asistencia(
   id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula)
);


-- Justificacion
Create table if not exists Justificacion(
    id_justificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_asistencia INT NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    aprobado BOOLEAN NOT NULL,

    FOREIGN KEY (id_asistencia) REFERENCES asistencia(id_asistencia)
);
INSERT INTO Estudiante (nombres, apellidos, correo, estado) VALUES
('Juan', 'Perez', 'juan.perez@epn.edu.ec', 'activo'),
('Maria', 'Lopez', 'maria.lopez@epn.edu.ec', 'activo'),
('Carlos', 'Vera', 'carlos.vera@epn.edu.ec', 'activo'),
('Ana', 'Mendoza', 'ana.mendoza@epn.edu.ec', 'activo'),
('Luis', 'Ortega', 'luis.ortega@epn.edu.ec', 'activo'),
('Sofia', 'Ramos', 'sofia.ramos@epn.edu.ec', 'activo'),
('Diego', 'Paredes', 'diego.paredes@epn.edu.ec', 'activo'),
('Valeria', 'Castro', 'valeria.castro@epn.edu.ec', 'activo'),
('Andres', 'Navarro', 'andres.navarro@epn.edu.ec', 'activo'),
('Camila', 'Torres', 'camila.torres@epn.edu.ec', 'activo');
select * from Estudiante;
-- Insertar Docentes
INSERT INTO docente (nombres, apellidos, correo) VALUES
('Ana', 'Martinez', 'ana.martinez@epn.edu.ec'),
('Luis', 'Gomez', 'luis.gomez@epn.edu.ec'),
('Pedro', 'Salazar', 'pedro.salazar@epn.edu.ec'),
('Rosa', 'Villacis', 'rosa.villacis@epn.edu.ec'),
('Jorge', 'Molina', 'jorge.molina@epn.edu.ec'),
('Paula', 'Espinoza', 'paula.espinoza@epn.edu.ec'),
('Fernando', 'Reinoso', 'fernando.reinoso@epn.edu.ec'),
('Lucia', 'Benitez', 'lucia.benitez@epn.edu.ec'),
('Marco', 'Chavez', 'marco.chavez@epn.edu.ec'),
('Elena', 'Cruz', 'elena.cruz@epn.edu.ec');

-- Insertar Materias
INSERT INTO materia (nombre, creditos) VALUES
('Base de Datos', 4),
('Programacion I', 5),
('Programacion II', 5),
('Matematicas Discretas', 4),
('Sistemas Operativos', 4),
('Redes de Computadoras', 4),
('Ingenieria de Software', 5),
('Estructura de Datos', 4),
('Arquitectura de Computadores', 4),
('Seguridad Informatica', 4);
-- Insertar Cursos
INSERT INTO curso (nombre, periodo) VALUES
('Segundo Software A', '2025-A'),
('Segundo Software B', '2025-A'),
('Tercero Software A', '2025-A'),
('Tercero Software B', '2025-A'),
('Cuarto Software A', '2025-A'),
('Cuarto Software B', '2025-A'),
('Quinto Software A', '2025-A'),
('Quinto Software B', '2025-A'),
('Sexto Software A', '2025-A'),
('Sexto Software B', '2025-A');
-- Insertar asignaciones
INSERT INTO asignacion (id_docente, id_materia, id_curso, periodo) VALUES
(1,1,1,'2025-A'),
(2,2,2,'2025-A'),
(3,3,3,'2025-A'),
(4,4,4,'2025-A'),
(5,5,5,'2025-A'),
(6,6,6,'2025-A'),
(7,7,7,'2025-A'),
(8,8,8,'2025-A'),
(9,9,9,'2025-A'),
(10,10,10,'2025-A');
-- Insertar matriculas
INSERT INTO matricula (id_estudiante, id_materia, id_curso) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);
select * from matricula;
-- Insertar asistencias
INSERT INTO asistencia (id_matricula, fecha, estado) VALUES
(1,'2025-01-10','presente'),
(2,'2025-01-10','presente'), 
(3,'2025-01-10','ausente'),
(4,'2025-01-10','presente'),
(5,'2025-01-10','ausente'),
(6,'2025-01-10','presente'),
(7,'2025-01-10','presente'),
(8,'2025-01-10','ausente'),
(9,'2025-01-10','presente'),
(10,'2025-01-10','ausente');
select * from asistencia;
-- Insertar justificaciones
INSERT INTO justificacion (id_asistencia, motivo, aprobado) VALUES
(1,'Enfermedad',TRUE),
(2,'Problemas familiares',TRUE),
(3,'Cita medica',TRUE),
(4,'Viaje',FALSE),
(5,'Retraso',FALSE),
(6,'Actividad institucional',TRUE),
(7,'Permiso especial',TRUE),
(8,'Emergencia',TRUE),
(9,'Fuerza mayor',TRUE),
(10,'Otro motivo',FALSE);


