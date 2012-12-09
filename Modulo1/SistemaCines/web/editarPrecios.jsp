<%-- 
    Document   : editarPrecio
    Created on : Dec 9, 2012, 11:45:39 AM
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
        <script type="text/javascript" src="Javascript/editarPrecio.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="commonMenu.jsp" %> 
         
         <div id="wrapper">           
            <div id="wrapper-precio">
                <fieldset id="user-details">
                    <h2> Edicion Datos Precio</h2>
                    <label>Escoger Precio</label>
                    <select name="escogerPrecios" id="precios" onchange="llenarCamposPrecio()"></select>
                    <h2>Datos Nuevo Precio</h2>
                    <label>Nuevo Nombre: </label>
                    <input type="text" id="nombrePrecio"/>
                    <label>Nuevo Precio: </label>
                    <input type="text" id="precioNuevo"/>

                    <button type="button" id="guardarPrecio" onclick="editarPrecio()">Guardar Cambios</button>
                </fieldset>
            </div>
        </div>
    </body>
</html>
