/*markdown
# Laboratorio Práctico: Trabajando con Múltiples Tablas

En este laboratorio, trabajarás en algunos problemas prácticos de SQL que te proporcionarán experiencia práctica con consultas SQL que acceden a múltiples tablas. Estarás:

- Accediendo a Múltiples Tablas con Subconsultas
- Accediendo a Múltiples Tablas con Uniones Implícitas

¿Cómo se ve la sintaxis de una versión implícita de la declaración CROSS JOIN (también conocida como Unión Cartesiana)?

```sql
SELECT column_name(s)
FROM table1, table2;
```
Copied!

Wrap Toggled!

¿Cómo se ve la sintaxis de una versión implícita de la declaración INNER JOIN?

```sql
SELECT column_name(s)
FROM table1, table2
WHERE table1.column_name = table2.column_name;
```

## Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es una base de datos interna. Estarás trabajando en una base de datos de recursos humanos (HR) de muestra. Este esquema de base de datos de HR consta de 5 tablas llamadas EMPLOYEES, JOB_HISTORY, JOBS, DEPARTMENTS y LOCATIONS. Cada tabla tiene algunas filas de datos de muestra. El siguiente diagrama muestra las tablas para la base de datos de HR:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás:

- Escribir consultas SQL que accedan a más de una tabla
- Componer consultas que accedan a múltiples tablas utilizando una declaración anidada en la cláusula WHERE
- Construir consultas con múltiples tablas en la cláusula FROM
- Escribir consultas de unión implícita con criterios de unión especificados en la cláusula WHERE
- Especificar alias para los nombres de las tablas y calificar los nombres de las columnas con alias de tabla
*/

/*markdown
## Ejercicio 1: Accediendo a Múltiples Tablas con Subconsultas
1. Problema:

> Recuperar solo los registros de EMPLEADOS que correspondan a trabajos en la tabla JOBS.

<details><summary>Solución </summary>

```sql
    select * from employees 
    where JOB_ID IN (select JOB_IDENT from jobs);
```
</details>


<details><summary>Salida </summary>

![alt text](image-1.png)
</details>
*/

/*markdown
2. Problema:

> Recuperar solo la lista de empleados cuyo JOB_TITLE es Jr. Designer.

Solución
<details><summary>Solución </summary>

```sql
    select * from employees 
    where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');
```
</details>


<details><summary>Salida </summary>

![alt text](image-2.png)
</details>
*/

/*markdown
3. Problema:

> Recuperar información de JOB y quienes ganan más de $70,000.

<details><summary>Solución </summary>

```sql
    select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
    from jobs where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );
```
</details>


<details><summary>Salida </summary>

![alt text](image-3.png)
</details>
*/

/*markdown
4. Problema:

> Recuperar información de JOB y cuyo año de nacimiento es después de 1976.

<details><summary>Solución </summary>

```sql
    select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
    from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 );
```
</details>


<details><summary>Salida </summary>

![alt text](image-4.png)
</details>
*/

/*markdown
5. Problema:

> Recuperar información de JOB para empleadas cuyos año de nacimiento es después de 1976.

<details><summary>Solución </summary>

```sql
    select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
    from jobs 
    where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' );
```
</details>


<details><summary>Salida </summary>

![alt text](image-5.png)
</details>
*/

/*markdown
## Ejercicio 2: Accediendo a Múltiples Tablas con Joins Implícitos

1. Problema:
>Realiza un join cartesiano/cruzado implícito entre las tablas EMPLOYEES y JOBS.

<details><summary>Solución </summary>

```sql
    select * from employees, jobs;
```
</details>


<details><summary>Salida </summary>

![alt text](image-6.png)
</details>
*/

/*markdown
2. Problema:

> Recupera solo los registros de EMPLOYEES que corresponden a trabajos en la tabla JOBS.

<details><summary>Solución </summary>

```sql
    select * 
    from employees, jobs 
    where employees.JOB_ID = jobs.JOB_IDENT;
```
</details>


<details><summary>Salida </summary>

![alt text](image-7.png)
</details>
*/

/*markdown
3. Problema:

> Repite la consulta anterior, usando alias más cortos para los nombres de las tablas.

<details><summary>Solución </summary>

```sql
    select * 
    from employees E, jobs J 
    where E.JOB_ID = J.JOB_IDENT;
```
</details>


<details><summary>Salida </summary>

![alt text](image-8.png)
</details>
*/

/*markdown
4. Problema:

> Repite la consulta anterior, pero recupera solo el ID del Empleado, Nombre del Empleado y Título del Trabajo.

<details><summary>Solución </summary>

```sql
    select EMP_ID,F_NAME,L_NAME, JOB_TITLE 
    from employees E, jobs J 
    where E.JOB_ID = J.JOB_IDENT;
```
</details>


<details><summary>Salida </summary>

![alt text](image-9.png)
</details>
*/

/*markdown
5. Problema:

> Repite la consulta anterior, pero especifica los nombres de columna completamente calificados con alias en la cláusula SELECT.

<details><summary>Solución </summary>

```sql
    select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE 
    from employees E, jobs J 
    where E.JOB_ID = J.JOB_IDENT;
```
</details>


<details><summary>Salida </summary>

![alt text](image-10.png)
</details>
*/

/*markdown
## Script de Solución
Si deseas ejecutar todas las consultas de solución de los problemas SQL de este laboratorio con un script, descarga el script a continuación. 
- [MultipleTables_Solution_Script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Working%20with%20Multiple%20Tables%20%20/MultipleTables_Solution_Script.sql)
*/