/*markdown
# Laboratorio Práctico: Usando Vistas en MySQL con phpMyAdmin

En este laboratorio, aprenderás sobre el uso de vistas. En SQL, una vista es una forma alternativa de representar datos que existen en una o más tablas. Al igual que una tabla real, contiene filas y columnas. Los campos en una vista son campos de una o más tablas reales en la base de datos. Aunque las vistas pueden ser consultadas como una tabla, las vistas son dinámicas; solo se almacena la definición de la vista, no los datos.

## Objetivos
Después de completar este laboratorio, podrás:

Crear una Vista y mostrar una selección de datos para una tabla dada
- Actualizar una Vista para combinar dos o más tablas de maneras significativas
- Eliminar una Vista creada

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás MySQL. MySQL es un Sistema de Gestión de Bases de Datos Relacionales (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es una base de datos de recursos humanos (HR) de muestra. Este esquema de base de datos de HR consta de cinco tablas llamadas ``EMPLOYEES``, ``JOB_HISTORY``, ``JOBS``, ``DEPARTMENTS`` y ``LOCATIONS``. Cada tabla tiene algunas filas de datos de muestra. El siguiente diagrama muestra las tablas de la base de datos de HR:

![alt text](image.png)

Tablas de la base de datos de HR de muestra con las cinco bases de datos incluidas.

Sigue los pasos a continuación para crear la base de datos y las tablas.

1. Abre la interfaz de MySQL desde el menú de Skills Network.

2. Crea una nueva base de datos y nómbrala ``HR``.

3. Carga y ejecuta el script compartido en el enlace a continuación para crear las tablas necesarias.

[HR_Database_Create_Tables_Script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/HR_Database_Create_Tables_Script.sql)

4. Carga todas las tablas con los datos disponibles en los archivos CSV compartidos a continuación.

- [Departments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Departments.csv)
- [Employees.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/data/Employees_updated.csv)
- [Jobs.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Jobs.csv)
- [Locations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Locations.csv)
- [JobsHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/data/JobsHistory.csv)

> Nota: Por favor, consulta las instrucciones en el laboratorio ["Crear y Cargar Tablas usando Scripts SQL"](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/v8/Create_tables_using_script_MySQL.md.html) para obtener instrucciones sobre cómo cargar scripts en MySQL.


## Tarea 1: Crear una Vista
En este ejercicio, crearás una Vista y mostrarás una selección de datos para una tabla dada.

1. Vamos a crear una vista llamada ``EMPSALARY`` para mostrar el salario junto con algunos datos sensibles básicos de los empleados de la base de datos de RRHH. Para crear la vista ``EMPSALARY`` a partir de la tabla ``EMPLOYEES``, copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en ``Go``.

```sql
CREATE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES;
```

![alt text](image-1.png)

2. Usando SELECT, consulta la vista EMPSALARY para recuperar todos los registros. Usa la siguiente declaración.

```sql
SELECT * FROM EMPSALARY;
```
![alt text](image-2.png)


## Tarea 2: Actualizar una Vista

En este ejercicio, actualizarás una Vista para combinar dos o más tablas de manera significativa.

Supón que la vista ``EMPSALARY`` que creamos en la Tarea 1 no contiene suficiente información sobre salarios, como el salario máximo/mínimo y el título del trabajo de los empleados. Para esto, necesitamos obtener información de otras tablas en la base de datos. Necesitas todas las columnas de la tabla ``EMPLOYEES`` utilizadas anteriormente, excepto ``SALARY``. También necesitas las columnas ``JOB_TITLE``, ``MIN_SALARY``, ``MAX_SALARY`` de la tabla ``JOBS``.
El comando que se debe utilizar es el siguiente:

```sql
CREATE OR REPLACE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE,
MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;
```

![alt text](image-3.png)

> NOTA: La técnica utilizada aquí para combinar datos de dos tablas se llama unión interna implícita. Aprenderás más sobre uniones más adelante. Por ahora, simplemente asume que estás combinando los datos de dos tablas diferentes, ``EMPLOYEES`` y ``JOBS``, conectando sus respectivas columnas ``JOB_ID`` y ``JOB_IDENT``, ya que ambas columnas contienen datos únicos comunes. Puedes consultar la descripción de la base de datos, compartida al inicio del laboratorio, para verificar esto.

2. Usando ``SELECT``, consulta la vista actualizada ``EMPSALARY`` para recuperar todos los registros. Copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en ``Go``.

```sql
SELECT * FROM EMPSALARY;
```

![alt text](image-4.png)

## Tarea 3: Eliminar una Vista
En este ejercicio, eliminarás la Vista creada ``EMPSALARY``. Usa el código a continuación.

```sql
DROP VIEW EMPSALARY;
```

![alt text](image-5.png)

Usando SELECT, puedes verificar si la vista ``EMPSALARY`` ha sido eliminada o no. Copia el código a continuación y pégalo en el área de texto de la página ``SQL``. Haz clic en ``Go``.

```sql
SELECT * FROM EMPSALARY;
```

![alt text](image-6.png)

## Problemas de Práctica
Intenta resolver los siguientes problemas de práctica basados en tu aprendizaje en este laboratorio.

1. Crea una vista “EMP_DEPT” que contenga la siguiente información.
``EMP_ID``, ``FNAME``, ``LNAME`` y ``DEP_ID`` de la tabla ``EMPLOYEES``

<details><summary>Haz clic aquí para ver la solución </summary>

```sql
CREATE VIEW EMP_DEPT AS
SELECT EMP_ID, F_NAME, L_NAME, DEP_ID
FROM EMPLOYEES;
```
</details>

2. Modifica “EMP_DEPT” de manera que muestre los nombres de los departamentos en lugar de los IDs de los departamentos. Para esto, necesitamos combinar la información de ``EMPLOYEES`` y ``DEPARTMENTS`` de la siguiente manera.`

``EMP_ID``, ``FNAME``, ``LNAME`` de la tabla ``EMPLOYEES`` y
``DEP_NAME`` de la tabla ``DEPARTMENTS``, combinados sobre las columnas ``DEP_ID`` y ``DEPT_ID_DEP``.

<details><summary>Haz clic aquí para ver la solución </summary>

```sql
CREATE OR REPLACE VIEW EMP_DEPT AS
SELECT EMP_ID, F_NAME, L_NAME, DEP_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;
```
</details>`

3. Elimina la vista “EPM_DEPT”.

<details><summary>Haz clic aquí para ver la solución </summary>

```sql
DROP VIEW EMP_DEPT
```
</details>

## Conclusión
Felicidades por completar este laboratorio. Ahora tienes conocimientos prácticos sobre cómo usar Vistas en SQL.

Ahora has aprendido a:

- Crear una nueva Vista según los requisitos

- Modificar una vista para incluir datos de múltiples tablas en el conjunto de datos

- Eliminar una vista
*/

USE HR;
SHOW TABLES;

SELECT  *
FROM EMPLOYEES;

/*
1. Vamos a crear una vista llamada EMPSALARY para mostrar el salario junto con algunos datos sensibles básicos 
de los empleados de la base de datos de RRHH. Para crear la vista EMPSALARY a partir de la tabla EMPLOYEES
*/

CREATE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES

/*
Usando SELECT, consulta la vista EMPSALARY para recuperar todos los registros
*/
SELECT * FROM EMPSALARY;

/*
En este ejercicio, actualizarás una Vista para combinar dos o más tablas de manera significativa.
Supón que la vista EMPSALARY que creamos en la Tarea 1 no contiene suficiente información sobre salarios, 
como el salario máximo/mínimo y el título del trabajo de los empleados. Para esto, necesitamos obtener información de otras tablas 
en la base de datos. Necesitas todas las columnas de la tabla EMPLOYEES utilizadas anteriormente, excepto SALARY. 
También necesitas las columnas JOB_TITLE, MIN_SALARY, MAX_SALARY de la tabla JOBS.
*/

CREATE OR REPLACE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

/*
Usando SELECT, consulta la vista actualizada EMPSALARY para recuperar todos los registros.
*/

SELECT * FROM EMPSALARY;

/*
Eliminar la Vista creada EMPSALARY
*/

DROP VIEW EMPSALARY;

/*
Problemas de Práctica

1. Crea una vista “EMP_DEPT” que contenga la siguiente información.
EMP_ID, FNAME, LNAME y DEP_ID de la tabla EMPLOYEES
*/

CREATE VIEW EMP_DEPT AS
SELECT EMP_ID, F_NAME, L_NAME, DEP_ID
FROM EMPLOYEES;


SELECT * FROM EMP_DEPT 

/*
2. Modifica “EMP_DEPT” de manera que muestre los nombres de los departamentos en lugar de los IDs de los departamentos.
Para esto, necesitamos combinar la información de EMPLOYEES y DEPARTMENTS de la siguiente manera.
EMP_ID, FNAME, LNAME de la tabla EMPLOYEES y DEP_NAME de la tabla DEPARTMENTS, combinados sobre las columnas DEP_ID y DEPT_ID_DEP.
*/

CREATE OR REPLACE VIEW EMP_DEPT AS
SELECT D.DEP_NAME, E.EMP_ID, E.F_NAME, E.L_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEP_ID = D.DEPT_ID_DEP 


SELECT * FROM EMP_DEPT;

/*
3. Elimina la vista “EPM_DEPT”.
*/

DROP VIEW EMP_DEPT;

SELECT * FROM EMP_DEPT;