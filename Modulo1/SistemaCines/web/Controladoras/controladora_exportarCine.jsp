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

        int idCine = Integer.parseInt(request.getParameter("idCine"));
        Element cine = new Element("cine");
        String nombre = "";
        String ciudad = "";
        String vision = "";
        String mision = "";
        String logo = "";
        String latitud = "";
        String longitud = "";


        query = con.prepareStatement("select nombre,ciudad,vision,mision,logo,latitud,longitud from cine where idCine = ?");
        query.setInt(1, idCine);

        rs = query.executeQuery();

        while (rs.next()) {
            nombre = rs.getString(1);
            ciudad = rs.getString(2);
            vision = rs.getString(3);
            mision = rs.getString(4);
            logo = rs.getString(5);
            latitud = rs.getString(6);
            longitud = rs.getString(7);
        }

        cine.setAttribute("nombre", nombre);
        cine.setAttribute("ciudad", ciudad);
        cine.setAttribute("vision", vision);
        cine.setAttribute("mision", mision);
        cine.setAttribute("logo", logo);
        cine.setAttribute("latitud", latitud);
        cine.setAttribute("longitud", longitud);

        XMLOutputter salida = new XMLOutputter();
        File fichero = new File(application.getRealPath("\\") + "configCine.xml");
        if (!fichero.exists()) {
            FileOutputStream FOS = new FileOutputStream(getServletContext().getRealPath("/") + "configCine.xml");
            salida.output(cine, FOS);
            FOS.close();
        }

        out.print("true");
        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
