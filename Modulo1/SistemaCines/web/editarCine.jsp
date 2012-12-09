<%-- 
    Document   : editarCine
    Created on : Dec 8, 2012, 11:05:53 PM
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
        <script type="text/javascript" src="Javascript/editarCine.js"></script>
        <title>Editar Cine</title>
    </head>
    <body>
        <%@include file="commonMenu.jsp" %> 

        <div id="wrapper">           
            <div id="wrapper-tanda">
                <fieldset id="user-details">
                    <h2> Edicion datos Cine</h2>
                    <label>Escoger Cine</label>
                    <select name="escogerCine" id="cines" onchange="llenarCampos()">
                        <option value="default">Escoger Cine</option>
                    </select>
                    <label>Nombre: </label>
                    <input type="text" id="nombreCine" disabled class="inputs"/>
                    <label>Ciudad: </label>
                    <input type="text" id="ciudadCine" disabled class="inputs" />
                    <label>Logo: </label>
                    <input type="text" id="logoCine" disabled class="inputs" />
                    <h3> Ubicacion en Coordenadas </h3>
                    <label>Latitud: </label>
                    <input type="text" id="latitudCine" disabled class="inputs" />
                    <label>Longitud: </label>
                    <input type="text" id="longitudCine" disabled class="inputs" />

                    <button type="button" id="guardarTanda" onclick="editarCine()" disabled >Guardar Cambios</button>
                </fieldset>
                <fieldset id="user-message">
                    <label>Visión: </label>
                    <textarea id="visionCine" cols="40" rows="3" disabled class="inputs"></textarea>
                    <br/><br/>
                    <label>Misión: </label>
                    <textarea id="misionCine" cols="40" rows="3" disabled class="inputs"></textarea>
                </fieldset>
            </div>
        </div>
    </body>
</html>
