/*markdown
# Laboratorio Práctico: Funciones Integradas

En SQL, puedes acceder a muchas funciones integradas que pueden ser utilizadas para obtener más variedad en nuestro análisis de datos. Estas funciones incluyen funciones de agregación (como **MAX**, **MIN**, **SUM** y **AVG**), funciones de cadena (como **LENGTH**, **UCASE** y **LCASE**), funciones escalares (como **ROUND**), y una variedad de funciones de fecha también. En esta pestaña, tendrás práctica práctica sobre cómo usarlas todas.

## Objetivos
Después de completar este laboratorio, podrás componer consultas en phpMyAdmin con MySQL utilizando:

- Funciones de Agregación
- Funciones Escalares
- Funciones de Cadena
- Funciones de Fecha
*/

/*markdown
## Crear la base de datos
1. Crea la base de datos llamada **Mysql_Learners** 
*/

CREATE DATABASE IF NOT EXISTS Mysql_Learners;

/*markdown
## Crear la tabla PETRESCUE
2. En lugar de crear la tabla manualmente escribiendo los comandos DDL en el editor SQL, ejecutarás un script que contiene el comando para crear la tabla.

Descarga el archivo de script [PETRESCUE-CREATE.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week3/PETRESCUE-CREATE.sql)

> Nota: Para descargar, haz clic derecho en el enlace anterior y selecciona Guardar como o Guardar enlace como dependiendo de tu navegador. Recuerda guardar el archivo con la extensión .sql y no como HTML.

A continuación, carga el archivo .sql en tu base de datos utilizando la opción Importar.

Al ejecutarlo, se creará la tabla **PETRESCUE** en la base de datos **Mysql_Learners** y se cargará con un conjunto de valores también. Los atributos de la tabla PETRESCUE son:

|Nombre de la Columna    |Tipo de Dato	    |Descripción        |
|------------------------|------------------|-------------------|
|ID	                     |INTEGER	        |ID de la entrada   |
|ANIMAL	                 |VARCHAR(20)	    |Tipo de animal     |
|CANTIDAD	             |INTEGER	        |Número de animales |
|COSTO	                 |DECIMAL(6,2)	    |Costo incurrido    |
|FECHA_DE_RESCATE	     |DATE	            |Fecha de rescate   |

Una vez que la tabla esté cargada, puedes abrir el editor SQL para comenzar a ejecutar las consultas.



*/

USE Mysql_Learners;

drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

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

/*markdown
## Funciones de Agregación
1. Escribe una consulta que calcule el costo total de todos los rescates de animales en la tabla PETRESCUE.

Para esta consulta, utilizaremos la función ``SUM(COLUMN_NAME)``. La salida de esta consulta será el valor total de todos los elementos en la columna. La consulta para esta pregunta se puede escribir como:

```sql
SELECT SUM(COST) FROM PETRESCUE;
```
*/

SELECT SUM(COST)
FROM PETRESCUE;

/*markdown
Puedes asignar aún más una etiqueta a la consulta ``SUM_OF_COST``.

```sql
SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;
```
*/

SELECT SUM(COST) AS SUM_OF_COST
FROM PETRESCUE

/*markdown
2. Escribe una consulta que muestre la cantidad máxima de animales rescatados (de cualquier tipo).

    Para esta consulta, utilizaremos la función ``MAX(COLUMN_NAME)``. La salida de esta consulta será el valor máximo de todos los elementos en la columna. La consulta para esta pregunta se puede escribir como:

    ```sql
    SELECT MAX(QUANTITY) FROM PETRESCUE;
    ```
*/

SELECT MAX(QUANTITY)
FROM PETRESCUE;

/*markdown
La consulta se puede cambiar fácilmente para mostrar la cantidad mínima utilizando la función ``MIN``.

```sql
SELECT MIN(QUANTITY) FROM PETRESCUE;
```
*/

SELECT MIN(QUANTITY)
FROM PETRESCUE;

/*markdown
3. Escribe una consulta que muestre el costo promedio de los animales rescatados.

    Para esta consulta, utilizaremos ``AVG(COLUMN_NAME)``. La salida de esta consulta será el promedio de todos los elementos en la columna. La consulta para esta pregunta se puede escribir como

    ```sql
    SELECT AVG(COST) FROM PETRESCUE;
    ```
*/

SELECT AVG(COST)
FROM PETRESCUE;

/*markdown
## Funciones Escalares y Funciones de Cadena
1. Escribe una consulta que muestre el costo integral redondeado de cada rescate.

    Para esta consulta, utilizaremos la función ``ROUND(COLUMN_NAME, NUMBER_OF_DECIMALS)``. La salida de esta consulta será el valor de cada elemento en la columna redondeado al número especificado de decimales. Ten en cuenta que el segundo argumento es opcional y, si se omite, resulta en un redondeo a un valor entero. La consulta para esta pregunta se puede escribir como:

    ```sql
    SELECT ROUND(COST) FROM PETRESCUE;
    ```
*/

SELECT ROUND(COST)
FROM PETRESCUE;

/*markdown
La consulta también podría escribirse como:

```sql
SELECT ROUND(COST, 0) FROM PETRESCUE;
```
*/

SELECT ROUND(COST, 0)
FROM PETRESCUE;

/*markdown

En caso de que la pregunta fuera redondear el valor a 2 decimales, la consulta cambiaría a:

```sql
SELECT ROUND(COST, 2) FROM PETRESCUE;
```
*/

SELECT ROUND(COST,2)
FROM PETRESCUE;

/*markdown
2. Escribe una consulta que muestre la longitud de cada nombre de animal.

    Para esta consulta, utilizaremos la función LENGTH(COLUMN_NAME). La salida de esta consulta será la longitud de cada elemento en la columna. La consulta para esta pregunta se puede escribir como:

    ```sql
    SELECT LENGTH(ANIMAL) FROM PETRESCUE;
    ```

*/

SELECT LENGTH(ANIMAL), ANIMAL
FROM PETRESCUE;

/*markdown
3. Escribe una consulta que muestre el nombre del animal en cada rescate en mayúsculas.

    Para esta consulta, utilizaremos la función UCASE(COLUMN_NAME). La salida de esta consulta será cada elemento en la columna en letras mayúsculas. La consulta para esta pregunta se puede escribir como:

    ```sql
    SELECT UCASE(ANIMAL) FROM PETRESCUE;
    ```
*/

SELECT UCASE(ANIMAL)
FROM PETRESCUE;

/*markdown
Igualmente, el usuario podría pedir una representación en minúsculas, y la consulta se cambiaría a:

```sql
SELECT LCASE(ANIMAL) FROM PETRESCUE;
```
*/

SELECT LCASE(ANIMAL)
FROM PETRESCUE;

/*markdown
## Funciones de Fecha
1. Escribe una consulta que muestre la fecha de rescate.

    Para esta consulta, utilizaremos la función ``DAY(COLUMN_NAME)``. La salida de esta consulta será solo la parte de ``DÍA`` de la fecha en la columna. La consulta para esta pregunta se puede escribir como:

    ```sql
    SELECT DAY(RESCUEDATE) FROM PETRESCUE;
    ```
*/

SELECT DAY(RESCUEDATE)
FROM PETRESCUE;

/*markdown
En caso de que la consulta estuviera pidiendo el ``MONTH`` de rescate, la consulta cambiaría a:

```sql
SELECT MONTH(RESCUEDATE) FROM PETRESCUE;
```
*/

SELECT MONTH(RESCUEDATE)
FROM PETRESCUE;

/*markdown
En caso de que la consulta estuviera pidiendo el ``AÑO`` del rescate, la consulta cambiaría a:

```sql
SELECT YEAR(RESCUEDATE) FROM PETRESCUE;
```
*/

SELECT YEAR(RESCUEDATE)
FROM PETRESCUE;

/*markdown
2. Los animales rescatados deben ver al veterinario dentro de los tres días posteriores a su llegada. Escribe una consulta que muestre el tercer día de cada rescate.

    Para esta consulta, utilizaremos la función ``DATE_ADD(COLUMN_NAME, INTERVAL Number Date_element)``. Aquí, la cantidad en ``Number`` y en ``Date_element`` se combinarán para formar el intervalo que se añadirá a la fecha en la columna. Para la pregunta dada, la consulta sería:

    ```sql
    SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE
    ```
*/

SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) AS TREE_DAY_AFTER, RESCUEDATE
FROM PETRESCUE;

/*markdown
Si la pregunta era añadir 2 meses a la fecha, la consulta cambiaría a:

```sql
SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE
```
*/

SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH)
FROM PETRESCUE;

/*markdown
De manera similar, podemos recuperar una fecha anterior a la dada en la columna por un número determinado utilizando la función DATE_SUB. Al modificar el mismo ejemplo, la siguiente consulta proporcionaría la fecha 3 días antes del rescate.

```sql
SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE
```
*/

SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY)
FROM PETRESCUE

/*markdown
3. Escribe una consulta que muestre la duración del tiempo que los animales han sido rescatados, por ejemplo, la diferencia entre la fecha actual y la fecha de rescate.

Para esta consulta, utilizaremos la función ``DATEDIFF(Date_1, Date_2)``. Esta función calcula la diferencia entre las dos fechas dadas y proporciona la salida en número de días. Para la pregunta dada, la consulta sería:

```sql
SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE
```
*/

SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE)
FROM PETRESCUE;

/*markdown


``CURRENT_DATE`` también es una función incorporada que devuelve la fecha actual según lo conoce el servidor.

Para presentar la salida en un formato YYYY-MM-DD, se puede usar otra función ``FROM_DAYS(number_of_days)``. Esta función toma un número de días y devuelve la salida formateada requerida. La consulta anterior se modificaría así:

```sql
SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE
```
*/

SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE))
FROM PETRESCUE;

/*markdown
## Problemas de Práctica

1. Escribe una consulta que muestre el costo promedio de rescatar un solo perro. Ten en cuenta que el costo por perro no sería el mismo en diferentes casos.

    <details><summary>Haz clic aquí para una pista </summary>
        Para este tipo de problema, debes usar la función `AVG` en `COST/QUANTITY`, por ejemplo, costo por unidad de cantidad.
    </details>

    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
        SELECT AVG(COST/QUANTITY) 
        FROM PETRESCUE WHERE ANIMAL = 'Dog';
    ```
    </details>
*/

SELECT ROUND(AVG(COST/QUANTITY),2) AS COST_DOG_PROM
FROM PETRESCUE
WHERE ANIMAl = 'DOG'

/*markdown
2. Escribe una consulta que muestre el nombre del animal en cada rescate en mayúsculas sin duplicaciones.

    <details><summary>Haz clic aquí para una pista </summary>
        Para escribir esta consulta, debes usar las funciones `DISTINCT` y `UCASE`.
    </details>

    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
        SELECT DISTINCT UCASE(ANIMAL) 
        FROM PETRESCUE;
    ```
    </details>
*/

SELECT DISTINCT UCASE(ANIMAl)
FROM PETRESCUE;

/*markdown
3. Escribe una consulta que muestre todas las columnas de la tabla PETRESCUE donde el(los) animal(es) rescatado(s) son gatos. Usa cat en minúsculas en la consulta.

<details><summary>Haz clic aquí para una pista </summary>
    Debes usar la función `LCASE` para escribir esta consulta.
</details>

<details><summary>Haz clic aquí para la solución </summary>

```sql
    SELECT * 
    FROM PETRESCUE 
    WHERE LCASE(ANIMAL)="cat";
```
</details>
*/

SELECT * 
    FROM PETRESCUE 
    WHERE LCASE(ANIMAL)="cat";

/*markdown
4. Escribe una consulta que muestre el número de rescates en el 5to mes.

    <details><summary>Haz clic aquí para una pista </summary>
        Debes usar la función `SUM` Y la función `MONTH` para escribir esta consulta.
    </details>

    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
        SELECT SUM(QUANTITY) 
        FROM PETRESCUE 
        WHERE MONTH(RESCUEDATE)="05";
    ```
    </details>
*/

SELECT SUM(QUANTITY)
FROM PETRESCUE
WHERE MONTH(RESCUEDATE) = "05";

/*markdown
5. Se supone que el refugio de rescate debe encontrar buenos hogares para todos los animales dentro de un año desde su rescate. Escribe una consulta que muestre el ID y la fecha objetivo.

    <details><summary>Haz clic aquí para una pista </summary>
        Tienes que usar la función `DATE_ADD` para escribir esta consulta.
    </details>

    <details><summary>Haz clic aquí para la solución </summary>

    ```sql
        SELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) 
        FROM PETRESCUE;
    ```
    </details>
*/

SELECT ID, RESCUEDATE, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) AS AÑO_PREVISTO
FROM PETRESCUE;

/*markdown
## Conclusión
Felicidades por completar este laboratorio.

Ahora eres capaz de:

- Utilizar funciones de agregación para calcular valores totales, máximos, mínimos y promedios de atributos numéricos.
- Utilizar funciones escalares para redondear un valor flotante al número deseado de decimales.
- Utilizar funciones de cadena para convertir texto en mayúsculas o minúsculas.
- Utilizar operaciones de fecha para manipular columnas de datos con el atributo como fecha.
*/