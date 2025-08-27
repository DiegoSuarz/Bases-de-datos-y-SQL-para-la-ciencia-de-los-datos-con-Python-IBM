/*markdown
# Laboratorio Práctico: CREAR, ALTERAR, TRUNCAR, ELIMINAR

En este laboratorio, aprenderás cómo crear tablas y cargar datos utilizando la interfaz gráfica de usuario (GUI) de phpMyAdmin en el servicio de base de datos MySQL.

## Objetivos
Después de completar este laboratorio, podrás usar phpMyAdmin con MySQL para:

- Crear una base de datos.
- Crear una nueva tabla en una base de datos.
- Agregar, eliminar o modificar columnas en una tabla existente.
- Eliminar todas las filas de una tabla existente sin eliminar la tabla en sí.
- Eliminar una tabla existente en una base de datos.

## Tarea 1: Crear una base de datos
1. Sigue los pasos a continuación para crear una nueva base de datos en la interfaz gráfica de phpMyAdmin de MySQL.

![alt text](image.png)

2. En la vista de árbol, haz clic en <code>Nuevo</code> para crear una nueva base de datos vacía. Luego, ingresa <code>Mysql_Learners</code> como el nombre de la base de datos, deja la codificación predeterminada <code>utf8</code> y haz clic en <code>Crear</code>.

UTF-8 es la codificación de caracteres más comúnmente utilizada para contenido o datos.

![alt text](image-1.png)

## Tarea 2a : Sentencia CREATE
Ahora, utilizarás la sentencia CREATE para crear dos nuevas tablas.
Sigue las instrucciones para completar esta tarea.

Necesitas crear dos tablas, <code>PETSALE</code> y <code>PET</code>. Para crear las dos tablas, copia el código a continuación y pégalo en el área de texto de la pestaña <code>SQL</code>. Haz clic en <code>Go</code>.

```sql
CREATE TABLE PETSALE (
        ID INTEGER NOT NULL,
        PET CHAR(20),
        SALEPRICE DECIMAL(6,2),
        PROFIT DECIMAL(6,2),
        SALEDATE DATE
        );
CREATE TABLE PET (
        ID INTEGER NOT NULL,
        ANIMAL VARCHAR(20),
        QUANTITY INTEGER
        );
```

![alt text](image-2.png)

Verifica que las dos tablas ahora estén disponibles en la estructura de árbol a la izquierda, como se muestra en la imagen a continuación.

![alt text](image-3.png)

## Tarea 2b: Instrucción INSERT
Ahora, inserta algunos registros en las dos tablas recién creadas. También puedes agregar instrucciones SELECT para imprimir el contenido de las tablas una vez que estén cargadas con datos.

Copia el código a continuación y pégalo en el área de texto de la pestaña <code>SQL</code>. Luego, haz clic en <code>Go</code>.

```sql
INSERT INTO PETSALE VALUES
        (1,'Cat',450.09,100.47,'2018-05-29'),
        (2,'Dog',666.66,150.76,'2018-06-01'),
        (3,'Parrot',50.00,8.9,'2018-06-04'),
        (4,'Hamster',60.60,12,'2018-06-11'),
        (5,'Goldfish',48.48,3.5,'2018-06-14');
        
INSERT INTO PET VALUES
        (1,'Cat',3),
        (2,'Dog',4),
        (3,'Hamster',2);
SELECT * FROM PETSALE;
SELECT * FROM PET;
```
![alt text](image-4.png)

## Tarea 3: Sentencia ALTER
En este ejercicio, utilizarás la sentencia ALTER para agregar, eliminar o modificar columnas en las tablas existentes.

### 1. Agregar una columna
Agrega una nueva columna llamada <code>QUANTITY</code> a la tabla <code>PETSALE</code> y muestra la tabla alterada.
Para esto, copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en Go.

```sql
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;
SELECT * FROM PETSALE;
```

![alt text](image-5.png)

Ahora actualiza la nueva columna QUANTITY de la tabla PETSALE con algunos valores y muestra todos los registros de la tabla. Copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en Go.

```sql
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;
SELECT * FROM PETSALE;
```

![alt text](image-6.png)

2. Eliminando una columna
Elimina la columna PROFIT de la tabla PETSALE y muestra la tabla alterada. Copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en Go.

```sql
ALTER TABLE PETSALE
DROP COLUMN PROFIT;
SELECT * FROM PETSALE;
```

![alt text](image-7.png)

3. Modificar una columna
Cambia el tipo de dato a <code>VARCHAR(20)</code> de la columna <code>PET</code> de la tabla <code>PETSALE</code> y muestra la tabla alterada. Copia el código a continuación y pégalo en el área de texto de la página <code>SQL</code>. Haz clic en <code>Go</code>.

```sql
ALTER TABLE PETSALE
MODIFY PET VARCHAR(20);
SELECT * FROM PETSALE;
```

Puedes hacer clic en el nombre de la tabla <code>PETSALE</code> en la estructura de árbol a la izquierda y luego hacer clic en la pestaña <code>Estructura</code> en la interfaz. Luego podrás ver que la estructura de la tabla muestra el tipo de dato de la columna modificado, como se muestra en la imagen a continuación.

![alt text](image-8.png)

4. Renombrar una Columna
Renombra la columna <code>PET</code> a <code>ANIMAL</code> de la tabla <code>PETSALE</code> y muestra la tabla alterada. Copia el código a continuación y pégalo en el área de texto de la página <code>SQL</code>. Haz clic en <code>Ir</code>.

```sql
ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20);
SELECT * FROM PETSALE;
```

![alt text](image-9.png)

## Tarea 4: Instrucción TRUNCATE
En este ejercicio, utilizarás la instrucción TRUNCATE para eliminar todas las filas de una tabla existente sin borrarla.

Eliminemos todas las filas de la tabla <code>PET</code> y mostremos la tabla vacía. Copia el código a continuación y pégalo en el área de texto de la página <code>SQL</code>. Haz clic en <code>Go</code>.

```sql
TRUNCATE TABLE PET ;
SELECT * FROM PET;
```

![alt text](image-10.png)

## Tarea 5: Instrucción DROP
Finalmente, usarás la instrucción DROP para eliminar una tabla existente. Vamos a eliminar la tabla <code>PET</code> y verificar si la tabla todavía existe o no (la instrucción SELECT debería dar un error si una tabla no existe). Copia el código a continuación y pégalo en el área de texto de la página <code>SQL</code>. Haz clic en <code>Go</code>.

```sql
DROP TABLE PET;
SELECT * FROM PET;
```

![alt text](image-11.png)

## Problemas de práctica
Intenta resolver los siguientes problemas para una práctica mejorada de los conceptos aprendidos en este laboratorio.

1. Crea una nueva tabla en la base de datos llamada <code>Toys</code> con los atributos ID (entero), Variedad (cadena de longitud variable) y Cantidad (entero). Asegúrate de que el ID no sea Nulo.

<details><summary> Haz clic aquí para ver la solución</summary>
```sql
CREATE TABLE Toys (
        ID INTEGER NOT NULL,
        Variety VARCHAR(20),
        Quantity INTEGER
        );
```
</details>

2. Agrega las entradas mencionadas a la tabla utilizando la instrucción INSERT.

ID |	Variedad	     | Cantidad     |
---|-------------------------|--------------|
1  |Juguete masticable	     |   20         |
2  |Pelotas	50           |   50         |       
3  |Tazones	             |   30         |
4  |Cama plegable	     |   40         |    

<details><summary>Haz clic aquí para ver la solución </summary>
```sql
INSERT INTO Toys VALUES
        (1, 'Chew toy', 20),
        (2, 'Balls', 50),
        (3, 'Bowls', 30),
        (4, 'Foldable bed', 40);
```
</details>

3. ALTERA la longitud de ‘Variety’ en la tabla a 30 caracteres.

<details><summary>Haz clic aquí para ver la solución </summary>
```sql
ALTER TABLE Toys
MODIFY Variety VARCHAR(30);
```
</details>

4. TRUNCAR la tabla 'Toys'

<details><summary>Haz clic aquí para ver la solución </summary>
```sql
TRUNCATE TABLE Toys;
```
</details>

5. ELIMINAR la tabla ‘Toys’

<details><summary>Haz clic aquí para ver la solución </summary>
```sql
DROP TABLE Toys;
```
</details>

## Conclusión
Felicidades por haber completado con éxito este laboratorio.

Para este momento, has aprendido a:

- Crear una base de datos en la interfaz gráfica de phpMyAdmin en MySQL.

- Usar la instrucción CREATE para crear nuevas tablas en la base de datos.

- Usar la instrucción INSERT para agregar registros a las tablas.

- Usar la instrucción ALTER para agregar, eliminar, renombrar o modificar las columnas de una tabla existente.

- Usar la instrucción TRUNCATE para eliminar el contenido de una tabla existente (pero no la tabla).

- Usar la instrucción DROP para eliminar una tabla completa.

*/

/*
Necesitas crear dos tablas, PETSALE y PET. Para crear las dos tablas, copia el código a continuación
 y pégalo en el área de texto de la pestaña SQL. Haz clic en Go.
*/
USE prueba;

CREATE TABLE PETSALE
(
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
);

CREATE TABLE PET
(
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
);


/*
Ahora, inserta algunos registros en las dos tablas recién creadas. También puedes agregar instrucciones SELECT 
para imprimir el contenido de las tablas una vez que estén cargadas con datos.
*/

INSERT INTO PETSALE
VALUES  (1, 'cat',450.09, 100.47, '2018-05-29'),
        (2, 'Dog',666.66, 150.76, '2018-06-01'),
        (3, 'Parrot',50.00, 8.9, '2018-06-04'),
        (4, 'Hamster', 60.60, 12, '2018-06-11'),
        (5, 'Goldfish', 48.48, 3.5, '2018-06-14');

INSERT INTO PET
VALUES  (1, 'Cat',3),
        (2, 'Dog',4),
        (3, 'Hamster', 2);


SELECT * FROM PETSALE;
SELECT * FROM PET;

/*
Agrega una nueva columna llamada QUANTITY a la tabla PETSALE y muestra la tabla alterada.
*/

ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

SELECT * FROM PETSALE;

/*
Ahora actualiza la nueva columna QUANTITY de la tabla PETSALE con algunos valores y muestra todos los registros de la tabla.
*/

UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

SELECT * FROM PETSALE;

/*
Elimina la columna PROFIT de la tabla PETSALE y muestra la tabla alterada
*/

ALTER TABLE PETSALE
DROP COLUMN PROFIT;

SELECT * FROM PETSALE;

/*
Cambia el tipo de dato a VARCHAR(20) de la columna PET de la tabla PETSALE y muestra la tabla alterada.
*/
ALTER TABLE PETSALE
MODIFY PET VARCHAR(20);

SELECT * FROM PETSALE;

/*
Renombra la columna PET a ANIMAL de la tabla PETSALE y muestra la tabla alterada
*/

ALTER TABLE PETSALE
CHANGE PET ANIMAL VARCHAR(20);

SELECT * FROM PETSALE;

/*
Eliminemos todas las filas de la tabla PET y mostremos la tabla vacía.
*/
TRUNCATE TABLE PET;

SELECT * FROM PET;

/*
Vamos a eliminar la tabla PET y verificar si la tabla todavía existe o no
*/
DROP TABLE PET;

SELECT * FROM PET;

/*PROBLEMAS DE PRACTICA
1. Crea una nueva tabla en la base de datos llamada Toys con los atributos ID (entero), Variety (cadena de longitud variable) 
y Quantity  (entero). Asegúrate de que el ID no sea Nulo.
*/
USE prueba;

DROP TABLE IF EXISTS Toys;
CREATE TABLE Toys
(
    ID INTEGER NOT NULL,
    Variety VARCHAR(20),
    Quantity INTEGER
)

SELECT * FROM Toys;

/*
Agrega las entradas mencionadas a la tabla utilizando la instrucción INSERT.
ID  Variety                 Quantity 
1   Juguete masticable      20
2   Pelotas                 50
3   Tazones                 30
4   Cama plegable           40
*/

INSERT INTO Toys(ID, Variety, Quantity)
VALUES 
    (1, 'Juguete masticable',20),
    (2, 'Pelotas',50),
    (3, 'Tazones',30),
    (4, 'Cama Pleagable',40);

SELECT * FROM Toys;

/*
ALTERA la longitud de ‘Variety’ en la tabla a 30 caracteres.
*/

ALTER TABLE Toys
MODIFY Variety VARCHAR(30); 

/*
TRUNCAR la tabla 'Toys'
*/
TRUNCATE TABLE Toys;

SELECT * FROM Toys;

/*
ELIMINAR la tabla ‘Toys’
*/
DROP TABLE Toys;

SELECT * FROM Toys;