# Sistema de Gestión de Asistencia Académica

## Proyecto Segundo Bimestre – Base de Datos  
**Carrera:** Tecnología Superior en Desarrollo de Software  
**Asignatura:** Base de Datos  
**Periodo académico:** 2025-B  
**Institución:** Escuela Politécnica Nacional  

**Integrantes:**  
- Diego Camacho  
- Jairo Maigua  

## 1. Descripción del proyecto
El presente proyecto consiste en el diseño, implementación y administración de una base de datos relacional para un **Sistema de Gestión de Asistencia Académica**, cuyo objetivo es registrar, consultar y auditar la asistencia de estudiantes en distintas materias y cursos, asignadas a docentes dentro de un período académico.

El sistema simula un escenario real del ámbito educativo, permitiendo gestionar estudiantes, docentes, materias, cursos, matrículas, asistencias y justificaciones, aplicando buenas prácticas de modelado y seguridad de bases de datos.

---

## 2. Objetivo general
Diseñar e implementar una base de datos relacional utilizando MySQL, aplicando principios de modelado, normalización, seguridad y auditoría, para resolver un caso práctico de gestión académica.

---

## 3. Objetivos específicos
- Analizar los requerimientos del sistema para identificar entidades y relaciones.
- Construir un modelo entidad-relación normalizado hasta la Tercera Forma Normal (3FN).
- Implementar la base de datos en MySQL con claves primarias y foráneas.
- Desarrollar consultas SQL utilizando joins, funciones de agregación, funciones de cadena, subconsultas y vistas.
- Aplicar mecanismos de seguridad mediante usuarios, permisos y auditoría.
- Realizar backups para garantizar la durabilidad de la información.

---

## 4. Modelo de datos
El modelo de datos está compuesto por las siguientes entidades principales:
- Estudiante
- Docente
- Materia
- Curso
- Matrícula
- Asistencia
- Justificación
- Asignación

Las relaciones permiten vincular estudiantes con cursos y materias, registrar asistencias y justificar inasistencias, asegurando integridad referencial mediante claves foráneas.

El modelo se encuentra normalizado hasta **3FN**, evitando redundancia y dependencias innecesarias.

---

## 5. Estructura del repositorio
Sistema_Gestion_Estudiantes/
├── Script_Sistema_Asistencia.sql
├── Consultas_Sistema_Asistencia.sql
├── backups/
  ├── backup_completo_sistema_asistencia.sql
  ├── backup_parcial_asistencia.sql
---

## 6. Implementación
La base de datos fue implementada en **MySQL**, creando tablas con restricciones de integridad como:
- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE

Se insertaron datos de prueba para validar el correcto funcionamiento del modelo.

---

## 7. Consultas SQL
El proyecto incluye:
- Consultas simples con filtros.
- Seis consultas con JOIN entre múltiples tablas.
- Funciones de agregación (COUNT, AVG, SUM).
- Funciones de cadena (UPPER, LENGTH).
- Subconsultas.
- Vistas para reportes de asistencia.
- Operaciones CRUD (INSERT, UPDATE, DELETE).

---

## 8. Seguridad
Se implementaron mecanismos de seguridad que incluyen:
- Creación de usuarios con distintos niveles de permisos (administrador y docente).
- Asignación de privilegios mediante GRANT.
- Control de accesos a la base de datos.
- Prevención teórica de inyección SQL mediante el uso de consultas preparadas en backend.
- Uso de hash para contraseñas como concepto de seguridad.

---

## 9. Auditoría
Se implementó una auditoría mediante triggers:
- Trigger AFTER INSERT
- Trigger AFTER UPDATE
- Trigger AFTER DELETE

Estos triggers registran las operaciones realizadas sobre la tabla de asistencia en una tabla de auditoría, permitiendo el seguimiento de cambios.

---

## 10. Backups
Se realizaron dos tipos de respaldos:
- **Backup completo:** copia total de la base de datos.
- **Backup lógico/parcial:** copia de tablas críticas (asistencia, matrícula y justificación).

Los backups garantizan la recuperación de la información y la durabilidad de los datos.

---

## 11. ACID
El sistema cumple con las propiedades ACID:
- **Atomicidad:** uso de transacciones.
- **Consistencia:** restricciones de integridad.
- **Aislamiento:** control de concurrencia del SGBD.
- **Durabilidad:** commits y backups realizados.

---

## 12. Conclusiones
El proyecto permitió aplicar de manera práctica los conceptos fundamentales de bases de datos relacionales, fortaleciendo conocimientos en modelado, normalización, consultas avanzadas, seguridad y administración de bases de datos.

---

## 13. Recomendaciones y trabajos futuros
- Implementar una interfaz web para el sistema.
- Integrar la base de datos con un backend usando prepared statements.
- Optimizar consultas mediante índices adicionales.
- Implementar control de roles más detallado.

---
