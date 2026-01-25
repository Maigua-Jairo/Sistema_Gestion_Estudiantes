-- Base de datos para el proyecto de 2 bimestre
Create database if not exists sistema_asistencia;
use sistema_asistencia;

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
('Ana', 'Maria', 'ana.maria@epn.edu.ec', 'activo');
select * from Estudiante;