/*markdown
# Laboratorio Práctico: COUNT, DISTINCT, LIMIT

En este laboratorio, aprenderás algunas expresiones útiles que se utilizan con declaraciones SELECT. Primero, aprenderás COUNT, que es una función agregada que recupera el número de filas que coinciden con los criterios de la consulta. A continuación, aprenderás DISTINCT, que se utiliza para eliminar valores duplicados de un conjunto de resultados específico y solo devolver los valores únicos. Por último, aprenderás LIMIT, que se utiliza para restringir el número de filas recuperadas de la tabla.

Base de datos utilizada en este laboratorio
La base de datos utilizada en este laboratorio proviene de la siguiente fuente de conjunto de datos: U[bicaciones de Películas en San Francisco](https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am) bajo una PDDL: Dedicación y Licencia de Dominio Público.

# Objetivos
Después de completar este laboratorio, podrás:

- Recuperar el número de filas que coinciden con un criterio de consulta
- Eliminar valores duplicados de un conjunto de resultados y devolver los valores únicos
- Restringir el número de filas recuperadas de una tabla

## Explorando la Base de Datos
Primero exploremos la base de datos SanFranciscoFilmLocations utilizando la herramienta Datasette:

Si la primera declaración que se enumera a continuación no está ya en el cuadro de texto de Datasette a la derecha, copie el código a continuación haciendo clic en el pequeño botón de copiar en la parte inferior derecha del bloque de código y luego péguelo en el cuadro de texto de la herramienta Datasette utilizando Ctrl+V o haciendo clic derecho en el cuadro de texto y eligiendo Pegar.

```sql
SELECT * FROM FilmLocations;
```

![alt text](image.png)

Estas son las descripciones de los atributos de las columnas de la tabla FilmLocations:

Title:              titles of the films, 
ReleaseYear:        time of public release of the films, 
Locations:          locations of San Francisco where the films were shot, 
FunFacts:           funny facts about the filming locations, 
ProductionCompany:  companies who produced the films, 
Distributor:        companies who distributed the films, 
Director:           people who directed the films, 
Writer:             people who wrote the films, 
Actor1:             person 1 who acted in the films, 
Actor2:             person 2 who acted in the films,
Actor3:             person 3 who acted in the films

## Uso de la declaración COUNT
Veamos algunos ejemplos de consultas relacionadas con COUNT.

1. Supongamos que queremos contar el número de registros o filas de la tabla "FilmLocations". La consulta para esto sería:

```sql
SELECT COUNT(*) FROM FilmLocations;
```
Copia el código anterior y pégalo en el cuadro de consulta de la herramienta Datasette. Luego haz clic en Enviar consulta.
Tu conjunto de resultados de salida debería verse como la imagen a continuación:

![alt text](image-1.png)

2. Queremos contar el número de ubicaciones de las películas. Pero también queremos restringir el conjunto de resultados de salida para que solo recuperemos el número de ubicaciones de las películas escritas por un cierto escritor. La consulta para esto se puede escribir como:

```sql
SELECT COUNT(Locations) FROM FilmLocations WHERE Writer="James Cameron";
```

![alt text](image-2.png)

## Uso de la declaración DISTINCT
En este ejercicio, revisarás algunos ejemplos de uso de DISTINCT en consultas.

1. Supongamos que queremos recuperar los títulos de todas las películas en la tabla de manera que se descarten los duplicados en el conjunto de resultados de salida.

```sql
SELECT DISTINCT Title FROM FilmLocations;
```

Tu conjunto de resultados de salida debería verse como la imagen a continuación:

![alt text](image-3.png)

Queremos recuperar el conteo de los años de estreno de las películas producidas por una empresa específica para que los años de estreno duplicados de esas películas sean descartados en el conteo.

```sql
SELECT COUNT(DISTINCT ReleaseYear) FROM FilmLocations WHERE ProductionCompany="Warner Bros. Pictures";
```

Tu conjunto de resultados debería verse como la imagen a continuación:

![alt text](image-4.png)

## Uso de la declaración LIMIT
En este ejercicio, primero pasarás por algunos ejemplos de uso de LIMIT en consultas.

1. Recupera solo las primeras 25 filas de la tabla para que las filas distintas de estas no estén en el conjunto de resultados de salida.

```sql
SELECT * FROM FilmLocations LIMIT 25;
```

Tu conjunto de resultados debería verse como la imagen a continuación:

![alt text](image-5.png)

2. Ahora, queremos recuperar 15 filas de la tabla comenzando desde la fila 11.

```sql
SELECT * FROM FilmLocations LIMIT 15 OFFSET 10;
```

Tu conjunto de resultados de salida debería verse como la imagen a continuación:

![alt text](image-6.png)

## Ejercicios de práctica

### CONTAR
1. Recupera el número de ubicaciones de las películas dirigidas por Woody Allen.

<details><summary> Pista</summary>
    Sigue el ejemplo 2 del ejercicio CONTAR. Utiliza el operador de comparación de la cláusula WHERE =, que significa Igual a.
</details>

<details><summary> Solución de la consulta</summary>
```sql
SELECT COUNT(Locations) FROM FilmLocations WHERE Director="Woody Allen";
```
</details>

<details><summary>Salida </summary>
![alt text](image-7.png)
</details>


2. Recupera el número de películas filmadas en Russian Hill.

<details><summary> Sugerencia</summary>
Sigue el ejemplo 2 del ejercicio COUNT. Utiliza el operador de comparación de la cláusula WHERE =, que significa Igual a.
</details>

<details><summary> Solución de Consulta</summary>
```sql
SELECT Count(Title) FROM FilmLocations WHERE Locations="Russian Hill";
```
</details>

<details><summary> Salida</summary>
![alt text](image-8.png)
</details>



3. Recupera el número de filas que tienen un año de lanzamiento anterior a 1950 de la tabla "FilmLocations".

<details><summary>Sugerencia </summary>
Sigue el ejemplo 1 del ejercicio COUNT. Usa el operador de comparación de la cláusula WHERE <, que significa Menos que.
</details>

<details><summary>Solución de la Consulta </summary>
```sql
SELECT Count(*) FROM FilmLocations WHERE ReleaseYear<1950;
```
</details>

<details><summary>Salida </summary>
![alt text](image-9.png)
</details>
*/

use sanfranciscofilmlocations;
SELECT * FROM Film_Locations;

/*COUNT 1*/
SELECT COUNT(*) FROM Film_Locations;

/*COUNT 2*/
SELECT COUNT(Locations) FROM Film_Locations WHERE Writer="James Cameron";

SELECT * FROM Film_Locations WHERE Writer="James Cameron";

/*DISTINCT 1*/
SELECT DISTINCT Title FROM Film_Locations;

/*DISTINCT 2: Queremos recuperar el conteo de los años de estreno de las películas producidas por una empresa específica
para que los años de estreno duplicados de esas películas sean descartados en el conteo.*/

SELECT COUNT(DISTINCT Release_Year)
FROM Film_Locations
WHERE Production_Company="Warner Bros. Pictures";



SELECT DISTINCT Release_Year
FROM Film_Locations
WHERE Production_Company="Warner Bros. Pictures";

/*LIMIT 1:
Recupera solo las primeras 25 filas de la tabla para que las filas distintas de estas no estén en el conjunto de resultados de salida.
*/
SELECT * 
FROM Film_Locations
LIMIT 25;

/*LIMIT 1:
Ahora, queremos recuperar 15 filas de la tabla comenzando desde la fila 11.
*/
SELECT *
FROM Film_Locations
LIMIT 15 OFFSET 10;

/*Recupera el número de ubicaciones de las películas dirigidas por Woody Allen.*/

SELECT COUNT(Locations)
FROM Film_Locations
WHERE Director = "Woody Allen"

SELECT *
FROM Film_Locations
WHERE Director = "Woody Allen"

/* Recupera el número de películas filmadas en Woody Allen.*/
SELECT COUNT(DISTINCT Title)
FROM Film_Locations
WHERE Director = "Woody Allen"

SELECT DISTINCT Title
FROM Film_Locations
WHERE Director = "Woody Allen"

/*Recupera el número de filas que tienen un año de lanzamiento anterior a  de la tabla "FilmLocations".*/

SELECT COUNT(*)
FROM Film_Locations
WHERE Release_Year < 1950;
