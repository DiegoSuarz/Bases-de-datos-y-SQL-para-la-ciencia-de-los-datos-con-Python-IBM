/*markdown
# Laboratorio práctico: Trabajando con Joins en MySQL usando phpMyAdmin

SQL JOIN es una cláusula que combina filas de dos o más tablas basándose en una columna relacionada entre ellas. La relación de las tablas se establece al comparar los valores en las columnas. El propósito de usar JOINs es recuperar datos de múltiples tablas en una sola consulta. Hay cuatro tipos de JOINs en SQL: INNER JOIN, LEFT JOIN, RIGHT JOIN y FULL OUTER JOIN.

- INNER JOIN: Devuelve solo las filas con valores coincidentes en ambas tablas.
- LEFT JOIN: Devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha.
- RIGHT JOIN: Devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda.
- FULL OUTER JOIN: Devuelve todas las filas cuando hay una coincidencia en la tabla izquierda o derecha.

## Objetivos
Al final de este laboratorio, podrás:
- Escribir consultas SQL en múltiples tablas usando INNER JOINS
- Escribir consultas SQL en múltiples tablas usando OUTER JOINS

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás MySQL. MySQL es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es interna. Estarás trabajando en una base de datos de ejemplo de recursos humanos (HR). Este esquema de base de datos de HR consta de cinco tablas: **EMPLOYEES**, **JOB_HISTORY**, **JOBS**, **DEPARTMENTS** y **LOCATIONS**. Cada tabla tiene algunas filas de datos de ejemplo. El siguiente diagrama muestra las tablas para la base de datos de HR:

![alt text](image.png)

En este laboratorio, realizarás algunos problemas de práctica en SQL que te proporcionarán experiencia práctica con los diferentes tipos de operaciones de join.

> **NOTA**: Este laboratorio requiere que tengas estas cinco tablas de la base de datos HR pobladas con datos de ejemplo en MySQL.

## Cargar la base de datos
Usando las habilidades adquiridas en los módulos anteriores, primero debes crear la base de datos en MySQL. Sigue los pasos a continuación:

1. Abre la interfaz de phpMyAdmin desde el Skills Network Toolbox en Cloud IDE.

2. Crea una base de datos en blanco llamada 'HR'. Usa el script compartido en el enlace a continuación para crear las tablas requeridas.
[Script_Create_Tables.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/scripts/Script_Create_Tables.sql)

3. Descarga los archivos en los enlaces a continuación a tu máquina local (si no lo has hecho ya en laboratorios anteriores).

- [Departments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Departments.csv)
- [Jobs.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Jobs.csv)
- [JobsHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/JobsHistory.csv)
- [Locations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Locations.csv)
- [Employees.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Employees.csv)

4. Usa estos archivos en la interfaz como datos para las tablas respectivas en la base de datos 'HR'.

## UNIONES
Veamos algunos ejemplos de UNIONES utilizadas para consultar los datos.

1. Recuperar los nombres y las fechas de inicio de trabajo de todos los empleados que trabajan para el departamento número 5.

Necesitamos utilizar la operación de unión interna con la tabla EMPLEADOS como la tabla izquierda y la tabla HISTORIAL_DE_TRABAJO como la tabla derecha. La unión se realizará sobre el ID del empleado, y la respuesta de la consulta se filtrará por el valor del ID del departamento 5. La consulta para esta pregunta será como se muestra a continuación.

```sql
SELECT E.F_NAME,E.L_NAME, JH.START_DATE 
FROM EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH 
ON E.EMP_ID=JH.EMPL_ID 
WHERE E.DEP_ID ='5';
```
2. Recuperar el ID del empleado, el apellido, el ID del departamento y el nombre del departamento para todos los empleados.

Para esto, debes usar la operación de Left Outer Join con la tabla EMPLOYEES como la tabla izquierda y la tabla DEPARTMENTS como la tabla derecha. La unión se realizará en el ID del departamento.

**La consulta de unión izquierda recupera todos los empleados, incluyendo los detalles de su departamento si están disponibles. Si un empleado no pertenece a ningún departamento, los campos del departamento serán NULL.**

La consulta se escribirá de la siguiente manera:

```sql
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D 
ON E.DEP_ID=D.DEPT_ID_DEP;
```
3. Recuperar el nombre, apellido y nombre del departamento de todos los empleados.

Para esto, utilizarás la operación de Full Outer Join con la tabla EMPLOYEES como la tabla izquierda y la tabla DEPARTMENTS como la tabla derecha. Un full outer join en MySQL se implementa como una UNIÓN de joins externos izquierdo y derecho.

**La consulta de Full Outer Join recupera todos los empleados y departamentos, mostrando todas las combinaciones. Si un empleado no está asociado con un departamento, o un departamento no tiene empleados, los campos faltantes serán NULL.**

La consulta se escribirá como se muestra a continuación.

```sql
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP
UNION
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP
```

## Problemas de Práctica
1. Recupera los nombres, fechas de inicio de trabajo y títulos de trabajo de todos los empleados que trabajan para el departamento número 5.

    <details><summary>Pista </summary>
    > Realiza un INNER JOIN con 3 tablas: EMPLOYEES, JOB_HISTORY, JOBS.
    </details>



    <details><summary>Solución </summary>

    ```sql
        select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
        from EMPLOYEES as E 
        INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
        INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
        where E.DEP_ID ='5';
    ```
    </details>

2. Recupera el ID del empleado, el apellido y el ID del departamento para todos los empleados, pero los nombres de los departamentos solo para aquellos nacidos antes de 1980.

    <details><summary>Pista </summary>
    > Usa un AND en la cláusula LEFT OUTER JOIN.
    </details>



    <details><summary>Solución </summary>

    ```sql
        SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
        FROM EMPLOYEES AS E
        LEFT OUTER JOIN DEPARTMENTS AS D
        ON E.DEP_ID = D.DEPT_ID_DEP
        AND YEAR(E.B_DATE) < 1980;
    ```
    </details>

3. Recupera el nombre y apellido de todos los empleados, pero el ID del departamento y los nombres de los departamentos solo para empleados masculinos.

    <details><summary>Pista </summary>
    > Agrega un AND en la Consulta 3A para filtrar a los empleados masculinos en la cláusula ON. Alternativamente, también puedes usar Left Outer Join.
    </details>



    <details><summary>Solución </summary>

    ```sql
        SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
        FROM EMPLOYEES AS E
        LEFT OUTER JOIN DEPARTMENTS AS D
        ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'

        UNION

        SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
        from EMPLOYEES AS E
        RIGHT OUTER JOIN DEPARTMENTS AS D
        ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';
    ```
    </details>

## Conclusión
¡Felicidades! Has completado este laboratorio y estás listo para el siguiente tema.

Ahora puedes:

- Consultar múltiples tablas usando INNER JOINS

- Consultar múltiples tablas usando LEFT/RIGHT OUTER JOINS

- Consultar múltiples tablas usando FULL OUTER JOINS

*/

DROP DATABASE IF EXISTS HR2;
CREATE DATABASE HR2;


USE HR2;
SHOW TABLES;

USE HR2;

DROP TABLE IF EXISTS EMPLOYEES;
CREATE TABLE EMPLOYEES(
    EMP_ID CHAR(5),
    F_NAME VARCHAR(15),
    L_NAME VARCHAR(15),
    SSN INTEGER,
    B_DATE DATE,
    SEX CHAR(1),
    ADDRESS VARCHAR(30),
    JOB_ID INTEGER,
    SALARY INTEGER,
    MANAGER_ID INTEGER,
    DEP_ID INTEGER
);

DROP TABLE IF EXISTS JOB_HISTORY;
CREATE TABLE JOB_HISTORY(
    EMPL_ID CHAR(5),
    START_DATE DATE,
    JOBS_ID INTEGER,
    DEPT_ID INTEGER
);

DROP TABLE IF EXISTS JOBS;
CREATE TABLE JOBS(
    JOB_IDENT INTEGER,
    JOB_TITLE VARCHAR(30),
    MIN_SALARY INTEGER,
    MAX_SALARY INTEGER
);

DROP TABLE IF EXISTS DEPARTMENTS;
CREATE TABLE DEPARTMENTS(
    DEPT_ID_DEP INTEGER,
    DEP_NAME VARCHAR(50),
    MANAGER_ID CHAR(5),
    LOC_ID CHAR(5)
);

DROP TABLE IF EXISTS LOCATIONS;
CREATE TABLE LOCATIONS(
    LOCT_ID CHAR(5),
    DEP_ID_LOC INTEGER
);

USE HR2;

INSERT INTO EMPLOYEES
VALUES
    ('E1001', 'John','Thomas',123456, '1976-01-09','M','5631 Rice, OakPark,IL',100,100000,30001,2),
    ('E1002', 'Alice', 'James', 123457, '1972-07-31','F','980 Berry In, Eigin,IL',200,80000,30002,5),
    ('E1003', 'Steve', 'Wells', 123458, '1980-08-10','M','291 Springs, Gary, IL',300, 50000, 30002, 5);

INSERT INTO JOB_HISTORY
VALUES
    ('E1001','2000-01-30',100,2),
    ('E1002','2010-08-16',200,5),
    ('E1003','2016-08-10',300,5);

INSERT INTO JOBS
VALUES
    (100,'Sr. Architect',60000,100000),
    (200,'Sr. SoftwareDeveloper',60000,80000),
    (300,'Jr. SoftwareDeveloper',40000,60000);

INSERT INTO DEPARTMENTS
VALUES
    (2, 'Architect Group',30001,'L0001'),
    (5, 'Software Development',30002,'L0002'),
    (7, 'Design Team', 30003,'L0003');

INSERT INTO LOCATIONS
VALUES
    ('L0001',2),
    ('L0002',5),
    ('L0003',7);



USE HR2;

SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM JOBS;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

/*
1. Recuperar los nombres y las fechas de inicio de trabajo de todos los empleados que trabajan para el departamento número 5.
*/

SELECT E.F_NAME, E.L_NAME, JH.START_DATE
FROM EMPLOYEES AS E 
INNER JOIN JOB_HISTORY AS JH
ON E.JOB_ID = JH.JOBS_ID
WHERE E.DEP_ID = 5


/*
2. Recuperar el ID del empleado, el apellido, el ID del departamento y el nombre del departamento para todos los empleados.
*/

SELECT E.EMP_ID, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP

/*
3. Recuperar el nombre, apellido y nombre del departamento de todos los empleados.
*/
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.MANAGER_ID = D.MANAGER_ID
ORDER BY 1;


SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.MANAGER_ID = D.MANAGER_ID
ORDER BY 1;


SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.MANAGER_ID = D.MANAGER_ID
UNION
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.MANAGER_ID = D.MANAGER_ID

/*PROBLEMAS DE PRACTICA:
1. Recupera los nombres, fechas de inicio de trabajo y títulos de trabajo de todos los empleados que trabajan 
para el departamento número 5.
*/
SELECT E.F_NAME, E.L_NAME, JH.START_DATE, J.JOB_TITLE
FROM EMPLOYEES AS E
INNER JOIN JOB_HISTORY AS JH
ON E.JOB_ID = JH.JOBS_ID
INNER JOIN JOBS AS J
ON JH.JOBS_ID = J.JOB_IDENT;

/*
2. Recupera el ID del empleado, el apellido y el ID del departamento para todos los empleados, 
pero los nombres de los departamentos solo para aquellos nacidos antes de 1980. 
*/

SELECT E.EMP_ID, E.L_NAME,E.B_DATE, D.DEPT_ID_DEP
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP
WHERE YEAR(E.B_DATE) < 1980

/*
3. Recupera el nombre y apellido de todos los empleados, pero el ID del departamento y los nombres
 de los departamentos solo para empleados masculinos.
*/

SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP
WHERE E.SEX = 'M'
