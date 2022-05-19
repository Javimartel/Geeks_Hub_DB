CREATE TABLE baja_cuenta(
    Correo VARCHAR(30) PRIMARY KEY,
    Fecha DATE
);

DROP TRIGGER IF EXISTS dar_baja ;
DELIMITER $$

CREATE TRIGGER dar_baja 
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

DROP TRIGGER IF EXISTS dar_alta ;
DELIMITER $$

CREATE TRIGGER dar_alta 
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