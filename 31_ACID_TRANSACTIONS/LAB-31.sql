/*markdown
## Laboratorio Práctico: Confirmar y Revertir una Transacción

Una transacción es simplemente una secuencia de operaciones realizadas utilizando una o más declaraciones SQL como una única unidad lógica de trabajo. Una transacción de base de datos debe ser ACID (Atómica, Consistente, Aislada y Duradera). Los efectos de todas las declaraciones SQL en una transacción pueden aplicarse a la base de datos utilizando el comando COMMIT o deshacerse de la base de datos utilizando el comando ROLLBACK.

En este laboratorio, aprenderás algunos comandos TCL (Lenguaje de Control de Transacciones) comúnmente utilizados en SQL a través de la creación de una rutina de procedimiento almacenado. Aprenderás sobre COMMIT, que se utiliza para guardar permanentemente los cambios realizados en las transacciones en una tabla, y sobre ROLLBACK, que se utiliza para deshacer las transacciones que no han sido guardadas en una tabla. ROLLBACK solo se puede usar para deshacer los cambios en la unidad de trabajo actual.

## Objetivos
Después de completar este laboratorio, podrás:

Guardar permanentemente los cambios realizados en una transacción
Deshacer la transacción que no ha sido guardada

## Software Utilizado en este Laboratorio
MySQL es un Sistema de Gestión de Bases de Datos Relacionales (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de Datos Utilizada en este Laboratorio
Se ha utilizado la base de datos **Mysql_learners** en este laboratorio.

## Datos Utilizados en este Laboratorio
Los datos utilizados en este laboratorio son datos internos. Estarás trabajando con las tablas **BankAccounts** y **ShoeShop**.

![alt text](image.png)

![alt text](image-1.png)

Este laboratorio requiere que las tablas **BankAccounts** y **ShoeShop** estén pobladas con datos de muestra. Descarga los scripts ``BankAccounts-CREATE.sql`` y ``ShoeShop-CREATE.sql`` a continuación, y cárgalos en la consola de phpMyAdmin. Los scripts crearán nuevas tablas llamadas ``BankAccounts`` y ``ShoeShop`` y las poblarán con los datos de muestra requeridos para este laboratorio.

- [BankAccounts-CREATE.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/BankAccounts-CREATE.sql)
- [ShoeShop-CREATE.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/MySQL/week6/ShoeShop-CREATE.sql)

## Ejercicio de Muestra
Ejemplo de comprometer y revertir una transacción.

1. **Escenario**: Rose está comprando un par de botas de ``ShoeShop``. Por lo tanto, tenemos que actualizar el saldo de Rose así como el saldo de ``ShoeShop`` en la tabla ``BankAccounts``. Luego también tenemos que actualizar el stock de botas en la tabla ``ShoeShop``. Después de las botas, intentemos también comprarle a Rose un par de zapatillas.

- Una vez que las tablas estén listas, crea una rutina de procedimiento almacenado llamada TRANSACTION_ROSE que incluya comandos TCL como COMMIT y ROLLBACK.
- Ahora desarrolla la rutina basada en el escenario dado para ejecutar una transacción.
- Para crear la rutina de procedimiento almacenado en MySQL, copia el código a continuación y pégalo en el área de texto de la página SQL. Haz clic en Go.

```sql
DELIMITER //
CREATE PROCEDURE TRANSACTION_ROSE()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
    UPDATE BankAccounts
    SET Balance = Balance-200
    WHERE AccountName = 'Rose';
    UPDATE BankAccounts
    SET Balance = Balance+200
    WHERE AccountName = 'Shoe Shop';
    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Boots';
    UPDATE BankAccounts
    SET Balance = Balance-300
    WHERE AccountName = 'Rose';
    COMMIT;
END //
DELIMITER ;
```

3. Ahora verifiquemos si la transacción se puede confirmar con éxito o no. Copia el código a continuación en un **nuevo script en blanco** y pégalo en el área de texto de la página **SQL**. Haz clic en Ir.

```sql
CALL TRANSACTION_ROSE;
SELECT * FROM BankAccounts;
SELECT * FROM ShoeShop;
```

4. Observe que la transacción se ha ejecutado. Pero cuando observamos las tablas, no se han guardado permanentemente cambios a través de COMMIT. Todos los posibles cambios que pudieron haber ocurrido podrían haberse deshecho a través de ROLLBACK, ya que toda la transacción falla debido a la falla de una o más declaraciones SQL. Vamos a revisar la posible razón detrás de la falla de la transacción y cómo funciona COMMIT - ROLLBACK en un procedimiento almacenado:

- Las primeras tres actualizaciones deberían ejecutarse con éxito. Tanto el saldo de Rose como el de ShoeShop deberían haberse actualizado en la tabla BankAccounts. El saldo actual de Rose debería ser 300 - 200 (precio de un par de botas) = 100. El saldo actual de ShoeShop debería ser 124,200 + 200 = 124,400. El stock de botas también debería actualizarse en la tabla ShoeShop después de la compra exitosa para Rose, 11 - 1 = 10.

- La última declaración de actualización intenta comprarle a Rose un par de zapatillas, pero su saldo se vuelve insuficiente (Saldo actual de Rose: 100 < Precio de las zapatillas: 300) después de comprar un par de botas. Por lo tanto, la última declaración de actualización falla. Dado que toda la transacción falla si alguna de las declaraciones SQL falla, la transacción no se comprometerá.

## Ejercicio de práctica
Ahora practiquemos un ejercicio sobre cómo comprometer y revertir una transacción.

Crea un procedimiento almacenado **TRANSACTION_JAMES** para ejecutar una transacción basada en el siguiente escenario: Primero compra James 4 pares de zapatillas en ShoeShop. Actualiza su saldo así como el saldo de ShoeShop. Además, actualiza el stock de zapatillas en ShoeShop. Luego intenta comprarle a James un par de zapatos Brogues en ShoeShop. Si alguna de las sentencias UPDATE falla, toda la transacción falla. Debes revertir la transacción. Compromete la transacción solo si toda la transacción es exitosa.

<details><summary>Pista </summary>

    > Utiliza el código anterior de la Tarea A Paso 2 y modifícalo. Resta 1200 (4 x 300) del saldo de James y suma 1200 al saldo de ShoeShop. Resta 4 zapatillas del stock en ShoeShop. Luego resta 150 del saldo de James.

</details>


<details><summary>Solución </summary>

```sql
    DELIMITER //

CREATE PROCEDURE TRANSACTION_JAMES()

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    UPDATE BankAccounts
    SET Balance = Balance-1200
    WHERE AccountName = 'James';

    UPDATE BankAccounts
    SET Balance = Balance+1200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-4
    WHERE Product = 'Trainers';

    UPDATE BankAccounts
    SET Balance = Balance-150
    WHERE AccountName = 'James';

    COMMIT;

END //

DELIMITER ; 
```
</details>


## Conclusión
¡Felicidades! Has completado este laboratorio y estás listo para el siguiente tema.

Ahora eres capaz de:

- Escribir un procedimiento almacenado para registrar una transacción en múltiples tablas
- Entender la diferencia entre transacciones permanentes y reversibles
- Realizar una transacción
- Realizar un rollback
*/

SHOW DATABASES;

USE mysql_learners;

SHOW TABLES;

/*CREANDO TABLAS*/
DROP TABLE IF EXISTS BankAccounts;
CREATE TABLE BankAccounts (
    AccountNumber VARCHAR(5) NOT NULL,
    AccountName VARCHAR(25) NOT NULL,
    Balance DECIMAL(8,2) CHECK(Balance>=0) NOT NULL,
    PRIMARY KEY (AccountNumber)
    );
    
INSERT INTO BankAccounts VALUES
('B001','Rose',300),
('B002','James',1345),
('B003','Shoe Shop',124200),
('B004','Corner Shop',76000);

DROP TABLE IF EXISTS ShoeShop;
CREATE TABLE ShoeShop (
    Product VARCHAR(25) NOT NULL,
    Stock INTEGER NOT NULL,
    Price DECIMAL(8,2) CHECK(Price>0) NOT NULL,
    PRIMARY KEY (Product)
    );

INSERT INTO ShoeShop VALUES
('Boots',11,200),
('High heels',8,600),
('Brogues',10,150),
('Trainers',14,300);

SELECT * FROM BankAccounts;

SELECT * FROM ShoeShop;

/*
1. Escenario: Rose está comprando un par de botas de ShoeShop. Por lo tanto, tenemos que actualizar el saldo de Rose así 
como el saldo de ShoeShop en la tabla BankAccounts. Luego también tenemos que actualizar el stock de botas en la tabla ShoeShop.
Después de las botas, intentemos también comprarle a Rose un par de zapatillas.

- Una vez que las tablas estén listas, crea una rutina de procedimiento almacenado llamada TRANSACTION_ROSE que incluya 
  comandos TCL como COMMIT y ROLLBACK.
- Ahora desarrolla la rutina basada en el escenario dado para ejecutar una transacción.
*/

CREATE PROCEDURE TRANSACTION_ROSE()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    UPDATE BankAccounts
    SET Balance = Balance-200
    WHERE AccountNumber = 'Rose';

    UPDATE BankAccounts
    SET Balance = Balance+200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Boots';

    UPDATE BankAccounts
    SET Balance = Balance-300
    WHERE AccountName = 'Rose';

    COMMIT;
END

SELECT * FROM BankAccounts;
SELECT * FROM ShoeShop;

CALL TRANSACTION_ROSE;
SELECT * FROM BankAccounts;
SELECT * FROM ShoeShop;

/*
Crea un procedimiento almacenado TRANSACTION_JAMES para ejecutar una transacción basada en el siguiente escenario:
 rimero compra James 4 pares de zapatillas en ShoeShop. Actualiza su saldo así como el saldo de ShoeShop. 
Además, actualiza el stock de zapatillas en ShoeShop. Luego intenta comprarle a James un par de zapatos Brogues en ShoeShop. 
Si alguna de las sentencias UPDATE falla, toda la transacción falla. Debes revertir la transacción. 
Compromete la transacción solo si toda la transacción es exitosa.
*/

CREATE PROCEDURE TRANSACTION_JAMES()

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    UPDATE BankAccounts
    SET Balance = Balance-1200
    WHERE AccountName = 'James';

    UPDATE BankAccounts
    SET Balance = Balance+1200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET  Stock = Stock-4
    WHERE Product = 'Trainers';

    UPDATE BankAccounts
    SET Balance = Balance-20
    WHERE AccountName = 'James';

    COMMIT;
END


DROP PROCEDURE TRANSACTION_JAMES

SELECT * FROM BankAccounts;
SELECT * FROM ShoeShop;

CALL TRANSACTION_JAMES;
SELECT * FROM BankAccounts;
SELECT * FROM ShoeShop;