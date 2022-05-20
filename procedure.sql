-- Procedimiento que devuelve el numero total de temporadas y de capitulos de la serie que introducimos, siguiendo el siguiente formato:
-- "La serie X tiene X temporadas con un total de X capitulos."

DELIMITER $$
DROP PROCEDURE IF EXISTS series_info $$
CREATE PROCEDURE series_info (IN Title VARCHAR(50))
BEGIN
    DECLARE total_seasons INT;
    DECLARE total_chapters INT;
    
    SELECT COUNT(N_Temporada), SUM(Capitulos) 
    INTO total_seasons, total_chapters
    FROM Serie WHERE Titulo = Title;

    IF Title NOT IN (
        SELECT Titulo FROM Serie
    ) THEN SELECT CONCAT("No existe una serie llamada ", Title, ".") AS "Error";
    ELSEIF total_seasons = 1 THEN
        SELECT CONCAT("La serie ", Title, " tiene 1 temporada con un total de ", total_chapters, " capitulos.") AS "Informacion";
    ELSE
        SELECT CONCAT("La serie ", Title, " tiene ", total_seasons, " temporadas con un total de ",  total_chapters, " capitulos.") AS "Informacion";
    END IF;
END $$
DELIMITER ;

-- EJEMPLOS

CALL series_info("Marianne");

+------------------------------------------------------------------+
| Informacion                                                      |
+------------------------------------------------------------------+
| La serie Marianne tiene 1 temporada con un total de 8 capitulos. |
+------------------------------------------------------------------+

CALL series_info("Black Mirror");

+------------------------------------------------------------------------+
| Informacion                                                            |
+------------------------------------------------------------------------+
| La serie Black Mirror tiene 5 temporadas con un total de 21 capitulos. |
+------------------------------------------------------------------------+

CALL series_info("Test");

+-----------------------------------+
| Error                             |
+-----------------------------------+
| No existe una serie llamada Test. |
+-----------------------------------+
