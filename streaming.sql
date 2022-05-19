DROP DATABASE IF EXISTS streaming;
CREATE DATABASE streaming;
USE streaming;

-- Creacion de Tablas --

CREATE TABLE Cuenta (
    Correo VARCHAR(30) PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL,
    Apellidos VARCHAR(35),
    Direccion VARCHAR(30),
    Contrasena VARCHAR(22) NOT NULL,
    Telefono VARCHAR(9),
    Tipo_Suscripcion ENUM("Basico", "Estandar", "Premium")
);

CREATE TABLE Perfil (
    Cod_Perfil VARCHAR(12),
    Correo VARCHAR(30),
    Nickname VARCHAR(15) NOT NULL,
    Imagen ENUM("Imagen1", "Imagen2", "Imagen3"),
    Cod_Favoritos CHAR(4),
    PRIMARY KEY(Cod_Perfil, Correo)
);

CREATE TABLE Suscripcion (
    Tipo_Suscripcion ENUM("Basico", "Estandar", "Premium") PRIMARY KEY,
    Precio DEC(5,2),
    Calidad_Videos VARCHAR(10), -- "HD", "Full HD", "4k"
    Max_Dispositivos INT         -- Elegir maximo
);

CREATE TABLE Favoritos ( -- ¿Lista_Favoritos?
    Cod_Favoritos CHAR(4) PRIMARY KEY,
    Fecha_Creacion DATE NOT NULL,
    Fecha_Eliminacion DATE
);

CREATE TABLE Contenido_Favorito (
    Cod_Favoritos CHAR(4),
    Cod_Contenido CHAR(4),
    PRIMARY KEY(Cod_Favoritos, Cod_Contenido)
);

CREATE TABLE Historial (
    Cod_Perfil VARCHAR(12),
    Cod_Contenido CHAR(4),
    Fecha_Visualizacion DATE NOT NULL,
    PRIMARY KEY(Cod_Perfil, Cod_Contenido)
);

CREATE TABLE Serie (
    Cod_Serie CHAR(4),
    N_Temporada INT,
    Titulo VARCHAR(200) NOT NULL,
    Calificacion_Edad ENUM("tp", "8", "12", "16", "18") NOT NULL,
    Genero ENUM("Suspense", "Terror", "Comedia", "Accion", "Drama", "Fantasia", "Romance", "Aventura", "Ciencia Ficcion", "Belico", "Musical", "Documental") NOT NULL,
    Director VARCHAR(20) NOT NULL,
    Puntuacion_Media DEC(3, 2) DEFAULT 0,
    Productor VARCHAR(20) NOT NULL,
    Sinopsis VARCHAR(300) NOT NULL, 
    Fecha_Publicacion DATE NOT NULL,
    Portada VARCHAR(200) NOT NULL,
    Trailer VARCHAR(200) NOT NULL,
    Capitulos INT NOT NULL,
    PRIMARY KEY(Cod_Serie, N_Temporada)
);

CREATE TABLE Pelicula (
    Cod_Pelicula CHAR(4) PRIMARY KEY,
    Titulo VARCHAR(50) NOT NULL,
    Calificacion_Edad ENUM("tp", "8", "12", "16", "18") NOT NULL,
    Genero ENUM("Suspense", "Terror", "Comedia", "Accion", "Drama", "Fantasia", "Romance", "Aventura", "Ciencia Ficcion", "Belico", "Musical", "Documental") NOT NULL,
    Director VARCHAR(20) NOT NULL,
    Puntuacion_Media DEC(3, 2) DEFAULT 0,
    Productor VARCHAR(20) NOT NULL,
    Sinopsis VARCHAR(300) NOT NULL, 
    Fecha_Publicacion DATE NOT NULL,
    Portada VARCHAR(200) NOT NULL,
    Trailer VARCHAR(200) NOT NULL,
    Duracion INT NOT NULL
);

-- ALTER TABLES (Claves Foraneas) --

ALTER TABLE Cuenta ADD FOREIGN KEY (Tipo_Suscripcion) REFERENCES Suscripcion(Tipo_Suscripcion) ON DELETE CASCADE;

ALTER TABLE Perfil ADD FOREIGN KEY (Correo) REFERENCES Cuenta(Correo) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Perfil ADD FOREIGN KEY (Cod_Favoritos) REFERENCES Favoritos(Cod_Favoritos) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Contenido_Favorito ADD FOREIGN KEY (Cod_Contenido) REFERENCES Pelicula(Cod_Pelicula) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Contenido_Favorito ADD FOREIGN KEY (Cod_Contenido) REFERENCES Serie(Cod_Serie) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Contenido_Favorito ADD FOREIGN KEY (Cod_Favoritos) REFERENCES Favoritos(Cod_Favoritos) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Historial ADD FOREIGN KEY (Cod_Contenido) REFERENCES Pelicula(Cod_Pelicula) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Historial ADD FOREIGN KEY (Cod_Contenido) REFERENCES Serie(Cod_Serie) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Historial ADD FOREIGN KEY (Cod_Perfil) REFERENCES Perfil(Cod_Perfil) ON UPDATE CASCADE ON DELETE CASCADE;

-- Restricciones (CHECK) --

-- Favoritos Fecha_Creacion <= Fecha_Eliminacion
ALTER TABLE Favoritos ADD CONSTRAINT CreacionMayorEliminacion CHECK (Fecha_Creacion <= Fecha_Eliminacion);

-- Puntuacion_media > 0
ALTER TABLE Pelicula ADD CONSTRAINT ValoracionMayorIgualCero CHECK (Puntuacion_Media >= 0);
ALTER TABLE Serie ADD CONSTRAINT ValoracionMayorIgualCero CHECK (Puntuacion_Media >= 0);

-- Duracion > 0
ALTER TABLE Pelicula ADD CONSTRAINT DuracionMayorIgualCero CHECK (Duracion >= 0);

-- N_Temporada > 0
ALTER TABLE Serie ADD CONSTRAINT TemporadaMayorCero CHECK (N_Temporada > 0);

-- Precio de suscripcion > 0
ALTER TABLE Suscripcion ADD CONSTRAINT PrecioSuscripcionMayorZero CHECK (Precio > 0);

-- Max_Dispositivos de suscripcion > 0
ALTER TABLE Suscripcion ADD CONSTRAINT MaxDispositivosMayorZero CHECK (Max_Dispositivos > 0); 

-- Triggers --

-- Trigger que comprueba que no se puedan existir mas de 3 Tipos de Suscripcion

DROP TRIGGER IF EXISTS max_suscription; 
DELIMITER $$
CREATE TRIGGER max_suscription
BEFORE INSERT
ON Suscripcion
FOR EACH ROW
BEGIN

    DECLARE max_suscription_error CONDITION FOR SQLSTATE "45000";

    IF (SELECT COUNT(*) FROM Suscripcion) = 3 THEN
        SIGNAL max_suscription_error SET MESSAGE_TEXT = "No puede haber mas de 3 Tipos de Suscripcion";
    END IF;

END $$
DELIMITER ;

-- Trigger para la claves de Series S001 --

DELIMITER $$
DROP TRIGGER IF EXISTS Generar_Codigo_Serie $$
CREATE TRIGGER Generar_Codigo_Serie 
BEFORE INSERT 
ON Serie
FOR EACH ROW
BEGIN
    DECLARE contador INT;
        SET contador = (SELECT COUNT(*) + 1 FROM Serie); 
        IF (contador < 10) THEN
            SET NEW.Cod_Serie = CONCAT("S00", contador);
        ELSEIF (contador < 100) THEN
            SET NEW.Cod_Serie = CONCAT("S0", contador);
        ELSEIF (contador < 1000) THEN
            SET NEW.Cod_Serie = CONCAT("S", contador);      
        END IF; 
END $$
DELIMITER ;

-- Trigger para la claves de Peliculas P001 --

DELIMITER $$
DROP TRIGGER IF EXISTS Generar_Codigo_Pelicula $$
CREATE TRIGGER Generar_Codigo_Pelicula 
BEFORE INSERT 
ON Pelicula
FOR EACH ROW
BEGIN
    DECLARE contador INT;
        SET contador = (SELECT COUNT(*) + 1 FROM Pelicula); 
        IF (contador < 10) THEN
            SET NEW.Cod_Pelicula = CONCAT("P00", contador);
        ELSEIF (contador < 100) THEN
            SET NEW.Cod_Pelicula = CONCAT("P0", contador);
        ELSEIF (contador < 1000) THEN
            SET NEW.Cod_Pelicula = CONCAT("P", contador);      
        END IF;
END $$
DELIMITER ;

-- Insercion de Datos

INSERT INTO Cuenta VALUES 
    ("aitorinfo@hotmail.es", "Aitor", "Santana Cabrera", "C/ El Monte", "1992A_sc*", "689002130", "Premium"),
    ("saracabrera@gmail.com", "Sara", "Cabrera Sanchez", "C/ Los Tarajales", "sara125*", "662358941", "Estandar"),
    ("javimartel@hotmail.com", "Javier", "Martel Espino" "C/ Jose Perez", "MJav8795.", "614789500", "Basico"),
    ("lauritajua@gmail.com", "Laura", "Hernandez Gil", "A/ El Pintor", "lau123jua", "611240359", "Estandar"),
    ("juanma87@gmail.com", "Juan Manuel", "Perez Diaz", "C/ Paula Doreste", "87juanma2", "606218752", "Basico"),
    ("raulpokefan@hotmail.es", "Raul", "Navarro Lopez", "A/ Escaleritas", "*rauli54*", "623145896", "Premium");

INSERT INTO Perfil VALUES
    ("Perfil1", "aitorinfo@hotmail.es", "Aitorino", "Imagen2", "FV01"),
    ("Perfil2", "aitorinfo@hotmail.es", "Juani", "Imagen1", "FV02"),
    ("Perfil3", "aitorinfo@hotmail.es", "Paco", "Imagen2", "FV03"),
    ("Perfil4", "saracabrera@gmail.com", "SaraCS", "Imagen3", "FV04"),
    ("Perfil5", "javimartel@hotmail.com", "Javi", "Imagen1", "FV05"),
    ("Perfil6", "javimartel@hotmail.com", "Javi2", "Imagen2", "FV06"),
    ("Perfil7", "lauritajua@gmail.com", "Lau", "Imagen1", "FV07"),
    ("Perfil8", "lauritajua@gmail.com", "Luisa", "Imagen3", "FV08"),
    ("Perfil9", "juanma87@gmail.com", "Juanma", "Imagen2", "FV09"),
    ("Perfil10", "raulpokefan@hotmail.es", "Raul", "Imagen1", "FV10"),
    ("Perfil11", "raulpokefan@hotmail.es", "Ivan", "Imagen3", "FV11"),
    ("Perfil12", "raulpokefan@hotmail.es", "Paco", "Imagen1", "FV12"),
    ("Perfil13", "raulpokefan@hotmail.es", "Mario", "Imagen2", "FV13");

INSERT INTO Suscripcion VALUES 
    ("Basico", 8.99, "HD", 2),
    ("Estandar", 10.99, "Full HD", 4),
    ("Premium", 13.99, "4K", 7);

INSERT INTO Favoritos VALUES 
    ("FV01", "2021-10-02", NULL),
    ("FV02", "2021-11-22", "2022-01-03"),
    ("FV03", "2021-12-13", NULL),
    ("FV04", "2021-12-23", NULL),
    ("FV05", "2022-01-02", "2022-03-08"),
    ("FV06", "2022-01-30", NULL),
    ("FV07", "2022-02-11", "2022-03-12"),
    ("FV08", "2022-02-24", "2022-04-01"),
    ("FV09", "2022-02-26", NULL),
    ("FV10", "2022-03-10", NULL),
    ("FV11", "2022-03-19", "2022-05-10"),
    ("FV12", "2022-03-29", NULL),
    ("FV13", "2022-04-01", NULL),

INSERT INTO Contenido_Favorito VALUES 
    ("FV01", "P001"),
    ("FV01", "S003"),
    ("FV02", "P001"),
    ("FV02", "P002"),
    ("FV02", "P005"),
    ("FV02", "S003"),
    ("FV03", "P001"),
    ("FV03", "S002"),
    ("FV04", "S005"),
    ("FV05", "S006"),
    ("FV05", "P001"),
    ("FV05", "P004"),
    ("FV05", "P007"),
    ("FV05", "S005"),
    ("FV06", "S001"),
    ("FV06", "P001"),
    ("FV07", "P003"),
    ("FV08", "S003"),
    ("FV08", "S002"),
    ("FV08", "P005"),
    ("FV09", "P003"),
    ("FV09", "S001"),
    ("FV09", "S004"),
    ("FV10", "P006"),
    ("FV10", "P005"),
    ("FV10", "S005"),
    ("FV11", "S002"),
    ("FV11", "P003"),
    ("FV11", "P002"),
    ("FV12", "S005"),
    ("FV13", "S003"),
    ("FV13", "P006"),
    ("FV13", "P005"),
    ("FV13", "S003");

INSERT INTO Historial VALUES 
    ("Perfil1", "P002", "2021-11-02"),
    ("Perfil1", "S001", "2021-12-11"),
    ("Perfil2", "P003", "2021-11-02"),
    ("Perfil2", "P004", "2022-01-30"),
    ("Perfil2", "S002", "2022-02-02"),
    ("Perfil3", "S002", "2021-12-03"),
    ("Perfil3", "S003", "2021-12-12"),
    ("Perfil3", "P006", "2021-12-25"),
    ("Perfil4", "P001", "2022-03-09"),
    ("Perfil5", "S004", "2021-10-12"),
    ("Perfil5", "P001", "2021-10-22"),
    ("Perfil6", "S003", "2021-11-25"),
    ("Perfil6", "S006", "2021-12-01"),
    ("Perfil7", "P002", "2022-01-08"),
    ("Perfil7", "P003", "2022-01-14"),
    ("Perfil7", "S005", "2021-02-12"),
    ("Perfil7", "P007", "2021-03-05"),
    ("Perfil8", "P002", "2021-11-30"),
    ("Perfil8", "P005", "2021-12-15"),
    ("Perfil9", "P001", "2021-12-10"),
    ("Perfil9", "S006", "2021-12-19"),
    ("Perfil9", "S004", "2022-03-14"),
    ("Perfil9", "S003", "2022-03-22"),
    ("Perfil10", "P001", "2021-11-07"),
    ("Perfil11", "S003", "2022-02-12"),
    ("Perfil11", "P004", "2022-02-25"),
    ("Perfil12", "P005", "2022-04-01"),
    ("Perfil12", "P003", "2022-04-03"),
    ("Perfil12", "S001", "2022-05-09"),
    ("Perfil13", "S003", "2021-12-16");

INSERT INTO Series (N_Temporada, Titulo, Calificacion_Edad, Genero, Director, Puntuacion_Media, Productor, Sinopsis, Fecha_Publicacion, Portada, Trailer, Capitulos) VALUES
    (1, "Elite", "12", "Drama", "Ramon Salazar", 4.50, "Zeta Studios", "Tres alumnos becados comienzan a estudiar en un prestigioso colegio donde las diferencias entre los alumnos provocan un asesinato",
    "2018-10-05", "https://bolavip.com/__export/1595263470964/sites/bolavip/img/2020/07/20/elite_serie_netflix_portada_crop1595263470483.jpg_242310155.jpg" ,"https://www.youtube.com/watch?v=4rTBAlB1JkQ", 8),
    (2, "Elite", "12", "Drama", "Ramon Salazar", 3.75, "Zeta Studios", "Un alumno desaparece en el nuevo curso escolar haciendo que la investigacion del asesinato se dificulte",
    "2019-09-06", "https://static.wikia.nocookie.net/elite/images/3/39/Elite_S2.jpg/revision/latest?cb=20191017055945&path-prefix=es" ,"https://www.youtube.com/watch?v=c4V3N-2ARUw", 8),
    (1, "Marianne", "16", "Terror", "Samuel Bodin", 4, "Empreinte Digitale", "Una novelista se da cuenta de que sus historias de terror se hacen realidad y decide volver a su ciudad natal para enfrentarse a su pasado",
    "2019-10-13", "https://pics.filmaffinity.com/Marianne_Miniserie_de_TV-803387895-large.jpg", "https://www.youtube.com/watch?v=wMofLWJCV0U", 8),
    (1, "Black Mirror", "18", "Ciencia Ficcion", "Charlie Brooker", 4.50, "Zeppotron", "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
    "2011-12-04", "https://es.web.img2.acsta.net/pictures/18/05/22/15/58/5162529.jpg", "https://www.youtube.com/watch?v=zLZHdK6l55I", 3),
    (2, "Black Mirror", "18", "Ciencia Ficcion", "Charlie Brooker", 3.50, "Zeppotron", "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
    "2013-02-11", "https://es.web.img2.acsta.net/pictures/18/05/22/15/58/5329716.jpg", "https://www.youtube.com/watch?v=iHgEJeINo-Y", 3),
    (3, "Black Mirror", "18", "Ciencia Ficcion", "Charlie Brooker", 3.25, "House of Tomorrow", "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
    "2016-10-21", "https://www.formulatv.com/images/series/posters/600/602/1_m3.jpg", "https://www.youtube.com/watch?v=F0bf_ZjrYaI", 6),
    (4, "Black Mirror", "18", "Ciencia Ficcion", "Charlie Brooker", 3, "House of Tomorrow", "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
    "2017-12-29", "https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2017/12/28/5fa3e3e37e7f2.jpeg", "https://www.youtube.com/watch?v=kGZodefZty8", 6),
    (5, "Black Mirror", "18", "Ciencia Ficcion", "Charlie Brooker", 4.25, "House of Tomorrow", "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
    "2019-06-05", "https://es.web.img3.acsta.net/pictures/19/06/03/09/48/4443572.jpg", "https://www.youtube.com/watch?v=oviaUj5eUzU", 3),
    -- AÑADIR MAS SERIES
    ();
    

CREATE TABLE Pelicula (
    Cod_Pelicula CHAR(4) PRIMARY KEY,
    Titulo VARCHAR(50) NOT NULL,
    Calificacion_Edad ENUM("tp", "8", "12", "16", "18") NOT NULL,
    Genero ENUM("Suspense", "Terror", "Comedia", "Accion", "Drama", "Fantasia", "Romance", "Aventura", "Ciencia Ficcion", "Belico", "Musical", "Documental") NOT NULL,
    Director VARCHAR(20) NOT NULL,
    Puntuacion_Media DEC(3, 2) DEFAULT 0,
    Productor VARCHAR(20) NOT NULL,
    Sinopsis VARCHAR(300) NOT NULL, 
    Fecha_Publicacion DATE NOT NULL,
    Portada VARCHAR(200) NOT NULL,
    Trailer VARCHAR(200) NOT NULL,
    Duracion INT NOT NULL
);

INSERT INTO Pelicula(Titulo, Calificacion_Edad, Genero, Director, Puntuacion_Media, Productor, Sinopsis, Fecha_Publicacion, Portada, Trailer, Duracion) VALUES
("Titanic","tp", "Romance", "James Cameron", 3.45, "Warner Bros", "Pelicula que narra la historia del hundimiento del Titanic","1997-12-11",
"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSLITJy5IWUAnLlg6dtv8Pfgvf2Emoi8vjaqIUD_9tLWiPTbFv6",
"https://www.youtube.com/watch?v=wMZuro21wtE",120),
("Star Wars Episodio I","tp", "Ciencia Ficcion", "George Lucas", 4.95, "20TH FOX", "La amenaza Fantasma","1999-05-19",
"https://es.web.img2.acsta.net/medias/nmedia/18/86/33/09/19835623.jpg",
"https://www.youtube.com/watch?v=n1CUHjrc9Sc",134),
("Star Wars Episodio II","tp", "Ciencia Ficcion", "George Lucas", 4.99, "20TH FOX", "La batalla de los clones","2002-05-17",
"https://basededatos.atrae.org/media/works/oZNPzxqM2s5DyVWab09NTQScDQt.jpg",
"https://www.youtube.com/watch?v=DywnxIuPtUs",145),
("Avatar","tp", "Ciencia Ficcion", "James Cameron", 4.85, "20TH FOX", "Aventura en el espacio en un planeta lleno de vida y recursos","2009-12-08",
"https://static.wikia.nocookie.net/james-camerons-avatar/images/a/a7/Caratula_de_Avatar.png/revision/latest?cb=20150218032222&path-prefix=es",
"https://www.youtube.com/watch?v=Xg8kYk6uHN0",155),
("Spìderman No Way Home","12", "Ciencia Ficcion", "Jhon Watts", 5.00, "Marvel Studios", "Spiderman lucha por devolver la normalidad al Multiverso","2021-12-17",
"https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg",
"https://www.youtube.com/watch?v=ldMn-1iQzKE",155),
("Avengers Infinity War","tp", "Ciencia Ficcion", "Hermanos Russo", 4.95, "Marvel Studios", "Los vengadores se enfrentan a la amenaza mas importante: Thanos","2018-04-27",
"https://m.media-amazon.com/images/I/81GfZasnt9L._SL1371_.jpg",
"https://www.youtube.com/watch?v=-f5PwE_Q8Fs",160),
("Avengers End Game","tp", "Ciencia Ficcion", "Hermanos Russo", 5.00, "Marvel Studios", "La lucha final para restablecer la vida en el Universo Marvel","2019-04-25",
"https://m.media-amazon.com/images/I/81GfZasnt9L._SL1371_.jpg",
"https://www.youtube.com/watch?v=UQ3bqYKnyhM",165),
("Creed II: Defendiendo el Legado","16", "Drama", "Steven Caple Jr", 2.95, "20TH FOX", "Creed debe defender el legado de su padre","2018-11-14",
"https://m.media-amazon.com/images/I/81rpB-3qwoL._SL1500_.jpg",
"https://www.youtube.com/watch?v=PK7E64G3LnI",112),
("El Proyecto Adam","tp", "Comedia", "Shawn Levy", 2.45, "Netflix", "Adam viaja al pasado tras escaparse del Control de Seguridad del año 2050","2022-03-09",
"https://pics.filmaffinity.com/El_proyecto_Adam-392719853-large.jpg",
"https://www.youtube.com/watch?v=ZnJxmnko64o",136),
("Sonic 2","tp", "Fantasia", "Jeff Fowler", 3.7, "Paramount Pictures", "Sonic 2. La pelicula es una pelicula de comedia de accion y aventuras basada en la franquicia de videojuegos publicada por Sega. Es la secuela de Sonic, la pelicula y una vez mas esta dirigida por Jeff Fowler y escrita por Pat Casey, Josh Miller y John Whittington","1997-12-11",
"https://es.web.img3.acsta.net/pictures/22/02/18/10/20/5195258.jpg",
"https://www.youtube.com/watch?v=cF5uf8a2Xds",145),
("Fresh","16", "Terror", "Mimi Cave", 3.35, "Disney", "Fresh sigue a Noa, quien conoce al atractivo Steve en una tienda de comestibles y, dada su frustracion con las aplicaciones de citas, se arriesga y le da su numero.","2022-01-20",
"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sensacine.com%2Fpeliculas%2Fpelicula-286323%2F&psig=AOvVaw2s4u8oAGbFpEW12hDvg311&ust=1652903539007000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLCnguan5_cCFQAAAAAdAAAAABAD",
"https://www.youtube.com/watch?v=wKk5VAK1GZQ",117),

-- Faltan Datos Scream
("Scream","18", "Suspense", "Matt Bettinelli-Olpin, Tyler Gillett", 4.55, "Disney", "Fresh sigue a Noa, quien conoce al atractivo Steve en una tienda de comestibles y, dada su frustracion con las aplicaciones de citas, se arriesga y le da su numero.","2022-01-20",
"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sensacine.com%2Fpeliculas%2Fpelicula-286323%2F&psig=AOvVaw2s4u8oAGbFpEW12hDvg311&ust=1652903539007000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLCnguan5_cCFQAAAAAdAAAAABAD",
"https://www.youtube.com/watch?v=wKk5VAK1GZQ",117),

("It","12", "Terror", "Mimi Cave", 5.82, "AppleTV", "Fresh sigue a Noa, quien conoce al atractivo Steve en una tienda de comestibles y, dada su frustracion con las aplicaciones de citas, se arriesga y le da su numero.","2022-01-20",
"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sensacine.com%2Fpeliculas%2Fpelicula-286323%2F&psig=AOvVaw2s4u8oAGbFpEW12hDvg311&ust=1652903539007000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLCnguan5_cCFQAAAAAdAAAAABAD",
"https://www.youtube.com/watch?v=wKk5VAK1GZQ",192),