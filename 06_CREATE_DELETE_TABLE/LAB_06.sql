/*markdown
# Lectura: Ejemplos para CREAR y ELIMINAR tablas

## Objetivo(s)
Al final de este laboratorio, podrás:

- Crear y eliminar tablas en la base de datos.

## INSTRUCCIÓN CREATE TABLE
En el video anterior, vimos la sintaxis general para crear una tabla:

```sql
CREATE TABLE TableName (
   COLUMN1 datatype,
   COLUMN2 datatype,
   COLUMN3 datatype, 
   ...
);
```
Considere los siguientes ejemplos:

1. Cree una tabla TEST con dos columnas: ID de tipo entero y NAME de tipo varchar. Para esto, utilizamos la siguiente instrucción SQL.

```sql
CREATE TABLE TEST (
   ID int,
   NAME varchar(30)
);
```
2. Crea una tabla COUNTRY con una columna ID de tipo entero, una columna de código de país de dos letras y una columna de nombre de país de longitud variable. Para esto, podemos usar la siguiente declaración SQL.

```sql
CREATE TABLE COUNTRY (
   ID int,
   CCODE char(2),
   Name varchar(60)
);
```
3. En el ejemplo anterior, convierte ID en una clave primaria. Luego, la declaración se modificará como se muestra a continuación.

```sql
CREATE TABLE COUNTRY (
   ID int NOT NULL,
   CCODE char(2),
   Name varchar(60),
   PRIMARY KEY (ID)
);
```

En el ejemplo anterior, la columna ID tiene la restricción NOT NULL añadida después del tipo de dato, lo que significa que no puede contener un valor NULL o vacío. Esto se añade ya que la base de datos no permite que las claves primarias tengan valores NULL.

## ELIMINAR TABLA
Si la tabla que estás intentando crear ya existe en la base de datos, recibirás un error indicando la tabla XXX.YYY ya existe. Para evitar este error, crea una tabla con un nombre diferente o primero ELIMINA la tabla existente. Es común emitir un ELIMINAR antes de hacer un CREAR en escenarios de prueba y desarrollo.

La sintaxis para eliminar una tabla es:

```sql
DROP TABLE TableName;
```

Por ejemplo, considera que deseas eliminar el contenido de la tabla COUNTRY si existe una tabla en el conjunto de datos con el mismo nombre. En tal caso, el código del último ejemplo se convierte en

```sql
DROP TABLE COUNTRY;
CREATE TABLE COUNTRY (
   ID int NOT NULL,
   CCODE char(2),
   Name varchar(60),
   PRIMARY KEY (ID)
);
```

ADVERTENCIA: Antes de eliminar una tabla, asegúrate de que no contenga datos importantes que no se puedan recuperar fácilmente.

Ten en cuenta que si la tabla no existe y intentas eliminarla, verás un error como XXX.YYY es un nombre no definido. Puedes ignorar este error si la declaración CREATE subsiguiente se ejecuta con éxito.

En un laboratorio práctico más adelante en este módulo, practicarás la creación de tablas y otras declaraciones SQL.
*/

USE prueba;

/*
Cree una tabla TEST con dos columnas: ID de tipo entero y NAME de tipo varchar. Para esto, utilizamos la siguiente instrucción SQL.
*/
CREATE TABLE Test
    (
        ID int,
        NAME VARCHAR(30)

    )

/*
Crea una tabla COUNTRY con una columna ID de tipo entero, una columna de código de país de dos letras y una columna de 
nombre de país de longitud variable.
*/
CREATE TABLE country_test
    (
        ID INT,
        CCODE CHAR(2),
        Name VARCHAR(60)
    );

/*
n el ejemplo anterior, convierte ID en una clave primaria. Luego, la declaración se modificará como se muestra a continuación.
*/
CREATE TABLE country_testp
    (
        ID INT NOT NULL,
        CCODE CHAR(2),
        Name VARCHAR(60),
        PRIMARY KEY (ID)
    );

INSERT INTO country_testp(ID, CCODE, Name)
VALUES
(1, 'US', 'UNITED STATES OF AMERICA');

SELECT *
FROM country_testp;

/*
considera que deseas eliminar el contenido de la tabla COUNTRY si existe una tabla en el conjunto 
de datos con el mismo nombre. En tal caso, el código del último ejemplo se convierte en
*/
DROP TABLE country_testp;

SELECT *
FROM country_testp;