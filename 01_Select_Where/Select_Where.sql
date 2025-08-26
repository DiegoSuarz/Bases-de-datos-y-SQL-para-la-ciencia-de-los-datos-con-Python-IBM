/*markdown
# Ejemplos de la declaración SELECT

## Objetivos
Al final de esta lectura, aprenderás a:
- Utilizar diversas consultas SELECT para recuperar datos de la base de datos.

## Uso de la declaración SELECT
SELECT se clasifica como un comando de consulta de base de datos utilizado para recuperar información de una tabla de base de datos.

Existen varias formas en las que se utiliza una declaración SELECT.

1. La sintaxis general de una declaración SELECT recupera los datos bajo las columnas listadas de Table_1. El código es:

```sql
SELECT COLUMN1, COLUMN2, ... FROM TABLE_1 ;
```

2. Para recuperar todas las columnas de una tabla, utiliza " * " en lugar de especificar nombres de columnas individuales. El código a continuación recupera toda la tabla.

```sql
SELECT * FROM TABLE_1 ;
```

3. Utiliza la cláusula WHERE para filtrar los datos requeridos en función de un predicado. El código a continuación filtra la respuesta para que solo se incluyan las entradas que coinciden con el predicado.

```sql
SELECT <COLUMNS> FROM TABLE_1 WHERE <predicate> ;
```

## Ejemplos de SELECT
Veamos estos códigos en acción. A continuación se muestra una tabla de base de datos llamada ‘COUNTRY’, que contiene las columnas <code>ID</code>, <code>Name</code> y <code>CCode</code>. Aquí, <code>CCode</code> es un código de país de 2 letras.

![alt text](image.png)

## Ejemplo #1
Cuando aplicamos el código SELECT <code>SELECT * FROM COUNTRY</code> ;, la consulta recupera todas las filas y columnas de la tabla de la base de datos llamada COUNTRY.

- 'SELECT *' instruye a la base de datos para seleccionar todas las columnas de la tabla.
- 'FROM COUNTRY' especifica la tabla de la que se debe recuperar la información. En este caso, es la tabla "COUNTRY", por lo que aparece toda la tabla, como se muestra a continuación.

Respuesta:

![alt text](image-1.png)

## Ejemplo #2
La consulta SQL <code>SELECT ID, Name FROM COUNTRY;</code> recupera columnas específicas de una tabla de base de datos llamada 'COUNTRY'.

- 'SELECT ID, Name' instruye a la base de datos para seleccionar dos columnas específicas de la tabla: "ID" y "Name." Devolverá estas dos columnas para cada fila que coincida con los criterios de la consulta.
- 'FROM COUNTRY' especifica la tabla de la cual recuperar los datos, que es la tabla "COUNTRY". La tabla a continuación muestra que solo se recuperaron las columnas "ID" y "Name".

Respuesta:

![alt text](image-2.png)

## Ejemplo #3
La consulta SQL <code>SELECT * FROM COUNTRY WHERE ID <= 5;</code> recupera todas las columnas de la tabla "COUNTRY" donde el valor en la columna "ID" es menor o igual a 5.

- <code>SELECT *</code> instruye a la base de datos a seleccionar todas las columnas de la tabla especificada.
- FROM COUNTRY especifica la tabla de la cual recuperar los datos, que es la tabla 'COUNTRY'.
- WHERE ID <= 5 ; es una condición que filtra las filas de la tabla. Solo devolverá las filas donde el valor en la columna "ID" sea menor o igual a 5. En la tabla a continuación, puedes ver que solo se recuperaron las filas 1-5.

Respuesta:

![alt text](image-3.png)

## Ejemplo #4
La consulta SQL <code>SELECT * FROM COUNTRY WHERE CCode = 'CA';</code> recupera todas las columnas de la tabla “COUNTRY” donde el valor en la columna “CCode” es igual a ‘CA’.

- <code>SELECT *</code> instruye a la base de datos a seleccionar todas las columnas de la tabla especificada.
- FROM COUNTRY especifica la tabla de la que se recuperarán los datos, que es la tabla ‘COUNTRY’.
- WHERE CCode = ‘CA’; es una condición que filtra las filas de la tabla. Solo devolverá filas donde el valor en la columna “CCode” sea igual a ‘CA.’ En la tabla a continuación, verás que solo se recuperó la columna CA.

Respuesta:

![alt text](image-4.png)

En el laboratorio que sigue más adelante en el módulo, aplicarás estos conceptos y practicarás más consultas SELECT de manera práctica.

En esta lectura, aprendiste que:

- SELECT es un comando de consulta de base de datos que recupera información de una tabla de base de datos.
- La declaración SELECT tiene varias formas dependiendo de la acción que necesites.
- La sintaxis general recuperará los datos de las columnas listadas de una tabla nombrada.
- Usa “*” para recuperar todas las columnas de una tabla sin especificar nombres de columnas individuales.
- Usa la cláusula WHERE para filtrar los datos según un predicado.

*/

/*markdown

*/


CREATE DATABASE IF NOT EXISTS COUNTRY;

DROP TABLE  IF  EXISTS COUNTRY;
CREATE TABLE COUNTRY (
    ID INT,
    Name VARCHAR(30) NOT NULL,
    CCode VARCHAR(2) UNIQUE NOT NULL      
);

INSERT INTO COUNTRY (ID,Name, CCode)
VALUES 
(1,'Estados Unidos de América','US'),
(2,'China', 'CH'),
(3,'Japón', 'JA'),
(4,'Alemania', 'GE'),
(5,'India', 'IN'),
(6,'Reino Unido', 'UK'),
(7,'Francia', 'FR'),
(8,'Italia', 'IT'),
(9,'Canadá', 'CA'),
(10,'Brasil', 'BR')

-- EJEMPLO 1:
SELECT * FROM COUNTRY
ORDER BY 1;

-- EJEMPLO 2:
SELECT ID, Name FROM COUNTRY ORDER BY 1;

-- EJEMPLO 3:

SELECT * FROM COUNTRY WHERE ID <= 5 ORDER BY 1;

/*Ejemplo4*/

SELECT * FROM COUNTRY WHERE CCode = 'CA' ORDER BY 1;