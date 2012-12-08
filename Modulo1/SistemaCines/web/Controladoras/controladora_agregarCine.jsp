<%@page import="java.sql.*"%>
<%
    try {
        String nombreCine = request.getParameter("nombreCine").trim();
        String ciudadCine = request.getParameter("ciudadCine").trim();
        String logoCine = request.getParameter("logoCine").trim();
        String latitudCine = request.getParameter("latitudCine").trim();
        String longitudCine = request.getParameter("longitudCine").trim();
        String visionCine = request.getParameter("visionCine").trim();
        String misionCine = request.getParameter("misionCine").trim();

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);

        PreparedStatement query = con.prepareStatement("insert into cine values(default,?,?,?,?,?,?,?)");
        query.setString(1, nombreCine);
        query.setString(2, ciudadCine);
        query.setString(3, visionCine);
        query.setString(4, misionCine);
        query.setString(5, logoCine);
        query.setString(6, latitudCine);
        query.setString(7, longitudCine);

        int row = query.executeUpdate();

        if (row > 0) {
            response.sendRedirect("../crearCine.jsp?insercion=true");
        } else {
            response.sendRedirect("../crearCine.jsp?insercion=false");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.println(e.toString());
    }
%>
