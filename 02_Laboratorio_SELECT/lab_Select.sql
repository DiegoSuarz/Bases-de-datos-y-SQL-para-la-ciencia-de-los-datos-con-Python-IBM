/*markdown
# Laboratorio práctico: Declaraciones SELECT simples

En este laboratorio, aprenderás una de las declaraciones más comúnmente utilizadas en SQL (Lenguaje de Consulta Estructurado), la declaración SELECT. La declaración SELECT se utiliza para seleccionar datos de una base de datos.

## Objetivos
Después de completar este laboratorio, podrás:

- Consultar una base de datos para obtener una respuesta como un conjunto de resultados
- Recuperar todas o algunas columnas de un conjunto de datos
- Aplicar comandos de criterios para filtrar el conjunto de resultados

## Software utilizado en este laboratorio
En este laboratorio, utilizarás Datasette, una herramienta de código abierto para explorar y publicar datos. Puedes visitar el repositorio de GitHub de Datasette aquí.

## Trabajando con Datasette
La herramienta Datasette ofrece una plataforma para ingresar y ejecutar consultas SQL. Al hacer clic en el botón Enviar consulta, puedes ejecutar la consulta SQL.

![alt text](image.png)

## Base de datos utilizada en este laboratorio
La base de datos utilizada en este laboratorio proviene de la siguiente fuente de conjunto de datos: [Ubicaciones de películas en San Francisco](https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am) bajo una PDDL: Dedicación y Licencia de Dominio Público.

## Explorando la Base de Datos
Primero exploremos la base de datos SanFranciscoFilmLocations utilizando la herramienta Datasette:

1. Si la primera declaración que se enumera a continuación no está ya en el cuadro de texto de Datasette a la derecha, copie el código a continuación haciendo clic en el pequeño botón de copiar en la esquina inferior derecha del bloque de código a continuación y luego péguelo en el cuadro de texto de la herramienta Datasette usando Ctrl+V o haciendo clic derecho en el cuadro de texto y eligiendo Pegar.

```sql
SELECT * FROM FilmLocations;
```

![alt text](image-1.png)

2. Haga clic en Enviar consulta.
3. Ahora puede desplazarse hacia abajo en la tabla y explorar todas las columnas y filas de la tabla FilmLocations para tener una idea general del contenido de la tabla.

![alt text](image-2.png)

4. Estas son las descripciones de los atributos de columna de la tabla FilmLocations:

FilmLocations(
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
)

 ## Uso de la declaración SELECT
Ahora, revisemos algunos ejemplos de consultas SELECT.

1. Supongamos que queremos recuperar los detalles de todas las películas de la tabla FilmLocations. Los detalles de cada registro de película deben contener todas las columnas. La declaración de consulta para esto es:

```sql
SELECT * FROM FilmLocations;
```

Copia el código de solución de arriba y pégalo en el cuadro de texto de la herramienta Datasette. Luego haz clic en Enviar consulta.

![alt text](image-7.png)

2. Queremos recuperar los nombres de las películas y los nombres del director y del escritor. La consulta ahora sería:

```sql
SELECT Title, Director, Writer FROM FilmLocations;
```
![alt text](image-8.png)

3. Queremos recuperar los nombres de las películas junto con las ubicaciones de filmación y los años de estreno. Pero también queremos restringir el conjunto de resultados de salida para recuperar solo los registros de películas estrenadas en 2001 y en adelante (años de estreno después de 2001, incluyendo 2001).

```sql
SELECT Title, ReleaseYear, Locations FROM FilmLocations WHERE ReleaseYear>=2001;
```

![alt text](image-9.png)

## Ejercicios prácticos sobre la sentencia SELECT

1. Recupera los datos curiosos y las locaciones de filmación de todas las películas.
<details><summary>Haz clic aquí para una pista</summary>
    Sigue el ejemplo 2 de SELECT, donde se han recuperado registros que contienen detalles de algunas columnas particulares.
</details>

<details><summary>Haz clic aquí para la solución </summary>
```sql
SELECT Locations, FunFacts FROM FilmLocations;
```
</details>

<details><summary>Haz clic aquí para ver la salida</summary>
![alt text](image-4.png)
</details>



2. Recupera los nombres de todas las películas estrenadas en el siglo XX y antes (años de estreno antes de 2000, incluyendo 2000), junto con las ubicaciones de filmación y los años de estreno.




<details><summary> Haz clic aquí para una pista</summary>
Sigue el ejemplo 3 de SELECT, donde restringimos el conjunto de resultados de salida para recuperar solo los registros de películas con ciertos años de estreno. Usa el operador de comparación de la cláusula WHERE <=, que significa Menor o igual que.
</details>

<details><summary>Haz clic aquí para la solución </summary>
```sql
SELECT Title, ReleaseYear, Locations FROM FilmLocations WHERE ReleaseYear<=2000;
```
</details>

<details><summary> Haz clic aquí para ver la salida</summary>
![alt text](image-5.png)
</details>

3. Recupera los nombres, nombres de las compañías productoras, ubicaciones de filmación y años de estreno de las películas que no fueron escritas por James Cameron.

<details><summary>Haz clic aquí para una pista </summary>
    Utiliza el operador de comparación de la cláusula WHERE <>, que significa No igual a.
</details>

<details><summary>Haz clic aquí para la solución </summary>
    ```sql
    SELECT Title, ProductionCompany, Locations, ReleaseYear FROM FilmLocations WHERE Writer<>"James Cameron";
    ```
</details>

<details><summary>Haz clic aquí para ver la salida </summary>
    ![alt text](image-6.png)
</details>

## Conclusión
¡Felicidades por completar este laboratorio!

Ahora eres capaz de:

- Consultar una base de datos utilizando sentencias SELECT
- Recuperar todas o columnas seleccionadas de datos
- Filtrar la respuesta de la consulta para cumplir con un criterio definido
*/

CREATE DATABASE IF NOT EXISTS SanFranciscoFilmLocations ;

USE sanfranciscofilmlocations;

ALTER TABLE film_Locations
RENAME COLUMN `Release Year` TO release_year;
RENAME COLUMN `Release Year` TO release_year;



ALTER TABLE film_Locations
RENAME COLUMN `Fun Facts` TO Fun_Facts;

ALTER TABLE film_Locations
RENAME COLUMN `Production Company` TO Production_Company;


-- Ejercicio1
select * from Film_Locations;

/*jercicio 2. Queremos recuperar los nombres de las películas y los nombres del director y del escritor*/
SELECT Title, Director, Writer FROM Film_Locations;



/*ejercicio 3. Queremos recuperar los nombres de las películas junto con las ubicaciones de filmación y los años de estreno. 
Pero también queremos restringir el conjunto de resultados de salida para recuperar solo los registros de películas estrenadas 
en 2001 y en adelante (años de estreno después de 2001, incluyendo 2001).*/

SELECT Title, Release_Year, Locations 
FROM Film_Locations
WHERE Release_Year >= 2001;
 


/*Ejercicio practico 1: Recupera los Fun_Facts y las Locations de filmación de todas las películas.*/
SELECT Fun_Facts, Locations
FROM Film_Locations;

/*Ejercicio Practico2: Recupera los nombres de todas las películas estrenadas en el siglo XX y antes (años de estreno antes de 2000,
incluyendo 2000), junto con las ubicaciones de filmación y los años de estreno.*/

SELECT Title, release_year, locations
FROM Film_Locations
WHERE release_year <= 2000;


/*Ejercicio Practico3: Recupera los nombres, nombres de las compañías productoras, ubicaciones de filmación y 
años de estreno de las películas que no fueron escritas por James Cameron.*/

SELECT Title, Production_Company, locations, Release_Year
FROM Film_Locations
WHERE Director <> "James Cameron";