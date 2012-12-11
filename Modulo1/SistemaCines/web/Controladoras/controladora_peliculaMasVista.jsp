<%@page import="java.util.ArrayList"%>
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
        String datos = "";
        String nombre = "";
        ResultSet rs = null;

        if (accion == 1) {

            query = con.prepareStatement("select idPelicula, count(idPelicula) from ticket group by idPelicula order by count(idPelicula) desc");
            rs = query.executeQuery();

            while (rs.next()) {
                datos = rs.getInt(1) + "," + rs.getInt(2);
                break;
            }

            if (datos.length() > 0) {
                out.print(datos);
            } else {
                out.print("none");
            }
        } else if (accion == 2) {

            int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            query = con.prepareStatement("select nombre from pelicula where idPelicula = ?");
            query.setInt(1, idPelicula);
            rs = query.executeQuery();


            while (rs.next()) {
                nombre = rs.getString(1);
            }

            if (nombre.length() > 0) {
                out.print(nombre);
            } else {
                out.print("none");
            }
        }
        query.close();
        con.close();

    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
