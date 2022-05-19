-- Consultas Simples

-- Consulta 1: mostrar todas las películas cuyo productor sea Netflix

SELECT Cod_Pelicula, Titulo, Genero 
FROM Pelicula 
WHERE Productor = "Netflix";

-- RESULTADO

+--------------+-----------------------------------+------------+
| Cod_Pelicula | Titulo                            | Genero     |
+--------------+-----------------------------------+------------+
| P002         | Yo antes de ti                    | Romance    |
| P011         | El Proyecto Adam                  | Comedia    |
| P012         | Vuelta al insti                   | Comedia    |
| P019         | Tyler Rake                        | Accion     |
| P020         | Jurassic World: El reino ca?do    | Accion     |
| P027         | Elon Musk: The Real Life Iron Man | Documental |
| P028         | El Estafador de Tinder            | Documental |
+--------------+-----------------------------------+------------+

-- Consulta 2: mostrar a todas las cuentas "Premium"

SELECT *
FROM Cuenta
WHERE Tipo_Suscripcion = "Premium";

-- RESULTADO

+------------------------+--------+-----------------+----------------+------------+-----------+------------------+
| Correo                 | Nombre | Apellidos       | Direccion      | Contrasena | Telefono  | Tipo_Suscripcion |
+------------------------+--------+-----------------+----------------+------------+-----------+------------------+
| aitorinfo@hotmail.es   | Aitor  | Santana Cabrera | C/ El Monte    | 1992A_sc*  | 689002130 | Premium          |
| raulpokefan@hotmail.es | Raul   | Navarro Lopez   | A/ Escaleritas | *rauli54*  | 623145896 | Premium          |
+------------------------+--------+-----------------+----------------+------------+-----------+------------------+

-- Consulta 3: mostrar todas las películas de "Ciencia Ficción"

SELECT Cod_Pelicula, Titulo
FROM Pelicula 
WHERE Genero = "Ciencia Ficcion";

-- RESULTADO

+--------------+-----------------------+
| Cod_Pelicula | Titulo                |
+--------------+-----------------------+
| P003         | Star Wars Episodio I  |
| P004         | Star Wars Episodio II |
| P005         | Avatar                |
| P006         | Spiderman No Way Home |
| P007         | Avengers Infinity War |
| P008         | Avengers End Game     |
+--------------+-----------------------+

-- Consulta 4: *Consultas Javi*

-- Consulta 5: *Consultas Javi*

------------

-- Consultas Compuestas

-- Consulta 1: mostrar la lista de favoritos del perfil 5
SELECT Cod_Contenido, Titulo, Genero, 0 AS "Temporada"
FROM Favoritos F
INNER JOIN Contenido_Favorito Cf
ON F.Cod_Favoritos = Cf.Cod_Favoritos
INNER JOIN Pelicula P
ON Cf.Cod_Contenido = P.Cod_Pelicula
WHERE F.Cod_Favoritos = "FV05"
UNION 
SELECT Cod_Contenido, Titulo, Genero, N_Temporada
FROM Favoritos F
INNER JOIN Contenido_Favorito Cf
ON F.Cod_Favoritos = Cf.Cod_Favoritos
INNER JOIN Serie S
ON Cf.Cod_Contenido = S.Cod_Serie
WHERE F.Cod_Favoritos = "FV05";

-- Resultado
+---------------+-----------------------+-----------------+-----------+
| Cod_Contenido | Titulo                | Genero          | Temporada |
+---------------+-----------------------+-----------------+-----------+
| P001          | Titanic               | Romance         |         0 |
| P004          | Star Wars Episodio II | Ciencia Ficcion |         0 |
| P007          | Avengers Infinity War | Ciencia Ficcion |         0 |
| S005          | Black Mirror          | Ciencia Ficcion |         2 |
| S006          | Black Mirror          | Ciencia Ficcion |         3 |
+---------------+-----------------------+-----------------+-----------+


-- Consulta 2: mostrar el historial del perfil 9
SELECT Cod_Contenido, Titulo, Genero, 0 AS "Temporada"
FROM Historial H
INNER JOIN Pelicula P
ON H.Cod_Contenido = P.Cod_Pelicula
WHERE H.Cod_Perfil = "Perfil9"
UNION 
SELECT Cod_Contenido, Titulo, Genero, N_Temporada
FROM Historial H
INNER JOIN Serie S
ON H.Cod_Contenido = S.Cod_Serie
WHERE H.Cod_Perfil = "Perfil9";

-- Resultado
+---------------+--------------+-----------------+-----------+
| Cod_Contenido | Titulo       | Genero          | Temporada |
+---------------+--------------+-----------------+-----------+
| P001          | Titanic      | Romance         |         0 |
| S003          | Marianne     | Terror          |         1 |
| S004          | Black Mirror | Ciencia Ficcion |         1 |
| S006          | Black Mirror | Ciencia Ficcion |         3 |
+---------------+--------------+-----------------+-----------+

-- Consulta 3: mostrar los perfiles de "Javier"

SELECT Cod_Perfil, Nickname
FROM Perfil INNER JOIN Cuenta ON Perfil.Correo = Cuenta.Correo
WHERE Nombre = "Javier";

-- RESULTADO

+------------+----------+
| Cod_Perfil | Nickname |
+------------+----------+
| Perfil5    | Javi     |
| Perfil6    | Javi2    |
+------------+----------+

-- Consulta 4: *Consultas Javi*

-- Consulta 5: *Consultas Javi*