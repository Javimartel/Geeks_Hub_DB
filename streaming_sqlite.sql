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
