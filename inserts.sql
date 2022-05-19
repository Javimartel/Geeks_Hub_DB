-- Insercion de Datos --
SET
    FOREIGN_KEY_CHECKS = 0;

INSERT INTO
    Cuenta
VALUES
    (
        "aitorinfo@hotmail.es",
        "Aitor",
        "Santana Cabrera",
        "C/ El Monte",
        "1992A_sc*",
        "689002130",
        "Premium"
    ),
    (
        "saracabrera@gmail.com",
        "Sara",
        "Cabrera Sanchez",
        "C/ Los Tarajales",
        "sara125*",
        "662358941",
        "Estandar"
    ),
    (
        "javimartel@hotmail.com",
        "Javier",
        "Martel Espino",
        "C/ Jose Perez",
        "MJav8795.",
        "614789500",
        "Basico"
    ),
    (
        "lauritajua@gmail.com",
        "Laura",
        "Hernandez Gil",
        "A/ El Pintor",
        "lau123jua",
        "611240359",
        "Estandar"
    ),
    (
        "juanma87@gmail.com",
        "Juan Manuel",
        "Perez Diaz",
        "C/ Paula Doreste",
        "87juanma2",
        "606218752",
        "Basico"
    ),
    (
        "raulpokefan@hotmail.es",
        "Raul",
        "Navarro Lopez",
        "A/ Escaleritas",
        "*rauli54*",
        "623145896",
        "Premium"
    );

INSERT INTO
    Perfil
VALUES
    (
        "Perfil1",
        "aitorinfo@hotmail.es",
        "Aitorino",
        "Imagen2",
        "FV01"
    ),
    (
        "Perfil2",
        "aitorinfo@hotmail.es",
        "Juani",
        "Imagen1",
        "FV02"
    ),
    (
        "Perfil3",
        "aitorinfo@hotmail.es",
        "Paco",
        "Imagen2",
        "FV03"
    ),
    (
        "Perfil4",
        "saracabrera@gmail.com",
        "SaraCS",
        "Imagen3",
        "FV04"
    ),
    (
        "Perfil5",
        "javimartel@hotmail.com",
        "Javi",
        "Imagen1",
        "FV05"
    ),
    (
        "Perfil6",
        "javimartel@hotmail.com",
        "Javi2",
        "Imagen2",
        "FV06"
    ),
    (
        "Perfil7",
        "lauritajua@gmail.com",
        "Lau",
        "Imagen1",
        "FV07"
    ),
    (
        "Perfil8",
        "lauritajua@gmail.com",
        "Luisa",
        "Imagen3",
        "FV08"
    ),
    (
        "Perfil9",
        "juanma87@gmail.com",
        "Juanma",
        "Imagen2",
        "FV09"
    ),
    (
        "Perfil10",
        "raulpokefan@hotmail.es",
        "Raul",
        "Imagen1",
        "FV10"
    ),
    (
        "Perfil11",
        "raulpokefan@hotmail.es",
        "Ivan",
        "Imagen3",
        "FV11"
    ),
    (
        "Perfil12",
        "raulpokefan@hotmail.es",
        "Paco",
        "Imagen1",
        "FV12"
    ),
    (
        "Perfil13",
        "raulpokefan@hotmail.es",
        "Mario",
        "Imagen2",
        "FV13"
    );

INSERT INTO
    Suscripcion
VALUES
    ("Basico", 8.99, "HD", 2),
    ("Estandar", 10.99, "Full HD", 4),
    ("Premium", 13.99, "4K", 7);

INSERT INTO
    Favoritos
VALUES
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
    ("FV13", "2022-04-01", NULL);

INSERT INTO
    Contenido_Favorito
VALUES
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
    ("FV13", "S002");

INSERT INTO
    Historial
VALUES
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

-- Series --

INSERT INTO
    Serie (
        N_Temporada,
        Titulo,
        Calificacion_Edad,
        Genero,
        Director,
        Puntuacion_Media,
        Productor,
        Sinopsis,
        Fecha_Publicacion,
        Portada,
        Trailer,
        Capitulos
    )
VALUES
    -- Drama
    (
        1,
        "Elite",
        "12",
        "Drama",
        "Ramon Salazar",
        4.50,
        "Zeta Studios",
        "Tres alumnos becados comienzan a estudiar en un prestigioso colegio donde las diferencias entre los alumnos provocan un asesinato",
        "2018-10-05",
        "https://bolavip.com/__export/1595263470964/sites/bolavip/img/2020/07/20/elite_serie_netflix_portada_crop1595263470483.jpg_242310155.jpg",
        "https://www.youtube.com/watch?v=4rTBAlB1JkQ",
        8
    ),
    (
        2,
        "Elite",
        "12",
        "Drama",
        "Ramon Salazar",
        3.75,
        "Zeta Studios",
        "Un alumno desaparece en el nuevo curso escolar haciendo que la investigacion del asesinato se dificulte",
        "2019-09-06",
        "https://static.wikia.nocookie.net/elite/images/3/39/Elite_S2.jpg/revision/latest?cb=20191017055945&path-prefix=es",
        "https://www.youtube.com/watch?v=c4V3N-2ARUw",
        8
    ),
    -- Terror
    (
        1,
        "Marianne",
        "16",
        "Terror",
        "Samuel Bodin",
        4,
        "Empreinte Digitale",
        "Una novelista se da cuenta de que sus historias de terror se hacen realidad y decide volver a su ciudad natal para enfrentarse a su pasado",
        "2019-10-13",
        "https://pics.filmaffinity.com/Marianne_Miniserie_de_TV-803387895-large.jpg",
        "https://www.youtube.com/watch?v=wMofLWJCV0U",
        8
    ),
    -- Ciencia Ficcion
    (
        1,
        "Black Mirror",
        "18",
        "Ciencia Ficcion",
        "Charlie Brooker",
        4.50,
        "Zeppotron",
        "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
        "2011-12-04",
        "https://es.web.img2.acsta.net/pictures/18/05/22/15/58/5162529.jpg",
        "https://www.youtube.com/watch?v=zLZHdK6l55I",
        3
    ),
    (
        2,
        "Black Mirror",
        "18",
        "Ciencia Ficcion",
        "Charlie Brooker",
        3.50,
        "Zeppotron",
        "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
        "2013-02-11",
        "https://es.web.img2.acsta.net/pictures/18/05/22/15/58/5329716.jpg",
        "https://www.youtube.com/watch?v=iHgEJeINo-Y",
        3
    ),
    (
        3,
        "Black Mirror",
        "18",
        "Ciencia Ficcion",
        "Charlie Brooker",
        3.25,
        "House of Tomorrow",
        "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
        "2016-10-21",
        "https://www.formulatv.com/images/series/posters/600/602/1_m3.jpg",
        "https://www.youtube.com/watch?v=F0bf_ZjrYaI",
        6
    ),
    (
        4,
        "Black Mirror",
        "18",
        "Ciencia Ficcion",
        "Charlie Brooker",
        3,
        "House of Tomorrow",
        "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
        "2017-12-29",
        "https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2017/12/28/5fa3e3e37e7f2.jpeg",
        "https://www.youtube.com/watch?v=kGZodefZty8",
        6
    ),
    (
        5,
        "Black Mirror",
        "18",
        "Ciencia Ficcion",
        "Charlie Brooker",
        4.25,
        "House of Tomorrow",
        "Historias en una sociedad futura donde el ser humano convive con tecnologia avanzada que condiciona sus pensamientos y comportamientos",
        "2019-06-05",
        "https://es.web.img3.acsta.net/pictures/19/06/03/09/48/4443572.jpg",
        "https://www.youtube.com/watch?v=oviaUj5eUzU",
        3
    ),
    -- Fantasia
    (
        1,
        "The Mandalorian",
        "12",
        "Aventura",
        "Dave Filoni",
        4.5,
        "Fairview Entertainment",
        "El Mandaloriano se ubica tras la caída del Imperio y antes de que la Primera Orden surja. En la serie seguimos las aventuras de un pistolero solitario en los confines de la galaxia, lejos de la autoridad de la Nueva República",
        "2019-11-12",
        "https://es.web.img2.acsta.net/pictures/19/10/29/09/01/2094959.jpg",
        "https://www.youtube.com/watch?v=a98FDZ8viPs",
        8
    ),
    (
        2,
        "The Mandalorian",
        "12",
        "Aventura",
        "Dave Filoni",
        4,
        "Fairview Entertainment",
        "El Mandaloriano y el Niño continúan su viaje, enfrentándose a enemigos y reuniendo aliados en su camino a través de una peligrosa galaxia en la tumultuosa era después del colapso del Imperio Galáctico",
        "2020-10-30",
        "https://es.web.img3.acsta.net/pictures/20/09/15/17/06/1295785.jpg",
        "https://www.youtube.com/watch?v=8rrVLdSSOY8",
        8
    ),
    -- Suspense
    (
        1,
        "¿Quien mato a Sara?",
        "16",
        "Suspense",
        "David Ruiz",
        4.25,
        "Perro Azul",
        "Tras 18 años de cárcel, Álex hace pagar a los miembros de la familia Lazcano, quienes lo incriminaron en el asesinato de su hermana Sara para preservar su buen nombre",
        "2021-03-24",
        "https://es.web.img3.acsta.net/pictures/21/03/03/05/30/3663120.jpg",
        "https://www.youtube.com/watch?v=tyU4zz_ds-s",
        10
    ),
    (
        2,
        "¿Quien mato a Sara?",
        "16",
        "Suspense",
        "David Ruiz",
        3.5,
        "Perro Azul",
        "Para concretar su venganza, Álex tendrá que adentrarse en la oscura psique de su hermana y aceptar el hecho de que nunca conoció a la verdadera Sara.",
        "2021-05-19",
        "https://i.blogs.es/782349/quien-mato-sara-temporada-2/1366_2000.jpeg",
        "https://www.youtube.com/watch?v=0bQ55akiXB0",
        8
    ),
    (
        3,
        "¿Quien mato a Sara?",
        "16",
        "Suspense",
        "David Ruiz",
        3.75,
        "Perro Azul",
        "Alex descubre que tiene una sobrina que es idéntica a su hermana Sara, el papá de Nicandro es el que está detrás de todo lo que ha pasado con Sara",
        "2022-05-18",
        "https://pbs.twimg.com/media/FKMlCuAUYAAEsGI.jpg",
        "https://www.youtube.com/watch?v=PjM7eOpHjUI",
        7
    ),
    -- Romance 
    (
        1,
        "Bridgerton",
        "12",
        "Romance",
        "Chris Van Dusen",
        4.5,
        "Shondaland",
        "Es una historia de amor que se ubica en el Periodo Regencia de Reino Unido, un relato que parte desde un punto de vista feminista. Sigue a personajes de la alta sociedad británica, explorando sus vidas, conflictos, problemas y toda clase de dilemas. Este mundo se muestra abierto desde la posición de la familia Bridgerton",
        "2020-12-25",
        "https://es.web.img3.acsta.net/pictures/20/11/04/12/03/4756219.jpg?coixp=50&coiyp=32",
        "https://www.youtube.com/watch?v=GErgslxZeME",
        8
    ),
    (
        2,
        "Bridgerton",
        "12",
        "Romance",
        "Chris Van Dusen",
        4.25,
        "Shondaland",
        "Es una historia de amor que se ubica en el Periodo Regencia de Reino Unido, un relato que parte desde un punto de vista feminista. Sigue a personajes de la alta sociedad británica, explorando sus vidas, conflictos, problemas y toda clase de dilemas. Este mundo se muestra abierto desde la posición de la familia Bridgerton",
        "2022-03-25",
        "https://es.web.img3.acsta.net/pictures/22/03/10/12/40/4798734.jpg",
        "https://www.youtube.com/watch?v=37tbdL5_C_s",
        8
    ),
    -- Documental
    (
        1,
        "En pocas palabras",
        "12",
        "Documental",
        "Ezra Klein",
        4,
        "Vox",
        "Esta reveladora serie de Vox indaga en una gran variedad de temas, como el nacimiento de la criptomoneda, por qué fracasan las dietas y el alocado mundo del pop coreano",
        "2018-05-23",
        "https://es.web.img2.acsta.net/pictures/20/06/21/23/10/1331780.jpg",
        "https://www.youtube.com/watch?v=WxYeus3Mlr0",
        20
    ),
    (
        2,
        "En pocas palabras",
        "12",
        "Documental",
        "Ezra Klein",
        4,
        "Vox",
        "Esta reveladora serie de Vox indaga en una gran variedad de temas, como el nacimiento de la criptomoneda, por qué fracasan las dietas y el alocado mundo del pop coreano",
        "2019-09-26",
        "https://image.tmdb.org/t/p/w342/xtplg03TPvOqWhDvORxaz6WopRm.jpg",
        "https://www.youtube.com/watch?v=WxYeus3Mlr0",
        10
    ),
    (
        3,
        "En pocas palabras",
        "12",
        "Documental",
        "Ezra Klein",
        4,
        "Vox",
        "Esta reveladora serie de Vox indaga en una gran variedad de temas, como el nacimiento de la criptomoneda, por qué fracasan las dietas y el alocado mundo del pop coreano",
        "2021-08-13",
        "https://es.web.img2.acsta.net/pictures/20/06/21/23/10/1331780.jpg",
        "https://www.youtube.com/watch?v=WxYeus3Mlr0",
        14
    ),
    -- Musical
    (
        1,
        "Erase una vez... pero ya no",
        "12",
        "Musical",
        "Manolo Caro",
        3.5,
        "Noc Noc Cinema",
        "Cuenta la historia de dos amantes que fueron separados trágicamente y que deben encontrarse en otra vida para romper el hechizo que cayó sobre el excéntrico pueblo que habitan. Ahora, en el presente, la llegada de dos turistas pondrá en riesgo la única posibilidad que tienen de romper el hechizo",
        "2022-03-11",
        "https://pics.filmaffinity.com/rase_una_vez_pero_ya_no_Serie_de_TV-832731027-large.jpg",
        "https://www.youtube.com/watch?v=4PA_jcv2784",
        6
    ),
    -- Belico
    (
        1,
        "The Liberator",
        "16",
        "Belico",
        "Greg Jonkajtys",
        4,
        "A&E Studios",
        "La ficción narra lo sucedido en el campo de batalla del rebelde oficial del Ejército Félix Sparks y su equipo compuesto por: vaqueros, nativos americanos y mexicoamericanos. Una historia real de lo que fue la marcha más sangrientas para conseguir la victoria en la Segunda Guerra Mundial",
        "2020-11-11",
        "https://es.web.img2.acsta.net/pictures/20/10/13/08/12/1993324.jpg",
        "https://www.youtube.com/watch?v=w2ze9eZ1WFs",
        4
    ),
    (
        1,
        "Barbaros",
        "16",
        "Belico",
        "Andres Heckmann",
        3.75,
        "Netflix",
        "El conflicto de lealtades de un oficial romano, dividido entre el imperio en el que creció y la gente de su propia tribu, desemboca en un épico enfrentamiento histórico.",
        "2020-10-23",
        "https://pics.filmaffinity.com/B_rbaros_Serie_de_TV-918771969-mmed.jpg",
        "https://www.youtube.com/watch?v=6UyACoBF2uk",
        6
    ),
    -- Comedia
    (
        1,
        "Dollface",
        "16",
        "Comedia",
        "Jordan Weiss",
        4.5,
        "Clubhouse Pictures",
        "Dollface se centra en Jules, una joven cuyo novio la deja, rompiendo una relación de muchos años. Afectada por lo sucedido, la protagonista tiene que recordar cómo vivir si el que ahora es su ex pareja, y volver a entrar en el mundo de las mujeres, recuperando relaciones con amigas que había dejado atrás",
        "2019-11-15",
        "https://es.web.img2.acsta.net/pictures/19/10/21/09/08/1111110.jpg",
        "https://www.youtube.com/watch?v=6_zl8nhQ2bY",
        10
    ),
    (
        2,
        "Dollface",
        "16",
        "Comedia",
        "Jordan Weiss",
        4,
        "Clubhouse Pictures",
        "Dollface se centra en Jules, una joven cuyo novio la deja, rompiendo una relación de muchos años. Afectada por lo sucedido, la protagonista tiene que recordar cómo vivir si el que ahora es su ex pareja, y volver a entrar en el mundo de las mujeres, recuperando relaciones con amigas que había dejado atrás",
        "2022-02-11",
        "https://images.justwatch.com/poster/263780202/s592/temporada-2",
        "https://www.youtube.com/watch?v=hI0ncmUPtbs",
        10
    ),
    -- Accion
    (
        1,
        "Estacion 19",
        "12",
        "Accion",
        "Stacy McKee",
        4.25,
        "ABC Studios",
        "Ambientada en Seattle, la serie se centra en las vidas de las mujeres y hombres en el departamento de bomberos de Seattle Fire estación 19. La serie es producida por Shondaland y ABC Signature, con McKee sirviendo como showrunner",
        "2018-03-22",
        "https://mx.web.img3.acsta.net/pictures/19/05/09/07/39/4240676.jpg",
        "https://www.youtube.com/watch?v=YYW64RgFdxk",
        10
    ),
    (
        2,
        "Estacion 19",
        "12",
        "Accion",
        "Stacy McKee",
        4.25,
        "ABC Studios",
        "La segunda temporada encuentra al heroico cuerpo de bomberos de la Estación 19 luchando con las consecuencias del incendio mortal. La vida de su antiguo capitán, Pruitt, pende de un hilo después de importantes complicaciones de salud. Ya no es un novato, Ben busca su lugar en el equipo",
        "2018-10-04",
        "https://mx.web.img2.acsta.net/pictures/19/05/09/07/41/3281788.jpg",
        "https://www.youtube.com/watch?v=0StAYVc9Gnk",
        17
    ),
    (
        3,
        "Estacion 19",
        "12",
        "Accion",
        "Stacy McKee",
        4.25,
        "ABC Signature",
        "La tercera temporada se centra en el estilo y ciclo de vida impredecibles del equipo de socorristas, que afectarán significativamente las relaciones dentro y fuera de la estación de bomberos",
        "2020-01-23",
        "https://es.web.img3.acsta.net/pictures/20/01/14/20/47/2026722.jpg",
        "https://www.youtube.com/watch?v=jazcEA_OaWo",
        16
    ),
    (
        4,
        "Estacion 19",
        "12",
        "Accion",
        "Stacy McKee",
        4.25,
        "ABC Signature",
        "En el final de la tercera temporada Ben, Jackson y Emmett se ponen en una posición precaria y peligrosa que podría tener una posible víctima. Mientras tanto, Andy continúa sospechandp de la muerte de su madre, así que decide acudir a su tía para obtener respuestas",
        "2020-11-12",
        "https://es.web.img3.acsta.net/pictures/20/09/18/09/13/5093273.jpg",
        "https://www.youtube.com/watch?v=Dw7w8QUEaRU",
        16
    );

-- Peliculas --

INSERT INTO
    Pelicula (
        Titulo,
        Calificacion_Edad,
        Genero,
        Director,
        Puntuacion_Media,
        Productor,
        Sinopsis,
        Fecha_Publicacion,
        Portada,
        Trailer,
        Duracion
    )
VALUES
    -- Romance
    (
        "Titanic",
        "tp",
        "Romance",
        "James Cameron",
        3.45,
        "Warner Bros",
        "Pelicula que narra la historia del hundimiento del Titanic",
        "1997-12-11",
        "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSLITJy5IWUAnLlg6dtv8Pfgvf2Emoi8vjaqIUD_9tLWiPTbFv6",
        "https://www.youtube.com/watch?v=wMZuro21wtE",
        120
    ),
    (
        "Yo antes de ti",
        "12",
        "Romance",
        "The Sharrock",
        4.8,
        "Netflix",
        "A menudo uno encuentra al amor donde menos lo espera. A veces te lleva a donde nunca imaginaste ir... ",
        "2016-07-01",
        "https://m.media-amazon.com/images/M/MV5BMmQxNzQyNTItMjM1OS00M2Q0LTg4YzUtNzlhZDJiNjNjM2FlXkEyXkFqcGdeQXVyMTAyOTE2ODg0._V1_.jpg",
        "https://www.youtube.com/watch?v=77wgbw-NKnY",
        110
    ),
    -- Ciencia Ficción
    (
        "Star Wars Episodio I",
        "tp",
        "Ciencia Ficcion",
        "George Lucas",
        4.95,
        "20TH FOX",
        "La amenaza Fantasma",
        "1999-05-19",
        "https://es.web.img2.acsta.net/medias/nmedia/18/86/33/09/19835623.jpg",
        "https://www.youtube.com/watch?v=n1CUHjrc9Sc",
        134
    ),
    (
        "Star Wars Episodio II",
        "tp",
        "Ciencia Ficcion",
        "George Lucas",
        4.99,
        "20TH FOX",
        "La batalla de los clones",
        "2002-05-17",
        "https://basededatos.atrae.org/media/works/oZNPzxqM2s5DyVWab09NTQScDQt.jpg",
        "https://www.youtube.com/watch?v=DywnxIuPtUs",
        145
    ),
    (
        "Avatar",
        "tp",
        "Ciencia Ficcion",
        "James Cameron",
        4.85,
        "20TH FOX",
        "Aventura en el espacio en un planeta lleno de vida y recursos",
        "2009-12-08",
        "https://static.wikia.nocookie.net/james-camerons-avatar/images/a/a7/Caratula_de_Avatar.png/revision/latest?cb=20150218032222&path-prefix=es",
        "https://www.youtube.com/watch?v=Xg8kYk6uHN0",
        155
    ),
    (
        "Spiderman No Way Home",
        "12",
        "Ciencia Ficcion",
        "Jhon Watts",
        5.00,
        "Marvel Studios",
        "Spiderman lucha por devolver la normalidad al Multiverso",
        "2021-12-17",
        "https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg",
        "https://www.youtube.com/watch?v=ldMn-1iQzKE",
        155
    ),
    (
        "Avengers Infinity War",
        "tp",
        "Ciencia Ficcion",
        "Hermanos Russo",
        4.95,
        "Marvel Studios",
        "Los vengadores se enfrentan a la amenaza mas importante: Thanos",
        "2018-04-27",
        "https://m.media-amazon.com/images/I/81GfZasnt9L._SL1371_.jpg",
        "https://www.youtube.com/watch?v=-f5PwE_Q8Fs",
        160
    ),
    (
        "Avengers End Game",
        "tp",
        "Ciencia Ficcion",
        "Hermanos Russo",
        5.00,
        "Marvel Studios",
        "La lucha final para restablecer la vida en el Universo Marvel",
        "2019-04-25",
        "https://m.media-amazon.com/images/I/81GfZasnt9L._SL1371_.jpg",
        "https://www.youtube.com/watch?v=UQ3bqYKnyhM",
        165
    ),
    -- Drama
    (
        "Creed II: Defendiendo el Legado",
        "16",
        "Drama",
        "Steven Caple Jr",
        2.95,
        "20TH FOX",
        "Creed debe defender el legado de su padre",
        "2018-11-14",
        "https://m.media-amazon.com/images/I/81rpB-3qwoL._SL1500_.jpg",
        "https://www.youtube.com/watch?v=PK7E64G3LnI",
        112
    ),
    (
        "Muerte en Nilo",
        "16",
        "Drama",
        "Kenneth Branagh",
        3.00,
        "20TH FOX",
        "El detective Hercule Poirot investiga el asesinato de una rica y joven heredera a bordo del mismo crucero por el río Nilo en el que pasa las vacaciones Poirot.",
        "2022-02-18",
        "https://pics.filmaffinity.com/Muerte_en_el_Nilo-335836399-large.jpg",
        "https://www.youtube.com/watch?v=2HQPNRtMbJ0",
        127
    ),
    -- Comedia
    (
        "El Proyecto Adam",
        "tp",
        "Comedia",
        "Shawn Levy",
        2.45,
        "Netflix",
        "Adam viaja al pasado tras escaparse del Control de Seguridad del año 2050",
        "2022-03-09",
        "https://pics.filmaffinity.com/El_proyecto_Adam-392719853-large.jpg",
        "https://www.youtube.com/watch?v=ZnJxmnko64o",
        136
    ),
    (
        "Vuelta al insti",
        "12",
        "Comedia",
        "Alex Hardcastle",
        2.75,
        "Netflix",
        "Una estudiante de secundaria y animadora entra en coma antes de su baile de graduación. Veinte años después, cuando se despierta, quiere volver al instituto para recuperar su popularidad y convertirse en la reina del baile de graduación.",
        "2022-05-13",
        "https://i0.wp.com/noescinetodoloquereluce.com/wp-content/uploads/2022/05/Poster-Vuelta-al-insti.jpg?fit=429%2C600&ssl=1",
        "https://www.youtube.com/watch?v=sm6PsZ4D6vk",
        113
    ),
    -- Fantasia
    (
        "Sonic 2",
        "tp",
        "Fantasia",
        "Jeff Fowler",
        3.7,
        "Paramount Pictures",
        "Sonic 2. La pelicula es una pelicula de comedia de accion y aventuras basada en la franquicia de videojuegos publicada por Sega. Es la secuela de Sonic, la pelicula y una vez mas esta dirigida por Jeff Fowler y escrita por Pat Casey, Josh Miller y John Whittington",
        "1997-12-11",
        "https://es.web.img3.acsta.net/pictures/22/02/18/10/20/5195258.jpg",
        "https://www.youtube.com/watch?v=cF5uf8a2Xds",
        145
    ),
    (
        "Encanto",
        "tp",
        "Fantasia",
        "Byron Howard",
        4.1,
        "Disney",
        "En una casa mágica, vive la extraordinaria familia Madrigal donde todos tienen habilidades fantásticas.",
        "2021-11-26",
        "https://laminute.info/wp-content/uploads/2021/11/29323514.jpg",
        "https://www.youtube.com/watch?v=SAH_W9q_brE",
        109
    ),
    -- Terror
    (
        "Fresh",
        "16",
        "Terror",
        "Mimi Cave",
        3.35,
        "Disney",
        "Fresh sigue a Noa, quien conoce al atractivo Steve en una tienda de comestibles y, dada su frustracion con las aplicaciones de citas, se arriesga y le da su numero.",
        "2022-01-20",
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sensacine.com%2Fpeliculas%2Fpelicula-286323%2F&psig=AOvVaw2s4u8oAGbFpEW12hDvg311&ust=1652903539007000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLCnguan5_cCFQAAAAAdAAAAABAD",
        "https://www.youtube.com/watch?v=wKk5VAK1GZQ",
        117
    ),
    (
        "It",
        "16",
        "Terror",
        "Andrés Muschietti",
        4.32,
        "Warner Bros",
        "Varios niños de una pequeña ciudad del estado de Maine se alían para combatir a una entidad diabólica que adopta la forma de un payaso y desde hace mucho tiempo emerge cada 27 años para saciarse de sangre infantil.",
        "2017-09-08",
        "https://pics.filmaffinity.com/It-787119144-large.jpg",
        "https://www.youtube.com/watch?v=9jhtucvduSw",
        135
    ),
    -- Suspense
    (
        "Scream",
        "18",
        "Suspense",
        "Matt Bettinelli-Olpin, Tyler Gillett",
        2.85,
        "Paramount Pictures",
        "Fresh sigue a Noa, quien conoce al atractivo Steve en una tienda de comestibles y, dada su frustracion con las aplicaciones de citas, se arriesga y le da su numero.",
        "2022-01-20",
        "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/41abe198c2d35b7db647d33b93a14a8014e71f598aa4f22e13006ccfdd03230a._RI_V_TTW_.jpg",
        "https://www.youtube.com/watch?v=LItQuV1bFf4",
        114
    ),
    (
        "Nadie",
        "18",
        "Suspense",
        "Ilya Naishuller",
        3.85,
        "Universal Pictures",
        "Un transeúnte interviene para ayudar a una mujer que está siendo acosada por un grupo de hombres y se convierte en el objetivo de un vengativo narcotraficante.",
        "2021-03-26",
        "https://pics.filmaffinity.com/Nadie-793040499-large.jpg",
        "https://www.youtube.com/watch?v=Mzrib73dVbc",
        92
    ),
    -- Accion
    (
        "Tyler Rake",
        "16",
        "Accion",
        "Sam Hargrave",
        2.99,
        "Netflix",
        "Tyler Rake, un intrépido mercenario, es enviado a Bangladesh por un poderoso mafioso encarcelado para que salve a su hijo secuestrado.",
        "2020-04-24",
        "https://pics.filmaffinity.com/Tyler_Rake-748147420-large.jpg",
        "https://www.youtube.com/watch?v=WPQq7fw_XMk",
        120
    ),
    (
        "Jurassic World: El reino caído",
        "12",
        "Accion",
        "Juan Antonio Bayona",
        4.4,
        "Netflix"
        "Owen y Claire intentan salvar a los dinosaurios que quedan en la isla ante el peligro de erupción de un volcán.",
        "2018-05-21",
        "http://5b0988e595225.cdn.sohucs.com/images/20181220/1a6dca5dc03642989057386e77feb554.jpeg",
        "https://www.youtube.com/watch?v=Pbxxz5uytCo",
        129
    ),
    -- Aventura
    (
        "The Batman",
        "12",
        "Aventura",
        "Matt Reeves",
        2.99,
        "DC Entertaiment",
        "En su segundo año luchando contra el crimen, Batman explora la corrupción existente en la ciudad de Gotham y el vínculo de esta con su propia familia. Además, entrará en conflicto con un asesino en serie conocido como 'el Acertijo'.",
        "2022-03-04",
        "https://pics.filmaffinity.com/The_Batman-449856406-large.jpg",
        "https://www.youtube.com/watch?v=IqRRLA6pZvo",
        120
    ),
    (
        "Uncharted",
        "16",
        "Aventura",
        "Ruben Fleischer",
        3.69,
        "Sony Pictures",
        "Nathan Drake y su compañero Victor Sullivan se adentran en la peligrosa búsqueda del mayor tesoro jamás encontrado. Al mismo tiempo, rastrean pistas que puedan conducir al hermano perdido de Drake.",
        "2022-02-11",
        "https://pics.filmaffinity.com/Uncharted-417211360-large.jpg",
        "https://www.youtube.com/watch?v=t_uYnyHWOsY",
        115
    ),
    -- Belico
    (
        "Top Gun Maverick",
        "12",
        "Belico",
        "Joseph Kosinski",
        3.99,
        "Paramount Pictures",
        "Tras más de 30 años de servicio como uno de los mejores aviadores de la Armada, Pete 'Maverick' Mitchel se encuentra dónde siempre quiso estar, empujando los límites como un valiente piloto de prueba.",
        "2022-05-24",
        "https://pics.filmaffinity.com/Top_Gun_Maverick-863584703-large.jpg",
        "https://www.youtube.com/watch?v=zmFdhZ6gyUM",
        131
    ),
    (
        "Hasta el último hombre",
        "16",
        "Belico",
        "Mel Gibson",
        4.9,
        "Movistar+",
        "Esta es la historia de Desmond T. Doss, un hombre contrario a la violencia que combatió como médico en la Segunda Guerra Mundial sin portar un arma. No disparó ni una bala, pero salvó a 75 personas de la muerte en la batalla de la isla de Okinawa.",
        "2016-11-23",
        "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/94677fc4ceb4d72363b5838aadc0e4b3f7c3cceea2df47ddd954f426b12d22f8._RI_V_TTW_.jpg",
        "https://www.youtube.com/watch?v=HpW6qzO4LHI",
        139
    ),
    -- Musical 
    (
        "La La Land",
        "12",
        "Musical",
        "Damien Chazelle",
        4.39,
        "Summit Entertaiment",
        "La La Land es una película dramática y musical estadounidense de 2016, escrita y dirigida por Damien Chazelle, y protagonizada por Emma Stone y Ryan Gosling, una aspirante a actriz y un pianista de jazz que se conocen y enamoran en Los Ángeles, California.",
        "2022-05-24",
        "https://pics.filmaffinity.com/La_ciudad_de_las_estrellas_La_La_Land-262021831-large.jpg",
        "https://www.youtube.com/watch?v=IHbHn5SLhZo",
        128
    ),
    (
        "West Side Story",
        "12",
        "Musical",
        "Steven Spielberg",
        3.9,
        "Disney+",
        "Dos adolescentes de diferentes raíces étnicas se enamoran en la ciudad de Nueva York de los años 50. ",
        "2021-12-10",
        "https://www.fhkiruna.se/_UPL/affisch/1117.jpg",
        "https://www.youtube.com/watch?v=Q2Pg67Hfz3Q",
        156
    ),
    -- Documental
    (
        "Elon Musk: The Real Life Iron Man",
        "tp",
        "Documental",
        "Sonia Anderson",
        3.39,
        "Netflix",
        "Este documental gira en torno a la vida de Elon Musk y sus innovadoras ideas en tecnología de viajes, inteligencia artificial y vuelos espaciales.",
        "2018-05-14",
        "httpshttps://images-na.ssl-images-amazon.com/images/S/pv-target-images/3f17d87c2ce071ecf1854d359c223f785c6226f862627f8beab86b75526f8722._RI_V_TTW_.jpg",
        "https://www.youtube.com/watch?v=qVxuLkvsknE",
        74
    ),
    (
        "El Estafador de Tinder",
        "18",
        "Documental",
        "Felicity Morris",
        4.39,
        "Netflix",
        "Él se hacía pasar por magnate con una vida de lujo y seducía a mujeres por Internet para robarles millones de dólares. Ahora, sus víctimas se han unido para vengarse juntas.",
        "2022-02-02",
        "https://pics.filmaffinity.com/El_timador_de_Tinder-488072708-large.jpg",
        "https://www.youtube.com/watch?v=91WMWCCQUyg",
        74
    );

SET
    FOREIGN_KEY_CHECKS = 1;