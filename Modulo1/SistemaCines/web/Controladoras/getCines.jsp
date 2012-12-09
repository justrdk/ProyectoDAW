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
        String cines = "";

        query = con.prepareStatement("select idCine,nombre from cine");
        ResultSet rs = query.executeQuery();

        while (rs.next()) {
            cines += rs.getInt(1) + "$" + rs.getString(2) + "#";
        }

        if (cines.length() > 0) {
            out.print(cines);
        } else {
            out.print("none");
        }
        
        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
