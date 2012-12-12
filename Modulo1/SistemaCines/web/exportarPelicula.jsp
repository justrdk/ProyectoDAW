<%-- 
    Document   : exportarPelicula
    Created on : Dec 11, 2012, 5:49:40 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="Javascript/jqueryAPI.js"></script>
        <script type="text/javascript" src="Javascript/exportarPelicula.js"></script>
        <title>Exportar Pelicula</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %> 
        
        <div id="wrapper">           
            <div id="wrapper-tanda">
                <fieldset id="user-details">
                    <h2> Exportar Datos Pelicula</h2>
                    <label>Escoger Sala</label>
                    <select name="escogerPelicula" id="peliculas">
                        <option value="default">Escoger Pelicula</option>
                    </select>
                    <button type="button" id="exportarSala" onclick="exportarPelicula()">Exportar Config</button>
                </fieldset>
            </div>
        </div>
    </body>
</html>
