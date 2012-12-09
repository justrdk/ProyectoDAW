<%@page import="java.sql.*"%>
<%
    try {
        String nombrePrecio = request.getParameter("nombrePrecio").trim();
        double precioNuevo = Double.parseDouble(request.getParameter("precioNuevo").trim());

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);

        PreparedStatement query = con.prepareStatement("insert into precio values(?,?)");
        query.setString(1, nombrePrecio);
        query.setDouble(2, precioNuevo);

        int row = query.executeUpdate();

        if (row > 0) {
            response.sendRedirect("../agregarPrecios.jsp?insercion=true");
        } else {
            response.sendRedirect("../agregarPrecios.jsp?insercion=false");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        response.sendRedirect("../agregarPrecios.jsp?insercion=false");
    }
%>
