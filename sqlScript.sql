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
        vision VARCHAR(150) NOT NULL,
        mision VARCHAR(150) NOT NULL,
        numSalas INT NOT NULL,
        logo VARCHAR (50) NOT NULL,
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
        duracion VARCHAR(10) NOT NULL,
        rating INT NOT NULL,
        sinopsis VARCHAR(100) NOT NULL,
        director VARCHAR(20) NOT NULL,
        trailer VARCHAR(50) NOT NULL,
        year INT NOT NULL,
        genero VARCHAR(20) NOT NULL,
        idioma VARCHAR(20) NOT NULL,
        formato VARCHAR(15) NOT NULL,
        imagenDescriptiva VARCHAR(20) NOT NULL,
        PRIMARY KEY (idPelicula)
    );

    CREATE TABLE Tanda(
        idTanda INT NOT NULL AUTO_INCREMENT,
        fecha DATE NOT NULL,
        hora_inicial DATETIME NOT NULL,
        hora_final DATETIME NOT NULL,
        idSala INT NOT NULL,
        idPelicula INT NOT NULL,
        configuracionSillas BLOB NOT NULL,
        PRIMARY KEY(idTanda,fecha,hora_inicial,hora_final),
        FOREIGN KEY (idSala) REFERENCES Sala(idSala)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        FOREIGN KEY (idPelicula) REFERENCES Pelicula(idPelicula)
        ON DELETE NO ACTION ON UPDATE CASCADE
    );

    CREATE TABLE Ticket(
        idTicket INT NOT NULL AUTO_INCREMENT,
        idPelicula INT NOT NULL,
        idTanda INT NOT NULL,
        tipoTicket VARCHAR(15) NOT NULL,
        precio INT NOT NULL,
        PRIMARY KEY (idTicket), 
        FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
        ON DELETE NO ACTION ON UPDATE CASCADE,       
        FOREIGN KEY (idTanda) REFERENCES Tanda (idTanda)
        ON DELETE NO ACTION ON UPDATE CASCADE
    );