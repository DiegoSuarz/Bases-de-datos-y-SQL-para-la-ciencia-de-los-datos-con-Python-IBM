/*markdown
# Laboratorio Práctico: Funciones incorporadas - Funciones de Agregación, Escalar, Cadenas, Fecha y Hora
Ahora practiquemos el uso de subconsultas y el trabajo con múltiples tablas. Utiliza el archivo PETRESCUE-CREATE.sql proporcionado para crear la tabla y ejecutar las consultas en los últimos dos videos.

ID	|ANIMAL	    |CANTIDAD   |COSTO	    |FECHA_DE_RESCATE   |
----|-----------|-----------|-----------|-------------------|
1	|Gato	    |9	        |450.09	    |29/5/2018          |
2	|Perro	    |3	        |666.66	    |1/6/2018           |
3	|Perro	    |1	        |100	    |4/6/2018           |
4	|Loro	    |2	        |50	        |4/6/2018           |
5	|Perro	    |1	        |75.75	    |10/6/2018          |
6	|Hámster    |6	        |60.6	    |11/6/2018          |
7	|Gato	    |1	        |44.44	    |11/6/2018          |
8	|Pez dorado	|24	        |48.48	    |14/6/2018          |
9	|Perro	    |2	        |222.22	    |15/6/2018          |

## Objetivos
Después de completar este laboratorio, podrás:

1. Componer y ejecutar subconsultas con múltiples tablas
2. Verificar los resultados de las consultas y revisar los archivos de registro

Compón y ejecuta las siguientes consultas. Verifica que los resultados sean los que esperas y recuerda revisar los registros en la sección de Resultados en busca de errores y advertencias.

> **Nota**: Las soluciones se proporcionan al final de este laboratorio, pero intenta componer las consultas por tu cuenta antes de revisar las soluciones.

#### NOTA : Asegúrate de estar utilizando el archivo CSV y los conjuntos de datos del mismo archivo de instrucciones.

## Ejercicio 1: Crear la tabla Pet Rescue
En lugar de crear la tabla manualmente escribiendo los comandos DDL en el editor SQL, ejecutarás un script que contiene el comando de creación de la tabla.

1. Descarga el archivo de script [PETRESCUE-CREATE.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/PETSALE_PETRESCUE/PETRESCUE-CREATE.sql)

> Nota: Para descargar, simplemente haz clic derecho en el enlace anterior y selecciona Guardar como.. o Guardar enlace como… dependiendo de tu navegador. Guarda el archivo como un archivo .sql y no HTML.

## Ejercicio 2: Funciones de Agregación
Consulta A1: Ingresa una función que calcule el costo total de todos los rescates de animales en la tabla PETRESCUE.

<details><summary>respuesta </summary>

```sql
    select SUM(COST) 
    from PETRESCUE;
```
</details>

Consulta A2: Ingresa una función que muestre el costo total de todos los rescates de animales en la tabla PETRESCUE en una columna llamada SUM_OF_COST.

<details><summary>respuesta </summary>

```sql
    select SUM(COST) AS SUM_OF_COST 
    from PETRESCUE;
```
</details>

Consulta A3: Ingresa una función que muestre la cantidad máxima de animales rescatados.

<details><summary>respuesta </summary>

```sql
    select MAX(QUANTITY) 
    from PETRESCUE;
```
</details>

Consulta A4: Ingresa una función que muestre el costo promedio de los animales rescatados.

<details><summary>respuesta </summary>

```sql
    select AVG(COST) 
    from PETRESCUE;
```
</details>

Consulta A5: Ingresa una función que muestre el costo promedio de rescatar un perro.

<details><summary>respuesta </summary>

```sql
    select AVG(COST/QUANTITY) 
    from PETRESCUE 
    where ANIMAL = 'Dog';
```
</details>

## Ejercicio 3: Funciones Escalares y de Cadenas
Consulta B1: Ingresa una función que muestre el costo redondeado de cada rescate.

<details><summary>respuesta </summary>

```sql
    select ROUND(COST) 
    from PETRESCUE;
```
</details>

Consulta B2: Ingresa una función que muestre la longitud de cada nombre de animal.

<details><summary>respuesta </summary>

```sql
    select LENGTH(ANIMAL)
    from PETRESCUE;
```
</details>

Consulta B3: Ingresa una función que muestre el nombre del animal en cada rescate en mayúsculas.

<details><summary>respuesta </summary>

```sql
    select UCASE(ANIMAL) 
    from PETRESCUE;
```
</details>

Consulta B4: Ingresa una función que muestre el nombre del animal en cada rescate en mayúsculas sin duplicaciones.

<details><summary>respuesta </summary>

```sql
    select DISTINCT(UCASE(ANIMAL)) 
    from PETRESCUE;
```
</details>

Consulta B5: Ingresa una consulta que muestre todas las columnas de la tabla PETRESCUE, donde los animales rescatados sean gatos. Usa cat en minúsculas en la consulta.

<details><summary>respuesta </summary>

```sql
    select * 
    from PETRESCUE 
    where LCASE(ANIMAL) = 'cat';
```
</details>

## Ejercicio 4: Funciones de Fecha y Hora
Consulta C1: Ingresa una función que muestre el día del mes en que se han rescatado gatos.

<details><summary>respuesta </summary>

```sql
    select DAY(RESCUEDATE)
    from PETRESCUE 
    where ANIMAL = 'Cat';
```
</details>

Consulta C2: Ingresa una función que muestre el número de rescates en el 5to mes.

<details><summary>respuesta </summary>

```sql
    select SUM(QUANTITY) 
    from PETRESCUE 
    where MONTH(RESCUEDATE)='05';
```
</details>

Consulta C3: Ingresa una función que muestre el número de rescates en el día 14to del mes.

<details><summary>respuesta </summary>

```sql
    select SUM(QUANTITY) 
    from PETRESCUE 
    where DAY(RESCUEDATE)='14';
```
</details>

Consulta C4: Los animales rescatados deben ver al veterinario dentro de tres días después de su llegada. Ingresa una función que muestre el tercer día de cada rescate.

<details><summary>respuesta </summary>

```sql
    select (RESCUEDATE + 3 DAYS) 
    from PETRESCUE;
```
</details>

Consulta C5: Ingresa una función que muestre el tiempo que los animales han estado rescatados; la diferencia entre la fecha de hoy y la fecha de rescate.

<details><summary>respuesta </summary>

```sql
    select (CURRENT DATE - RESCUEDATE) 
    from PETRESCUE;
```
</details>

## Resumen
Ahora puedes componer y ejecutar consultas, verificar resultados y ver los registros. Utilizarás estas habilidades en laboratorios posteriores.
*/

/*
Ejercicio 1: Crear la tabla Pet Rescue
Crear la tabla Pet Rescue
*/

CREATE DATABASE IF NOT EXISTS PETRESCUE;

-- Drop the PETRESCUE table in case it exists
USE PETRESCUE;
drop table PETRESCUE;
-- Create the PETRESCUE table 
create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);
-- Insert sample data into PETRESCUE table
insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15');

USE PETRESCUE;

SELECT *
FROM PETRESCUE;

/*
Ejercicio 2: Funciones de Agregación
Consulta A1: Ingresa una función que calcule el costo total de todos los rescates de animales en la tabla PETRESCUE.
*/

SELECT SUM(COST)
FROM PETRESCUE;



/*
Consulta A2: Introduzca una función que muestre el costo total de todos los rescates de animales en la 
             tabla PETRESCUE en una columna llamada SUM_OF_COST.
*/
SELECT SUM(COST) AS SUM_OF_COST
FROM PETRESCUE;


/*
Consulta A3: Consulta A3: Introduzca una función que muestre la cantidad máxima de animales rescatados.
*/

SELECT MAX(QUANTITY) AS MAX_RESCATADO
FROM PETRESCUE;

/*
Consulta A4:  Introduzca una función que muestre el costo promedio de los animales rescatados.
*/
SELECT ROUND(AVG(COST),2) AS COSTO_PROMEDIO
FROM PETRESCUE;

/*
Consulta A5: Introduzca una función que muestre el costo promedio de rescatar un perro.
*/
SELECT ANIMAL, ROUND(AVG(COST),2) AS COSTO_PROMEDIO_PERRO
FROM PETRESCUE
GROUP BY ANIMAL
HAVING ANIMAL = 'Dog'


SELECT AVG(COST/QUANTITY) 
from PETRESCUE 
where ANIMAL = 'Dog';

/*
Ejercicio 3: Funciones Escalares y de Cadenas
Consulta B1: Ingresa una función que muestre el costo redondeado de cada rescate.
*/
SELECT ROUND(COST)
FROM PETRESCUE;


/*
Consulta B2: Ingresa una función que muestre la longitud de cada nombre de animal.
*/

SELECT LENGTH(ANIMAL), ANIMAL
FROM PETRESCUE;

/*
Consulta B3: Ingresa una función que muestre el nombre del animal en cada rescate en mayúsculas.
*/

SELECT UCASE(ANIMAL) 
FROM PETRESCUE;

/*
Consulta B4: Ingresa una función que muestre el nombre del animal en cada rescate en mayúsculas sin duplicaciones.
*/

SELECT DISTINCT UCASE(ANIMAL)
FROM PETRESCUE;

/*
Consulta B5: Ingresa una consulta que muestre todas las columnas de la tabla PETRESCUE, donde los animales 
             rescatados sean gatos. Usa cat en minúsculas en la consulta.
*/

SELECT *
FROM PETRESCUE
WHERE LCASE(ANIMAL) = 'cat'

/*
Soluciones del Ejercicio 4: Funciones de Fecha y Hora
Consulta C1: Ingresa una función que muestre el día del mes en que se han rescatado gatos.
*/

SELECT DAY(RESCUEDATE), MONTH(RESCUEDATE) 
FROM PETRESCUE
WHERE LCASE(ANIMAL) = 'cat'

/*
Consulta C2: Ingresa una función que muestre el número de rescates en el 5to mes.
*/

SELECT SUM(QUANTITY) AS CANTIDAD_RESCATE_MAYO
FROM PETRESCUE
WHERE MONTH(RESCUEDATE) = '05'; 


/*
Consulta C3: Ingresa una función que muestre el número de rescates en el día 14to del mes.
*/

SELECT SUM(QUANTITY)
FROM PETRESCUE
WHERE DAY(RESCUEDATE) = '14'