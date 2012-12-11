<%-- 
    Document   : ingresosNetosCine
    Created on : Dec 9, 2012, 6:05:43 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel='stylesheet' type='text/css' />
        <link href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <script src="Javascript/jqueryAPI.js"></script>
        <script src="Javascript/peliculaMasVista.js"></script>
        <script src="Javascript/highcharts.js"></script>
        <script src="Javascript/modules/exporting.js"></script>
        <title>Reporte Ingresos</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>

        <div id="wrapper">           
            <div id="wrapper-cuenta">
                <fieldset id="user-details">
                    <h2>Pelicula(as) Más Vista(as)</h2>
                    <br/>
                    <label>Eliga reporte a mostrar</label>
                    <select id="opciones" onchange="showGraph()">
                        <option value="0">Eliga reporte a mostrar</option>
                        <option value="1">Pelicula Más Vista</option>
                        <option value="2">Asistencias totales/Pelicula</option>
                    </select>
                </fieldset>
                <div id="reporte">

                </div>
            </div>

        </div>
    </body>
</html>
