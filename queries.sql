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

-- Consulta 1: mostrar la lista de favoritos del perfil 4

-- Consulta 2: mostrar el historial del perfil 9

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