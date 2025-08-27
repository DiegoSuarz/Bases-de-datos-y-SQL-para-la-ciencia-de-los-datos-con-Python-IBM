/*markdown

# Laboratorio: CREAR, ALTERAR, TRUNCAR, ELIMINAR Tablas

En este laboratorio, aprenderás algunos enunciados DDL (Lenguaje de Definición de Datos) comúnmente utilizados en SQL. Primero aprenderás el enunciado CREATE, que se utiliza para crear una nueva tabla en una base de datos. A continuación, aprenderás el enunciado ALTER, que se utiliza para agregar, eliminar o modificar columnas en una tabla existente. Luego, aprenderás el enunciado TRUNCATE, que se utiliza para eliminar todas las filas de una tabla existente sin eliminar la tabla en sí. Por último, aprenderás el enunciado DROP, que se utiliza para eliminar una tabla existente en una base de datos.

**¿Cómo se ve la sintaxis de un enunciado CREATE?**

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
```

**¿Cómo se ve la sintaxis de una declaración ALTER?**

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type column_constraint;
ALTER TABLE table_name
DROP COLUMN column_name;
ALTER TABLE table_name
ALTER COLUMN column_name SET DATA TYPE data_type;
ALTER TABLE table_name
RENAME COLUMN current_column_name TO new_column_name;
```

**¿Cómo se ve la sintaxis de una declaración TRUNCATE?**

```sql
TRUNCATE TABLE table_name;
```

**¿Cómo se ve la sintaxis de una declaración DROP?**

```sql
DROP TABLE table_name;
```

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás IBM Db2 Database. Db2 es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) de IBM, diseñado para almacenar, analizar y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás un servicio de base de datos Db2 en IBM Cloud. Si no completaste esta tarea del laboratorio anteriormente en este módulo, aún no tendrás acceso a Db2 en IBM Cloud, y necesitarás seguir primero este laboratorio:

- Laboratorio práctico: Regístrate en IBM Cloud, crea una instancia de servicio Db2 y comienza con la consola de Db2

## Base de Datos Utilizada en este Laboratorio
Las bases de datos utilizadas en este laboratorio son bases de datos internas.

## Objetivos
Después de completar este laboratorio, podrás:

- Crear una nueva tabla en una base de datos
- Agregar, eliminar o modificar columnas en una tabla existente
- Eliminar todas las filas de una tabla existente sin eliminar la tabla en sí
- Eliminar una tabla existente en una base de datos

## Instrucciones
Cuando abordes los ejercicios en este laboratorio, sigue las instrucciones para ejecutar las consultas en Db2:

- Ve a la Lista de Recursos de IBM Cloud iniciando sesión donde puedes encontrar la instancia del servicio Db2 que creaste en un laboratorio anterior en la sección Servicios. Haz clic en el servicio Db2-xx. A continuación, abre la Consola de Db2 haciendo clic en el botón Abrir Consola. Haz clic en el ícono del menú de 3 barras en la esquina superior izquierda y ve a la página Ejecutar SQL. La herramienta Ejecutar SQL te permite ejecutar declaraciones SQL.

    -  Si es necesario, sigue el [Laboratorio práctico: Regístrate en IBM Cloud, Crea una instancia de servicio Db2 y Comienza con la consola de Db2](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/labs/Lab%20-%20Sign%20up%20for%20IBM%20Cloud%20-%20Create%20Db2%20service%20instance%20-%20Get%20started%20with%20the%20Db2%20console/instructional-labs.md.html)

## Ejercicio 1: CREAR
En este ejercicio, utilizarás la instrucción CREATE para crear dos nuevas tablas usando Db2.

1. Necesitas crear dos tablas, PETSALE y PET. Para crear las dos tablas PETSALE y PET, copia el código a continuación y pégalo en el cuadro de texto de la página Ejecutar SQL. Haz clic en Ejecutar todo. En la sección Historial debajo del cuadro del editor, podrás ver si la consulta se ha ejecutado correctamente o no.

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
![alt text](image.png)

2. Ahora inserta algunos registros en las dos tablas recién creadas y muestra todos los registros de las dos tablas. Copia el código a continuación y pégalo en el cuadro de texto de la página Ejecutar SQL. Haz clic en Ejecutar todo.

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
![alt text](image-1.png)

Puedes hacer clic en la consulta en la sección Historial para verificar su resultado:

![alt text](image-2.png)

## Ejercicio 2: ALTER
En este ejercicio, utilizarás la sentencia ALTER para agregar, eliminar o modificar columnas en dos de las tablas existentes creadas en el ejercicio 1.

## Tarea A: ALTER usando ADD COLUMN
Agrega una nueva columna CANTIDAD a la tabla PETSALE y muestra la tabla alterada. Copia el código a continuación y pégalo en el cuadro de texto de la página Ejecutar SQL. Haz clic en Ejecutar todo.

```sql
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;
SELECT * FROM PETSALE;
```

2. Ahora actualiza la nueva columna CANTIDAD de la tabla PETSALE con algunos valores y muestra todos los registros de la tabla. Copia el código a continuación y pégalo en el cuadro de texto de la página Ejecutar SQL. Haz clic en Ejecutar todo. Después de que la consulta se ejecute correctamente, haz clic en ella para verificar el conjunto de resultados.

```sql
UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;
SELECT * FROM PETSALE;
```

![alt text](image-3.png)

## Tarea B: ALTER usando DROP COLUMN
Elimina la columna PROFIT de la tabla PETSALE y muestra la tabla alterada. Copia el código a continuación y pégalo en el cuadro de texto de la página Run SQL. Haz clic en Run all.

```sql
ALTER TABLE PETSALE
DROP COLUMN PROFIT;
SELECT * FROM PETSALE;
```

## Tarea C: ALTER usando ALTER COLUMN
1. Cambia el tipo de dato a VARCHAR(20) de la columna PET de la tabla PETSALE y muestra la tabla alterada. Copia el código a continuación y pégalo en el cuadro de texto de la página Run SQL. Haz clic en Run all.

```sql
ALTER TABLE PETSALE
ALTER COLUMN PET SET DATA TYPE VARCHAR(20);
SELECT * FROM PETSALE;
```

![alt text](image-4.png)

2. Ahora verifica si el tipo de dato de la columna PET de la tabla PETSALE cambió a VARCHAR(20) o no. Haz clic en la sección de Datos en la barra de menú de la izquierda.

![alt text](image-5.png)

Luego haz clic en Tablas:

![alt text](image-6.png)

Encuentra tu esquema y elige la tabla PETSALE

![alt text](image-7.png)

Verás que el tipo de dato de la columna PET ha cambiado a VARCHAR(20)

![alt text](image-8.png)

## Tarea D: ALTER usando RENAME COLUMN
1. En la tabla PETSALE, renombra la columna PET a ANIMAL y muestra la tabla alterada. Copia el código a continuación y pégalo en el cuadro de texto de la página Run SQL. Haz clic en Run all.

```sql
ALTER TABLE PETSALE
RENAME COLUMN PET TO ANIMAL;
SELECT * FROM PETSALE;
```

En este ejercicio, usarás la sentencia TRUNCATE para eliminar todas las filas de una tabla existente creada en el ejercicio 1 sin eliminar la tabla en sí.

1. Elimina todas las filas de la tabla PET y muestra la tabla vacía. Copia el código a continuación y pégalo en el cuadro de texto de la página Run SQL. Haz clic en Run all. Verás sin datos en la sección de Resultados.

```sql
TRUNCATE TABLE PET IMMEDIATE;
SELECT * FROM PET;
```

![alt text](image-9.png)

En este ejercicio, usarás la sentencia DROP para eliminar una tabla existente creada en el ejercicio 1.

1. Elimina la tabla PET y verifica si la tabla todavía existe o no (la sentencia SELECT no funcionará si una tabla no existe). Copia el código a continuación y pégalo en el cuadro de texto de la página Run SQL. Haz clic en Run all. Verás que la sentencia select falla.

```sql
DROP TABLE PET;
SELECT * FROM PET;
```

*/

/*markdown

*/