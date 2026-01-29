-- Consultas y operaciones en mysql
use sistema_asistencia;
-- CONSULTAS SIMPLES

-- 1. Lista de estudiantes activos
select * from estudiante
where estado="activo";
-- 2. Asistencias ausentes en una fecha
select * from asistencia 
where estado='ausente' and fecha='2025-01-10';
-- 3. Listar todos los docentes
select * from docente;
-- 4. Materias con 4 creditos
select * from materia 
where creditos > 4;
-- 5. Cursos del periodo 2025-A
select * from curso
where periodo = '2025-A';
-- JOINS 
-- 1. Asistencias con nombre del estudiante 
select e.nombres, e.apellidos, a.fecha, a.estado from asistencia a
join matricula m on a.id_matricula=m.id_matricula
join estudiante e on m.id_estudiante= e.id_estudiante;

-- 2. Estudiantes por curso
Select c.nombre as Curso, e.nombres, e.apellidos from matricula m
join curso c on m.id_curso=c.id_curso
join estudiante e on m.id_estudiante=e.id_estudiante;

-- 3.Docentes y materias asignadas
Select d.nombres, d.apellidos, ma.nombre as Materia, c.nombre as Curso 
from asignacion a
join  docente d on a.id_docente=d.id_docente
join materia ma on  a.id_materia=ma.id_materia
join curso c on a.id_curso=c.id_curso;

-- 4. Asitencias justificadas
select e.nombres, a.fecha, j.motivo
from justificacion j
join asistencia a ON j.id_asistencia = a.id_asistencia
join matricula m ON a.id_matricula = m.id_matricula
join estudiante e ON m.id_estudiante = e.id_estudiante;

-- 5. Estudiantes ausentes por materia
select e.nombres, ma.nombre as materia, a.fecha
from asistencia a
join matricula m on a.id_matricula = m.id_matricula
join estudiante e on m.id_estudiante = e.id_estudiante
join materia ma on m.id_materia = ma.id_materia
where a.estado = 'ausente';

-- 6. Estudiantes con su docente y materia
select e.nombres as Nombre , e.apellidos as Apellido,
	   d.nombres as Docente,
       ma.nombre as Materia 
from estudiante e
join matricula m on e.id_estudiante = m.id_estudiante
join materia ma on m.id_materia = ma.id_materia
join asignacion a on ma.id_materia = a.id_materia
join docente d on a.id_docente = d.id_docente ;

-- FUNCIONES DE AGREGACION
-- 1.Total de faltas por estudiante
Select e.nombres, count(*) as "Total Faltas" from asistencia a
join matricula m on a.id_matricula=m.id_matricula
join estudiante e on m.id_estudiante=e.id_estudiante
where a.estado= 'ausente'
group by e.nombres;

-- Promedio de asistencias por estudiante 
Select e.nombres, avg(case when a.estado='presente' then 1 else 0 end) as "Promedio Asistencias"
from asistencia a
join matricula m on a.id_matricula=m.id_matricula
join estudiante e on m.id_estudiante=e.id_estudiante
group by e.nombres;

-- SUM total de asistencias registradas por estudiante
select e.nombres as Nombre, sum(case when a.estado = 'presente' then 1 else 0 end) as "Total Asistencias"
from asistencia a
join matricula ma on a.id_matricula = ma.id_matricula
join estudiante e on ma.id_estudiante = e.id_estudiante
group by e.nombres;

--   FUNCIONES DE CADENA
-- Mostrar nombre completo en mayúsculas
select upper(concat(nombres ,' ', apellidos)) AS "Nombre completo"
from estudiante;

-- FUNCION DE CADENA 2 longitud de correo
select nombres, length(correo) as "Longitud del correo" from estudiante;

-- SUBCONSULTAS
-- Estudiantes con mas de 1 falta
Select nombres, apellidos from estudiante
where id_estudiante in( select m.id_estudiante
                     from asistencia a
					join matricula m on a.id_matricula=m.id_matricula
                    where a.estado='ausente'
                    group by m.id_estudiante
                    having count(*)>1
);

-- SUBCONSULTA 2 
-- estudiantes que no faltaron 
select nombres, apellidos from estudiante 
where id_estudiante not in(
	select m.id_estudiante
    from asistencia a
    join matricula m on a.id_matricula = m.id_matricula
    where a.estado = "ausente"
);

-- VISTAS
-- 1. Reporte general de asistencia 
create view vista_asistencia_general as
select e.nombres, e.apellidos, ma.nombre as Materia,
       a.fecha, a.estado 
from asistencia a 
join matricula m on a.id_matricula=m.id_matricula
join estudiante e on m.id_estudiante=e.id_estudiante
join materia ma on m.id_materia=ma.id_materia;

-- Operaciones CRUD
-- 1. INSERT
INSERT INTO estudiante (nombres, apellidos, correo, estado)
VALUES ('Jairo', 'Maigua', 'jairo.maigua@epn.edu.ec', 'activo');

-- 2. Actualización
Update estudiante set estado='bloqueado' 
where id_estudiante=1;
-- 3.Eliminar 
DELETE FROM justificacion
WHERE id_justificacion = 20;

-- ADMINISTRACION Y SEGURIDAD
-- 2.Usuarios y permisos 
CREATE USER 'docente'@'localhost' IDENTIFIED BY 'docente123';
GRANT SELECT, INSERT ON sistema_asistencia.asistencia TO 'docente'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON sistema_asistencia.* TO 'admin'@'localhost';

FLUSH PRIVILEGES;
DROP USER 'docente'@'localhost';
DROP USER 'admin'@'localhost';

SELECT user, host FROM mysql.user;
FLUSH PRIVILEGES;

--         SEGURIDAD
-- BACKUP COMPLETO 
-- Copia toda la base de datos sistema_asistencia
-- Comando ejecutado desde la terminal del sistema operativo

-- mysqldump -u root -p sistema_asistencia > "%USERPROFILE%\Desktop\backup_completo_sistema_asistencia.sql"

-- BACKUP LOGICO / PARCIAL

-- Copia solo tablas críticas del sistema
-- Simula un backup incremental

-- mysqldump -u root -p sistema_asistencia asistencia matricula justificacion > "%USERPROFILE%\Desktop\backup_parcial_asistencia.sql"

-- INDICES
create index idx_asistencia_fecha on asistencia(fecha);
create index idx_asistencia_estado on asistencia(estado);
-- EXPLAIN 
explain
select e.nombres, a.fecha, a.estado
from  asistencia a 
join matricula m on a.id_matricula=m.id_matricula
join estudiante e on a.id_matricula=e.id_estudiante
where a.estado='ausente';

--   TRIGGERS
-- Tabla auditoria
create table auditoria_asistencia (
   id_adutoria int auto_increment primary key,
   tabla_afectada varchar(50),
   operacion varchar(10),
   fecha timestamp default current_timestamp
);

-- trigger insert 
DELIMITER //
CREATE TRIGGER trg_insert_asistencia 
AFTER INSERT ON asistencia
FOR EACH ROW
BEGIN 
 insert into auditoria_asistencia(tabla_afectada, operacion)
values ('asistencia', 'INSERT');

END // 
DELIMITER ;

-- trigger update
DELIMITER //
CREATE TRIGGER trg_update_asistencia
AFTER UPDATE ON asistencia
FOR EACH ROW
BEGIN 
  INSERT INTO auditoria_asistencia(tabla_afectada, operacion)
  VALUES("asistencia", "UPDATE");
END //
DELIMITER ;

-- trigger delete
DELIMITER //
CREATE TRIGGER trg_delete_asistencia
 AFTER DELETE ON asistencia
 FOR EACH ROW
BEGIN
 INSERT INTO auditoria_asistencia(tabla_afectada, operacion)
 VALUES("asistencia", "DELETE");
END //
DELIMITER ;