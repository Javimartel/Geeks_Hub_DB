# Introducción a Geeks Hub DB

## Antes de empezar

Este proyecto y su documentación están disponibles en [GitHub](https://github.com/Javimartel/Geeks_Hub_DB)

Puedes clonarlo ejecutando:

```bash=
$ git clone https://github.com/Javimartel/Geeks_Hub_DB.git
```

---

## Índice de contenidos

* [Introducción](#Introducción)
    * [Diagrama Entidad-Relación](#Diagrama-Entidad-Relación)
    * [Modelo Lógico](#Modelo-Lógico)
* [Desarrollo de Tablas](#Desarrollo-de-Tablas)
    * [Creación de Tablas](#Creación-de-Tablas)
    * [Claves Foráneas](#Claves-Foráneas)
    * [Restricciones](#Restricciones)
* [Inserción de Datos](#Inserción-de-Datos)

---

### Introducción


#### Diagrama Entidad-Relación

En primer lugar hemos creado el **Diagrama Entidad-Relación**, para poder unir cada tabla y obtener las **relaciones** correspondientes junto a sus **cardinalidades**, además de conocer los **atributos** pertenecientes a cada tabla.

![Diagrama Entidad-Relación](https://i.imgur.com/vIDdqpI.png)

---

#### Modelo Lógico

A continuación hemos creado el **Modelo Lógico** para poder saber si nuestro Diagrama está en **3FN** y de esta manera poder pasar a la creación de la Base de Datos.

| Nombre de Tabla | Atributos |
|---|---|
| Cuenta | (**Correo**, Nombre, Apellidos, Direccion, Contrasena, Telefono, Fecha_Nacimiento, *Tipo_Suscripcion*) | 
| Suscripción  | (**Tipo_Suscripcion**, Precio, Calidad_Videos, Max_Dispositivos) |
| Perfil | (**Cod_Perfil**, **Correo**, Nickname, Imagen) | 
| Perfil_Contenido *[Historial]*  | (**Cod_Perfil**, **Cod_Contenido**, Fecha_Visualizacion) | 
| Favoritos | (**Cod_Favoritos**, Fecha_Creacion, Fecha_Eliminacion) | 
| Contenido_Favorito | (**Cod_Favoritos**, **Cod_Contenido**) |
| Serie | (**Cod_Contenido**, **N_Temporada**, Titulo, Calificacion_Edades, Genero, Director, Puntuacion_Media, Productora, Sinopsis, Fecha_Publicacion, Portada, Trailer, N_Capitulos) | 
| Película | (**Cod_Contenido**, Titulo, Calificacion_Edades, Genero, Director, Puntuacion_Media, Productora, Sinopsis, Fecha_Publicacion, Portada, Trailer, Duracion) |

Como se puede observar, tenemos todas las tablas en **3FN** por lo que podemos avanzar.

---

### Desarrollo de Tablas

#### Creación de Tablas

Hemos creado las tablas asignando a cada atributo el tipo de dato que hemos considerado más adecuado.

Por ejemplo, la tabla **Cuenta** ha sido creada de esta manera:

```sql
CREATE TABLE Cuenta (
    Correo VARCHAR(30) PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL,
    Apellidos VARCHAR(35),
    Direccion VARCHAR(30),
    Contrasena VARCHAR(22) NOT NULL,
    Telefono VARCHAR(9),
    Tipo_Suscripcion ENUM("Basico", "Estandar", "Premium")
);
```

*Nota: hemos evitado utilizar **tildes** y la letra **"ñ"** para que no se produzcan **Warnings** en la consola.* 

Siguiendo esta estructura hemos creado todas las tablas para poder pasar al siguiente punto, las claves foráneas. 

Para ver el resto de tablas creadas pulsar [**aquí**](https://github.com/Javimartel/Geeks_Hub_DB/blob/main/streaming.sql).

---

#### Claves Foráneas

Para las claves foráneas hemos utilizado dos opciones, ***"ON UPDATE CASCADE"*** y ***"ON DELETE CASCADE"***

Primer ejemplo con la tabla **Cuenta**, a la que le hemos referenciado el atributo *"Tipo_Suscripcion"* al campo de la tabla **Suscripcion**:

```sql
ALTER TABLE Cuenta ADD FOREIGN KEY (Tipo_Suscripcion) REFERENCES Suscripcion(Tipo_Suscripcion) ON DELETE CASCADE;
```

Otro ejemplo podría ser con la tabla **Perfil** a la que le hemos referenciado el campo *"Correo"* al propio de la tabla **Cuenta**, de esta forma si se **modifica** o se **borra**, se actualizará el campo:

```sql
ALTER TABLE Perfil ADD FOREIGN KEY (Correo) REFERENCES Cuenta(Correo) ON UPDATE CASCADE ON DELETE CASCADE;
```

Para ver el resto de claves foráneas pulsar [**aquí**](https://github.com/Javimartel/Geeks_Hub_DB/blob/main/streaming.sql#L84).

---

#### Restricciones

Respecto a las restricciones, hemos tenido en cuenta evitar la inserción de datos **no válidos** para evitar errores en el funcionamiento de la base de datos.

Por ejemplo, en la lista de **Favoritos** la *fecha de eliminación* debe ser **sí** o **sí** posterior a la *fecha de creación*.

```sql
ALTER TABLE Favoritos ADD CONSTRAINT CreacionMayorEliminacion CHECK (Fecha_Creacion <= Fecha_Eliminacion);
```

Al insertar cualquier tipo de **Contenido** *(Serie o Película)*, la *puntuación media* **no** debe ser **menor** a 0.

```sql
ALTER TABLE Pelicula ADD CONSTRAINT ValoracionMayorIgualCero CHECK (Puntuacion_Media >= 0);
ALTER TABLE Serie ADD CONSTRAINT ValoracionMayorIgualCero CHECK (Puntuacion_Media >= 0);
```

Para ver el resto de restricciones pulsar [**aquí**](https://github.com/Javimartel/Geeks_Hub_DB/blob/main/streaming.sql#L99).

---

### Inserción de Datos

Antes de insertar los datos de nuestras tablas hemos tenido que utilizar **"SET FOREIGN_KEY_CHECKS = 0;”** para desactivar las claves foráneas y evitar posibles errores.

Al terminar de insertar nuestros datos hemos utilizado **“SET FOREIGN_KEY_CHECKS = 1;”** para volver a activar las claves foráneas.

Para ver todas las inserciones de datos pulsar [**aquí**](https://github.com/Javimartel/Geeks_Hub_DB/blob/main/inserts.sql).

---
