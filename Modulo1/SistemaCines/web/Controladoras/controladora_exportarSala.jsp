<%@page import="java.sql.*"%>
<%@page import="org.jdom.Document"%>
<%@page import="org.jdom.input.SAXBuilder"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom.output.XMLOutputter"%>
<%@page import="org.jdom.Element"%>
<%
    try {

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);
        PreparedStatement query = null;
        ResultSet rs = null;

        int accion = Integer.parseInt(request.getParameter("accion"));
        String datos = "";

        if (accion == 1) {

            query = con.prepareStatement("select idSala,nombre from sala");
            rs = query.executeQuery();

            while (rs.next()) {
                datos += rs.getInt(1) + "$" + rs.getString(2) + "#";
            }

            if (datos.length() > 0) {
                out.print(datos);
            } else {
                out.print("none");
            }

        } else if (accion == 2) {

            Element sala = new Element("sala");
            int idSala = Integer.parseInt(request.getParameter("idSala"));
            String nombreSala = "";
            int capacidad = 0;

            query = con.prepareStatement("select nombre,capacidad from sala where idSala = ?");
            query.setInt(1, idSala);

            rs = query.executeQuery();

            while (rs.next()) {
                nombreSala = rs.getString(1);
                capacidad = rs.getInt(2);
            }

            sala.setAttribute("nombre", nombreSala);
            sala.setAttribute("capacidad", String.valueOf(capacidad));

            XMLOutputter salida = new XMLOutputter();
            File fichero = new File(application.getRealPath("\\") + "configSala" + idSala + ".xml");
            if (!fichero.exists()) {
                FileOutputStream FOS = new FileOutputStream(getServletContext().getRealPath("/") + "configSala" + idSala + ".xml");
                salida.output(sala, FOS);
                FOS.close();
            }

            out.print("true");
        }


        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
