<%@page import="java.sql.*"%>
<%
    try {

        int accion = Integer.parseInt(request.getParameter("accion"));
        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);
        PreparedStatement query = null;

        int idPelicula = 0;
        String nombre = "";
        String duracion = "";
        String rating = "";
        String sinopsis = "";
        String director = "";
        String trailer = "";
        int year = 0;
        String genero = "";
        String idioma = "";
        String formato = "";
        String imagen = "";

        String datosPelicula = "";

        if (accion == 1) {
            idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            query = con.prepareStatement("select * from pelicula where idPelicula = ?");
            query.setInt(1, idPelicula);
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                datosPelicula += rs.getString(2) + "$" + rs.getString(3) + "$" + rs.getString(6) + "$"
                        + rs.getString(7) + "$" + rs.getString(8) + "$" + rs.getString(9) + "$" + rs.getString(10)
                        + "$" + rs.getString(11) + "$" + rs.getString(12) + "$" + rs.getString(5) + "#";
            }

            if (datosPelicula.length() > 0) {
                out.print(datosPelicula);
            } else {
                out.print("none");
            }

        } else if (accion == 2) {

            idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            nombre = request.getParameter("nuevoNombre");
            duracion = request.getParameter("nuevaDuracion");
            rating = request.getParameter("nuevoRating");
            sinopsis = request.getParameter("nuevaSinopsis");
            director = request.getParameter("nuevoDirector");
            trailer = request.getParameter("nuevoTrailer");
            year = Integer.parseInt(request.getParameter("nuevoYear"));
            genero = request.getParameter("nuevoGenero");
            idioma = request.getParameter("nuevoIdioma");
            formato = request.getParameter("nuevoFormato");
            imagen = request.getParameter("nuevaImagen");

            query = con.prepareStatement("update pelicula set nombre=?,duracion=?,rating=?,sinopsis=?,director=?,trailer=?,year=?,genero=?,idioma=?,formato=?,imagenDescriptiva=? where idPelicula = ?");
            query.setString(1,nombre);
            query.setString(2,duracion);
            query.setString(3,rating);
            query.setString(4,sinopsis);
            query.setString(5,director);
            query.setString(6,trailer);
            query.setInt(7,year);
            query.setString(8,genero);
            query.setString(9,idioma);
            query.setString(10,formato);
            query.setString(11,imagen);
            query.setInt(12,idPelicula);
            
            int row = query.executeUpdate();

            if (row > 0) {
                out.print("true");
            } else {
                out.print("false");
            }

        }
        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
