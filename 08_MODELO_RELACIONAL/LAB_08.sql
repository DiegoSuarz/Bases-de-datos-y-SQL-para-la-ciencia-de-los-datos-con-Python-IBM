/*markdown
# Lectura: Entendiendo las Restricciones del Modelo Relacional

## Objetivos
Después de completar esta lectura, podrás:

- Definir e identificar las restricciones de integridad de entidad, integridad referencial e integridad de dominio
- Explicar cómo cada restricción mantiene la integridad de los datos
- Reconocer ejemplos de cómo se implementan estas restricciones en SQL

## Visión general
En cualquier base de datos bien diseñada, mantener la integridad de los datos es esencial para garantizar la precisión, consistencia y fiabilidad de la información almacenada. Este laboratorio se centra en tres restricciones clave del modelo relacional:

- Integridad de entidad
- Integridad referencial
- Integridad de dominio

Estas restricciones imponen reglas sobre cómo se almacenan y se relacionan los datos dentro de las tablas.

Imagina que estás construyendo una base de datos BookShopDB. Necesitas asegurarte de que:

- Cada libro y autor tenga un identificador único.
- Cada libro debe estar vinculado a un autor válido.
- Atributos como precio, título y fecha deben tener valores dentro de un rango y formato aceptables.

Esta lectura te guiará a través de estas restricciones con ejemplos para consolidar tu comprensión.

## Vista de muestra de las tablas utilizadas en esta lectura
### 1. Tabla BookShop
Esta es una estructura de tabla de muestra y vista de datos para la tabla BookShop utilizada en esta lectura.

![alt text](image.png)

### 2. Tabla BookShop_AuthorDetails
Esta es una estructura de tabla de muestra y vista de datos para la tabla BookShop_AuthorDetails utilizada en esta lectura.

![alt text](image-1.png)

## Tipos de restricciones del modelo relacional
### Restricción de integridad de entidad
Esta restricción asegura que cada tabla en una base de datos relacional tenga una clave primaria. Una clave primaria identifica de manera única cada fila en la tabla. Una columna(s) de clave primaria:

- no debe contener valores NULL
- debe ser única en todas las filas

Esta restricción garantiza que cada registro (o entidad) en una tabla sea distinto e identificable, previniendo duplicaciones y la falta de identificadores.

Ejemplo:

```sql
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT
);
```

### Explicación
Aquí, BOOK_ID es la clave primaria. Debe ser:

- Única (no puede haber dos libros con el mismo ID)

- No NULO (cada libro debe tener un ID)

> Nota: Cada tabla en una base de datos relacional debe tener una clave primaria para satisfacer la integridad de la entidad.

## Restricción de integridad referencial
Esta restricción asegura que una clave foránea en una tabla siempre se refiera a una clave primaria válida en otra tabla. Esto mantiene relaciones consistentes y significativas entre tablas.

Hace cumplir el vínculo lógico entre datos relacionados en diferentes tablas, evitando la existencia de referencias inválidas o “huérfanas”.

Ejemplo
```sql
CREATE TABLE BookShop_AuthorDetails (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(100)
);
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
);
```

### Explicación
AUTHOR_ID en BookShop hace referencia a AUTHOR_ID en BookShop_AuthorDetails.

Esto significa que cada AUTHOR_ID en BookShop debe existir en BookShop_AuthorDetails.

Intentar insertar un libro con un AUTHOR_ID que no existe en BookShop_AuthorDetails fallará.

## Restricción de integridad de dominio
Esta restricción asegura que todos los valores almacenados en una columna caigan dentro de un dominio definido. Esto incluye reglas sobre:

- Tipo de dato
- Formato
- Valores permitidos
- Nullabilidad

Ayuda a garantizar que los datos en una columna sean válidos, lógicos y consistentes con su uso previsto.

Ejemplo:

```sql
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    PRICE DECIMAL(5, 2) CHECK (PRICE >= 0),
    PUBLISHED_DATE DATE
);
```
### Explicación
Dos mecanismos estándar utilizados para hacer cumplir la integridad del dominio son las restricciones CHECK y NOT NULL:

1. Restricción CHECK
La restricción CHECK impone reglas sobre el rango o patrón de valores aceptables dentro de una columna. Asegura que los datos ingresados cumplan con condiciones lógicas específicas.

- La columna PRICE en el ejemplo anterior tiene una restricción CHECK para asegurar que no sea negativa.
2. Restricción NOT NULL
La restricción NOT NULL impone reglas de nulidad, asegurando que una columna debe contener un valor y no puede quedar vacía (NULL).

- TÍTULO es NOT NULL. Se debe proporcionar un título.

## Resumen
En esta lectura, exploraste tres tipos clave de restricciones utilizadas en bases de datos relacionales. Al aplicar estas restricciones, puedes crear bases de datos precisas, consistentes y fáciles de gestionar.
*/

USE prueba;

CREATE DATABASE IF NOT EXISTS books; 

USE books;

/*
Restricción de integridad de entidad
Esta restricción asegura que cada tabla en una base de datos relacional tenga una clave primaria
- no debe contener valores NULL
- debe ser única en todas las filas
*/
DROP TABLE IF EXISTS bookshop;
CREATE TABLE bookshop
(
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(50),
    AUTHOR_ID VARCHAR(50)
);

DROP TABLE IF EXISTS bookshop_AuthorDetails;
CREATE TABLE bookshop_AuthorDetails
(
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(50)
);

INSERT INTO bookshop(BOOK_ID ,TITLE, AUTHOR_ID)
VALUES
    (1, 'The Silent Patient', '101'),
    (2, 'Educated', '102'),
    (3, '1984', '103'),
    (4, 'To Kill a Mockingbird','104'),
    (5, 'The Great Gatsby', '105');

INSERT INTO bookshop_AuthorDetails(AUTHOR_ID ,AUTHOR_NAME)
VALUES
    (101, 'Alex Michaelides'),
    (102, 'Tara Westover'),
    (103, 'George Orwell'),
    (104, 'Harper Lee'),
    (105, 'F. Scott Fitzgerald')


SELECT * FROM bookshop;
SELECT * FROM bookshop_AuthorDetails;

/*
Restricción de integridad referencial
Esta restricción asegura que una clave foránea en una tabla siempre se refiera a una clave primaria
 válida en otra tabla. Esto mantiene relaciones consistentes y significativas entre tablas.

Hace cumplir el vínculo lógico entre datos relacionados en diferentes tablas, evitando la existencia 
de referencias inválidas o “huérfanas”.
*/

DROP TABLE IF EXISTS BookShop;
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
);

/*
Restricción de integridad de dominio
Esta restricción asegura que todos los valores almacenados en una columna caigan dentro de un dominio definido. Esto incluye reglas sobre:
- Tipo de dato
- Formato
- Valores permitidos
- Nullabilidad
*/

DROP TABLE IF EXISTS BookShop;
CREATE TABLE BookShop (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    PRICE DECIMAL(5, 2) CHECK (PRICE >= 0),
    PUBLISHED_DATE DATE
);