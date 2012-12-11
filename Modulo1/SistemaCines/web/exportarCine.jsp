<%-- 
    Document   : exportarCine
    Created on : Dec 11, 2012, 4:43:03 PM
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
        <script type="text/javascript" src="Javascript/exportarCine.js"></script>
        <title>Exportar Cine</title>
    </head>
    <body>
         <%@include file="commonMenu.jsp" %> 
         
         <div id="wrapper">           
            <div id="wrapper-tanda">
                <fieldset id="user-details">
                    <h2> Exportar Datos Cine</h2>
                    <label>Escoger Cine</label>
                    <select name="escogerCine" id="cines">
                        <option value="default">Escoger Cine</option>
                    </select>
                    <button type="button" id="exportarCine" onclick="exportarCine()">Exportar Config</button>
                </fieldset>
            </div>
        </div>
    </body>
</html>
