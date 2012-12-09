<%@page import="java.sql.*"%>
<%
    try {

        int accion = Integer.parseInt(request.getParameter("accion"));
        String fecha = request.getParameter("fecha");
        String horaInicial = request.getParameter("horaInicial");
        String horaFinal = request.getParameter("horaFinal");
        int idSala = Integer.parseInt(request.getParameter("idSala"));
        int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
        Date date = new Date(0000-00-00);

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);
        PreparedStatement query = null;
        String xml = "<sala><fila Columna=\"A\"><silla  disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla><silla disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla></fila>"
        + "<fila  Columna=\"B\"><silla  disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla><silla disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla></fila>"
        + "<fila  Columna=\"C\"><silla  disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla><silla disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla></fila>"
        + "<fila  Columna=\"D\"><silla  disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla><silla disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla></fila>"
        + "<fila  Columna=\"E\"><silla  disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla><silla disponible = \"true\">"
        + "</silla><silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla>"
        + "<silla disponible = \"true\"></silla><silla disponible = \"true\"></silla></fila></sala>";

        if (accion == 1) {
            query = con.prepareStatement("insert into tanda values (default,?,?,?,?,?,?)");
            query.setDate(1,date.valueOf(fecha));
            query.setString(2,horaInicial);
            query.setString(3,horaFinal);
            query.setInt(4, idSala);
            query.setInt(5, idPelicula);
            query.setString(6,xml.trim());

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
