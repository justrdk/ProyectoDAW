<%-- 
    Document   : crearCine
    Created on : Dec 7, 2012, 10:03:33 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel='stylesheet' type='text/css' />
        <LINK href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <title>Crear Cine</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>

        <div id="wrapper">
            <form action="Controladoras/controladora_agregarCine.jsp" method="POST">
                <h2> Creacion de Nuevo Cine</h2><br/>
                <fieldset id="user-details">
                    <label>Nombre: </label>
                    <input type="text" name="nombreCine" />
                    <label>Ciudad: </label>
                    <input type="text" name="ciudadCine" />
                    <label>Logo: </label>
                    <input type="text" name="logoCine" />
                    <h3> Ubicacion en Coordenadas </h3>
                    <label>Latitud: </label>
                    <input type="text" name="latitudCine" />
                    <label>Longitud: </label>
                    <input type="text" name="longitudCine" />
                    <input type="submit" value="Crear" name="submit" class="submit" />
                </fieldset>

                <fieldset id="user-message">
                    <label>Visión: </label>
                    <textarea name="visionCine" cols="40" rows="3"></textarea>
                    <br/><br/>
                    <label>Misión: </label>
                    <textarea name="misionCine" cols="40" rows="3"></textarea>
                </fieldset>
            </form>
        </div>
    </body>
</html>
