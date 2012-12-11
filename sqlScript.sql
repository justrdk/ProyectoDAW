create database cines;
    use cines;

    CREATE TABLE Cuenta(
        cuenta VARCHAR(20) NOT NULL,
        password VARCHAR(32) NOT NULL,
        nombre VARCHAR(20) NOT NULL,
        edad INT NOT NULL,
        noIdentidad VARCHAR(13) NOT NULL,
        PRIMARY KEY(cuenta)
        );

    CREATE TABLE Cine(
        idCine INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(20) NOT NULL,
        ciudad VARCHAR(50) NOT NULL,
        vision VARCHAR(200) NOT NULL,
        mision VARCHAR(200) NOT NULL,
        logo VARCHAR (300) NOT NULL,
        latitud VARCHAR(100) NOT NULL,
        longitud VARCHAR(100) NOT NULL,
        PRIMARY KEY (idCine)
        );

    CREATE TABLE Sala(
        idSala INT NOT NULL AUTO_INCREMENT,
        idCine INT NOT NULL,
        nombre VARCHAR(20) NOT NULL,
        capacidad INT NOT NULL,
        PRIMARY KEY (idSala),
        FOREIGN KEY (idCine) REFERENCES Cine(idCine)
        ON DELETE NO ACTION ON UPDATE CASCADE 
        );

    CREATE TABLE Pelicula(
        idPelicula INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        duracion VARCHAR(30) NOT NULL,
        rating VARCHAR (50) NOT NULL,
        sinopsis VARCHAR(200) NOT NULL,
        director VARCHAR(40) NOT NULL,
        trailer VARCHAR(200) NOT NULL,
        year INT NOT NULL,
        genero VARCHAR(30) NOT NULL,
        idioma VARCHAR(30) NOT NULL,
        formato VARCHAR(40) NOT NULL,
        imagenDescriptiva VARCHAR(300) NOT NULL,
        PRIMARY KEY (idPelicula)
        );

    CREATE TABLE Tanda(
        idTanda INT NOT NULL AUTO_INCREMENT,
        fecha DATE NOT NULL,
        hora_inicial VARCHAR(25) NOT NULL,
        hora_final VARCHAR(25) NOT NULL,
        idSala INT NOT NULL,
        idPelicula INT NOT NULL,
        configuracionSillas BLOB NOT NULL,
        PRIMARY KEY(idTanda,fecha,hora_inicial,hora_final),
        FOREIGN KEY (idSala) REFERENCES Sala(idSala)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        FOREIGN KEY (idPelicula) REFERENCES Pelicula(idPelicula)
        ON DELETE NO ACTION ON UPDATE CASCADE
        );
		
    CREATE TABLE Precio(
		idPrecio VARCHAR(30) NOT NULL,
		precio DECIMAL(5,2) UNSIGNED NOT NULL,
		PRIMARY KEY (idPrecio)
	);

    CREATE TABLE Ticket(
        idTicket INT NOT NULL AUTO_INCREMENT,
        idPelicula INT NOT NULL,
        idTanda INT NOT NULL,
        idPrecio VARCHAR(10) NOT NULL,
		fecha DATE NOT NULL,
        PRIMARY KEY (idTicket), 
        FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        FOREIGN KEY (idTanda) REFERENCES Tanda (idTanda)
        ON DELETE NO ACTION ON UPDATE CASCADE,
		FOREIGN KEY (idPrecio) REFERENCES Precio (idPrecio)
        ON DELETE NO ACTION ON UPDATE NO ACTION
        );

    INSERT INTO CUENTA VALUES ('admin',MD5('admin'),'osman',20,'0801199207544');

    INSERT INTO CINE VALUES (default,'Cinemark','Tegucigalpa','Para el 2020 Ser el cento de entrenimiento principal de latinoamerica','Ser el mejor cine en centroamerica','http://www.cinemarkca.com/imgs/themes/cinemark/logo-cinemark-blanco.png','14.090981078624113','-87.18333721160889');

    INSERT INTO CINE VALUES (default,'Cinepolis','Tegucigalpa','Para el 2014 Ser el cento de entrenimiento principal de latinoamerica','Ser el mejor cine en honduras','http://cinepolis.hn/imagenes_/png/logo-cinepolis.png','14.077015787291305','-87.2001600265503');

    INSERT INTO PELICULA VALUES(default,'Black Hawk Down','120 minutos','R','Pelicula de Guerra que toma lugar en Somalia,Africa.','Ridley Scott','http://www.youtube.com/watch?v=tnV6wM-vd9s',2001,'Accion','Ingles','Subtitulada,Normal','http://ia.media-imdb.com/images/M/MV5BMTc0NTY1NjcyMV5BMl5BanBnXkFtZTcwNjk2MjAyMQ@@._V1._SX326_SY475_.jpg');

    INSERT INTO PELICULA VALUES(default,'The Secret Window','144 minutos','PG-13','Pelicula de suspenso que los tendra intrigados todo el tiempo.','David Koepp','http://www.youtube.com/watch?v=tnV6wM-vd9s',2004,'Suspenso','Ingles','Subtitulada,Normal','http://ia.media-imdb.com/images/M/MV5BMTc0NTY1NjcyMV5BMl5BanBnXkFtZTcwNjk2MjAyMQ@@._V1._SX326_SY475_.jpg');

    INSERT INTO PELICULA VALUES(default,'The Gladiator','110 minutos','R','Pelicula de un gladiador.','Ridley Scott','http://www.youtube.com/watch?v=tnV6wM-vd9s',1999,'Drama,Accion','Ingles','Subtitulada,Normal','http://ia.media-imdb.com/images/M/MV5BMTc0NTY1NjcyMV5BMl5BanBnXkFtZTcwNjk2MjAyMQ@@._V1._SX326_SY475_.jpg');

    INSERT INTO PELICULA VALUES(default,'Prometheus','125 minutos','R','Pelicula de aliens.','Ridley Scott','http://www.youtube.com/watch?v=tnV6wM-vd9s',2011,'Accion,Suspenso','Ingles','Subtitulada,Normal','http://ia.media-imdb.com/images/M/MV5BMTc0NTY1NjcyMV5BMl5BanBnXkFtZTcwNjk2MjAyMQ@@._V1._SX326_SY475_.jpg');

    INSERT INTO PELICULA VALUES(default,'Black Swan','125 minutos','R','Pelicula de una bailarina de ballet.','Darren Aronofsky','http://www.youtube.com/watch?v=tnV6wM-vd9s',2010,'Suspenso,Drama','Ingles','Subtitulada,Normal','http://ia.media-imdb.com/images/M/MV5BMTc0NTY1NjcyMV5BMl5BanBnXkFtZTcwNjk2MjAyMQ@@._V1._SX326_SY475_.jpg');

    INSERT INTO SALA VALUES(default,1,'Regis',50);
    INSERT INTO SALA VALUES(default,1,'Aries',50);
    INSERT INTO SALA VALUES(default,2,'Sala1',50);
    INSERT INTO SALA VALUES(default,2,'Sala2',50);
    INSERT INTO SALA VALUES(default,1,'Sagitario',50);
    INSERT INTO SALA VALUES(default,1,'Acuario',50);
    INSERT INTO SALA VALUES(default,2,'Sala3',50);

     INSERT INTO TANDA VALUES(default,'2012-12-08','2012-12-08 13:00','2012-12-08 14:00',1,1,'<sala>
    <fila  Columna="A">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>=
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="B">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="C">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="D">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="E">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
</sala>');
    INSERT INTO TANDA VALUES(default,'2012-12-09','2012-12-09 14:00','2012-12-08 15:00',2,2,'<sala>
    <fila  Columna="A">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>=
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="B">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="C">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="D">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="E">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
</sala>');
    INSERT INTO TANDA VALUES(default,'2012-12-10','2012-12-09 15:00','2012-12-08 16:00',4,5,'<sala>
    <fila  Columna="A">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>=
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="B">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="C">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="D">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="E">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
</sala>');
    INSERT INTO TANDA VALUES(default,'2012-12-08','2012-12-08 13:00','2012-12-08 14:00',1,1,'<sala>
    <fila  Columna="A">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>=
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="B">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="C">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="D">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="E">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
</sala>');
    INSERT INTO TANDA VALUES(default,'2012-12-09','2012-12-09 14:00','2012-12-08 15:00',2,2,'<sala>
    <fila  Columna="A">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>=
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="B">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="C">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="D">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="E">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
</sala>');
    INSERT INTO TANDA VALUES(default,'2012-12-10','2012-12-09 15:00','2012-12-08 16:00',4,5,'<sala>
    <fila  Columna="A">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>=
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="B">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="C">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="D">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
    <fila  Columna="E">
        <silla  disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
        <silla disponible = "true">
        </silla>
    </fila>
</sala>');
	
	INSERT INTO PRECIO VALUES('Adulto', 65.00);
	INSERT INTO PRECIO VALUES('Nino', 55.00);
	INSERT INTO PRECIO VALUES('Terc Edad', 45.00);
	INSERT INTO PRECIO VALUES('Estudiante', 55.00);
	
	INSERT INTO ticket VALUES(default,1,1,'Estudiante', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,2,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,2,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,2,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Estudiante', curdate());
	INSERT INTO ticket VALUES(default,1,2,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,2,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,3,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,4,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,5,2,'Nino', curdate());
	INSERT INTO ticket VALUES(default,2,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,2,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,2,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,4,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,5,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,5,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Estudiante', curdate());
	INSERT INTO ticket VALUES(default,2,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,5,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,5,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Nino', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
	INSERT INTO ticket VALUES(default,1,1,'Adulto', curdate());
