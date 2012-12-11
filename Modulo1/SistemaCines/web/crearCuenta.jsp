<%-- 
    Document   : crearCuenta
    Created on : Dec 9, 2012, 4:02:52 PM
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
        <script type="text/javascript" src="Javascript/crearCuenta.js"></script>
        <title>Crear Cuenta</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>
        <div id="wrapper">           
            <div id="wrapper-cuenta">
                <fieldset id="user-details">
                    <h2> Creacion de Nueva Cuenta</h2>
                    <label>Nombre: </label>
                    <input type="text" id="nombre" />
                    <label>Edad: </label>
                    <input type="text" id="edad" />
                    <label>No.Identidad </label>
                    <input type="text" id="identidad" />
                    <label>Cuenta: </label>
                    <input type="text" id="cuenta" />
                    <label>Password: </label>
                    <input type="password" id="password" />
                    <button type="button" id="guardarCuenta" onclick="crearCuenta()">Crear Cuenta</button>
                </fieldset>
            </div>
        </div>
    </body>
</html>
