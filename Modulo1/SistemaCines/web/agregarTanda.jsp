<%-- 
    Document   : agregarTanda
    Created on : Dec 8, 2012, 3:38:46 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel='stylesheet' type='text/css' />
        <link href="CSS/flick/jquery-ui-1.9.2.custom.css" rel="stylesheet">
        <link href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <link href="CSS/chromatableStyle.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="Javascript/jqueryAPI.js"></script>
        <script type="text/javascript" src="Javascript/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="Javascript/jquery.chromatable.js"></script> 
        <script type="text/javascript" src="Javascript/agregarTanda.js"></script>
        <title>Agregar Tanda</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %>

        <div id="wrapper">           
            <div id="wrapper-cine">
                 <fieldset id="user-details">
                <h2> Creacion de Nueva Tanda</h2>
                <label>Escoger Cine</label>
                <select name="escogerCine" id="cines" onchange="getSalas()">
                    <option value="default">Escoger Cine</option>
                </select>
                <br/>
                <label>Escoger Sala</label>
                <select name="escogerSala" id="salas" onchange="getPeliculas()">
                </select>
                <br/>
                <label>Escoger Fecha</label>
                <input type="text" id="fecha" />
                <label>Hora Inicial (Formato 24hrs)</label>
                <input type="text" id="horaInicial" />
                <label>Hora Final (Formato 24hrs)</label>
                <input type="text" id="horaFinal" />
                
                <h2>Escoger Pelicula</h2> 
                </fieldset>
                <table id="peliculas" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Director</th>
                        <th>Rating</th>
                        <th>Duración</th>
                    </tr>
                </table>
                <button type="button" id="guardarTanda" onclick="guardarTanda()" >Crear Tanda</button>
                 
            </div>
        </div>
    </body>
</html>
