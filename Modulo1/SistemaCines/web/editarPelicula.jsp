<%-- 
    Document   : editarPelicula
    Created on : Dec 9, 2012, 10:28:31 AM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel='stylesheet' type='text/css' />
        <link href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="Javascript/jqueryAPI.js"></script>
        <script type="text/javascript" src="Javascript/editarPelicula.js"></script>
        <title>Editar Pelicula</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %> 

        <div id="wrapper">
            <div id="wrapper-pelicula">
                <h2>Datos Edición Película</h2><br/>
                <fieldset id="user-details">
                    <label>Escoja Película</label>
                    <select name="peliculas" id="peliculas" onchange="llenarCampos()"></select>
                    <label>Nombre: </label>
                    <input type="text" id="nombrePelicula" disabled class="inputs"/>
                    <label>Duracion </label>
                    <input type="text" id="duracionPelicula"  disabled class="inputs" />
                    <label>Rating</label>
                    <select id="ratings">
                        <option value="G">G</option>
                        <option value="PG">PG</option>
                        <option value="PG-13">PG-13</option>
                        <option value="R">R</option>
                        <option value="NC-17">NC-17</option>
                    </select>
                    <label>Director </label>
                    <input type="text" id="directorPelicula"  disabled class="inputs" />
                    <label>Trailer: </label>
                    <input type="text" id="trailerPelicula"  disabled class="inputs" />
                    <label>Año: </label>
                    <input type="text" id="yearPelicula"  disabled class="inputs" />
                    <label>Género: </label>
                    <input type="text" id="generoPelicula"  disabled class="inputs" />
                    <label>Idioma: </label>
                    <input type="text" id="idiomaPelicula"  disabled class="inputs" />
                    <label>Formato:  </label>
                    <input type="text" id="formatoPelicula"  disabled class="inputs" />
                    <label>Imagen Descriptiva </label>
                    <input type="text" id="imagenPelicula"  disabled class="inputs" />
                    <button type="button" id="guardarPelicula" onclick="editarPelicula()" disabled>Guardar Cambios</button>
                </fieldset>

                <fieldset id="user-message">
                    <label>Sinposis </label>
                    <textarea id="sinopsisPelicula" cols="40" rows="3" class="inputs"></textarea>
                </fieldset>
            </div>
        </div>
    </body>
</html>
