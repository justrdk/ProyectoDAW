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


        String cuenta = request.getParameter("cuenta");
        String password = request.getParameter("password");
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String identidad = request.getParameter("identidad");
        query = con.prepareStatement("insert into cuenta values (?,MD5(?),?,?,?)");
        query.setString(1, cuenta);
        query.setString(2, password);
        query.setString(3, nombre);
        query.setInt(4, edad);
        query.setString(5, identidad);

        int row = query.executeUpdate();
        if (row > 0) {
            out.print("true");
        } else {
            out.print("false");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
