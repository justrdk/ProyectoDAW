<%@page import="javax.print.attribute.standard.MediaSize.Other"%>
<%@page import="java.sql.*"%>
<%
    try {

        int accion = Integer.parseInt(request.getParameter("accion"));
        PreparedStatement query = null;
        String nombreCine = "";
        String ciudadCine = "";
        String logoCine = "";
        String latitudCine = "";
        String longitudCine = "";
        String visionCine = "";
        String misionCine = "";
        int row = 0;

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);

        if (accion == 1) {

            nombreCine = request.getParameter("nombreCine").trim();
            ciudadCine = request.getParameter("ciudad").trim();
            logoCine = request.getParameter("logo").trim();
            latitudCine = request.getParameter("latitud").trim();
            longitudCine = request.getParameter("longitud").trim();
            visionCine = request.getParameter("vision").trim();
            misionCine = request.getParameter("mision").trim();

            query = con.prepareStatement("insert into cine values(default,?,?,?,?,?,?,?)");
            query.setString(1, nombreCine);
            query.setString(2, ciudadCine);
            query.setString(3, visionCine);
            query.setString(4, misionCine);
            query.setString(5, logoCine);
            query.setString(6, latitudCine);
            query.setString(7, longitudCine);

            row = query.executeUpdate();

            if (row > 0) {
                out.print("true");
            } else {
                out.print("false");
            }
        } else if (accion == 2) {
            
            int idCine = Integer.parseInt(request.getParameter("idCine"));
            String nombreSala = request.getParameter("nombreSala");
            int capacidad = Integer.parseInt(request.getParameter("capacidad"));
            query = con.prepareStatement("insert into sala values (default,?,?,?)");
            query.setInt(1, idCine);
            query.setString(2, nombreSala);
            query.setInt(3, capacidad);

            row = query.executeUpdate();
            if (row > 0) {
                out.print("true");
            } else {
                out.print("false");
            }
        } else if (accion == 3) {
            String nombrePelicula = request.getParameter("nombrePelicula").trim();
            String duracionPelicula = request.getParameter("duracion").trim();
            String ratingPelicula = request.getParameter("rating").trim();
            String directorPelicula = request.getParameter("director").trim();
            String trailerPelicula = request.getParameter("trailer").trim();
            int yearPelicula = Integer.parseInt(request.getParameter("year").trim());
            String generoPelicula = request.getParameter("genero").trim();
            String idiomaPelicula = request.getParameter("idioma").trim();
            String formatoPelicula = request.getParameter("formato").trim();
            String imagenPelicula = request.getParameter("imagen").trim();
            String sinopsisPelicula = request.getParameter("sinopsis").trim();

            query = con.prepareStatement("insert into pelicula values(default,?,?,?,?,?,?,?,?,?,?,?)");
            query.setString(1, nombrePelicula);
            query.setString(2, duracionPelicula);
            query.setString(3, ratingPelicula);
            query.setString(4, sinopsisPelicula);
            query.setString(5, directorPelicula);
            query.setString(6, trailerPelicula);
            query.setInt(7, yearPelicula);
            query.setString(8, generoPelicula);
            query.setString(9, idiomaPelicula);
            query.setString(10, formatoPelicula);
            query.setString(11, imagenPelicula);

            row = query.executeUpdate();

            if (row > 0) {
                out.print("true");
            } else {
                out.print("false");
            }
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.print("asdasdas");
    }
%>
