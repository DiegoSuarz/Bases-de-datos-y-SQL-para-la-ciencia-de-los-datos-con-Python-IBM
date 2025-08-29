/*markdown
## Laboratorio Práctico : Subconsultas y SELECTs Anidados

En este laboratorio, resolverás algunos problemas prácticos de SQL que te proporcionarán experiencia práctica con declaraciones SELECT anidadas en SQL (también conocidas como subconsultas).

¿Cómo se ve la sintaxis típica de una declaración SELECT anidada?

```sql
SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name OPERATOR
   (SELECT column_name [, column_name ]
   FROM table1 [, table2 ]
   WHERE condition);
```

Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es una base de datos interna. Estarás trabajando en una base de datos de recursos humanos (HR) de muestra. Este esquema de base de datos de HR consta de 5 tablas llamadas EMPLOYEES, JOB_HISTORY, JOBS, DEPARTMENTS y LOCATIONS. Cada tabla tiene algunas filas de datos de muestra. El siguiente diagrama muestra las tablas de la base de datos de HR:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás:

- Escribir consultas SQL que demuestren la necesidad de utilizar subconsultas
- Componer subconsultas en la cláusula where
- Construir Expresiones de Columna (es decir, subconsulta en lugar de una columna)
- Escribir Expresiones de Tabla (es decir, subconsulta en lugar de una tabla)
*/

USE HR;
SHOW TABLES;

/*markdown
## Ejercicio:
1. Problema:
Ejecutar una consulta fallida (es decir, una que da un error) para recuperar todos los registros de empleados cuyo salario es inferior al salario promedio.

<details><summary>Pista </summary>

> Utiliza la función de agregado AVG.
</details>

<details><summary>Solución </summary>

```sql
select * 
    from employees 
    where salary < AVG(salary);
```
</details>

<details><summary>Salida </summary>

![alt text](image-2.png)
</details>

*/

SELECT *
FROM EMPLOYEES
WHERE SALARY < AVG(SALARY);

/*markdown
2. Problema:
Ejecutar una consulta que funcione utilizando un sub-select para recuperar todos los registros de empleados cuyo salario es inferior al salario promedio.

<details><summary>Pista </summary>

    > Coloca AVG(SALARY) del SELECT interno en comparación con SALARY del SELECT externo.
</details>

<details><summary>Solución </summary>

```sql

select EMP_ID, F_NAME, L_NAME, SALARY 
from employees 
where SALARY < (select AVG(SALARY) 
            from employees);
```
</details>

<details><summary>Salida </summary>

![alt text](image-3.png)
</details>

*/

SELECT EMP_ID, F_NAME, L_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (
                SELECT AVG(SALARY)
                FROM EMPLOYEES
                );

/*markdown
3. Problema:
Ejecutar una consulta fallida (es decir, una que da un error) para recuperar todos los registros de empleados con EMP_ID, SALARY y el salario máximo como MAX_SALARY en cada fila.

<details><summary>Pista </summary>

> Utiliza la función de agregado MAX.
</details>

<details><summary>Solución </summary>

```sql
select EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY 
from employees;	
```
</details>

<details><summary>Salida </summary>

![alt text](image-4.png)
</details>
*/

SELECT EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES;

/*markdown
4. Problema:
Ejecutar una expresión de columna que recupere todos los registros de empleados con EMP_ID, SALARY y el salario máximo como MAX_SALARY en cada fila.

<details><summary>Pista </summary>

> Utiliza el SELECT (que recupera MAX(SALARY)) como una columna del otro SELECT.
</details>

<details><summary>Solución </summary>

```sql
select EMP_ID, SALARY, ( select MAX(SALARY) from employees ) AS MAX_SALARY 
from employees;
```
</details>

<details><summary>Salida </summary>

![alt text](image-5.png)
</details>
*/

SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY
FROM EMPLOYEES;

/*markdown
5. Problema:
Ejecutar una expresión de tabla para la tabla EMPLOYEES que excluya columnas con datos sensibles de empleados (es decir, no incluye columnas: SSN, B_DATE, SEX, ADDRESS, SALARY).

<details><summary>Pista </summary>

> Utiliza un SELECT (que recupera datos no sensibles de empleados) después de FROM del otro SELECT.
</details>

<details><summary>Solución </summary>

```sql
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;
```
</details>

<details><summary>Salida </summary>

![alt text](image-6.png)
</details>
*/

SELECT *
FROM (
        SELECT EMP_ID, F_NAME, L_NAME, DEP_ID
        FROM EMPLOYEES
     ) AS EMP4ALL;

/*markdown
## Script de Solución
Si deseas ejecutar todas las consultas de solución de los problemas de SQL en este laboratorio con un script, descarga el script a continuación.

- [SubQueries_Solution_Script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Sub-queries%20and%20Nested%20SELECTs%20/SubQueries_Solution_Script.sql)
*/