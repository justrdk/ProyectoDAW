<%-- 
    Document   : agregarSala
    Created on : Dec 8, 2012, 11:27:16 AM
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
        <script type ="text/javascript" src="Javascript/agregarSala.js"></script>    
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>

        <div id="wrapper">           
            <div id="wrapper-sala">
                <h2> Creacion de Nueva Sala</h2>
                <label>Escoger Cine</label>
                <select name="escogerCine" id="cines"></select>
                <h2>Datos Nueva Sala</h2>
                <label>Nombre Sala: </label>
                <input type="text" id="nombreSala" />
                <span id="errorMessage">Error! Campo Nombre Sala no puede ser vacio</span>
                <br/>
                <button type="button" id="guardarSala" onclick="guardarSala()">Crear Sala</button>
            </div>
        </div>
    </body>
</html>
