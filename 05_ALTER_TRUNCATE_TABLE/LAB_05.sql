/*markdown
# Lectura: Ejemplos para ALTER y TRUNCATE tablas usando MySQL

> En el video anterior, la sintaxis de ALTER y TRUNCATE se aplica a DB2. Hay variaciones en la sintaxis entre diferentes bases de datos. Esta lectura explorará algunos ejemplos de declaraciones ALTER y TRUNCATE usando MySQL.

## Objetivo(s)
Al final de esta lectura, podrás:
- Usar la declaración ALTER TABLE con la sintaxis correcta.
- Usar declaraciones TRUNCATE en la sintaxis.
- Ejecutar ejemplos de declaraciones ALTER y TRUNCATE.

## ALTER TABLE
Las declaraciones ALTER TABLE se pueden utilizar para agregar o eliminar columnas de una tabla, modificar el tipo de datos de las columnas, agregar o eliminar claves, y agregar o eliminar restricciones. La sintaxis de la declaración ALTER TABLE es:

### Sintaxis de ADD COLUMN

```sql
ALTER TABLE table_name
ADD column_name data_type;
```

Una variación de la sintaxis para agregar columnas es:

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

De forma predeterminada, todas las entradas se asignan inicialmente el valor <code>NULL</code>. Luego puedes usar declaraciones <code>UPDATE</code> para agregar los valores de columna necesarios.

Por ejemplo, para agregar una columna telephone_number a la tabla author en la base de datos library, la declaración se escribirá como:

```sql
ALTER TABLE author 
ADD telephone_number BIGINT;
```

Aquí, BIGINT es un tipo de dato para Entero Grande.
Después de agregar las entradas a la nueva columna, se muestra a continuación un ejemplo de salida.

![alt text](image.png)

## Modificar el tipo de dato de la columna

```sql
ALTER TABLE table_name
MODIFY column_name data_type;
```

A veces, los datos presentados pueden estar en un formato diferente al requerido. En tal caso, necesitamos modificar el data_type de la columna. Por ejemplo, usar un tipo de dato numérico para telephone_number significa que no puedes incluir paréntesis, signos más o guiones como parte del número. Para tales entradas, la elección adecuada de data_type es CHAR.

Para modificar el tipo de dato, la declaración se escribirá como:

```sql
ALTER TABLE author
MODIFY telephone_number CHAR(20);
```
Las entradas se pueden actualizar utilizando declaraciones UPDATE. A continuación se muestra una versión actualizada de la tabla “author”.

![alt text](image-1.png)

## TRUNCAR Tabla
Las declaraciones TRUNCATE TABLE se utilizan para eliminar todas las filas de una tabla. La sintaxis de la declaración es:

```sql
TRUNCATE TABLE table_name;
```

Para truncar la tabla "author", la declaración se escribirá como:

```sql
TRUNCATE TABLE author;
```

La salida sería como se muestra en la imagen a continuación.

![alt text](image-2.png)

Nota: La instrucción TRUNCATE eliminará las filas y no la tabla.
*/

CREATE DATABASE IF NOT EXISTS library;

USE library;

DROP TABLE IF EXISTS author;
CREATE TABLE author
(
    author_id INT,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
    
);

INSERT INTO author (author_id,lastname,firstname,email,city,country)
VALUES
    (1001, ' Thomas', 'John','johnt@gmail.com','New York','USA'),
    (1002, 'James', 'Alice','alicej@gmail.com','Seattle', 'USA'),
    (1003, 'Wells', 'Steve','stevew:@gmail.com','Montreal','Canada'),
    (1004, 'Kumar','Santosh','kumars@gmail.com','London','UK');

SELECT *
FROM author;

/*
Sintaxis de ADD COLUMN
*/
ALTER TABLE author
ADD telephone_number BIGINT;

UPDATE  author
SET telephone_number = '5551111'
WHERE author_id = 1001


SELECT *
FROM author;

UPDATE author
SET telephone_number =  CASE author_id
                            WHEN 1002 THEN '5551112'
                            WHEN 1003 THEN '5552222'
                            WHEN 1004 THEN '5553333'
                        END
WHERE author_id IN (1002, 1003,1004);

SELECT *
FROM author;

/*CAMBIAR EL TIPO DE DATO DE UNA COLUMNA*/
ALTER TABLE author
MODIFY telephone_number CHAR(20);

UPDATE author
SET telephone_number =  CASE author_id
                            WHEN 1001 THEN '555-1111'
                            WHEN 1002 THEN '555-1112'
                            WHEN 1003 THEN '555-2222'
                            WHEN 1004 THEN '555-3333'
                        END
WHERE author_id IN (1001, 1002, 1003,1004);

SELECT *
FROM author;

/*TRUNCATE TABLE*/
TRUNCATE TABLE author;

SELECT *
FROM author;