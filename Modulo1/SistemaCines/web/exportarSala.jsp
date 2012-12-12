<%-- 
    Document   : exportarSala
    Created on : Dec 11, 2012, 5:16:09 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/formAdministracionCines.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="Javascript/jqueryAPI.js"></script>
        <script type="text/javascript" src="Javascript/exportarSala.js"></script>
        <title>Exportar Cine</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %> 

        <div id="wrapper">           
            <div id="wrapper-tanda">
                <fieldset id="user-details">
                    <h2> Exportar Datos Sala</h2>
                    <label>Escoger Sala</label>
                    <select name="escogerSala" id="salas">
                        <option value="default">Escoger Sala</option>
                    </select>
                    <button type="button" id="exportarSala" onclick="exportarSala()">Exportar Config</button>
                </fieldset>
            </div>
        </div>
    </body>
</html>
