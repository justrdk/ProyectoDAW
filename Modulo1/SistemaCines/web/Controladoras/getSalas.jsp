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
        String salas = "";

        int idCine = Integer.parseInt(request.getParameter("idCine"));

        query = con.prepareStatement("select idSala,nombre from sala where idCine = ?");
        query.setInt(1, idCine);
        ResultSet rs = query.executeQuery();

        while (rs.next()) {
            salas += rs.getInt(1) + "$" + rs.getString(2) + "#";
        }

        if (salas.length() > 0) {
            out.print(salas);
        } else {
            out.print("none");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
