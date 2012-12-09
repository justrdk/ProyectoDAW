create database banco;
use banco;

    CREATE TABLE Cuenta
	(
        cuenta VARCHAR(10) NOT NULL,
        saldo decimal(10,2) NOT NULL,        
        PRIMARY KEY(cuenta)
    );
	
	INSERT INTO cuenta VALUES('1032034034', 1000.0);
	INSERT INTO cuenta VALUES('1032234324', 10000.0);
	INSERT INTO cuenta VALUES('1232163213', 5500.0);
	INSERT INTO cuenta VALUES('1324536456',25.00);
	INSERT INTO cuenta VALUES('4325435643', 100.0);