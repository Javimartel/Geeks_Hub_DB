CREATE TABLE baja_cuenta(
    Correo VARCHAR(30) PRIMARY KEY,
    Fecha DATE
);

-- Trigger 1: Crear un trigger que, al eliminar una cuenta, 
-- esta se debe quedar registrada en una tabla junto a la 
-- fecha en la que se dio de baja

DROP TRIGGER IF EXISTS unsubscribe;
DELIMITER $$

CREATE TRIGGER unsubscribe 
BEFORE DELETE ON Cuenta
FOR EACH ROW
BEGIN

    INSERT INTO baja_cuenta VALUES (OLD.Correo, CURRENT_DATE());

END $$
DELIMITER ;

DELETE FROM Cuenta WHERE Correo = "juanma87@gmail.com";

-- Tabla baja_cuenta tras eliminar

+--------------------+------------+
| Correo             | Fecha      |
+--------------------+------------+
| juanma87@gmail.com | 2022-05-19 |
+--------------------+------------+

-------------------

-- Trigger 2: Crear un trigger que, al añadir una cuenta que 
-- anteriormente fue dada de baja, esta debe ser eliminada de 
-- la tabla de cuentas de baja.

DROP TRIGGER IF EXISTS to_register ;
DELIMITER $$

CREATE TRIGGER to_register 
BEFORE INSERT ON Cuenta
FOR EACH ROW
BEGIN
    
    IF NEW.Correo IN (SELECT Correo FROM baja_cuenta) THEN
        DELETE FROM baja_cuenta WHERE baja_cuenta.Correo = NEW.Correo;
    END IF;

END $$
DELIMITER ;

INSERT INTO Cuenta VALUES ("juanma87@gmail.com", "Juan Manuel", "Perez Diaz", "C/ Paula Doreste", "87juanma2", "606218752", "Basico");

-- Al volver a insertar la cuenta se elimina de la tabla baja_cuenta

-- Empty set (0.000 sec)