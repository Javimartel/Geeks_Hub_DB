-- Consultas Simples

-- Consulta 1: mostrar todas las películas cuyo productor sea Netflix

-- Consulta 2: mostrar a todas las cuentas "Premium"
SELECT *
FROM Cuenta
WHERE Tipo_Suscripcion = "Premium";

-- Consulta 3: mostrar todas las películas de "Ciencia Ficción"

-- Consulta 4: *Consultas Javi*

-- Consulta 5: *Consultas Javi*

------------

-- Consultas Compuestas

-- Consulta 1: mostrar la lista de favoritos del perfil 4
SELECT Cod_Contenido, Titulo, Genero
FROM Favoritos F
INNER JOIN Contenido_Favorito Cf
ON F.Cod_Favoritos = Cf.Cod_Favoritos
INNER JOIN Pelicula P
ON Cf.Cod_Contenido = P.Cod_Pelicula
UNION 
SELECT Cod_Contenido, Titulo, Genero
FROM Favoritos F
INNER JOIN Contenido_Favorito Cf
ON F.Cod_Favoritos = Cf.Cod_Favoritos
INNER JOIN Serie S
ON Cf.Cod_Contenido = S.Cod_Serie;


-- Consulta 2: mostrar el historial del perfil 9

-- Consulta 3: mostrar los perfiles de "Javier"

-- Consulta 4: *Consultas Javi*

-- Consulta 5: *Consultas Javi*