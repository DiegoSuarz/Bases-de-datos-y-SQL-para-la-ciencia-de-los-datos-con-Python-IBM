/*markdown
# Laboratorio práctico: Crear y cargar tablas utilizando scripts SQL

En este laboratorio, aprenderás a crear tablas y cargar datos utilizando la herramienta de interfaz gráfica de usuario (GUI) phpMyAdmin en el servicio de base de datos MySQL.

## Objetivos
Después de completar este laboratorio, podrás utilizar phpMyAdmin con MySQL para:

Crear una base de datos en MySQL
Crear tablas utilizando scripts SQL
Cargar datos en tablas directamente desde archivos CSV

## MySQL
En este laboratorio, utilizarás MySQL. MySQL es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

## Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es interna. Estarás trabajando con una base de datos de ejemplo sobre Enfermedades Cardio-Vasculares (ECV). Este esquema de base de datos de ECV consta de cinco tablas: PATIENTS, MEDICAL_HISTORY, MEDICAL_PROCEDURES, MEDICAL_DEPARTMENTS y MEDICAL_LOCATIONS.

Cada tabla tiene algunas filas de datos de muestra. El siguiente diagrama muestra el contenido de la base de datos de ECV:

![alt text](image.png)

Tu tarea es crear esta base de datos en MySQL. Esta tarea se divide en tres partes.

Tarea 1: Crea la base de datos en MySQL utilizando la interfaz gráfica de phpMyAdmin.

Tarea 2: Crea todas las tablas en MySQL utilizando un script SQL.

Tarea 3: Población de cada tabla con los datos en los respectivos archivos CSV.

## Tarea 1 : Crear la base de datos
Sigue las instrucciones compartidas a continuación para crear la base de datos CVD en MySQL.

En la vista de árbol, haz clic en Nuevo para crear una nueva base de datos vacía. Luego, ingresa CVD como el nombre de la base de datos y haz clic en Crear.

Deja la codificación predeterminada utf8. UTF-8 es la codificación de caracteres más comúnmente utilizada para contenido o datos.

![alt text](image-1.png)

## Tarea 2 : Crear tablas usando un script SQL
En este ejercicio, aprenderás a ejecutar un script que contiene los comandos CREATE TABLE para todas las tablas, en lugar de crear cada tabla manualmente escribiendo los comandos DDL en el editor SQL.

> Nota: Los scripts SQL son básicamente un conjunto de comandos SQL compilados en un solo archivo. Cada comando debe terminar con un punto y coma ;. La extensión del archivo debe mantenerse como .sql. Al importar este archivo en la interfaz de phpMyAdmin, los comandos en el archivo se ejecutan secuencialmente.

Sigue los pasos compartidos a continuación.

- Descarga el archivo del script en tu máquina local:

    [CVD_Database_Create_Tables_Script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/a6tVOpmvznnyz7IrrINc6Q/CVD-Database-Create-Tables-Script.sql)

- Selecciona la base de datos CVD. Luego haz clic en la pestaña Importar.

- Haz clic en Elegir archivo, busca el archivo y súbelo.

- Una vez subido, desplázate hacia abajo y haz clic en Continuar.

![alt text](image-2.png)

- El script se ejecuta correctamente y la interfaz muestra entradas en la imagen a continuación.

![alt text](image-3.png)

- Haz clic en cualquiera de las tablas para ver su Definición de Tabla (su lista de columnas, tipos de datos, etc.). La imagen a continuación muestra la estructura de la tabla PACIENTES.

![alt text](image-4.png)

## Tarea 3 : Cargar datos en las tablas
Ahora necesitas cargar los datos en las tablas. Podrías insertar manualmente cada fila en la tabla una por una, pero eso es altamente ineficiente. En su lugar, MySQL (y casi todas las demás bases de datos) te permite cargar datos desde archivos CSV directamente a las tablas.

Los pasos a continuación explican cómo cargar datos en las tablas que creaste en la Tarea 2.

1. Descarga los 5 archivos CSV a tu máquina local.

- [Patients.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/pVsjsvE6Yp0FZqUem_sRHQ/PATIENTS.csv)
- [MedicalHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/QZV5RNxKu1NzwpWR2NNzEQ/MEDICAL-HISTORY.csv)
- [MedicalProcedures.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/jvcmetCeMWqHHgl5Er6uGQ/MEDICAL-PROCEDURES.csv)
- [MedicalDepartments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/Y_Mr0fmk9VivtEYfTk4GgA/MEDICAL-DEPARTMENTS.csv)
- [MedicalLocations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/_3-OnABaAq8eE6huBqmKAQ/MEDICAL-LOCATIONS.csv)

Los pasos para cargar un CSV en una tabla son los siguientes.

- Selecciona la tabla.

- Haz clic en la pestaña Importar.

- Navega hasta la ubicación del archivo CSV y haz clic en ‘Ir’ para cargar el archivo CSV.

Las imágenes a continuación muestran cómo cargar los datos CSV en la tabla PATIENTS.

![alt text](image-5.png)

Una vez que la tabla esté cargada, recibirás un mensaje que indica que los registros se han insertado correctamente.

Además, puedes hacer clic en explorar y ver los datos de la tabla.

![alt text](image-6.png)

## Ejercicio práctico

Repite el mismo proceso para todas las demás tablas.

## Conclusión
Felicidades por completar este laboratorio.

En este laboratorio, aprendiste cómo:

- Usar la interfaz gráfica de phpMyAdmin para operar en servidores MySQL.
- Crear una nueva base de datos en phpMyAdmin.
- Crear las tablas para el conjunto de datos utilizando scripts SQL.
- Cargar datos desde un archivo CSV directamente a una tabla en MySQL.
*/