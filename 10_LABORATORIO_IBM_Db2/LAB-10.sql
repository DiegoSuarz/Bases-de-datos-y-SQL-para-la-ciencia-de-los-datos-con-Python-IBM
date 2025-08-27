/*markdown
# Laboratorio práctico: Crear tablas usando scripts SQL y cargar datos en tablas

En este laboratorio, aprenderás cómo ejecutar scripts SQL para crear varias tablas a la vez, así como también cómo cargar datos en tablas desde archivos .csv.

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás IBM Db2 Database. Db2 es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) de IBM, diseñado para almacenar, analizar y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás un servicio de base de datos Db2 en IBM Cloud. Si no has completado esta tarea de laboratorio anteriormente en este módulo, aún no tendrás acceso a Db2 en IBM Cloud, y necesitarás seguir primero este laboratorio:

- Laboratorio práctico: Regístrate en IBM Cloud, Crea una instancia de servicio Db2 y Comienza con la consola Db2

## Base de Datos Utilizada en este Laboratorio
La base de datos utilizada en este laboratorio es una base de datos interna. Estarás trabajando en una base de datos de recursos humanos (HR) de muestra. Este esquema de base de datos de HR consta de 5 tablas llamadas EMPLOYEES, JOB_HISTORY, JOBS, DEPARTMENTS y LOCATIONS. Cada tabla tiene algunas filas de datos de muestra. El siguiente diagrama muestra las tablas de la base de datos de HR:

 ![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás:

- Crear tablas utilizando scripts SQL
- Cargar datos en tablas

> NOTA : Asegúrate de estar utilizando el archivo CSV y los conjuntos de datos del mismo archivo de instrucciones.

## Ejercicio 1: Crear tablas usando scripts SQL
En este ejercicio, aprenderás a ejecutar un script que contiene los comandos CREATE TABLE para todas las tablas en lugar de crear cada tabla manualmente escribiendo los comandos DDL en el editor SQL.

1. Descarga el archivo del script a tu computadora:

- [HR_Database_Create_Tables_Script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/HR_Database_Create_Tables_Script.sql)

2. Inicia sesión en IBM Cloud y ve a la Lista de Recursos donde puedes encontrar la instancia del servicio Db2 que creaste en un laboratorio anterior en la sección Servicios. Haz clic en el servicio Db2-xx. Luego, haz clic en el botón Ir a UI.

![alt text](image-1.png)

3. Haz clic en SQL en la esquina izquierda y haz clic en el ícono +

![alt text](image-2.png)

Selecciona la opción Desde Archivo.

![alt text](image-3.png)

4. Localiza el archivo HR_Database_Create_Tables_Script.sql que descargaste a tu computadora anteriormente y ábrelo.

5. Una vez que las declaraciones estén en la herramienta del Editor SQL, puedes ejecutar las consultas contra la base de datos seleccionando el botón Ejecutar Todo.

![alt text](image-4.png)

6. En el lado derecho de la ventana del editor SQL verás una sección de Resultados. Hacer clic en una consulta en la sección de Resultados mostrará los detalles de la ejecución del trabajo, como si se ejecutó con éxito o tuvo algún error o advertencia. Asegúrate de que tus consultas se hayan ejecutado con éxito y hayan creado todas las tablas.

    -  Nota: Puede que veas varios errores antes de la creación exitosa de las tablas. Estos errores se relacionan con la eliminación (borrado) de cualquier versión preexistente de estas tablas. Puedes ignorar estos errores.

![alt text](image-5.png)

7. Ahora puedes ver las tablas que creaste. Haz clic en el ícono de datos y luego haz clic en la pestaña Tablas

![alt text](image-6.png)

8. Selecciona el Esquema correspondiente a tu userid de Db2. Típicamente comienza con 3 letras (no SQL) seguidas de 5 números (pero será diferente del ejemplo MYG36304 a continuación). Luego, en el lado derecho de la pantalla deberías ver las 5 tablas recién creadas listadas: DEPARTMENTS, EMPLOYEES, JOBS, JOB_HISTORY y LOCATIONS (más cualquier otra tabla que hayas creado en laboratorios anteriores, por ejemplo, PETSALE, PETRESCUE, etc.).

![alt text](image-7.png)

9. Haz clic en cualquiera de las tablas y verás su Definición de Tabla (es decir, su lista de columnas, tipos de datos, etc).

![alt text](image-8.png)

## Ejercicio 2: Cargar datos en tablas
En este ejercicio, aprenderás cómo se pueden cargar datos en Db2. Podrías insertar manualmente cada fila en la tabla una por una, pero eso llevaría mucho tiempo. En su lugar, Db2 (y casi todas las demás bases de datos) te permite cargar datos desde archivos .CSV.

Los pasos a continuación explican el proceso de carga de datos en las tablas que creaste anteriormente en el ejercicio 1.

1. Descarga los 5 archivos .csv a tu computadora local:

- [Departments.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Departments.csv)
- [Employees.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week2/data/Employees_updated.csv)
- [Jobs.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Jobs.csv)
- [Locations.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/Locations.csv)
- [JobsHistory.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Labs_Coursera_V5/datasets/HR_Database/JobsHistory.csv)

> Nota: Para los estudiantes que están teniendo problemas con la carga desde .csv en Db2 usando Firefox, pueden descargar los archivos .txt y probar con esos. Para descargar los archivos .txt, simplemente haz clic derecho en el archivo y selecciona Guardar enlace como y guarda el archivo en el sistema local.

- [Departments.txt](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Departments.txt)
- [Employees.txt](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Employees.txt)
- [Jobs.txt](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Jobs.txt)
- [Locations.txt](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/Locations.txt)
- [JobsHistory.txt](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%202/data/JobsHistory.txt)

2. En la Consola de Db2, desde el ícono del menú de 3 barras en la esquina superior izquierda, haz clic en Cargar, y luego selecciona Cargar datos.

![alt text](image-9.png)

3. En la página de Cargar datos que se abre, asegúrate de que Mi computadora esté seleccionada como la fuente. Haz clic en el enlace explorar archivos.

![alt text](image-10.png)

4. Elige el archivo Employees.csv que descargaste a tu computadora y haz clic en Abrir.

![alt text](image-11.png)

5. Una vez que el archivo esté seleccionado, haz clic en Siguiente en la esquina inferior derecha.

![alt text](image-12.png)

6. Selecciona el esquema para tu Id de usuario de Db2 (el que usaste para crear las tablas anteriormente). Se mostrarán todas las tablas que se han creado en este esquema anteriormente, incluida la tabla Employees. Selecciona la tabla EMPLOYEES, y en la nueva pestaña de Definición de tabla que aparece, elige Sobrescribir tabla con nuevos datos (ten en cuenta el mensaje de advertencia), luego haz clic en Siguiente. Selecciona la tabla Employees.

![alt text](image-13.png)

7. Dado que los archivos de datos de origen no contienen filas con etiquetas de columna, desactiva la configuración de Encabezado en la primera fila.

![alt text](image-14.png)

8. Haz clic en Siguiente. Revisa la configuración de carga y haz clic en Iniciar carga en la esquina inferior derecha.

![alt text](image-15.png)

9. Después de que la carga se haya completado, notarás que tuviste éxito en cargar las 10 filas de la tabla Employees. Si hay algún Error o Advertencias, puedes verlos en esta pantalla.

![alt text](image-16.png)

10. Haz clic en la pestaña Tablas y luego selecciona la tabla EMPLOYEES y luego haz clic en Ver datos.

![alt text](image-17.png)

11. Ahora puedes ver los datos de la tabla.

![alt text](image-18.png)

12. Ahora es tu turno de cargar datos en las 4 tablas restantes de la base de datos de RRHH LOCATIONS, JOB_HISTORY, JOBS, y DEPARTMENTS desde los archivos de origen restantes.

13. Haz clic en Cargar más datos y luego sigue los pasos del Paso 3 anterior nuevamente para cargar las 4 tablas restantes.
IMPORTANTE Asegúrate de realizar los pasos en Paso 7 para cada una de las 4 cargas de archivos restantes.
*/

/*markdown

*/