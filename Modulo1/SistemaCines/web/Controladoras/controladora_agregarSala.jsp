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
        final int capacidad = 50;

        if (accion == 1) {

            int idCine = Integer.parseInt(request.getParameter("idCine"));
            String nombreSala = request.getParameter("nombreSala");
            query = con.prepareStatement("insert into sala values (default,?,?,?)");
            query.setInt(1, idCine);
            query.setString(2, nombreSala);
            query.setInt(3, capacidad);

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
