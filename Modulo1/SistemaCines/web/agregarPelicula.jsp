<%-- 
    Document   : agregarPelicula
    Created on : Dec 7, 2012, 10:53:55 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel='stylesheet' type='text/css' />
        <LINK href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <title>Agregar Pelicula</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>
        <div id="wrapper">
            <form action="Controladoras/controladora_agregarPelicula.jsp" method="POST">
                <h2>Datos Pelicula Nueva</h2><br/>
                <fieldset id="user-details">
                    <label>Nombre: </label>
                    <input type="text" name="nombrePelicula" />
                    <label>Duracion </label>
                    <input type="text" name="duracionPelicula" />
                    <label>Rating</label>
                    <select name="ratings">
                        <option value="G">G</option>
                        <option value="PG">PG</option>
                        <option value="PG-13">PG-13</option>
                        <option value="R">R</option>
                        <option value="NC-17">NC-17</option>
                    </select>
                    <label>Director </label>
                    <input type="text" name="directorPelicula" />
                    <label>Trailer: </label>
                    <input type="text" name="trailerPelicula" />
                    <label>Año: </label>
                    <input type="text" name="yearPelicula" />
                    <label>Género: </label>
                    <input type="text" name="generoPelicula" />
                    <label>Idioma: </label>
                    <input type="text" name="idiomaPelicula" />
                    <label>Formato:  </label>
                    <input type="text" name="formatoPelicula" />
                    <label>Imagen Descriptiva </label>
                    <input type="text" name="imagenPelicula" />
                    <input type="submit" value="Agregar" name="submit" class="submit" />
                </fieldset>

                <fieldset id="user-message">
                    <label>Sinposis </label>
                    <textarea name="sinopsisPelicula" cols="40" rows="3"></textarea>
                </fieldset>
            </form>
        </div>
    </body>
</html>
