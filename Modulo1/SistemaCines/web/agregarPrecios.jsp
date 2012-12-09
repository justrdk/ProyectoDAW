<%-- 
    Document   : agregarPrecios
    Created on : Dec 8, 2012, 10:17:38 PM
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
         <script type="text/javascript" src="Javascript/agregarPrecios.js"></script>
        <title>Agregar Precios</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>
        <div id="wrapper">
            <form action="Controladoras/controladora_agregarPrecio.jsp" method="POST">
                <h2> Creacion de Nuevo Precio</h2><br/>
                <fieldset id="user-details">
                    <label>Nombre: </label>
                    <input type="text" name="nombrePrecio" />
                    <label>Precio: </label>
                    <input type="text" name="precioNuevo" />
                    <input type="submit" value="Crear" name="submit" class="submit" />
                </fieldset>
            </form>
        </div>
    </body>
</html>
