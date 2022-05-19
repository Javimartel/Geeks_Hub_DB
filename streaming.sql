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
