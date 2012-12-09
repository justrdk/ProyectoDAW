<%@page import="java.sql.*"%>
<%
    try {
        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);
        PreparedStatement query = null;
        String peliculas = "";

        query = con.prepareStatement("select idPelicula,nombre,director,rating,duracion from pelicula");
        ResultSet rs = query.executeQuery();

        while (rs.next()) {
            peliculas += rs.getInt(1) + "$" + rs.getString(2) + "$" + rs.getString(3) + "$" + rs.getString(4) + "$" + rs.getString(5) + "#";
        }

        if (peliculas.length() > 0) {
            out.print(peliculas);
        } else {
            out.print("none");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
