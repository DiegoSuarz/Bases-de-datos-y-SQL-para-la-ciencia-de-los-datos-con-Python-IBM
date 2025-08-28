/*markdown
# Laboratorio Práctico: Patrones de Cadenas, Ordenamiento y Agrupación en MySQL

En este laboratorio, aprenderás a crear tablas y cargar datos en el servicio de base de datos MySQL utilizando la herramienta de interfaz gráfica de usuario (GUI) phpMyAdmin.

## Objetivos
Después de completar este laboratorio, podrás:

- Filtrar la salida de una consulta SELECT utilizando patrones de cadenas, rangos o conjuntos de valores.
- Ordenar el conjunto de resultados en orden ascendente o descendente de acuerdo con una columna predefinida.
- Agrupar los resultados de una consulta en función de un parámetro seleccionado para refinar aún más la respuesta.

## Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es una base de datos interna. Estarás trabajando en una base de datos de recursos humanos (HR) de muestra. Este esquema de base de datos de HR consta de 5 tablas llamadas **EMPLOYEES**, **JOB_HISTORY**, **JOBS**, **DEPARTMENTS** y **LOCATIONS**. Cada tabla tiene algunas filas de datos de ejemplo. El siguiente diagrama muestra las tablas de la base de datos de HR: 

![alt text](image.png)

## Cargar la base de datos
Usando las habilidades adquiridas en los módulos anteriores, primero debes crear la base de datos en MySQL. Sigue los pasos a continuación:

1. Abre la interfaz de phpMyAdmin desde el Skills Network Toolbox en Cloud IDE.

2. Crea una base de datos en blanco llamada ‘HR’. Utiliza el script compartido en el enlace a continuación para crear las tablas requeridas.

- [Script_Create_Tables.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/scripts/Script_Create_Tables.sql)

3. Descarga los archivos en los enlaces a continuación a tu máquina local (si no lo has hecho ya en laboratorios anteriores).

- [Departments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Departments.csv)

- [Jobs.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Jobs.csv)

- [JobsHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/JobsHistory.csv)

- [Locations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Locations.csv)

- [Employees.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Employees.csv)


4. Utiliza cada uno de estos archivos en la interfaz como datos para las respectivas tablas en la base de datos ‘HR’.

## Patrones de Cadenas
Puedes usar patrones de cadenas para filtrar la respuesta de una consulta. Veamos el siguiente ejemplo:

Supongamos que necesitas recuperar los nombres **F_NAME** y apellidos **L_NAME** de todos los empleados que viven en E**lgin, IL**. Puedes usar el operador **LIKE** para recuperar cadenas que contengan el texto mencionado. El código se verá como se muestra a continuación.

```sql
SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';
```
Al ejecutar, la salida de la consulta debería aparecer como se muestra a continuación:

![alt text](image-1.png)

Ahora suponga que desea identificar a los empleados que nacieron durante los años 70. La consulta anterior se puede modificar a:

```sql
SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';
```
La salida de esta consulta será:

![alt text](image-2.png)

Tenga en cuenta que en el primer ejemplo, el signo **%** se utiliza tanto antes como después del texto requerido. Esto indica que la cadena de dirección puede tener más caracteres, tanto antes como después del texto requerido.

En el segundo ejemplo, dado que la fecha de nacimiento en los registros de **Eployees** comienza con el año de nacimiento, el signo **%** se aplica después de **197%**, lo que indica que el año de nacimiento puede ser cualquier cosa entre 1970 y 1979. Además, el signo **%** también permite cualquier fecha posible a lo largo de los años seleccionados.

Considere un ejemplo más específico. Recuperemos todos los registros de empleados en el departamento 5 donde el salario esté entre 60000 y 70000. La consulta que se utilizará es

```sql
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;
```
La salida de la consulta se puede ver en la imagen a continuación.

![alt text](image-3.png)

## Ordenamiento
Puedes ordenar las entradas recuperadas en función de uno o más parámetros.

Primero, supón que debes recuperar una lista de empleados ordenada por ID de departamento.

El ordenamiento se realiza utilizando la cláusula ORDER BY en tu consulta SQL. Por defecto, la cláusula ORDER BY ordena los registros en orden ascendente.

```sql
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;
```
La salida para esta consulta será como se muestra a continuación.

![alt text](image-4.png)

Ahora, obtenga la salida de la misma consulta en orden descendente por ID de departamento, y dentro de cada departamento, los registros deben estar ordenados en orden alfabético descendente por apellido. Para el orden descendente, puede utilizar la cláusula DESC.

```sql
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;
```
La salida será como se muestra en la imagen a continuación.

![alt text](image-5.png)

## Agrupación
En este ejercicio, resolverás algunos problemas de SQL sobre Agrupación.

> NOTA: Los problemas de SQL en este ejercicio implican el uso de las funciones de agregación SQL AVG y COUNT. COUNT se ha cubierto anteriormente. AVG es una función que se puede utilizar para calcular el promedio o media de todos los valores de una columna específica en el conjunto de resultados. Por ejemplo, para recuperar el salario promedio de todos los empleados en la tabla EMPLOYEES, emite la consulta: **SELECT AVG(SALARY) FROM EMPLOYEES;**.

Un buen ejemplo de agrupación sería si, para cada ID de departamento, deseamos recuperar el número de empleados en el departamento.

```sql
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;
```

![alt text](image-6.png)

Ahora, para cada departamento, recupera el número de empleados en el departamento y el salario promedio de los empleados en el departamento. Para esto, puedes usar COUNT(*) para obtener el conteo total de una columna y la función AVG() para calcular los salarios promedio, y luego usar GROUP BY.

```sql
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;
```

![alt text](image-7.png)

Puedes refinar tu salida utilizando etiquetas apropiadas para las columnas de datos recuperados. Etiqueta las columnas calculadas en el conjunto de resultados del último problema como NUM_EMPLOYEES y AVG_SALARY.

```sql
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;
```

También puedes combinar el uso de las cláusulas GROUP BY y ORDER BY para ordenar la salida de cada grupo de acuerdo con un parámetro específico. Es importante señalar que en tal caso, la cláusula ORDER BY debe usarse después de la cláusula GROUP BY. Por ejemplo, podemos ordenar el resultado de la consulta anterior por salario promedio. La consulta SQL se convertiría así en

```sql
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY;
```
La salida de la consulta debería verse así:

![alt text](image-8.png)

En caso de que necesites filtrar una respuesta agrupada, debes usar la cláusula HAVING. En el ejemplo anterior, si deseamos limitar el resultado a departamentos con menos de 4 empleados, tendremos que usar HAVING después del GROUP BY y utilizar la función count() en la cláusula HAVING en lugar de la etiqueta de columna.

```sql
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;
```

![alt text](image-9.png)

## Preguntas de Práctica
1. Recupera la lista de todos los empleados, nombres y apellidos, cuyos nombres comienzan con ‘S’.

<details><summary>Haz clic aquí para la Solución </summary>

```sql
SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE F_NAME LIKE 'S%';
```
</details>

2. Organiza todos los registros de la tabla EMPLOYEES en orden ascendente de la fecha de nacimiento.

<details><summary>Haz clic aquí para la Solución</summary>

```sql
SELECT *
FROM EMPLOYEES
ORDER BY B_DATE;
```
</details>

3. Agrupa los registros en función de los IDs de departamento y filtra aquellos que tengan un salario promedio mayor o igual a 60000. Muestra el ID de departamento y el salario promedio.

<details><summary>Haz clic aquí para la Solución</summary>

```sql
SELECT DEP_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING AVG(SALARY) >= 60000;
```
</details>

4. Para el problema anterior, ordena los resultados de cada grupo en orden descendente de salario promedio.

<details><summary>Haz clic aquí para la Solución </summary>

```sql
SELECT DEP_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING AVG(SALARY) >= 60000
ORDER BY AVG(SALARY) DESC;
```
</details>

## Conclusión

Al final de este laboratorio, sarás capaz de:
- Utilizar patrones de cadena para filtrar los datos recuperados.
- Ordenar los datos recuperados según uno o más parámetros utilizando la declaración ORDER BY.
- Agrupar los datos con respecto a un parámetro.

## Laboratorios prácticos con IBM Db2Estado
SQL intermedio

Puede practicar los conceptos de este módulo utilizando el sistema IBM Db2. Aquí encontrará enlaces a recursos que le guiarán en el uso de Db2 para refinar aún más sus conjuntos de resultados mediante el uso de funciones.

[Patrones de cadenas, ordenación, agrupación](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20String%20Patterns%20-%20Sorting%20-%20Grouping/instructional-labs.md.html?origin=www.coursera.org)

[Funciones incorporadas](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Built-in%20functions%20/Hands-on_Lab__Built-in_Functions.md.html?origin=www.coursera.org)
*/

/*Crear base de datos HR*/

CREATE DATABASE IF NOT EXISTS HR;

/*crear tablas para la base de datos*/
/*
USE HR;

DROP TABLE  IF EXISTS EMPLOYEES;
CREATE TABLE EMPLOYEES
(
    EMP_ID CHAR(9) NOT NULL, 
    F_NAME VARCHAR(15) NOT NULL,
    L_NAME VARCHAR(15) NOT NULL,
    SSN CHAR(9),
    B_DATE DATE,
    SEX CHAR,
    ADDRESS VARCHAR(30),
    JOB_ID CHAR(9),
    SALARY DECIMAL(10,2),
    MANAGER_ID CHAR(9),
    DEP_ID CHAR(9) NOT NULL,
    PRIMARY KEY (EMP_ID)
);
                            
DROP TABLE  IF EXISTS JOB_HISTORY;
CREATE TABLE JOB_HISTORY
(
    EMPL_ID CHAR(9) NOT NULL, 
    START_DATE DATE,
    JOBS_ID CHAR(9) NOT NULL,
    DEPT_ID CHAR(9),
    PRIMARY KEY (EMPL_ID,JOBS_ID)
);
 
DROP TABLE  IF EXISTS JOBS;
CREATE TABLE JOBS (
    JOB_IDENT CHAR(9) NOT NULL, 
    JOB_TITLE VARCHAR(30),
    MIN_SALARY DECIMAL(10,2),
    MAX_SALARY DECIMAL(10,2),
    PRIMARY KEY (JOB_IDENT)
);

DROP TABLE  IF EXISTS DEPARTMENTS;
CREATE TABLE DEPARTMENTS 
(
    DEPT_ID_DEP CHAR(9) NOT NULL, 
    DEP_NAME VARCHAR(15) ,
    MANAGER_ID CHAR(9),
    LOC_ID CHAR(9),
    PRIMARY KEY (DEPT_ID_DEP)
);

DROP TABLE  IF EXISTS LOCATIONS;
CREATE TABLE LOCATIONS 
(
    LOCT_ID CHAR(9) NOT NULL,
    DEP_ID_LOC CHAR(9) NOT NULL,
    PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
);
*/
                            

USE HR; 
SELECT * from EMPLOYEES;

/*
PATRONES DE CADENA

Supongamos que necesitas recuperar los nombres F_NAME y apellidos L_NAME de todos los empleados que viven en Elgin, IL
*/

SELECT F_NAME, L_NAME
FROM HR.EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

/*
De la consulta anterior, suponga que desea identificar a los empleados que nacieron durante los años 70
*/
SELECT F_NAME, L_NAME
FROM HR.EMPLOYEES
WHERE B_DATE LIKE '197%';

/*
Recuperemos todos los registros de empleados en el departamento 5 donde el salario esté entre 60000 y 70000
*/
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;


/*
ORDENAMIENTO
1. Supón que debes recuperar una lista de empleados ordenada por ID de departamento.
*/
SELECT F_NAME, L_NAME
FROM EMPLOYEES
ORDER BY DEP_ID;

/*
2.  Ahora, obtenga la salida de la misma consulta en orden descendente por ID de departamento, y dentro de cada departamento, 
    los registros deben estar ordenados en orden alfabético descendente por apellido.
*/
SELECT F_NAME, L_NAME
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

/*
AGRUPACIÓN
3. para recuperar el salario promedio de todos los empleados en la tabla EMPLOYEES
*/
SELECT AVG(SALARY) 
FROM EMPLOYEES;

/*
para cada ID de departamento, deseamos recuperar el número de empleados en el departamento.
*/
SELECT DEP_ID,COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

/*
Para cada departamento, recupera el número de empleados en el departamento y el salario promedio de los empleados en el departamento.
*/

SELECT DEP_ID, COUNT(*) AS NUM_EMPLEADOS, ROUND(AVG(SALARY),2) AS SALARY
FROM EMPLOYEES
GROUP BY DEP_ID

/*
Ordenar el resultado de la consulta anterior por salario promedio.
*/
SELECT DEP_ID, COUNT(*) AS NUM_EMPLEADOS, ROUND(AVG(SALARY),2) AS SALARIO_PROMEDIO
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY 3 DESC;

/*
Del ejemplo anterior, si deseamos limitar el resultado a departamentos con menos de 4 empleados
*/
SELECT DEP_ID, COUNT(*) AS NUM_EMPLEADOS, ROUND(AVG(SALARY),2) AS SALARIO_PROMEDIO
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING NUM_EMPLEADOS < 4
ORDER BY SALARIO_PROMEDIO DESC;

/*
PREGUNTAS DE PRÁCTICA:
1. Recupera la lista de todos los empleados, nombres y apellidos, cuyos nombres comienzan con ‘S’.
*/

SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE F_NAME LIKE 'S%'

/*
2. Organiza todos los registros de la tabla EMPLOYEES en orden ascendente de la fecha de nacimiento.
*/
SELECT * 
FROM EMPLOYEES
ORDER BY B_DATE ASC;


/*
3. Agrupa los registros en función de los IDs de departamento y filtra aquellos que tengan un salario promedio mayor o igual a 60000. 
Muestra el ID de departamento y el salario promedio.
*/
 
SELECT DEP_ID AS ID_DEPARTAMENTO, AVG(SALARY) AS SALARIO_PROMEDIO
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING SALARIO_PROMEDIO >= 60000


/*
Para el problema anterior, ordena los resultados de cada grupo en orden descendente de salario promedio.
*/
SELECT DEP_ID AS ID_DEPARTAMENTO, AVG(SALARY) AS SALARIO_PROMEDIO
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING SALARIO_PROMEDIO >= 60000
ORDER BY SALARIO_PROMEDIO DESC

SELECT * from EMPLOYEES;