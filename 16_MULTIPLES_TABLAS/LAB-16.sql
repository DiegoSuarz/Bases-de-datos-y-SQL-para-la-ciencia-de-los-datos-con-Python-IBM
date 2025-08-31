/*markdown
# Laboratorio Práctico: Trabajando con Múltiples Tablas

## Objetivos
Después de completar este laboratorio, podrás:

- Escribir consultas SQL que accedan a más de una tabla
- Componer consultas que accedan a múltiples tablas utilizando una declaración anidada en la cláusula WHERE
- Construir consultas con múltiples tablas en la cláusula FROM
- Escribir consultas de unión implícita con criterios de unión especificados en la cláusula WHERE
- Especificar alias para los nombres de las tablas y calificar los nombres de las columnas con alias de tabla

En este laboratorio, completarás problemas de práctica SQL que te proporcionarán experiencia práctica con consultas SQL que acceden a múltiples tablas. Estarás:

- Accediendo a Múltiples Tablas con Subconsultas
- Accediendo a Múltiples Tablas con Uniones Implícitas

## Base de datos utilizada en este laboratorio
La base de datos utilizada en este laboratorio es interna. Estarás trabajando en una base de datos de ejemplo de recursos humanos (HR). Este esquema de base de datos de HR consta de 5 tablas llamadas **EMPLOYEES**, **JOB_HISTORY**, **JOBS**, **DEPARTMENTS** y **LOCATIONS**. Cada tabla tiene unas pocas filas de datos de ejemplo. El siguiente diagrama muestra las tablas para la base de datos de HR:

![alt text](image.png)
*/

/*markdown
## Cargar la base de datos
Cargar la base de datos HR.
*/

USE hr;
SHOW TABLES;

/*markdown
## Accediendo a múltiples tablas con subconsultas
Veamos algunos ejemplos de consultas que requieren acceso a múltiples tablas utilizando subconsultas.

1. Recuperar solo los registros de EMPLEADOS correspondientes a trabajos en la tabla JOBS.

    Para tal pregunta, puedes implementar la subconsulta en la cláusula WHERE, de manera que la columna superpuesta de ID DE TRABAJO pueda identificar las entradas requeridas.

    ```sql
    SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);
    ```
    La salida esperada se vería como se muestra a continuación.

    <details><summary>Mostrar salida </summary>
    
    ![alt text](image-1.png)
    </details>    
*/

SELECT * FROM EMPLOYEES 
WHERE JOB_ID IN ( SELECT JOB_IDENT FROM JOBS);

/*markdown
2. Recuperar información de JOB para empleados que ganan más de $70,000.

    Para este ejemplo, recupera los detalles de la tabla JOBS, que tiene IDs comunes con los disponibles en la tabla EMPLOYEES, siempre que el salario en la tabla EMPLOYEES sea mayor a $70,000. Puedes escribir la consulta como:

    ```sql
    SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
    FROM JOBS
    WHERE JOB_IDENT IN (select JOB_ID from EMPLOYEES where SALARY > 70000);
    ```
    La salida esperada se vería como se muestra a continuación.

    <details><summary>Mostrar salida </summary>
    
    ![alt text](image-2.png)
    </details>   
*/

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (
                    SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE SALARY > 70000
                    );

/*markdown
## Accediendo a múltiples tablas con Joins Implícitos
Veamos algunos ejemplos de consultas que requieren el acceso a múltiples tablas utilizando Joins Implícitos.

1. Recuperar solo los registros de EMPLEADOS correspondientes a trabajos en la tabla JOBS.

    La misma pregunta que antes, pero ahora utilizaremos un Join Implícito para recuperar la información requerida. Para esto, combinarás las tablas en función de los IDs de trabajo. Utilizando la siguiente consulta para esto:

    ```sql
    SELECT *
    FROM EMPLOYEES, JOBS
    WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;
    ```
    La salida esperada se muestra a continuación.

    <details><summary>Mostrar salida </summary>
    
    ![alt text](image-3.png)
    </details>      
*/

SELECT * 
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

/*markdown
2. Rehaga la consulta anterior utilizando alias más cortos para los nombres de las tablas.

    Tenga en cuenta que las tablas en cuestión pueden recibir alias más cortos. Esto es especialmente útil en casos donde se deben acceder a columnas específicas de diferentes tablas. La consulta se modificaría a:

    ```sql
    SELECT *
    FROM EMPLOYEES E, JOBS J
    WHERE E.JOB_ID = J.JOB_IDENT;
    ```

    La salida se vería así:

    <details><summary>Mostrar salida </summary>
    
    ![alt text](image-4.png)
    </details>   


    Observa que las dos consultas están dando la misma respuesta.
*/

SELECT * 
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID =  J.JOB_IDENT;

/*markdown
3. En la consulta anterior, recupera solo el ID de empleado, el nombre y el título del trabajo.

    Observa que el título del trabajo es una columna de la tabla JOBS, y otros detalles provienen de la tabla EMPLOYEES. Las dos tablas se unirán por el ID de trabajo. La consulta sería la siguiente:

    ```sql
    SELECT EMP_ID,F_NAME,L_NAME, JOB_TITLE
    FROM EMPLOYEES E, JOBS J
    WHERE E.JOB_ID = J.JOB_IDENT;
    ```
    La salida se vería como se muestra a continuación.

    <details><summary>Mostrar salida </summary>
    
    ![alt text](image-5.png)
    </details>
    
*/

SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT

/*markdown
4. Repite la consulta anterior, pero especifica los nombres de columna completamente calificados con alias en la cláusula SELECT.

    Los nombres de columna también pueden ser precedidos por alias de tabla para mantener un registro de dónde proviene cada columna. La consulta anterior se modificará como se muestra a continuación.

    ```sql
    SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
    FROM EMPLOYEES E, JOBS J
    WHERE E.JOB_ID = J.JOB_IDENT;
    ```
    La salida esperada es:
   
    <details><summary>Mostrar salida </summary>
    
    ![alt text](image-6.png)
    </details>   
*/

SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

/*markdown
## Problemas de práctica
##### 1. Recupera solo la lista de empleados cuyo CARGO es Jr. Designer.

a. Usando subconsultas

<details><summary>Solución </summary>

```sql
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT
                FROM JOBS
                WHERE JOB_TITLE= 'Jr. Designer');
```
</details>
*/

SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (
                    SELECT JOB_IDENT
                    FROM JOBS
                    WHERE JOB_TITLE = 'Jr. Designer'
                );

/*markdown

b. Usando Uniones Implícitas

<details><summary>Solución </summary>

```sql
SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE= 'Jr. Designer';
```
</details>

*/

SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE = 'Jr. Designer';

/*markdown
##### 2. Recuperar información de JOB y una lista de empleados cuyo año de nacimiento es posterior a 1976.

a. Usando subconsultas

<details><summary>Solución </summary>

```sql
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE YEAR(B_DATE)>1976 );
```
</details>
*/

SELECT *
FROM JOBS
WHERE JOB_IDENT IN  (
                    SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE YEAR(B_DATE) > 1976
                    );

/*markdown
b. Usando unión implícita

<details><summary>Solución </summary>

```sql
SELECT J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, J.JOB_IDENT
FROM JOBS J, EMPLOYEES E
WHERE E.JOB_ID = J.JOB_IDENT AND YEAR(E.B_DATE)>1976;
```
</details>
*/

SELECT J.JOB_IDENT, J.MIN_SALARY, J.MAX_SALARY, J.JOB_IDENT
FROM JOBS J, EMPLOYEES E
WHERE E.JOB_ID = J.JOB_IDENT AND YEAR(E.B_DATE)>1976;

/*markdown
## Conclusión
¡Felicidades! Has completado este laboratorio y estás listo para el próximo tema.

Al final de este laboratorio, ahora eres capaz de:

- Escribir consultas SQL que accedan a más de una tabla
- Componer consultas que accedan a múltiples tablas utilizando una declaración anidada en la cláusula WHERE
- Construir consultas con múltiples tablas en la cláusula FROM
- Escribir consultas de unión implícita con criterios de unión especificados en la cláusula WHERE
- Especificar alias para los nombres de las tablas y calificar los nombres de las columnas con alias de tabla
*/