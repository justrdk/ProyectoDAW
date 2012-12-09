<%-- 
    Document   : editarSala
    Created on : Dec 9, 2012, 12:41:42 AM
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
        <script type="text/javascript" src="Javascript/editarSala.js"></script>
        <title>Editar Sala</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %> 

        <div id="wrapper">           
            <div id="wrapper-sala">
                <fieldset id="user-details">
                    <h2> Edicion Datos Sala</h2>
                    <label>Escoger Sala</label>
                    <select name="escogerSala" id="salas" onchange="llenarCamposSala()"></select>
                    <h2>Datos Nueva Sala</h2>
                    <label>Nombre Sala: </label>
                    <input type="text" id="nombreSala" disabled />
                    <label>Cine Actual: </label>
                    <input type="text" id="cineActual" disabled />
                    <label>Escoger Cine Nuevo</label>
                    <select name="escogerCine" id="cines"></select>
                    <button type="button" id="guardarSala" onclick="editarSala()">Guardar Cambios</button>
                </fieldset>
            </div>
        </div>
    </body>
</html>
