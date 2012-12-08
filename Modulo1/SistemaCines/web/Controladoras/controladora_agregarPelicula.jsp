<%@page import="java.sql.*"%>
<%
    try {
        String nombrePelicula = request.getParameter("nombrePelicula").trim();
        String duracionPelicula = request.getParameter("duracionPelicula").trim();
        int ratingPelicula = Integer.parseInt(request.getParameter("ratingPelicula").trim());
        String directorPelicula = request.getParameter("directorPelicula").trim();
        String trailerPelicula = request.getParameter("trailerPelicula").trim();
        int yearPelicula = Integer.parseInt(request.getParameter("yearPelicula").trim());
        String generoPelicula = request.getParameter("generoPelicula").trim();
        String idiomaPelicula = request.getParameter("idiomaPelicula").trim();
        String formatoPelicula = request.getParameter("formatoPelicula").trim();
        String imagenPelicula = request.getParameter("imagenPelicula").trim();
        String sinopsisPelicula = request.getParameter("sinopsisPelicula").trim();


        Connection con = null;
        String dbuser = "dba";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);

        PreparedStatement query = con.prepareStatement("insert into pelicula values(default,?,?,?,?,?,?,?,?,?,?,?)");
        query.setString(1, nombrePelicula);
        query.setString(2, duracionPelicula);
        query.setInt(3, ratingPelicula);
        query.setString(4, sinopsisPelicula);
        query.setString(5, directorPelicula);
        query.setString(6, trailerPelicula);
        query.setInt(7, yearPelicula);
        query.setString(8, generoPelicula);
        query.setString(9, idiomaPelicula);
        query.setString(10, formatoPelicula);
        query.setString(11, imagenPelicula);

        int row = query.executeUpdate();

        if (row > 0) {
            response.sendRedirect("../agregarPelicula.jsp?insercion=true");
        } else {
            response.sendRedirect("../agregarPelicula.jsp?insercion=false");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.println(e.toString());
    }
%>
