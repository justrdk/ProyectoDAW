<%-- 
    Document   : administracionCines
    Created on : Dec 7, 2012, 9:16:04 PM
    Author     : Osman
Pagina Estatica para incluir menu en todas las demás paginas que tengan este mismo menu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/menu_assets/styles.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            function getParameterByName(name)
            {
                name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                var regexS = "[\\?&]" + name + "=([^&#]*)";
                var regex = new RegExp(regexS);
                var results = regex.exec(window.location.search);
                if(results == null)
                    return "";
                else
                    return decodeURIComponent(results[1].replace(/\+/g, " "));
            }
        </script>
        <title>Administracion Cines</title>
    </head>
    <body>
        <div id='cssmenu'>
            <ul>
                <li class='has-sub '><a href='#'><span>Cines</span></a>
                    <ul>
                        <li><a href='crearCine.jsp'><span>Crear Cine</span></a></li>
                        <li><a href='editarCine.jsp'><span>Editar Cine</span></a></li>
                    </ul>
                </li>
                <li class='has-sub '><a href='#'><span>Salas</span></a>
                    <ul>
                        <li><a href='agregarSala.jsp'><span>Agregar Sala</span></a></li>
                        <li><a href='editarSala.jsp'><span>Editar Sala</span></a></li>
                    </ul>
                </li>
                <li class='has-sub '><a href='#'><span>Películas</span></a>
                    <ul>
                        <li><a href='agregarPelicula.jsp'><span>Agregar Película</span></a></li>
                    </ul>
                </li>
                <li class='has-sub '><a href='#'><span>Tandas</span></a>
                    <ul>
                        <li><a href='agregarTanda.jsp'><span>Agregar Tanda</span></a></li>
                    </ul>
                </li>
                <li class='has-sub '><a href='#'><span>Precios</span></a>
                    <ul>
                        <li><a href='agregarPrecios.jsp'><span>Agregar/Modificar Precio Entrada</span></a></li>
                    </ul>
                </li>
                <li class='has-sub '><a href='#'><span>Reportes</span></a>
                    <ul>
                        <li><a href='#'><span>Tandas</span></a></li>
                        <li><a href='#'><span>Pelicula Más Vista</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </body>
</html>
