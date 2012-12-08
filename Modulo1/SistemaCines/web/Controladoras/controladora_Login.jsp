<%@page import="java.sql.*"%>
<%
    try {
        String userName = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);

        PreparedStatement query = con.prepareStatement("select * from cuenta where cuenta = ? AND password = MD5(?)");
        query.setString(1, userName);
        query.setString(2, password);
        ResultSet rs = query.executeQuery();
        boolean found = false;

        while (rs.next()) {
            found = true;
        }

        if (found) {
            session.setAttribute("s_user", userName);
            session.setAttribute("s_pass", password);
            response.sendRedirect("../administracionCines.jsp");
        } else {
            out.print("<script>alert('el usuario no existe')</script>");
            response.sendRedirect("../index.jsp");
        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.println(e.toString());
    }
%>
