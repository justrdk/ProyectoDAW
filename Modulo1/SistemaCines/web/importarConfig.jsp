<%-- 
    Document   : importarConfig
    Created on : Dec 10, 2012, 7:39:12 AM
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
        <script type="text/javascript" src="Javascript/importarConfig.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>
        <div id="wrapper">           
            <div id="wrapper-cuenta">
                <fieldset id="user-details">
                    <textarea id="xmlConfig" rows="40" cols="50"></textarea>
                    <button type="button" id="importarCine" onclick="sendXML(1)">Importar Cine</button>
                    <button type="button" id="importarSala" onclick="sendXML(2)" disabled>Importar Sala</button>
                    <button type="button" id="importarPelicula" onclick="sendXML(3)">Importar Pelicula</button>
                </fieldset>
                <fieldset id="user-message">
                    <label>Escoger Cine para Importación de Sala </label>
                    <select name="escogerCine" id="cines" onchange="habilitarSalaXML()">
                        <option value="default">Escoger Cine</option>
                    </select>
                </fieldset>
            </div>
        </div>
    </body>
</html>
