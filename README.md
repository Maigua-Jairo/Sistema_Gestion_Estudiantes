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

