-- Funcion que devuelva la dureación de una Película, siguiendo el siguiente formato:
-- 125 min --> 2h 5min

DROP FUNCTION IF EXISTS duration_format;
DELIMITER $$
CREATE FUNCTION duration_format (codPeliculaIn CHAR(4))
RETURNS VARCHAR(10)
BEGIN

    DECLARE duration_time VARCHAR(10) DEFAULT "";
    DECLARE duration_film INT;
    DECLARE duration_hours INT DEFAULT 0;
    DECLARE duration_minutes INT DEFAULT 0;

    IF codPeliculaIn IN (SELECT Cod_Pelicula FROM Pelicula) THEN
        SELECT Duracion INTO duration_film FROM Pelicula WHERE Cod_Pelicula = codPeliculaIn;

        WHILE duration_film >= 60 DO 
            SET duration_film = duration_film - 60;
            SET duration_hours = duration_hours + 1;
        END WHILE;

        SET duration_minutes = duration_film;

        IF duration_hours = 0 THEN 
            SET duration_time = CONCAT(duration_minutes," min");
        ELSEIF duration_minutes = 0 THEN 
            SET duration_time = CONCAT(duration_hours," h");
        ELSE 
            SET duration_time = CONCAT(duration_hours," h ",duration_minutes," min");
        END IF;

    ELSE
        SET duration_time = "No existe esa Pelicula";
    END IF;

    RETURN duration_time;

END $$
DELIMITER ;

-- Ejemplos

SELECT duration_format("P001") Duracion;
-- Resultado
+----------+
| Duracion |
+----------+
| 2 h       |
+----------+

SELECT duration_format("P003") Duracion;
-- Resultado
+-----------+
| Duracion  |
+-----------+
| 2 h 14 min |
+-----------+
