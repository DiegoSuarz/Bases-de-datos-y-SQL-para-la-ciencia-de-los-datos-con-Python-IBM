/*markdown

*/

/*markdown
https://author-ide.skills.network/render?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZF9pbnN0cnVjdGlvbnNfdXJsIjoiaHR0cHM6Ly9jZi1jb3Vyc2VzLWRhdGEuczMudXMuY2xvdWQtb2JqZWN0LXN0b3JhZ2UuYXBwZG9tYWluLmNsb3VkL0lCTURldmVsb3BlclNraWxsc05ldHdvcmstREIwMjAxRU4tU2tpbGxzTmV0d29yay9sYWJzL0JvbnVzTW9kdWxlX0NvdXJzZXJhX3Y1L0ZpbmFsUHJvamVjdF9Cb251c01vZHVsZS5tZCIsInRvb2xfdHlwZSI6Imluc3RydWN0aW9uYWwtbGFiIiwiYXRsYXNfZmlsZV9pZCI6MjQ0NzMsImFkbWluIjpmYWxzZSwiaWF0IjoxNzMzOTgwMDMyfQ.BA2ZbaMGf13pAGr4FiuvQIw69gqVdA5rnEtk6GQHcLM

#
#
#
# Proyecto Final: Técnicas Avanzadas de SQL

## Objetivos
Después de completar este laboratorio, podrás:

1. Usar uniones para consultar datos de múltiples tablas

2. Crear y consultar vistas

3. Escribir y ejecutar procedimientos almacenados

4. Usar transacciones

## Escenario
En este proyecto, trabajarás con tres conjuntos de datos que están disponibles en el Portal de Datos de la Ciudad de Chicago:

-  Indicadores socioeconómicos en Chicago
- Escuelas públicas de Chicago
- Datos de criminalidad en Chicago

Debes descargar cada conjunto de datos, crear una tabla para cada uno y cargar el conjunto de datos apropiado a través de la consola de Db2. Si ya has completado el Laboratorio Práctico: Uniones, puedes reutilizar las tablas que creaste para ese laboratorio práctico. Sin embargo, no debes reutilizar tablas similares con otros nombres de otros ejercicios o laboratorios, ya que pueden no generar los resultados correctos.

**Nota importante:**

Si aún no has descargado los tres conjuntos de datos del Portal de Datos de la Ciudad de Chicago, creado las tablas requeridas y cargado los datos, por favor sigue las instrucciones en esta sección.

## Conjuntos de datos de la ciudad de Chicago
1. Indicadores socioeconómicos en Chicago
Este conjunto de datos contiene una selección de seis indicadores socioeconómicos de importancia para la salud pública y un “índice de dificultades”, para cada área comunitaria de Chicago, para los años 2008 – 2012. Se puede obtener una descripción detallada de este conjunto de datos y del conjunto de datos original en el Portal de Datos de Chicago en:
https://data.cityofchicago.org/Health-Human-Services/Census-Data-Selected-socioeconomic-indicators-in-C/kn9c-c2s2

2. Escuelas públicas de Chicago
Este conjunto de datos muestra todos los datos de rendimiento a nivel escolar utilizados para crear las Tarjetas de Informe Escolar de CPS para el año escolar 2011-2012. Se puede obtener una descripción detallada de este conjunto de datos y del conjunto de datos original en el Portal de Datos de Chicago en:
https://data.cityofchicago.org/Education/Chicago-Public-Schools-Progress-Report-Cards-2011-/9xs2-f89t

3. Datos de crimen en Chicago
Este conjunto de datos refleja los incidentes de crimen reportados (con la excepción de los homicidios donde existen datos para cada víctima) que ocurrieron en la ciudad de Chicago desde 2001 hasta la fecha, menos los siete días más recientes. Se puede obtener una descripción detallada de este conjunto de datos y del conjunto de datos original en el Portal de Datos de Chicago en: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-present/ijzp-q8t2

## Almacenar los conjuntos de datos en tablas de base de datos
El laboratorio requiere que tengas estas tres tablas pobladas con un subconjunto de todos los conjuntos de datos. Descarga los conjuntos de datos 'ChicagoCensusData.csv', 'ChicagoPublicSchools.csv' y 'ChicagoCrimeData.csv' a continuación y carga los datos en tu base de datos Db2 On Cloud.

- [Datos del Censo de Chicago](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/datasets/ChicagoCensusData.csv)

- [Escuelas Públicas de Chicago](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/datasets/ChicagoPublicSchools.csv)

- [Datos del Crimen en Chicago](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/BonusModule_Coursera_v5/datasets/ChicagoCrimeData.csv)

Necesitas crear una nueva tabla para cada conjunto de datos. A medida que cargas cada conjunto de datos, haz clic en "(+) Nueva Tabla", especifica el nombre de la tabla que deseas crear y luego haz clic en "Siguiente".

![alt text](image.png)

Nombra las nuevas tablas de la siguiente manera:

1. CENSUS_DATA
2. CHICAGO_PUBLIC_SCHOOLS
3. CHICAGO_CRIME_DATA

Después de haber creado las tablas, revisa los datos en cada tabla utilizando la función Ver Datos en la consola de Db2 On Cloud.

## Ejercicio 1: Uso de Joins
Se le ha pedido que produzca algunos informes sobre las comunidades y los delitos en el área de Chicago. Necesitará utilizar consultas SQL de unión para acceder a los datos almacenados en múltiples tablas.

## Pregunta 1
- Escribe y ejecuta una consulta SQL para listar los nombres de las escuelas, los nombres de las comunidades y la asistencia promedio para comunidades con un índice de dificultad de 98.

<details><summary> Sugerencia 1</summary>
    Usa las tablas CHICAGO_PUBLIC_SCHOOLS y CENSUS_DATA
</details>

Usa las tablas CHICAGO_PUBLIC_SCHOOLS y CENSUS_DATA

<details><summary> Sugerencia 2</summary>
    Usa un left join
</details>

**Toma una captura de pantalla que muestre la consulta SQL y sus resultados.**

## Pregunta 2

- Escribe y ejecuta una consulta SQL para listar todos los crímenes que ocurrieron en una escuela. Incluye el número de caso, el tipo de crimen y el nombre de la comunidad.

<details><summary> Sugerencia 1</summary>
    Usa las tablas CHICAGO_CRIME_DATA y CENSUS_DATA
</details>

<details><summary> Sugerencia 2</summary>
    Usa un left join
</details>

<details><summary> Sugerencia 3</summary>
   La columna location_description te ayudará a encontrar la ubicación del crimen
</details>

**Toma una captura de pantalla mostrando la consulta SQL y sus resultados.**

## Ejercicio 2: Creando una Vista
Por razones de privacidad, se te ha solicitado crear una vista que permita a los usuarios seleccionar solo el nombre de la escuela y los campos de icono de la tabla CHICAGO_PUBLIC_SCHOOLS. Al proporcionar una vista, puedes asegurarte de que los usuarios no puedan ver las puntuaciones reales asignadas a una escuela, solo el icono asociado con su puntuación. Debes definir nuevos nombres para las columnas de la vista para oscurecer el uso de puntuaciones e iconos en la tabla original.

## Pregunta 1
- Escriba y ejecute una declaración SQL para crear una vista que muestre las columnas enumeradas en la siguiente tabla, con los nuevos nombres de columna como se muestra en la segunda columna.

-------------------------------------------------------------------------------------
|Nombre de columna en CHICAGO_PUBLIC_SCHOOLS	    |Nombre de columna en la vista  |
|---------------------------------------------------|--------------------------------
|NAME_OF_SCHOOL	                                    |   School_Name                 |                  
|Safety_Icon	                                    |   Safety_Rating               |
|Family_Involvement_Icon	                        |   Family_Rating               |
|Environment_Icon	                                |   Environment_Rating          |
|Instruction_Icon	                                |   Instruction_Rating          |
|Leaders_Icon	                                    |   Leaders_Rating              |
|Teachers_Icon	                                    |   Teachers_Rating             |

- Escriba y ejecute una declaración SQL que devuelva todas las columnas de la vista.

- Escriba y ejecute una declaración SQL que devuelva solo el nombre de la escuela y la calificación de líderes de la vista.

**Tome una captura de pantalla que muestre la última consulta SQL y sus resultados.**

## Ejercicio 3: Creación de un Procedimiento Almacenado
Los campos de icono se calculan en función del valor en el campo de puntuación correspondiente. Debes asegurarte de que cuando se actualice un campo de puntuación, el campo de icono también se actualice. Para hacer esto, escribirás un procedimiento almacenado que recibe el id de la escuela y una puntuación de líderes como parámetros de entrada, calcula la configuración del icono y actualiza los campos de manera apropiada.

## Pregunta 1
- Escribe la estructura de una consulta para crear o reemplazar un procedimiento almacenado llamado UPDATE_LEADERS_SCORE que tome un parámetro in_School_ID como un entero y un parámetro in_Leader_Score como un entero. No olvides usar la declaración #SET TERMINATOR para usar el @ como terminador de la declaración CREATE.
**Toma una captura de pantalla mostrando la consulta SQL.**

## Pregunta 2
- Dentro de tu procedimiento almacenado, escribe una declaración SQL para actualizar el campo Leaders_Score en la tabla CHICAGO_PUBLIC_SCHOOLS para la escuela identificada por in_School_ID al valor en el parámetro in_Leader_Score.
**Toma una captura de pantalla que muestre la consulta SQL.**

## Pregunta 3
- Dentro de tu procedimiento almacenado, escribe una declaración SQL IF para actualizar el campo Leaders_Icon en la tabla CHICAGO_PUBLIC_SCHOOLS para la escuela identificada por in_School_ID utilizando la siguiente información.

-----------------------------------------------------------------------------    
|Límite inferior de puntaje	    |Límite superior de puntaje	    |Icono      |
|-------------------------------|-------------------------------|------------
|80	                            |   99	                        |Muy fuerte |
|60	                            |   79	                        |Fuerte     |
|40	                            |   59	                        |Promedio   |
|20	                            |   39                          |Débil      |
|0	                            |   19	                        |Muy débil  |


<details><summary> Sugerencia 1</summary>
    Recuerda que una vez que se ejecuta una cláusula de la declaración IF, no se realizan más verificaciones y el procesamiento se mueve al código debajo de la declaración IF. 
</details>

<details><summary> Sugerencia 2</summary>

    Tu declaración IF debería tener una estructura similar a:
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN

    – actualizar icono para 0-19

    ELSEIF in_Leader_Score < 40 THEN

    – actualizar icono para 20-39

    ELSEIF in_Leader_Score < 60 THEN

    – actualizar icono para 40-59

    ELSEIF in_Leader_Score < 80 THEN

    – actualizar icono para 60-79

    ELSEIF in_Leader_Score < 100 THEN

    – actualizar icono para 80-99

    END IF;
</details>

**Toma una captura de pantalla mostrando la consulta SQL.**

## Pregunta 4
- Ejecuta tu código para crear el procedimiento almacenado.

**Toma una captura de pantalla que muestre la consulta SQL y sus resultados.**

- Escribe una consulta para llamar al procedimiento almacenado, pasando un ID de escuela válido y una puntuación de líder de 50, para verificar que el procedimiento funcione como se espera.

## Ejercicio 4: Uso de Transacciones
Te das cuenta de que si alguien llama a tu código con una puntuación fuera del rango permitido (0-99), entonces la puntuación se actualizará con los datos inválidos y el ícono permanecerá en su valor anterior. Hay varias formas de evitar este problema, una de las cuales es usar una transacción.

## Pregunta 1
- Actualiza la definición de tu procedimiento almacenado. Agrega una cláusula ELSE genérica a la declaración IF que revierta el trabajo actual si la puntuación no encaja en ninguna de las categorías anteriores.

<details><summary> Sugerencia 1</summary>
    Puedes agregar una cláusula ELSE a la declaración IF que solo se ejecutará si ninguna de las condiciones anteriores se ha cumplido.
</details>

**Toma una captura de pantalla mostrando la consulta SQL.**

## Pregunta 2
- Actualiza nuevamente la definición de tu procedimiento almacenado. Agrega una instrucción para confirmar la unidad de trabajo actual al final del procedimiento.

<details><summary> Sugerencia 1</summary>
    Recuerda que tan pronto como cualquier código dentro de las declaraciones IF/ELSE IF/ELSE se completa, el procesamiento reanuda después del END IF, por lo que puedes agregar tu código de confirmación allí.
</details>

**Toma una captura de pantalla que muestre la consulta SQL.**

- Ejecuta tu código para reemplazar el procedimiento almacenado.

- Escribe y ejecuta una consulta para verificar que el procedimiento almacenado actualizado funcione como se espera al usar una puntuación válida de 38.

- Escribe y ejecuta otra consulta para verificar que el procedimiento almacenado actualizado funcione como se espera al usar una puntuación inválida de 101.

## Resumen
Ahora puedes escribir declaraciones SQL avanzadas para consultar datos de múltiples tablas, ocultar datos sensibles de los usuarios y controlar cómo se actualiza la información en tus tablas.
*/

SHOW DATABASES;

USE CHICAGO;
SHOW TABLES;



SELECT * FROM census_data LIMIT 3;
SELECT * FROM chicago_crime_data LIMIT 3;
SELECT * FROM chicago_public_schools LIMIT 3;

/*PROBLEMAS*/

/*
Ejercicio 1: Uso de Joins

Escribe y ejecuta una consulta SQL para listar los nombres de las escuelas, los nombres de las comunidades y la asistencia promedio 
para comunidades con un índice de dificultad de 98.
*/

SELECT CPS.NAME_OF_SCHOOL, CD.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE
FROM chicago_public_schools CPS
LEFT OUTER JOIN census_data CD
ON CPS.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE HARDSHIP_INDEX = 98

/*
Pregunta 2
Escribe y ejecuta una consulta SQL para listar todos los crímenes que ocurrieron en una escuela. 
Incluye el número de caso, el tipo de crimen y el nombre de la comunidad.
*/
SELECT CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME	
FROM chicago_crime_data CCD
LEFT OUTER JOIN census_data CD
ON CCD.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE CCD.LOCATION_DESCRIPTION LIKE '%SCHOOL%'

/*
Ejercicio 2: Creando una Vista
Por razones de privacidad, se te ha solicitado crear una vista que permita a los usuarios seleccionar
solo el nombre de la escuela y los campos de icono de la tabla CHICAGO_PUBLIC_SCHOOLS. Al proporcionar una vista,
puedes asegurarte de que los usuarios no puedan ver las puntuaciones reales asignadas a una escuela, 
solo el icono asociado con su puntuación. Debes definir nuevos nombres para las columnas de la vista 
para oscurecer el uso de puntuaciones e iconos en la tabla original.

Pregunta 1
Escriba y ejecute una declaración SQL para crear una vista que muestre las columnas enumeradas en la siguiente tabla,
con los nuevos nombres de columna como se muestra en la segunda columna.
*/

CREATE VIEW CHICAGO_SCHOOLS
(School_Name, Safety_Rating, Family_Rating, Environment_Rating, Instruction_Rating, Leaders_Rating,Teachers_Rating) AS
SELECT NAME_OF_SCHOOL, Safety_Icon, Family_Involvement_Icon, Environment_Icon, Instruction_Icon, Leaders_Icon, Teachers_Icon
FROM chicago_public_schools


SELECT * FROM CHICAGO_SCHOOLS;

-- SELECT * FROM census_data LIMIT 3;
-- SELECT * FROM chicago_crime_data LIMIT 3;
SELECT * FROM chicago_public_schools LIMIT 3;

/*
Ejercicio 3: Creación de un Procedimiento Almacenado
Los campos de icono se calculan en función del valor en el campo de puntuación correspondiente.
Debes asegurarte de que cuando se actualice un campo de puntuación, el campo de icono también se actualice. 
Para hacer esto, escribirás un procedimiento almacenado que recibe el id de la escuela y una puntuación de líderes 
como parámetros de entrada, calcula la configuración del icono y actualiza los campos de manera apropiada.

Pregunta 1
Escribe la estructura de una consulta para crear o reemplazar un procedimiento almacenado llamado UPDATE_LEADERS_SCORE
que tome un parámetro in_School_ID como un entero y un parámetro in_Leader_Score como un entero. 
No olvides usar la declaración #SET TERMINATOR para usar el @ como terminador de la declaración CREATE.
*/

DROP PROCEDURE IF EXISTS UPDATE_LEADERS_SCORE;
CREATE PROCEDURE UPDATE_LEADERS_SCORE(IN in_School_ID INTEGER, IN in_Leader_Score  INTEGER)
BEGIN 
    
    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Muy debil'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 40 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Debil'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 60 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Promedio'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 80 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Fuerte'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 100 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Muy fuerte'
        WHERE School_ID = in_School_ID;
    END IF; 

END

CALL UPDATE_LEADERS_SCORE(610038, 10);
CALL UPDATE_LEADERS_SCORE(610281, 22);
CALL UPDATE_LEADERS_SCORE(610185, 55);
CALL UPDATE_LEADERS_SCORE(609993, 71);
CALL UPDATE_LEADERS_SCORE(610513, 96);

/*
Ejercicio 4: Uso de Transacciones
Te das cuenta de que si alguien llama a tu código con una puntuación fuera del rango permitido (0-99), 
entonces la puntuación se actualizará con los datos inválidos y el ícono permanecerá en su valor anterior. 
Hay varias formas de evitar este problema, una de las cuales es usar una transacción.

Pregunta 1
Actualiza la definición de tu procedimiento almacenado. Agrega una cláusula ELSE genérica a la declaración IF 
que revierta el trabajo actual si la puntuación no encaja en ninguna de las categorías anteriores.
*/

DROP PROCEDURE IF EXISTS UPDATE_LEADERS_SCORE_TRANSC;
CREATE PROCEDURE UPDATE_LEADERS_SCORE_TRANSC(IN in_School_ID INTEGER UNSIGNED, IN in_Leader_Score INTEGER UNSIGNED)
BEGIN 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
    IF  in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Muy debil'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 40 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Debil'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 60 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Promedio'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 80 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Fuerte'
        WHERE School_ID = in_School_ID;

    ELSEIF in_Leader_Score < 100 THEN
        UPDATE chicago_public_schools
        SET Leaders_Score = in_Leader_Score, Leaders_Icon = 'Muy fuerte'
        WHERE School_ID = in_School_ID;

    ELSE 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El puntaje no está en un rango válido';
    
    END IF; 

    COMMIT;
END


CALL UPDATE_LEADERS_SCORE_TRANSC(610038, 101);
-- CALL UPDATE_LEADERS_SCORE(610281, 22);

SELECT * FROM chicago_public_schools LIMIT 5;