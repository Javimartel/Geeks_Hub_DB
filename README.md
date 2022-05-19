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

![Diagrama Entidad-Relación](https://i.imgur.com/cPeuHFe.png)


---

#### Modelo Lógico

A continuación hemos creado el **Modelo Lógico** para poder saber si nuestro Diagrama está en **3FN** y de esta manera poder pasar a la creación de la Base de Datos.

| Nombre de Tabla | Atributos |
|---|---|
| Cuenta | (**Correo**, Nombre, Apellidos, Direccion, Contrasena, Telefono, Fecha_Nacimiento, *Tipo_Suscripcion*) | 
| Suscripción  | (**Tipo_Suscripcion**, Precio, Calidad_Videos, Max_Dispositivos) |
| Perfil | (**Cod_Perfil**, Nickame, Imagen, **Correo**) | 
| Perfil_Contenido *[Historial]*  | (**Cod_Perfil**, **Cod_Contenido**, Fecha_Visualizacion) | 
| Favoritos | (**Cod_Favoritos**, Fecha_Creacion, Fecha_Eliminacion) | 
| Contenido_Favorito | (**Cod_Favoritos**, **Cod_Contenido**) |
| Serie | (**Cod_Contenido**, **N_Temporada**, Titulo, Calificacion_Edades, Genero, Director, Puntuacion_Media, Productora, Sinopsis, Fecha_Publicacion, Portada, Trailer, N_Capitulos) | 
| Película | (**Cod_Contenido**, Titulo, Calificacion_Edades, Genero, Director, Puntuacion_Media, Productora, Sinopsis, Fecha_Publicacion, Portada, Trailer, Duracion) |

Como se puede observar, tenemos todas las tablas en **3FN** por lo que podemos avanzar.

---

### Desarrollo de Tablas



#### Creación de Tablas



#### Claves Foráneas



#### Restricciones



---

### Inserción de Datos



---
