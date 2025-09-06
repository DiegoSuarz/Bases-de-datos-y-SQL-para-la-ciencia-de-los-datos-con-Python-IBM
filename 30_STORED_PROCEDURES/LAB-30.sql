/*markdown
## Laboratorio Práctico: Procedimientos Almacenados

Los procedimientos almacenados en SQL son un tipo de objeto de base de datos que te permiten encapsular una serie de declaraciones SQL en una sola rutina. Se almacenan en el diccionario de datos de la base de datos y pueden ser invocados desde un programa de aplicación o desde la interfaz de comandos de la base de datos. Los procedimientos almacenados pueden aceptar parámetros de entrada y devolver múltiples valores de parámetros de salida. También pueden incluir construcciones de control de flujo como bucles y declaraciones condicionales. Los procedimientos almacenados ofrecen varios beneficios, incluyendo un rendimiento mejorado, mayor productividad, facilidad de uso y escalabilidad aumentada. También proporcionan un mecanismo para hacer cumplir las reglas de negocio y la integridad de los datos en el sistema de base de datos.

## Objetivos
Después de completar este laboratorio, podrás:

Crear procedimientos almacenados
Ejecutar procedimientos almacenados

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás MySQL. MySQL es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.


Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de Datos Utilizada en este Laboratorio
Se ha utilizado la base de datos Mysql_learners en este laboratorio.

## Datos Utilizados en este Laboratorio
Los datos utilizados en este laboratorio son datos internos. Estarás trabajando en la tabla **PETSALE**.

![alt text](image.png)

Este laboratorio requiere que la tabla PETSALE esté poblada con datos de muestra en la interfaz de phpMyAdmin de MySQL. Es posible que hayas creado y poblado una tabla PETSALE en un laboratorio anterior.

Para este laboratorio, necesitas crear una base de datos ``PETS`` en la interfaz de phpMyAdmin. Descarga el script ``PETSALE-CREATE-v2.sql`` a continuación, súbelo a la consola bajo la base de datos ``PETS``. Al ejecutarlo, el script creará una nueva tabla PETSALE eliminando cualquier tabla PETSALE anterior si existe, y la poblará con los datos de muestra requeridos.

- [PETSALE-CREATE-v2.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/PETSALE-CREATE-v2.sql)


## Procedimiento Almacenado: Ejercicio 1
En este ejercicio, crearás y ejecutarás un procedimiento almacenado para leer datos de una tabla en mysql phpadmin usando SQL.

1. Crearás una rutina de procedimiento almacenado llamada **RETRIEVE_ALL**.
Esta rutina **RETRIEVE_ALL** contendrá una consulta SQL para recuperar todos los registros de la tabla PETSALE, por lo que no necesitas escribir la misma consulta una y otra vez. Solo llamas a la rutina del procedimiento almacenado para ejecutar la consulta cada vez.
Para crear la rutina del procedimiento almacenado, copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en Go.

```sql
DELIMITER //
CREATE PROCEDURE RETRIEVE_ALL()
BEGIN
   SELECT *  FROM PETSALE;
END //
DELIMITER ;
```

![alt text](image-1.png)

2. Para llamar a la rutina RETRIEVE_ALL, abre otra pestaña de **SQL** haciendo clic en **Abrir en nueva pestaña**.

![alt text](image-2.png)

Elimina la línea predeterminada que aparece para que obtengas una ventana en blanco.

Copia el código a continuación y pégalo en el área de texto de la página de **SQL**. Haz clic en **Ir**.

```sql
CALL RETRIEVE_ALL;
```

![alt text](image-3.png)

3. Puedes ver la rutina de procedimiento almacenado RETRIEVE_ALL creada. En el panel izquierdo, expande la opción de base de datos **PETS** y haz clic en **Procedures** para ver el procedimiento.

![alt text](image-4.png)

4. Si deseas eliminar la rutina de procedimiento almacenado RETRIEVE_ALL, copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en Go.

```sql
DROP PROCEDURE RETRIEVE_ALL;
CALL RETRIEVE_ALL;
```

![alt text](image-5.png)

## Procedimiento Almacenado: Ejercicio 2
En este ejercicio, crearás y ejecutarás un procedimiento almacenado para escribir/modificar datos en una tabla en MySQL usando SQL.

Crearás una rutina de procedimiento almacenado llamada **UPDATE_SALEPRICE** con los parámetros **Animal_ID** y **Animal_Health**.

- Esta rutina **UPDATE_SALEPRICE** contendrá consultas SQL para actualizar el precio de venta de los animales en la tabla PETSALE dependiendo de sus condiciones de salud, **MALA** o **PEOR**.

- Esta rutina de procedimiento tomará el ID del animal y la condición de salud como parámetros que se usarán para actualizar el precio de venta del animal en la tabla PETSALE por un monto dependiendo de su condición de salud. Supongamos que:

    - Para un animal con ID XX que tenga una condición de salud MALA, el precio de venta se reducirá en un 25%.
    - Para un animal con ID YY que tenga una condición de salud PEOR, el precio de venta se reducirá en un 50%.
    - Para un animal con ID ZZ que tenga otra condición de salud, el precio de venta no cambiará.

- Para crear la rutina de procedimiento almacenado, copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en **Go**.

```sql
DELIMITER @
CREATE PROCEDURE UPDATE_SALEPRICE (IN Animal_ID INTEGER, IN Animal_Health VARCHAR(5))
BEGIN
    IF Animal_Health = 'BAD' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;
    END IF;
END @
DELIMITER ;
```

![alt text](image-6.png)

1. Llamemos a la rutina UPDATE_SALEPRICE. Queremos actualizar el precio de venta del animal con ID 1 que tiene una condición de salud MALA en la tabla PETSALE. abre otra pestaña de SQL haciendo clic en Abrir en nueva pestaña.

![alt text](image-7.png)

Elimina la línea predeterminada que aparece para que obtengas una ventana en blanco.

Copia el código a continuación y pégalo en el área de texto de la página de **SQL**. Haz clic en **Ejecutar**.

> Nota: si has eliminado el procedimiento RETREIVE_ALL, vuelve a ejecutar el script de creación de ese procedimiento antes de ejecutar estas líneas.

```sql
   CALL RETRIEVE_ALL;
   CALL UPDATE_SALEPRICE(1, 'BAD');
   CALL RETRIEVE_ALL;
```

![alt text](image-8.png)

2. Llamemos a la rutina UPDATE_SALEPRICE una vez más. Queremos actualizar el precio de venta del animal con ID 3 que tiene una condición de salud PEOR en la tabla PETSALE. copia el código a continuación y pégalo en el área de texto de la página de SQL. Haz clic en Ejecutar. Tendrás todos los registros recuperados de la tabla PETSALE.

```sql
   CALL RETRIEVE_ALL;
   CALL UPDATE_SALEPRICE(3, 'WORSE');
   CALL RETRIEVE_ALL;
```

![alt text](image-9.png)

3. Puedes ver la rutina de procedimiento almacenado creada UPDATE_SALEPRICE. Haz clic en **Rutinas** y visualiza el procedimiento.

![alt text](image-10.png)

4. Si deseas eliminar la rutina de procedimiento almacenado UPDATE_SALEPRICE, copia el código a continuación y pégalo en el área de texto de la página de SQL. Haz clic en Ejecutar.

```sql
DROP PROCEDURE UPDATE_SALEPRICE;
CALL UPDATE_SALEPRICE;
```

![alt text](image-11.png)

## Conclusión
¡Felicidades! Has completado este laboratorio sobre la creación de procedimientos almacenados en MySQL.

Ahora eres capaz de:

- Escribir un procedimiento almacenado según los requisitos
- Llamar o ejecutar un procedimiento almacenado
- Eliminar un procedimiento almacenado una vez que su utilidad ha terminado



*/

SHOW DATABASES;

DROP DATABASE IF EXISTS PETS;

-- Crear la base de datos
CREATE DATABASE PETS

USE PETS;
SHOW TABLES;

/*CREATE DATABASE PETS*/

DROP TABLE IF EXISTS PETSALE;

CREATE TABLE PETSALE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE,
	QUANTITY INTEGER,
	PRIMARY KEY (ID)
	);

INSERT INTO PETSALE VALUES
(1,'Cat',450.09,'2018-05-29',9),
(2,'Dog',666.66,'2018-06-01',3),
(3,'Parrot',50.00,'2018-06-04',2),
(4,'Hamster',60.60,'2018-06-11',6),
(5,'Goldfish',48.48,'2018-06-14',24);

SELECT * FROM PETSALE;

/*
1. Crearás una rutina de procedimiento almacenado llamada RETRIEVE_ALL.
Esta rutina RETRIEVE_ALL contendrá una consulta SQL para recuperar todos los registros de la tabla PETSALE, 
por lo que no necesitas escribir la misma consulta una y otra vez. Solo llamas a la rutina del procedimiento
almacenado para ejecutar la consulta cada vez.
*/


CREATE PROCEDURE RETRIEVE_ALL()

BEGIN
    SELECT * FROM PETSALE;
END 

/*
Llama a la rutina RETRIEVE_ALL
*/

CALL RETRIEVE_ALL;

/*
Eliminar la rutina de procedimiento almacenado RETRIEVE_ALL
*/

DROP PROCEDURE RETRIEVE_ALL;

CALL RETRIEVE_ALL;

/*
En este ejercicio, crearás y ejecutarás un procedimiento almacenado para escribir/modificar datos en una tabla en MySQL usando SQL.
Crearás una rutina de procedimiento almacenado llamada UPDATE_SALEPRICE con los parámetros Animal_ID y Animal_Health.
Esta rutina UPDATE_SALEPRICE contendrá consultas SQL para actualizar el precio de venta de los animales en la tabla PETSALE 
dependiendo de sus condiciones de salud, MALA o PEOR.

Esta rutina de procedimiento tomará el ID del animal y la condición de salud como parámetros que se usarán para actualizar el
 precio de venta del animal en la tabla PETSALE por un monto dependiendo de su condición de salud. Supongamos que:

Para un animal con ID XX que tenga una condición de salud MALA, el precio de venta se reducirá en un 25%.
Para un animal con ID YY que tenga una condición de salud PEOR, el precio de venta se reducirá en un 50%.
Para un animal con ID ZZ que tenga otra condición de salud, el precio de venta no cambiará.
*/

CREATE PROCEDURE UPDATE_SALEPRICE (IN Animal_ID INTEGER, Animal_Health VARCHAR(5))
BEGIN
    IF Animal_Health = 'BAD' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;
    END IF;
END 



CALL RETRIEVE_ALL;

CALL UPDATE_SALEPRICE(3, 'WORSE');

CALL RETRIEVE_ALL;

CALL RETRIEVE_ALL;
CALL UPDATE_SALEPRICE(1,'BAD');
CALL RETRIEVE_ALL;

/*
Eliminar el procedimiento almacenado
*/

DROP PROCEDURE UPDATE_SALEPRICE;

CALL UPDATE_SALEPRICE;