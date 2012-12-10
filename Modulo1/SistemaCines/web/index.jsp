<%-- 
    Document   : index
    Created on : Dec 7, 2012, 7:12:59 PM
    Author     : Osman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK href="CSS/LoginStyling.css" rel="stylesheet" type="text/css">   
        <title>Login</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="wrapper-inside">
                <form action="Controladoras/controladora_Login.jsp" method="POST">
                    <label>Usuario: </label>
                    <input type ="text" name ="username"/>
                    <label>Contraseña: </label>
                    <input type ="password" name ="password"/>
                    <input type="submit" value="Login" name="submit" class="submit" />
                </form>
            </div>
        </div>
    </body>
</html>
