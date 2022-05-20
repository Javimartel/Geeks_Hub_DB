DROP DATABASE IF EXISTS streaming;
CREATE DATABASE streaming;
USE streaming;

CREATE TABLE Suscripcion (
    Tipo_Suscripcion TEXT CHECK (Tipo_Suscripcion IN ("Basico", "Estandar", "Premium")) PRIMARY KEY,
    Precio REAL,
    Calidad_Videos TEXT,
    Max_Dispositivos INTEGER        
);

CREATE TABLE Cuenta (
    Correo TEXT PRIMARY KEY,
    Nombre TEXT NOT NULL,
    Apellidos TEXT,
    Direccion TEXT,
    Contrasena TEXT NOT NULL,
    Telefono TEXT,
    Tipo_Suscripcion TEXT CHECK (Tipo_Suscripcion IN ("Basico", "Estandar", "Premium")),
    FOREIGN KEY (Tipo_Suscripcion) REFERENCES Suscripcion(Tipo_Suscripcion) ON DELETE CASCADE
);

CREATE TABLE Serie (
    Cod_Serie TEXT,
    N_Temporada INTEGER,
    Titulo TEXT NOT NULL,
    Calificacion_Edad TEXT NOT NULL CHECk (Calificacion_Edad IN ("tp", "8", "12", "16", "18")),
    Genero TEXT NOT NULL CHECK (Genero IN ("Suspense", "Terror", "Comedia", "Accion", "Drama", "Fantasia", "Romance", "Aventura", "Ciencia Ficcion", "Belico", "Musical", "Documental") ),
    Director TEXT NOT NULL,
    Puntuacion_Media REAL DEFAULT 0,
    Productor REAL NOT NULL,
    Sinopsis TEXT NOT NULL, 
    Fecha_Publicacion TEXT NOT NULL,
    Portada TEXT NOT NULL,
    Trailer TEXT NOT NULL,
    Capitulos INTEGER NOT NULL,
    PRIMARY KEY(Cod_Serie, N_Temporada)
);

CREATE TABLE Perfil (
    Cod_Perfil TEXT,
    Correo TEXT,
    Nickname TEXT NOT NULL,
    Imagen TEXT CHECK (Imagen IN ("Imagen1", "Imagen2", "Imagen3")),
    Cod_Favoritos TEXT,
    PRIMARY KEY(Cod_Perfil, Correo),
    FOREIGN KEY (Correo) REFERENCES Cuenta(Correo) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Cod_Favoritos) REFERENCES Favoritos(Cod_Favoritos) ON UPDATE CASCADE ON DELETE CASCADE
);