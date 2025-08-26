/*markdown
# Laboratorio práctico : INSERTAR, ACTUALIZAR, ELIMINAR

En este laboratorio, aprenderás algunas declaraciones DML (Lenguaje de Manipulación de Datos) comúnmente usadas en SQL, además de SELECT. Primero, aprenderás la declaración INSERT, que se utiliza para insertar nuevas filas en una tabla. A continuación, aprenderás la declaración UPDATE, que se usa para actualizar los datos en filas existentes de la tabla. Finalmente, aprenderás la declaración DELETE, que se utiliza para eliminar filas de una tabla.

## Objetivos
Después de completar este laboratorio, podrás:

- Insertar nuevas filas en una tabla
- Actualizar datos en filas existentes de la tabla
- Eliminar filas de una tabla

## Conceptos cubiertos
¿Cómo se ve la sintaxis de una declaración INSERT?

```sql
INSERT INTO table_name (column1, column2, ... )
VALUES (value1, value2, ... )
```

¿Cómo se ve la sintaxis de una declaración UPDATE?

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```
¿Cómo se ve la sintaxis de una declaración DELETE?

```sql
DELETE FROM table_name
WHERE condition
```

## Explorando la Base de Datos
Primero exploremos la base de datos de Instructores utilizando la herramienta Datasette:

1. Si la primera declaración que se muestra a continuación no está ya en el cuadro de texto de Datasette a la derecha, copie el código a continuación haciendo clic en el pequeño botón de copiar en la esquina inferior derecha del bloque de código a continuación y luego pégalo en el cuadro de texto de la herramienta Datasette usando Ctrl+V o haciendo clic derecho en el cuadro de texto y eligiendo Pegar.

```sql
SELECT * FROM Instructor;
```

![alt text](image.png)

2. Haga clic en Enviar Consulta.

3. Ahora puede desplazarse hacia abajo en la tabla y explorar todas las columnas y filas de la tabla Instructor para obtener una idea general del contenido de la tabla.

![alt text](image-1.png)

4. Estas son las descripciones de los atributos de columna de la tabla Instructor:

    ins_id:     número de identificación único de los instructores,    
    lastname:   apellido de los instructores,
    firstname:  nombre de los instructores,
    city:       nombre de las ciudades donde se encuentran los instructores,
    country:    código de país de dos letras de los países donde se encuentran los instructores

# Ejercicio 1: INSERT
En este ejercicio, primero pasarás por algunos ejemplos de uso de INSERT en consultas y luego resolverás algunos problemas de ejercicio utilizándolo.

# Tarea A
## Ejercicios de ejemplo sobre INSERTAR
Veamos algunos ejemplos de consultas relacionadas con INSERTAR:

1. En este ejemplo, supongamos que queremos insertar una nueva fila en la tabla Instructor.

Problema:

> Insertar un nuevo registro de instructor con id 4 para Sandip Saha que vive en Edmonton, CA en la tabla “Instructor”.

Solución:

```sql
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(4, 'Saha', 'Sandip', 'Edmonton', 'CA');
```

```sql
SELECT * FROM Instructor;
```

Tu conjunto de resultados debería verse como la imagen a continuación:

![alt text](image-2.png)

2. En este ejemplo, supongamos que queremos insertar varias filas nuevas en la tabla Instructor.

Problema:

> Insertar dos nuevos registros de instructor en la tabla “Instructor”. Primer registro con id 5 para John Doe que vive en Sydney, AU. Segundo registro con id 6 para Jane Doe que vive en Dhaka, BD.

Solución:

```sql
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(5, 'Doe', 'John', 'Sydney', 'AU'), (6, 'Doe', 'Jane', 'Dhaka', 'BD');
```

```sql
SELECT * FROM Instructor;
```

Tu conjunto de resultados debería verse como la imagen a continuación:

![alt text](image-3.png)

# Tarea B
## Ejercicios prácticos sobre INSERTAR

Ahora, practiquemos creando y ejecutando algunas consultas relacionadas con INSERTAR.

1. Problema:

> Inserta un nuevo registro de instructor con id 7 para Antonio Cangiano que vive en Vancouver, CA en la tabla “Instructor”.

<details><summary>Pista </summary>
    Sigue el ejemplo 1 del ejercicio de INSERTAR.
    ```sql
    INSERT INTO table_name([columnn1],[column2], [column3], [column4], [column5])
    VALUES(7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');
    SELECT * FROM tablename;
    ```
</details>

<details><summary>Solución </summary>
```sql
    INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
    VALUES(7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');
    SELECT * FROM Instructor;
```
</details>

<details><summary>Salida </summary>
    ![alt text](image-4.png)
</details>


2. Problema:

> Inserta dos nuevos registros de instructor en la tabla “Instructor”. Primer registro con id 8 para Steve Ryan que vive en Barlby, GB. Segundo registro con id 9 para Ramesh Sannareddy que vive en Hyderabad, IN.

<details><summary>Pista </summary>
    > Sigue el ejemplo 2 del ejercicio de INSERTAR.
    ```sql
    INSERT INTO table_name([columnn1],[column2], [column3], [column4], [column5])
    VALUES(8, 'Ryan', 'Steve', 'Barlby', 'GB'), (9, 'Sannareddy', 'Ramesh', 'Hyderabad', 'IN');
    SELECT * FROM tablename;
```
</details>

<details><summary>Solución </summary>
    ```sql
    INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
    VALUES(8, 'Ryan', 'Steve', 'Barlby', 'GB'), (9, 'Sannareddy', 'Ramesh', 'Hyderabad', 'IN');
    SELECT * FROM Instructor;
    ```
</details>

<details><summary>Salida </summary>
    ![alt text](image-5.png)
</details>


# Ejercicio 2: ACTUALIZAR
En este ejercicio, primero revisarás algunos ejemplos de uso de ACTUALIZAR en consultas y luego resolverás algunos problemas de ejercicio utilizándolo.


# Tarea A
## Ejercicios de ejemplo sobre UPDATE
Vayamos a través de algunos ejemplos de consultas relacionadas con UPDATE:

1. En este ejemplo, queremos actualizar una columna de una fila existente de la tabla.

Problema:

> Actualizar la ciudad de Sandip a Toronto.

Solución:

```sql
UPDATE Instructor 
SET city='Toronto' 
WHERE firstname="Sandip";
```

Copia el código de solución anterior haciendo clic en el pequeño botón de copiar en la esquina inferior derecha del bloque de código a continuación y pégalo en el cuadro de texto de la herramienta Datasette. Luego haz clic en Enviar consulta.

Copia el código a continuación haciendo clic en el pequeño botón de copiar en la esquina inferior derecha del bloque de código a continuación y pégalo en el cuadro de texto de la herramienta Datasette. Luego haz clic en Enviar consulta.

```sql
SELECT * FROM Instructor;
```
Tu conjunto de resultados de salida debería verse como la imagen a continuación:

![alt text](image-6.png)

2. En este ejemplo, queremos actualizar múltiples columnas de una fila existente de la tabla.

Problema:

> Actualizar la ciudad y el país de Doe con id 5 a Dubái y AE respectivamente.

Solución:

```sql
UPDATE Instructor 
SET city='Dubai', country='AE' 
WHERE ins_id=5;
```

```sql
SELECT * FROM Instructor;
```

Tu conjunto de resultados de salida debería verse como la imagen a continuación:

![alt text](image-7.png)

Tarea B
Ejercicios prácticos sobre UPDATE
Ahora, practiquemos creando y ejecutando algunas consultas relacionadas con UPDATE.

1. Problema:

> Actualiza la ciudad del registro del instructor a Markham cuyo id es 1.

<details><summary>Pista </summary>
    > Sigue el ejemplo 1 del ejercicio UPDATE.
    ```sql
    UPDATE table_name 
    SET [column1]='Markham' 
    WHERE [specifiedcolumn]=1;
    SELECT * FROM tablename;
```
</details>

<details><summary>Solución </summary>
    ```sql
    UPDATE Instructor 
    SET city='Markham' 
    WHERE ins_id=1;

    SELECT * FROM Instructor;
    ```
</details>

<details><summary>Salida </summary>
    ![alt text](image-8.png)
</details>

2. Problema:
> Actualiza la ciudad y el país de Sandip con id 4 a Dhaka y BD respectivamente.

<details><summary>Pista </summary>
    > Sigue el ejemplo 2 del ejercicio UPDATE.
    ```sql
    UPDATE table_name 
    SET [column1]='Dhaka', [column2]='BD' 
    WHERE [specifiedcolumn]=4;
    SELECT * FROM tablename;
```
</details>

<details><summary>Solución </summary>
    ```sql
    UPDATE Instructor 
    SET city='Dhaka', country='BD' 
    WHERE ins_id=4;

    SELECT * FROM Instructor;
    ```
</details>

<details><summary>Salida </summary>
    ![alt text](image-9.png)
</details>

# Ejercicio 3: ELIMINAR
En este ejercicio, primero pasarás por un ejemplo de uso de DELETE en una consulta y luego resolverás un problema de ejercicio utilizándolo.

## Tarea A
Ejercicio de ejemplo sobre DELETE
Pasemos por un ejemplo de una consulta relacionada con DELETE:

1. En este ejemplo, queremos eliminar una fila de la tabla.

Problema:

> Eliminar el registro del instructor Doe cuyo id es 6.

Solución:

```sql
DELETE FROM instructor
WHERE ins_id = 6;
```

```sql
SELECT * FROM Instructor;
```

Su conjunto de resultados de salida debería verse como la imagen a continuación:

![alt text](image-10.png)

## Ejercicio B
## Ejercicio práctico sobre DELETE
Ahora, practiquemos la creación y ejecución de una consulta relacionada con DELETE.

1. Problema:
> Elimina el registro del instructor Hima.

<details><summary>Pista </summary>
    > Sigue el ejemplo 1 del ejercicio DELETE.
    ```sql
    DELETE FROM tablename
    WHERE [columnanme1] = 'Hima';
    SELECT * FROM tablename;
```
</details>

<details><summary>Solución </summary>
    ```sql
    DELETE FROM instructor
    WHERE firstname = 'Hima';

    SELECT * FROM Instructor;
    ```
</details>

<details><summary>Salida </summary>
    ![alt text](image-11.png)
</details>

Gracias por completar el Laboratorio Práctico: INSERTAR, ACTUALIZAR, ELIMINAR! donde aprendiste a realizar operaciones en tablas como insertar y eliminar filas, y actualizar los datos en filas existentes.
*/

use prueba;
SELECT * FROM bookshop_authordetails;

-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS Instructor


DELETE FROM Instructor;
select * from Instructor;

use Instructor;

DROP TABLE IF EXISTS Instructor;
CREATE TABLE Instructor(
    ins_id INT,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50));

use Instructor;

INSERT INTO Instructor (ins_id, lastname, firstname,city,country)
VALUES
    (1, 'Ahuja', 'Rav','Toronto','CA'),
    (2, 'Chong', 'Raul','Toronto','CA'),
    (3, 'Vasudevan', 'Hima','Chicago','US');


use Instructor;
SELECT * 
FROM Instructor;

/*
Tarea A
Ejercicios de ejemplo sobre INSERTAR
Insertar un nuevo registro de instructor con id 4 para Sandip Saha que vive en Edmonton, CA en la tabla “Instructor”.
*/

INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(4,'Saha','Sandip', 'Edmonton', 'CA');

SELECT *
FROM Instructor

/*
Tarea A
Ejercicios de ejemplo sobre INSERTAR
Insertar dos nuevos registros de instructor en la tabla “Instructor”.
Primer registro con id 5 para John Doe que vive en Sydney, AU. 
Segundo registro con id 6 para Jane Doe que vive en Dhaka, BD.
*/

INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES
    (5, 'Doe','John', 'Sydney','AU'),
    (6, 'Doe','Jane', 'Dhaka', 'BD');

SELECT *
FROM Instructor;

/*
Tarea B
Ejercicios prácticos sobre INSERTAR
Inserta un nuevo registro de instructor con id 7 para Antonio Cangiano que vive en Vancouver, CA en la tabla “Instructor”.
*/
INSERT INTO Instructor
VALUES (7, 'Cangiano','Antonio','Vancouver','CA');

SELECT *
FROM Instructor;

/*
Inserta dos nuevos registros de instructor en la tabla “Instructor”. 
Primer registro con id 8 para Steve Ryan que vive en Barlby, GB. S
egundo registro con id 9 para Ramesh Sannareddy que vive en Hyderabad, IN.
*/

INSERT INTO Instructor
VALUES
(8,'Ryan','Steve','Barlby','GB'),
(9,'Sannareddy','Ramesh','Hyderabad','IN');

SELECT *
FROM Instructor;

/*
Tarea A
Ejercicios de ejemplo sobre UPDATE
Actualizar la ciudad de Sandip a Toronto.
*/
UPDATE Instructor
SET city = 'Toronto'
WHERE firstname = 'Sandip';

SELECT *
FROM Instructor

/*
Actualizar la ciudad y el país de Doe con id 5 a Dubái y AE respectivamente.
*/
UPDATE Instructor
SET city = 'Dubai', country = 'AE'
WHERE ins_id = 5;

SELECT *
FROM Instructor

/*
Actualiza la ciudad del registro del instructor a Markham cuyo id es 1.
*/
UPDATE instructor
SET city = 'Markham'
WHERE ins_id = 1;

SELECT *
FROM Instructor;

/*
Actualiza la ciudad y el país de Sandip con id 4 a Dhaka y BD respectivamente.
*/
UPDATE Instructor
SET city = "Dhaka", country = "BD"
WHERE ins_id = 4;


SELECT *
FROM Instructor;

/*
Tarea A
Ejercicio de ejemplo sobre DELETE
Eliminar el registro del instructor Doe cuyo id es 6.
*/

DELETE FROM instructor
WHERE ins_id = 6;

SELECT *
FROM Instructor

/*
Elimina el registro del instructor Hima.
*/

DELETE FROM Instructor
WHERE firstname = 'Hima';

SELECT *
FROM Instructor;

