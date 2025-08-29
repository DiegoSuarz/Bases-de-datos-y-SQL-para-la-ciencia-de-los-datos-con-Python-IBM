/*markdown
# Laboratorio práctico: Subconsultas y selecciones anidadas

## Objetivos
Después de completar este laboratorio, podrás:

- Escribir consultas SQL que demuestren la necesidad de usar subconsultas
- Componer subconsultas en la cláusula where
- Construir expresiones de columna (por ejemplo, subconsulta en lugar de una columna)
- Escribir expresiones de tabla (por ejemplo, subconsulta en lugar de una tabla)

## Base de datos utilizada en este laboratorio
La base de datos utilizada en este laboratorio es interna. Estarás trabajando en una base de datos de recursos humanos de muestra. Este esquema de base de datos de recursos humanos consta de 5 tablas: **EMPLOYEES**, **JOB_HISTORY**, **JOBS**, **DEPARTMENTS**, y **LOCATIONS**. Cada tabla tiene unas pocas filas de datos de muestra. El siguiente diagrama muestra las tablas de la base de datos de recursos humanos:

![alt text](image.png)

## Cargar la base de datos
La base de datos a usar es HR

*/

USE hr;
SHOW TABLES;

/*markdown
## Subconsultas y Selecciones Anidadas
Supongamos que se te pide recuperar todos los registros de empleados cuyo salario es inferior al salario promedio. Podrías utilizar la siguiente consulta para hacerlo.

```sql
    SELECT * 
    FROM EMPLOYEES 
    WHERE salary < AVG(salary);
```
*/

SELECT *
FROM EMPLOYEES
WHERE SALARY < AVG(SALARY);

/*markdown
Sin embargo, esta consulta generará un error que indica: “Uso ilegal de la función de grupo”. Aquí, la función de grupo es AVG y no se puede usar directamente en la condición ya que no se ha recuperado de los datos. Por lo tanto, la condición utilizará una subconsulta para recuperar la información del salario promedio para comparar con el salario existente. La consulta modificada se convertiría en:

```sql
    SELECT *
    FROM EMPLOYEES
    WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
```
*/

SELECT *
FROM EMPLOYEES
WHERE SALARY < (
                SELECT AVG(SALARY) 
                FROM EMPLOYEES
                );

/*markdown
Ahora, considere ejecutar una consulta que recupere todos los registros de empleados con EMP_ID, SALARY y el salario máximo como MAX_SALARY en cada fila. Para esto, el salario máximo debe ser consultado y utilizado como una de las columnas. Esto se puede hacer utilizando la consulta a continuación.

```sql
    SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY 
    FROM EMPLOYEES;
```
*/

SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY
FROM EMPLOYEES;

/*markdown
Ahora, considera que deseas extraer los nombres y apellidos del empleado más antiguo. Dado que el empleado más antiguo será el que tenga la fecha de nacimiento más pequeña, la consulta se puede escribir como:

<details><summary>Mostrar solución </summary>

```sql
    SELECT F_NAME, L_NAME
    FROM EMPLOYEES
    WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);
```
</details>
*/

SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);

/*markdown
También puedes usar subconsultas para crear tablas derivadas, que luego se pueden usar para consultar información específica. Supongamos que quieres conocer el salario promedio de los 5 principales ganadores de la empresa. Primero tendrás que extraer una tabla con los cinco salarios más altos. A partir de esa tabla, puedes consultar el valor promedio del salario. La consulta se puede escribir de la siguiente manera.

<details><summary>Mostrar solución </summary>

```sql
      SELECT AVG(SALARY) 
      FROM (SELECT SALARY 
            FROM EMPLOYEES 
            ORDER BY SALARY DESC 
            LIMIT 5) AS SALARY_TABLE;
```
</details>

Tenga en cuenta que es necesario dar un alias a cualquier tabla derivada.
*/

SELECT AVG(SALARY)
FROM(
    SELECT SALARY
    FROM EMPLOYEES 
    ORDER BY SALARY DESC 
    LIMIT 5
    )AS SALARY_TOP_5;

/*markdown
## Problemas de Práctica
1. Escribe una consulta para encontrar el salario promedio de los cinco empleados con menor salario.

    <details><summary>Haz clic aquí para una pista </summary>
    
      > Necesitas ordenar los datos en orden ascendente de salario y limitarlo a las cinco entradas principales, tratando esto como una tabla derivada. Toma el promedio de estas entradas.
    </details>


    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
    SELECT AVG(SALARY) 
    FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY 
      LIMIT 5) AS SALARY_TABLE;
    ```
    </details>
*/

SELECT ROUND(AVG(SALARY),2) AS 'SALARIO PROMEDIO'
FROM
(
    SELECT SALARY
    FROM EMPLOYEES
    ORDER BY 1 
    LIMIT 5
)AS SALARY_TAIL_5;

/*markdown
2. Escribe una consulta para encontrar los registros de empleados mayores que la edad promedio de todos los empleados.

    <details><summary>Haz clic aquí para una pista </summary>

    >La edad en años se puede calcular como el componente del año en la diferencia entre la fecha de nacimiento y la fecha actual. Necesitas comparar la edad en años con la edad promedio en años. La edad promedio en años se evaluará como una subconsulta.
    </details>

    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
    SELECT * 
    FROM EMPLOYEES 
    WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE))) > 
        (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE)))) 
        FROM EMPLOYEES);
    ```
    </details>
*/

SELECT *
FROM EMPLOYEES
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, B_DATE))) >
        (
            SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, B_DATE))))
            FROM EMPLOYEES
        );


/*markdown

3. Desde la tabla Job_History, muestra la lista de IDs de empleados, años de servicio y promedio de años de servicio para todas las entradas.

    <details><summary>Haz clic aquí para una pista </summary>

    >Para esto, necesitas calcular los años de servicio como la diferencia entre la fecha de ingreso y la fecha actual. El promedio de años de servicio debe consultarse por separado para ser mostrado.
    </details>


    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
    SELECT EMPL_ID, YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))), 
        (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE)))) 
        FROM JOB_HISTORY)
    FROM JOB_HISTORY;
    ```
    </details>

*/

SELECT  EMPL_ID, 
        YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))) AS AÑOS_SERVICIO,
        (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))))
         FROM JOB_HISTORY) AS AÑOS_PROMEDIO
FROM JOB_HISTORY;
