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

            query = con.prepareStatement("select T.idPelicula, count(T.idPelicula),P.nombre from ticket as T inner join pelicula as P on T.idPelicula = P.idPelicula group by T.idPelicula order by count(T.idPelicula) desc;");
            rs = query.executeQuery();

            while (rs.next()) {
                datos = rs.getString(3) + "," + rs.getInt(2);
                break;
            }

            if (datos.length() > 0) {
                out.print(datos);
            } else {
                out.print("none");
            }
        } else if (accion == 2) {

            query = con.prepareStatement("select T.idPelicula, count(T.idPelicula),P.nombre from ticket as T inner join pelicula as P on T.idPelicula = P.idPelicula group by T.idPelicula order by count(T.idPelicula) desc;");
            rs = query.executeQuery();

            while (rs.next()) {
                datos += rs.getString(3) + "," + rs.getInt(2)+"$";
            }

            if (datos.length() > 0) {
                out.print(datos);
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
